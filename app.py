from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configure MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'ProotPass'
app.config['MYSQL_DB'] = 'survey'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

# Routes
@app.route('/')
def index():
    return redirect(url_for('assesment', entity_id=5))

@app.route('/add', methods=['POST'])
def add():
    if request.method == 'POST':
        email = request.form['email']
        industry = request.form['industry']
        name = request.form['name']

        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO users (email, industry, name) VALUES (%s, %s, %s)', (email, industry, name))
        mysql.connection.commit()
        cur.close()

        return redirect(url_for('index'))

@app.route('/edit/<int:user_id>', methods=['GET', 'POST'])
def edit(user_id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM users WHERE id = %s', (user_id,))
    user = cur.fetchone()
    cur.close()

    if request.method == 'POST':
        email = request.form['email']
        industry = request.form['industry']
        name = request.form['name']

        cur = mysql.connection.cursor()
        cur.execute('UPDATE users SET email=%s, industry=%s, name=%s WHERE id=%s', (email, industry, name, user_id))
        mysql.connection.commit()
        cur.close()

        return redirect(url_for('index'))

    return render_template('edit.html', user=user)

@app.route('/delete/<int:user_id>')
def delete(user_id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM users WHERE id = %s', (user_id,))
    mysql.connection.commit()
    cur.close()

    return redirect(url_for('index'))

@app.route('/assesment/<int:entity_id>', methods=['GET', 'POST'])
def assesment(entity_id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT q.id AS question_id, q.question, q.category, q.question_order, q.question_type, a.id AS answer_id, a.answer, a.answer_order, a.is_default FROM answer AS a LEFT JOIN question AS q ON a.question_id = q.id WHERE q.survey_id = %s ORDER BY q.question_order ASC, a.answer_order ASC', (entity_id,))
    questions = cur.fetchall()
    cur.close()

    if request.method == 'POST':

        email = request.form['email'] 
        industry = request.form['refered_by'] 
        name = request.form['name'] 

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM `users` WHERE `email` LIKE %s", (email,))
        existing_user = cur.fetchone()
        cur.close()

        if existing_user:
            user_id = existing_user['id']
            cur = mysql.connection.cursor()
            cur.execute("UPDATE `users` SET `refered_by` = %s, `name` = %s WHERE `id` = %s",
                        (industry, name, user_id))
            mysql.connection.commit()
            cur.close()
        else:
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO `users` (`email`, `refered_by`, `name`) VALUES (%s, %s, %s)",
                        (email, industry, name))
            mysql.connection.commit()
            user_id = cur.lastrowid
            cur.close()

        cur = mysql.connection.cursor()
        cur.execute('DELETE FROM question_answer WHERE user_id = %s AND answer_id IN (SELECT id FROM answer WHERE question_id IN (SELECT id FROM question WHERE survey_id = %s))', (user_id,entity_id))
        mysql.connection.commit()
        cur.close()

        for key, value in request.form.items():
            if key.startswith('question_'):
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO `question_answer` (`user_id`, `answer_id`) VALUES (%s, %s)",
                            (user_id, value))
                mysql.connection.commit()
                cur.close()                

        return redirect(url_for('score', entity_id=user_id, survey_id=entity_id))

    return render_template('survey.html', questions=questions, entity_id=entity_id)

@app.route('/score/<int:entity_id>/<int:survey_id>')
def score(entity_id,survey_id):
    cur = mysql.connection.cursor()

    cur.execute("SELECT question.category, SUM(question.weightage * answer.points) AS total_weightage, CASE WHEN SUM(question.weightage * answer.points) >= 3 AND SUM(question.weightage * answer.points) < 6 THEN 2 WHEN SUM(question.weightage * answer.points) >= 6 AND SUM(question.weightage * answer.points) < 9 THEN 3 WHEN SUM(question.weightage * answer.points) >= 9 THEN 4 ELSE 1 END AS weightage_label FROM users JOIN question_answer ON users.id = question_answer.user_id JOIN answer ON question_answer.answer_id = answer.id JOIN question ON answer.question_id = question.id JOIN survey ON question.survey_id = survey.id WHERE users.id = %s AND survey.id = %s GROUP BY question.category", (entity_id,survey_id,))
    score = cur.fetchall()

    cur.execute('SELECT * FROM users WHERE id = %s', (entity_id,))
    user = cur.fetchone()

    cur.execute('SELECT SUM(max_weightage) AS total_max_weightage FROM ( SELECT MAX(question.weightage * answer.points) AS max_weightage FROM answer LEFT JOIN question ON question.id = answer.question_id WHERE question.survey_id = %s GROUP BY question_id ) AS max_weights', (survey_id,))
    total_score = cur.fetchone()

    cur.execute('SELECT SUM(q.weightage * a.points) AS score FROM question_answer AS qa LEFT JOIN answer AS a ON a.id = qa.answer_id LEFT JOIN question AS q ON a.question_id = q.id WHERE qa.user_id = %s AND q.survey_id = %s', (entity_id,survey_id,))
    my_score = cur.fetchone()

    cur.execute("SELECT a.recomendation FROM question_answer AS qa LEFT JOIN answer AS a ON a.id = qa.answer_id LEFT JOIN question AS q ON a.question_id = q.id WHERE qa.user_id = %s AND q.survey_id = %s AND a.points < 10", (entity_id,survey_id,))
    recomendation = cur.fetchall()

    cur.close()


    score_dict = {}
    score_dict['recomendation'] = recomendation
    total_score = 100 * int(my_score['score']) / int(total_score['total_max_weightage'])
    rounded_percentage = round(total_score)
    score_dict['total_score'] = rounded_percentage
    for row in score:
        category = row['category']
        total_weightage = row['total_weightage']
        weightage_label = int(row['weightage_label'])
        score_dict[category] = {'total_weightage': total_weightage, 'weightage_label': weightage_label}

    score_dict["sre_tco"] = {1:"very high", 2:"high", 3:"medium", 4:"low"}
    score_dict["sre_her"] = {1:"low", 2:"medium", 3:"high", 4:"very high"}

    score_dict["aiops_cr"] = {1:"very high", 2:"high", 3:"medium", 4:"low"}
    score_dict["aiops_cr_leadtime"] = {1:"very high", 2:"high", 3:"medium", 4:"low"}
    score_dict["aiops_cr_failtire_rate"] = {1:"very high", 2:"high", 3:"medium", 4:"low"}
    score_dict["aiops_mtbf"] = {1:"low", 2:"medium", 3:"high", 4:"very high"}

    score_dict["genai_preemp_inc"] = {1:"low", 2:"medium", 3:"high", 4:"very high"}
    score_dict["genai_mttr"] = {1:"very high", 2:"high", 3:"medium", 4:"low"}
    score_dict["genai_mttd"] = {1:"very high", 2:"high", 3:"medium", 4:"low"}

    score_dict["auto_productivity"] = {1:"low", 2:"medium", 3:"high", 4:"very high"}
    score_dict["genai_sme"] = {1:"very high", 2:"high", 3:"medium", 4:"low"}

    if my_score['score'] >= 0 and my_score['score'] <= 10:
        score_dict['my_score'] = 1
    elif my_score['score'] >= 11 and my_score['score'] <= 20:
        score_dict['my_score'] = 2
    elif my_score['score'] >= 21 and my_score['score'] <= 34:
        score_dict['my_score'] = 3
    elif my_score['score'] > 34:
        score_dict['my_score'] = 4

    score_dict['pointer_margin'] = 230
    if score_dict['my_score'] == 1:
        score_dict['pointer_margin'] = 165
    elif score_dict['my_score'] == 2:
        score_dict['pointer_margin'] = 240
    elif score_dict['my_score'] == 3:
        score_dict['pointer_margin'] = 320
    elif score_dict['my_score'] == 4:
        score_dict['pointer_margin'] = 395

    

    return render_template('results.html', score=score_dict, user=user)
    

@app.route('/list_reports', methods=['GET'])
def list_reports():
    cur = mysql.connection.cursor()
    cur.execute("SELECT u.id AS uid, u.name, u.email, s.id AS sid, s.survey_name FROM question_answer AS qa LEFT JOIN answer AS a ON qa.answer_id = a.id LEFT JOIN question AS q ON a.question_id = q.id LEFT JOIN survey AS s ON q.survey_id = s.id LEFT JOIN users AS u ON qa.user_id = u.id WHERE u.name <> '' AND u.email <> '' GROUP BY u.id, s.id")
    rows = cur.fetchall()
    cur.close()
    return render_template('list.html', rows=rows)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    refered_by VARCHAR(255),
    name VARCHAR(255) NOT NULL
);


CREATE TABLE survey (
    id INT AUTO_INCREMENT PRIMARY KEY,
    survey_name VARCHAR(255) NOT NULL
);


CREATE TABLE question (
    id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT,
    category VARCHAR(128) NULL,
    question TEXT,
    question_order INT,
    question_type INT DEFAULT 1 COMMENT '1-radio, 2-text',
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);


CREATE TABLE answer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT,
    answer TEXT,
    is_default INT NOT NULL DEFAULT '0',
    answer_order INT,
    weightage INT,
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);


CREATE TABLE question_answer (
    user_id INT,
    answer_id INT,
    PRIMARY KEY (user_id, answer_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (answer_id) REFERENCES answer(id)
);

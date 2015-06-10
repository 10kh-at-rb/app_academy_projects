CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT,
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

--seed data

INSERT INTO
  users (fname, lname)
VALUES
  ('Rhoen', 'Pruesse-Adams'),
  ('Eric', 'Firth');


INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Quick Question', 'Where am I?', (SELECT id FROM users WHERE fname = 'Eric')),
  ('Sup', 'Whats the meaning of life?', (SELECT id FROM users WHERE fname = 'Rhoen'));

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (
    (SELECT id FROM questions WHERE title = 'Sup'),
    (SELECT id FROM users WHERE fname = 'Eric')

    );

INSERT INTO
  replies(question_id, user_id, body, parent_id)
VALUES
  (
    (SELECT id FROM questions WHERE title = 'Quick Question'),
    (SELECT id FROM users WHERE fname = 'Rhoen'),
    'You are in app academy!',
    NULL
  );

INSERT INTO
  replies(question_id, user_id, body, parent_id)
VALUES
  (
    (SELECT id FROM questions WHERE title = 'Quick Question'),
    (SELECT id FROM users WHERE fname = 'Eric'),
    'Cool, thanks.',
    (SELECT id FROM replies WHERE body = 'You are in app academy!')
  );


INSERT INTO
  question_likes(question_id, user_id)
VALUES
(
  (SELECT id FROM questions WHERE title = 'Sup'),
  (SELECT id FROM users WHERE fname = 'Eric')
);

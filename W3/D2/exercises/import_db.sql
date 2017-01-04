
DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);
--
DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Yong', 'Park'),
  ('Peter', 'Delfausse'),
  ('Eileen', 'Ho');

--
INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Am I normal?', 'Am I a human being?', (SELECT id FROM users WHERE fname = 'Yong' AND lname = 'Park')),
  ('Is Yong normal?', 'Is he normal?', (SELECT id FROM users WHERE fname = 'Peter' AND lname = 'Delfausse'));


INSERT INTO
  replies (question_id, parent_reply_id, body, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Am I normal?'), NULL, 'No, you dummy.', (SELECT id FROM users WHERE fname = 'Peter' AND lname = 'Delfausse'));

INSERT INTO
  replies (question_id, parent_reply_id, body, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Am I normal?'), (SELECT id FROM replies WHERE body = 'No, you dummy.'), 'Hail emperor Trump.', (SELECT id FROM users WHERE fname = 'Eileen' AND lname = 'Ho'));

INSERT INTO
  replies (question_id, parent_reply_id, body, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Am I normal?'), (SELECT id FROM replies WHERE body = 'Hail emperor Trump.'), 'Please work.', (SELECT id FROM users WHERE fname = 'Yong' AND lname = 'Park'));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1);


INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (1, 1),
  (1, 2);

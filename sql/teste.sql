CREATE DATABASE IF NOT EXISTS `DATABASE_TESTE`; -- Cria o banco de dados se não existir

USE DATABASE IF EXISTS `DATABASE_TESTE`; -- Usa o DB se existir

CREATE TABLE IF NOT EXISTS `users` (  -- Cria tabela user se não existir
  uid INTEGER AUTOINCREMENT, -- uid = nome, INTEGER = int, AUTOINCREMENT = soma.
  username TEXT(45) UNIQUE NOT NULL,
  password TEXT NOT NULL,
  email TEXT(90) UNIQUE NOT NULL,
  PRIMARY KEY (uid) -- torna o UID como chave primária.
);

CREATE TABLE IF NOT EXISTS `posts` (
  pid INTEGER AUTOINCREMENT,
  uid INTEGER NOT NULL,
  title TEXT(45) NOT NULL,
  content TEXT NOT NULL,
  createDate DATETIME NOT NULL,
  PRIMARY KEY (pid),
  FOREIGN KEY (uid) REFERENCES users(uid) -- FOREIGN KEY = chave estrangeira, a tabela só existe se "uid" existir.
);

-- CREATE TABLE IF NOT EXISTS `users_posts` (
--   uid INTEGER,
--   pid INTEGER,
--   PRIMARY KEY (uid, pid),
--   FOREIGN KEY (uid) REFERENCES users(uid),
--   FOREIGN KEY (pid) REFERENCES posts(pid),
-- )


-- C = create
-- R = read
-- U = update
-- D = delete

INSERT INTO `users` (`username`, `password`, `email`) VALUES ('admin', 'admin', 'admin@gmail.com'); -- CREATE

SELECT * FROM `users`;

SELECT * FROM `users` WHERE uid = 1;

SELECT * FROM `users` WHERE email LIKE 'admin';

INSERT INTO `posts` (`uid`, `title`, `content`, `createDate`) VALUES (1, "Welcome", "teste", NOW());

INSERT INTO `posts` (`uid`, `title`, `content`, `createDate`) VALUES (1, "Welcome2", "teste 2", NOW());

SELECT u.*, p.title, p.content from `users` u INNER JOIN `posts` p ON u.uid = p.uid; -- READ

UPDATE `users` SET username = 'admin1', password = 'admin1' WHERE uid = 1; -- UPDATE

DELETE FROM `users` WHERE uid = 1; -- DELETE

-- ===========================================================================================
--|   | uid | username | password | title     | content
--| 1 |   1 | admin    |    admin | Welcome   | teste
--| 2 |   1 | admin    |    admin | Welcome 2 | teste 2
--| 3 | ...
--| 4 | ...
-- =============================================================================================
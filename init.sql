CREATE DATABASE IF NOT EXISTS `ep`
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
USE `ep`;

CREATE TABLE `users` (
  `userid` BIGINT UNSIGNED NOT NULL,
  `won`    INT UNSIGNED       NOT NULL DEFAULT 0,
  `lose`   INT UNSIGNED       NOT NULL DEFAULT 0,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE `questions` (
  `id`       INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` TEXT             NOT NULL,
  `options`  TEXT             NOT NULL COMMENT 'JSON array of answers',
  `answer`   TINYINT UNSIGNED NOT NULL COMMENT 'Index of correct option',
  `category` VARCHAR(100)     NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4;

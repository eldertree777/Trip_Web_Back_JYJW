-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema enjoytrip
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `enjoytrip` ;

-- -----------------------------------------------------
-- Schema enjoytrip
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `enjoytrip` DEFAULT CHARACTER SET utf8 ;
USE `enjoytrip` ;

-- -----------------------------------------------------
-- Table `enjoytrip`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`User` (
  `user_id` VARCHAR(16) NOT NULL,
  `user_name` VARCHAR(16) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `email_id` VARCHAR(20) NOT NULL,
  `email_domain` VARCHAR(45) NOT NULL,
  `join_date` DATETIME NULL DEFAULT now(),
  `role` INT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_id_UNIQUE` (`email_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Notice` (
  `board_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `content` VARCHAR(2000) NULL,
  `hit` INT NULL,
  `register_time` TIMESTAMP NULL,
  PRIMARY KEY (`board_id`),
  INDEX `notice_to_member_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `notice_to_member_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `enjoytrip`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Category` (
  `cat_id` CHAR(3) NOT NULL,
  `cat_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Hotplace`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Hotplace` (
  `hotplace_id` INT NOT NULL AUTO_INCREMENT,
  `cat_id` CHAR(3) NULL,
  `trip_time` DATE NULL,
  `Description` VARCHAR(200) NULL,
  `hotplace_img` BLOB NULL,
  `user_id` VARCHAR(16) NULL,
  `title` VARCHAR(100) NULL,
  `hit` INT NULL DEFAULT 0,
  `register_time` TIMESTAMP NULL,
  `lat` DECIMAL(20) NULL,
  `lon` DECIMAL(20) NULL,
  PRIMARY KEY (`hotplace_id`),
  INDEX `hotplace_to_cat_cat_id_fk_idx` (`cat_id` ASC) VISIBLE,
  INDEX `hotplace_to_memer_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `hotplace_to_cat_cat_id_fk`
    FOREIGN KEY (`cat_id`)
    REFERENCES `enjoytrip`.`Category` (`cat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `hotplace_to_member_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `enjoytrip`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Trip_path`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Trip_path` (
  `trip_path_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NULL,
  `register_time` TIMESTAMP NULL,
  `hit` INT NULL,
  `startdate` DATETIME NULL,
  `enddate` DATETIME NULL,
  `title` VARCHAR(200) NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`trip_path_id`),
  INDEX `path_to_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `path_to_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `enjoytrip`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Sido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Sido` (
  `sido_code` INT NOT NULL,
  `sido_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sido_code`),
  UNIQUE INDEX `sido_name_UNIQUE` (`sido_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Gugun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Gugun` (
  `gugun_code` INT NOT NULL,
  `gugun_name` VARCHAR(45) NOT NULL,
  `sido_code` INT NULL,
  PRIMARY KEY (`gugun_code`),
  INDEX `gugun_to_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  CONSTRAINT `gugun_to_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `enjoytrip`.`Sido` (`sido_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Attraction_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Attraction_info` (
  `content_id` INT NOT NULL,
  `content_type_id` INT NULL,
  `title` VARCHAR(100) NULL,
  `addr1` VARCHAR(100) NULL,
  `addr2` VARCHAR(50) NULL,
  `zipcode` VARCHAR(50) NULL,
  `tel` VARCHAR(50) NULL,
  `first_img_1` VARCHAR(200) NULL,
  `first_img_2` VARCHAR(200) NULL,
  `read_count` INT NULL,
  `sido_code` INT NULL,
  `gugun_code` INT NULL,
  `lat` DECIMAL(20) NULL,
  `lon` DECIMAL(20) NULL,
  `cat_id` CHAR(3) NULL,
  `create_time` DATETIME NULL,
  `modify_time` DATETIME NULL,
  `book_tour` INT NULL,
  `overview` VARCHAR(10000) NULL,
  `tel` VARCHAR(45) NULL,
  PRIMARY KEY (`content_id`),
  INDEX `info_to_sido_code_fk_idx_idx` (`sido_code` ASC) VISIBLE,
  INDEX `info_to_gugun_code_fk_idx_idx` (`gugun_code` ASC) VISIBLE,
  INDEX `info_to_cat_cat_id_fk_idx` (`cat_id` ASC) VISIBLE,
  CONSTRAINT `info_to_sido_code_fk_idx`
    FOREIGN KEY (`sido_code`)
    REFERENCES `enjoytrip`.`Sido` (`sido_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `info_to_gugun_code_fk_idx`
    FOREIGN KEY (`gugun_code`)
    REFERENCES `enjoytrip`.`Gugun` (`gugun_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `info_to_cat_cat_id_fk`
    FOREIGN KEY (`cat_id`)
    REFERENCES `enjoytrip`.`Category` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Weather`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Weather` (
  `datetime` CHAR(6) NOT NULL,
  `sido_name` VARCHAR(45) NOT NULL,
  `weather` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`datetime`, `sido_name`),
  INDEX `weather_to_sido_idx` (`sido_name` ASC) VISIBLE,
  CONSTRAINT `weather_to_sido`
    FOREIGN KEY (`sido_name`)
    REFERENCES `enjoytrip`.`Sido` (`sido_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Sun_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Sun_status` (
  `datetime` CHAR(6) NOT NULL,
  `sido_name` VARCHAR(45) NOT NULL,
  `rise_time` CHAR(4) NULL,
  `down_time` CHAR(4) NULL,
  PRIMARY KEY (`datetime`, `sido_name`),
  INDEX `sun_to_sido_fk_idx` (`sido_name` ASC) VISIBLE,
  CONSTRAINT `sun_to_sido_fk`
    FOREIGN KEY (`sido_name`)
    REFERENCES `enjoytrip`.`Sido` (`sido_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `board_id` INT NULL,
  `user_id` VARCHAR(16) NULL,
  `content` VARCHAR(200) NULL,
  `p_comment_id` INT NULL,
  `register_time` DATETIME NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `comment_to_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  INDEX `comment_to_comment_fk_idx` (`p_comment_id` ASC) VISIBLE,
  INDEX `comment_to_notice_board_id_fk_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `comment_to_comment_fk`
    FOREIGN KEY (`p_comment_id`)
    REFERENCES `enjoytrip`.`Comment` (`comment_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_to_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `enjoytrip`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_to_notice_board_id_fk`
    FOREIGN KEY (`board_id`)
    REFERENCES `enjoytrip`.`Notice` (`board_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enjoytrip`.`Trip_path_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytrip`.`Trip_path_location` (
  `content_id` INT NOT NULL,
  `trip_path_id` INT NOT NULL,
  `startdate` DATETIME NULL,
  `enddate` DATETIME NULL,
  PRIMARY KEY (`content_id`, `trip_path_id`),
  INDEX `location_to_trip_path_id_fk_idx` (`trip_path_id` ASC) VISIBLE,
  CONSTRAINT `location_to_trip_path_id_fk`
    FOREIGN KEY (`trip_path_id`)
    REFERENCES `enjoytrip`.`Trip_path` (`trip_path_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_to_attraction_info`
    FOREIGN KEY (`content_id`)
    REFERENCES `enjoytrip`.`Attraction_info` (`content_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EnjoyTrip
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EnjoyTrip
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EnjoyTrip` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `EnjoyTrip` ;

-- -----------------------------------------------------
-- Table `EnjoyTrip`.`members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EnjoyTrip`.`members` ;

CREATE TABLE IF NOT EXISTS `EnjoyTrip`.`members` (
  `user_id` VARCHAR(16) NOT NULL,
  `user_name` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `email_id` VARCHAR(20) NULL DEFAULT NULL,
  `email_domain` VARCHAR(45) NULL DEFAULT NULL,
  `join_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into `EnjoyTrip`.`members` (user_id, user_name, user_password, email_id, email_domain, join_date)
values 	('ssafy', '김싸피', '1234', 'ssafy', 'ssafy.com', now()), 
		('admin', '관리자', '1234', 'admin', 'google.com', now());
	
commit;


-- -----------------------------------------------------
-- Table `EnjoyTrip`.`board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EnjoyTrip`.`board` ;

CREATE TABLE IF NOT EXISTS `EnjoyTrip`.`board` (
  `article_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NULL DEFAULT NULL,
  `subject` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT 0,
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`),
  INDEX `board_to_members_user_id_fk` (`user_id` ASC),
  CONSTRAINT `board_to_members_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `EnjoyTrip`.`members` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `EnjoyTrip`.`memo`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `EnjoyTrip`.`memo` ;

-- CREATE TABLE IF NOT EXISTS `EnjoyTrip`.`memo` (
--   `memo_no` INT NOT NULL AUTO_INCREMENT,
--   `user_id` VARCHAR(16) NULL DEFAULT NULL,
--   `comment` VARCHAR(500) NULL DEFAULT NULL,
--   `memo_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   `article_no` INT NULL DEFAULT NULL,
--   PRIMARY KEY (`memo_no`),
--   INDEX `memo_to_board_article_no_fk` (`article_no` ASC),
--   INDEX `memo_to_member_fk_idx` (`user_id` ASC) VISIBLE,
--   CONSTRAINT `memo_to_board_article_no_fk`
--     FOREIGN KEY (`article_no`)
--     REFERENCES `EnjoyTrip`.`board` (`article_no`),
--   CONSTRAINT `memo_to_member_user_id_fk`
--     FOREIGN KEY (`user_id`)
--     REFERENCES `EnjoyTrip`.`members` (`user_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- AUTO_INCREMENT = 1
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


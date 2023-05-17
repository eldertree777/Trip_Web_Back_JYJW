-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `cat_id` CHAR(3) NOT NULL,
  `cat_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`sido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`sido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`sido` (
  `sido_code` INT NOT NULL,
  `sido_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sido_code`),
  UNIQUE INDEX `sido_name_UNIQUE` (`sido_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`gugun`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`gugun` ;

CREATE TABLE IF NOT EXISTS `mydb`.`gugun` (
  `gugun_code` INT NOT NULL,
  `gugun_name` VARCHAR(45) NOT NULL,
  `sido_code` INT NOT NULL,
  PRIMARY KEY (`gugun_code`, `sido_code`),
  INDEX `gugun_to_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  CONSTRAINT `gugun_to_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `mydb`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`attraction_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`attraction_info` ;

CREATE TABLE IF NOT EXISTS `mydb`.`attraction_info` (
  `content_id` INT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `addr1` VARCHAR(100) NULL DEFAULT NULL,
  `addr2` VARCHAR(50) NULL DEFAULT NULL,
  `zipcode` VARCHAR(50) NULL DEFAULT NULL,
  `tel` VARCHAR(50) NULL DEFAULT NULL,
  `first_img_1` VARCHAR(200) NULL DEFAULT NULL,
  `first_img_2` VARCHAR(200) NULL DEFAULT NULL,
  `read_count` INT NULL DEFAULT NULL,
  `sido_code` INT NULL DEFAULT NULL,
  `gugun_code` INT NULL DEFAULT NULL,
  `lat` DECIMAL(20,0) NULL DEFAULT NULL,
  `lon` DECIMAL(20,0) NULL DEFAULT NULL,
  `cat_id` CHAR(3) NULL DEFAULT NULL,
  `create_time` VARCHAR(100) NULL DEFAULT NULL,
  `modify_time` VARCHAR(100) NULL DEFAULT NULL,
  `book_tour` VARCHAR(30) NULL DEFAULT NULL,
  `overview` VARCHAR(10000) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  INDEX `info_to_sido_code_fk_idx_idx` (`sido_code` ASC) VISIBLE,
  INDEX `info_to_gugun_code_fk_idx_idx` (`gugun_code` ASC) VISIBLE,
  INDEX `info_to_cat_cat_id_fk_idx` (`cat_id` ASC) VISIBLE,
  CONSTRAINT `info_to_cat_cat_id_fk`
    FOREIGN KEY (`cat_id`)
    REFERENCES `mydb`.`category` (`cat_id`),
  CONSTRAINT `info_to_gugun_code_fk_idx`
    FOREIGN KEY (`gugun_code`)
    REFERENCES `mydb`.`gugun` (`gugun_code`),
  CONSTRAINT `info_to_sido_code_fk_idx`
    FOREIGN KEY (`sido_code`)
    REFERENCES `mydb`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` VARCHAR(16) NOT NULL,
  `user_name` VARCHAR(16) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `email_id` VARCHAR(20) NOT NULL,
  `email_domain` VARCHAR(45) NOT NULL,
  `join_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `role` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_id_UNIQUE` (`email_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`info_board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`info_board` ;

CREATE TABLE IF NOT EXISTS `mydb`.`info_board` (
  `board_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT NULL,
  `register_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_id`),
  INDEX `notice_to_member_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `notice_to_member_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`comment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `board_id` INT NULL DEFAULT NULL,
  `user_id` VARCHAR(16) NULL DEFAULT NULL,
  `content` VARCHAR(200) NULL DEFAULT NULL,
  `p_comment_id` INT NULL DEFAULT NULL,
  `register_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  INDEX `comment_to_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  INDEX `comment_to_comment_fk_idx` (`p_comment_id` ASC) VISIBLE,
  INDEX `comment_to_notice_board_id_fk_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `comment_to_comment_fk`
    FOREIGN KEY (`p_comment_id`)
    REFERENCES `mydb`.`comment` (`comment_id`)
    ON DELETE CASCADE,
  CONSTRAINT `comment_to_notice_board_id_fk`
    FOREIGN KEY (`board_id`)
    REFERENCES `mydb`.`info_board` (`board_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comment_to_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`hotplace`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`hotplace` ;

CREATE TABLE IF NOT EXISTS `mydb`.`hotplace` (
  `hotplace_id` INT NOT NULL AUTO_INCREMENT,
  `cat_id` CHAR(3) NULL DEFAULT NULL,
  `trip_time` VARCHAR(100) NULL DEFAULT NULL,
  `Description` VARCHAR(200) NULL DEFAULT NULL,
  `hotplace_img` BLOB NULL DEFAULT NULL,
  `user_id` VARCHAR(16) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT '0',
  `register_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `lat` DECIMAL(20,0) NULL DEFAULT NULL,
  `lon` DECIMAL(20,0) NULL DEFAULT NULL,
  PRIMARY KEY (`hotplace_id`),
  INDEX `hotplace_to_cat_cat_id_fk_idx` (`cat_id` ASC) VISIBLE,
  INDEX `hotplace_to_memer_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `hotplace_to_cat_cat_id_fk`
    FOREIGN KEY (`cat_id`)
    REFERENCES `mydb`.`category` (`cat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `hotplace_to_member_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`sun_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`sun_status` ;

CREATE TABLE IF NOT EXISTS `mydb`.`sun_status` (
  `datetime` CHAR(6) NOT NULL,
  `sido_name` VARCHAR(45) NOT NULL,
  `rise_time` CHAR(4) NULL DEFAULT NULL,
  `down_time` CHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`datetime`, `sido_name`),
  INDEX `sun_to_sido_fk_idx` (`sido_name` ASC) VISIBLE,
  CONSTRAINT `sun_to_sido_fk`
    FOREIGN KEY (`sido_name`)
    REFERENCES `mydb`.`sido` (`sido_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`trip` ;

CREATE TABLE IF NOT EXISTS `mydb`.`trip` (
  `trip_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NULL DEFAULT NULL,
  `register_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `hit` INT NULL DEFAULT NULL,
  `startdate` VARCHAR(100) NULL DEFAULT NULL,
  `enddate` VARCHAR(100) NULL DEFAULT NULL,
  `title` VARCHAR(200) NULL DEFAULT NULL,
  `description` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  INDEX `path_to_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `path_to_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`trip_path`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`trip_path` ;

CREATE TABLE IF NOT EXISTS `mydb`.`trip_path` (
  `content_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  `startdate` VARCHAR(100) NULL DEFAULT NULL,
  `enddate` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`, `trip_id`),
  INDEX `location_to_trip_path_id_fk_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `location_to_attraction_info`
    FOREIGN KEY (`content_id`)
    REFERENCES `mydb`.`attraction_info` (`content_id`),
  CONSTRAINT `location_to_trip_path_id_fk`
    FOREIGN KEY (`trip_id`)
    REFERENCES `mydb`.`trip` (`trip_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`weather`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`weather` ;

CREATE TABLE IF NOT EXISTS `mydb`.`weather` (
  `datetime` CHAR(6) NOT NULL,
  `sido_name` VARCHAR(45) NOT NULL,
  `weather` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`datetime`, `sido_name`),
  INDEX `weather_to_sido_idx` (`sido_name` ASC) VISIBLE,
  CONSTRAINT `weather_to_sido`
    FOREIGN KEY (`sido_name`)
    REFERENCES `mydb`.`sido` (`sido_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
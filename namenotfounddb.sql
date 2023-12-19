-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema NameNotFoundDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NameNotFoundDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NameNotFoundDB` DEFAULT CHARACTER SET utf8 ;
USE `NameNotFoundDB` ;

-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`sheet` (
  `sheet_id` INT NOT NULL,
  `chara_type` VARCHAR(45) NULL,
  `sheet_creation_date` DATETIME NOT NULL,
  `sheet_name` VARCHAR(60) NOT NULL,
  `sheet_alias` LONGTEXT NULL,
  `sheet_alleg` VARCHAR(45) NULL,
  `sheet_va` VARCHAR(45) NULL,
  `sheet_background` LONGTEXT NULL,
  `sheet_sinif` LONGTEXT NULL,
  `sheet_lore` LONGTEXT NULL,
  `sheet_rank` INT NULL,
  PRIMARY KEY (`sheet_id`),
  UNIQUE INDEX `sheet_id_UNIQUE` (`sheet_id` ASC) VISIBLE,
  UNIQUE INDEX `sheet_name_UNIQUE` (`sheet_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`users` (
  `user_id` INT NOT NULL,
  `userName` VARCHAR(16) NOT NULL,
  `userPass` VARCHAR(26) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `user_role` TINYINT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`admin` (
  `admin_id` INT NOT NULL,
  `admin_name` VARCHAR(16) NOT NULL,
  `admin_pass` VARCHAR(26) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE INDEX `admin_id_UNIQUE` (`admin_id` ASC) VISIBLE,
  UNIQUE INDEX `admin_name_UNIQUE` (`admin_name` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`request` (
  `request_id` INT NOT NULL,
  `request_date` DATETIME NOT NULL,
  `request_status` TINYINT NULL,
  `request_content` LONGTEXT NOT NULL,
  PRIMARY KEY (`request_id`),
  UNIQUE INDEX `mod_id_UNIQUE` (`request_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`user_has_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`user_has_request` (
  `user_user_id` INT NOT NULL,
  `request_request_id` INT NOT NULL,
  PRIMARY KEY (`user_user_id`, `request_request_id`),
  INDEX `fk_user_has_request_request1_idx` (`request_request_id` ASC) VISIBLE,
  INDEX `fk_user_has_request_user_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_request_user`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `NameNotFoundDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_request_request1`
    FOREIGN KEY (`request_request_id`)
    REFERENCES `NameNotFoundDB`.`request` (`request_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`user_has_sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`user_has_sheet` (
  `user_user_id` INT NOT NULL,
  `sheet_sheet_id` INT NOT NULL,
  PRIMARY KEY (`user_user_id`, `sheet_sheet_id`),
  INDEX `fk_user_has_sheet_sheet1_idx` (`sheet_sheet_id` ASC) VISIBLE,
  INDEX `fk_user_has_sheet_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_sheet_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `NameNotFoundDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_sheet_sheet1`
    FOREIGN KEY (`sheet_sheet_id`)
    REFERENCES `NameNotFoundDB`.`sheet` (`sheet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`admin_has_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`admin_has_request` (
  `admin_admin_id` INT NOT NULL,
  `request_request_id` INT NOT NULL,
  PRIMARY KEY (`admin_admin_id`, `request_request_id`),
  INDEX `fk_admin_has_request_request1_idx` (`request_request_id` ASC) VISIBLE,
  INDEX `fk_admin_has_request_admin1_idx` (`admin_admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_admin_has_request_admin1`
    FOREIGN KEY (`admin_admin_id`)
    REFERENCES `NameNotFoundDB`.`admin` (`admin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_has_request_request1`
    FOREIGN KEY (`request_request_id`)
    REFERENCES `NameNotFoundDB`.`request` (`request_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`admin_has_sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`admin_has_sheet` (
  `admin_admin_id` INT NOT NULL,
  `sheet_sheet_id` INT NOT NULL,
  PRIMARY KEY (`admin_admin_id`, `sheet_sheet_id`),
  INDEX `fk_admin_has_sheet_sheet1_idx` (`sheet_sheet_id` ASC) VISIBLE,
  INDEX `fk_admin_has_sheet_admin1_idx` (`admin_admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_admin_has_sheet_admin1`
    FOREIGN KEY (`admin_admin_id`)
    REFERENCES `NameNotFoundDB`.`admin` (`admin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_has_sheet_sheet1`
    FOREIGN KEY (`sheet_sheet_id`)
    REFERENCES `NameNotFoundDB`.`sheet` (`sheet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NameNotFoundDB`.`sheet_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NameNotFoundDB`.`sheet_view` (
  `sheet_view_id` INT NOT NULL,
  `amount_tracker` INT NULL,
  PRIMARY KEY (`sheet_view_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

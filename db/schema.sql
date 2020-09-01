

DROP DATABASE IF EXISTS drink_app;
CREATE DATABASE drink_app;

-- -- MySQL Script generated by MySQL Workbench
-- -- Thu Aug 27 20:56:37 2020
-- -- Model: New Model    Version: 1.0
-- -- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -----------------------------------------------------
-- -- Schema drink_app
-- -- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `drink_app` ;

-- -- -----------------------------------------------------
-- -- Schema drink_app
-- -- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `drink_app` DEFAULT CHARACTER SET utf8 ;
-- USE `drink_app` ;

-- -- -----------------------------------------------------
-- -- Table `drink_app`.`Ingredient`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `drink_app`.`Ingredient` ;

-- CREATE TABLE IF NOT EXISTS `drink_app`.`Ingredient` (
--   `ingredient_id` INT UNSIGNED NOT NULL,
--   `ingredient_name` LONGTEXT NOT NULL,
--   PRIMARY KEY (`ingredient_id`))
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `drink_app`.`Recipe`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `drink_app`.`Recipe` ;

-- CREATE TABLE IF NOT EXISTS `drink_app`.`Recipe` (
--   `recipe_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
--   `recipe_name` VARCHAR(255) NOT NULL,
--   `instructions` LONGTEXT NOT NULL,
--   `user_id` VARCHAR(255) NOT NULL,
--   `image_file_name` VARCHAR(255) NOT NULL,
--   `rating` DECIMAL(5) NOT NULL,
--   PRIMARY KEY (`recipe_id`),
--   INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
--   CONSTRAINT `user_id`
--     FOREIGN KEY (`user_id`)
--     REFERENCES `drink_app`.`User` (`user_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `drink_app`.`Recipe_Ingredient`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `drink_app`.`Recipe_Ingredient` ;

-- CREATE TABLE IF NOT EXISTS `drink_app`.`Recipe_Ingredient` (
--   `ri_id` INT UNSIGNED NOT NULL,
--   `recipe_id` INT UNSIGNED NOT NULL,
--   `ingredient_id` INT UNSIGNED NOT NULL,
--   `amount` VARCHAR(255) NOT NULL,
--   PRIMARY KEY (`ri_id`),
--   INDEX `ingredient_id_idx` (`ingredient_id` ASC) VISIBLE,
--   INDEX `recipe_id_idx` (`recipe_id` ASC) VISIBLE,
--   CONSTRAINT `ingredient_id`
--     FOREIGN KEY (`ingredient_id`)
--     REFERENCES `drink_app`.`Ingredient` (`ingredient_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `recipe_id`
--     FOREIGN KEY (`recipe_id`)
--     REFERENCES `drink_app`.`Recipe` (`recipe_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `drink_app`.`User`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `drink_app`.`User` ;

-- CREATE TABLE IF NOT EXISTS `drink_app`.`User` (
--   `user_id` VARCHAR(255) NOT NULL,
--   `username` VARCHAR(255) NOT NULL,
--   `password` VARCHAR(255) NOT NULL,
--   `email` VARCHAR(255) NOT NULL,
--   PRIMARY KEY (`user_id`),
--   UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
--   UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
-- ENGINE = InnoDB;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
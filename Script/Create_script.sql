-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema football_main
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `football_main` ;

-- -----------------------------------------------------
-- Schema football_main
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `football_main` DEFAULT CHARACTER SET utf8 ;
USE `football_main` ;

-- -----------------------------------------------------
-- Table `football_main`.`divisions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`divisions` ;

CREATE TABLE IF NOT EXISTS `football_main`.`divisions` (
  `id_division` INT NOT NULL,
  `name_division` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_division`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`teams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`teams` ;

CREATE TABLE IF NOT EXISTS `football_main`.`teams` (
  `id_team` INT NOT NULL AUTO_INCREMENT,
  `id_division` INT NULL,
  `team_name` VARCHAR(100) NOT NULL,
  `creation_date` DATE NULL,
  `logo` VARCHAR(45) NULL,
  `id_parent` INT NULL COMMENT 'Дубль основной команды',
  PRIMARY KEY (`id_team`),
  INDEX `fk_teams_divisions1_idx` (`id_division` ASC),
  INDEX `fk_teams_teams1_idx` (`id_parent` ASC),
  CONSTRAINT `fk_teams_divisions1`
    FOREIGN KEY (`id_division`)
    REFERENCES `football_main`.`divisions` (`id_division`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teams_teams1`
    FOREIGN KEY (`id_parent`)
    REFERENCES `football_main`.`teams` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`amplua`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`amplua` ;

CREATE TABLE IF NOT EXISTS `football_main`.`amplua` (
  `id_amplua` INT NOT NULL AUTO_INCREMENT,
  `name_amplua` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_amplua`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`players`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`players` ;

CREATE TABLE IF NOT EXISTS `football_main`.`players` (
  `id_player` INT NOT NULL AUTO_INCREMENT,
  `id_team` INT NULL,
  `name` VARCHAR(100) NOT NULL,
  `id_amplua` INT NULL,
  `birthdate` DATE NULL,
  `number` INT NULL,
  `photo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_player`),
  INDEX `fk_players_teams_idx` (`id_team` ASC),
  INDEX `fk_players_amplua1_idx` (`id_amplua` ASC),
  CONSTRAINT `fk_players_teams`
    FOREIGN KEY (`id_team`)
    REFERENCES `football_main`.`teams` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_players_amplua1`
    FOREIGN KEY (`id_amplua`)
    REFERENCES `football_main`.`amplua` (`id_amplua`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`sesons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`sesons` ;

CREATE TABLE IF NOT EXISTS `football_main`.`sesons` (
  `id_season` INT NOT NULL AUTO_INCREMENT,
  `year_end` DATE NULL,
  `year_start` DATE NULL,
  PRIMARY KEY (`id_season`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`tournament_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`tournament_table` ;

CREATE TABLE IF NOT EXISTS `football_main`.`tournament_table` (
  `id_season` INT NOT NULL,
  `id_division` INT NOT NULL,
  `id_team` INT NOT NULL,
  `games` INT NULL,
  `wins` INT NULL,
  `draws` INT NULL,
  `losses` INT NULL,
  `goals_scored` INT NULL,
  `goals_conceded` INT NULL,
  `points` INT NULL,
  PRIMARY KEY (`id_season`, `id_division`, `id_team`),
  INDEX `fk_tournament_table_teams1_idx` (`id_team` ASC),
  INDEX `fk_tournament_table_divisions1_idx` (`id_division` ASC),
  INDEX `fk_tournament_table_sesons1_idx` (`id_season` ASC),
  CONSTRAINT `fk_tournament_table_teams1`
    FOREIGN KEY (`id_team`)
    REFERENCES `football_main`.`teams` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tournament_table_divisions1`
    FOREIGN KEY (`id_division`)
    REFERENCES `football_main`.`divisions` (`id_division`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tournament_table_sesons1`
    FOREIGN KEY (`id_season`)
    REFERENCES `football_main`.`sesons` (`id_season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`players_statistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`players_statistics` ;

CREATE TABLE IF NOT EXISTS `football_main`.`players_statistics` (
  `id_season` INT NOT NULL,
  `id_player` INT NOT NULL,
  `id_team` INT NOT NULL,
  `games` INT NULL,
  `goal` INT NULL,
  `assist` INT NULL,
  `yellow_card` INT NULL,
  `red_card` INT NULL,
  `penalty` INT NULL,
  `own_goal` INT NULL,
  `penalty_out` INT NULL,
  PRIMARY KEY (`id_season`, `id_player`, `id_team`),
  INDEX `fk_players_has_sesons_sesons1_idx` (`id_season` ASC),
  INDEX `fk_players_has_sesons_players1_idx` (`id_player` ASC),
  INDEX `fk_players_statistics_teams1_idx` (`id_team` ASC),
  CONSTRAINT `fk_players_has_sesons_players1`
    FOREIGN KEY (`id_player`)
    REFERENCES `football_main`.`players` (`id_player`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_players_has_sesons_sesons1`
    FOREIGN KEY (`id_season`)
    REFERENCES `football_main`.`sesons` (`id_season`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_players_statistics_teams1`
    FOREIGN KEY (`id_team`)
    REFERENCES `football_main`.`teams` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`stadiums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`stadiums` ;

CREATE TABLE IF NOT EXISTS `football_main`.`stadiums` (
  `id_stadium` INT NOT NULL AUTO_INCREMENT,
  `name_stadium` VARCHAR(45) NULL,
  `location` VARCHAR(100) NULL,
  PRIMARY KEY (`id_stadium`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`position` ;

CREATE TABLE IF NOT EXISTS `football_main`.`position` (
  `id_pos` INT NOT NULL AUTO_INCREMENT,
  `pos_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`staff` ;

CREATE TABLE IF NOT EXISTS `football_main`.`staff` (
  `id_staff` INT NOT NULL,
  `staff_name` VARCHAR(70) NULL,
  `id_pos` INT NULL,
  `num_phone` INT NULL,
  PRIMARY KEY (`id_staff`),
  INDEX `fk_staff_position1_idx` (`id_pos` ASC),
  CONSTRAINT `fk_staff_position1`
    FOREIGN KEY (`id_pos`)
    REFERENCES `football_main`.`position` (`id_pos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`matches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`matches` ;

CREATE TABLE IF NOT EXISTS `football_main`.`matches` (
  `id_match` INT NOT NULL AUTO_INCREMENT,
  `id_season` INT NOT NULL,
  `id_division` INT NOT NULL,
  `id_tour` INT NOT NULL,
  `team_home` INT NOT NULL,
  `goal_home` INT NULL,
  `goal_guest` INT NULL,
  `team_guest` INT NOT NULL,
  `m_date` DATETIME NULL,
  `id_stadium` INT NULL,
  `id_referee` INT NULL,
  `transfer` VARCHAR(100) NULL,
  PRIMARY KEY (`id_match`, `id_season`, `id_division`, `id_tour`),
  INDEX `fk_matches_teams1_idx` (`team_home` ASC),
  INDEX `fk_matches_teams2_idx` (`team_guest` ASC),
  INDEX `fk_matches_sesons1_idx` (`id_season` ASC),
  INDEX `fk_matches_stadiums1_idx` (`id_stadium` ASC),
  INDEX `fk_matches_divisions1_idx` (`id_division` ASC),
  INDEX `fk_matches_staff1_idx` (`id_referee` ASC),
  CONSTRAINT `fk_matches_teams1`
    FOREIGN KEY (`team_home`)
    REFERENCES `football_main`.`teams` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_teams2`
    FOREIGN KEY (`team_guest`)
    REFERENCES `football_main`.`teams` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_sesons1`
    FOREIGN KEY (`id_season`)
    REFERENCES `football_main`.`sesons` (`id_season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_stadiums1`
    FOREIGN KEY (`id_stadium`)
    REFERENCES `football_main`.`stadiums` (`id_stadium`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_divisions1`
    FOREIGN KEY (`id_division`)
    REFERENCES `football_main`.`divisions` (`id_division`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_staff1`
    FOREIGN KEY (`id_referee`)
    REFERENCES `football_main`.`staff` (`id_staff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_main`.`players_in_match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `football_main`.`players_in_match` ;

CREATE TABLE IF NOT EXISTS `football_main`.`players_in_match` (
  `id_match` INT NOT NULL,
  `id_player` INT NOT NULL COMMENT 'Заявка на матч. Данные об игроке, участвующем в матче (его активность)',
  `count_goals` INT NULL,
  `count_assist` INT NULL,
  `yellow` INT NULL,
  `red` INT NULL,
  `penalty` INT NULL,
  `penalty_out` INT NULL,
  `own_goal` INT NULL,
  INDEX `fk_players_in_match_players1_idx` (`id_player` ASC),
  INDEX `fk_players_in_match_matches1_idx` (`id_match` ASC),
  PRIMARY KEY (`id_match`, `id_player`),
  CONSTRAINT `fk_players_in_match_players1`
    FOREIGN KEY (`id_player`)
    REFERENCES `football_main`.`players` (`id_player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_players_in_match_matches1`
    FOREIGN KEY (`id_match`)
    REFERENCES `football_main`.`matches` (`id_match`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `football_main`.`divisions`
-- -----------------------------------------------------
START TRANSACTION;
USE `football_main`;
INSERT INTO `football_main`.`divisions` (`id_division`, `name_division`) VALUES (1, 'Высший дивизион');
INSERT INTO `football_main`.`divisions` (`id_division`, `name_division`) VALUES (2, 'Первый дивизион');
INSERT INTO `football_main`.`divisions` (`id_division`, `name_division`) VALUES (3, 'Второй дивизион A');
INSERT INTO `football_main`.`divisions` (`id_division`, `name_division`) VALUES (4, 'Второй дивизион B');
INSERT INTO `football_main`.`divisions` (`id_division`, `name_division`) VALUES (5, 'Третий дивизион A');
INSERT INTO `football_main`.`divisions` (`id_division`, `name_division`) VALUES (6, 'Третий дивизион B');

COMMIT;


-- -----------------------------------------------------
-- Data for table `football_main`.`amplua`
-- -----------------------------------------------------
START TRANSACTION;
USE `football_main`;
INSERT INTO `football_main`.`amplua` (`id_amplua`, `name_amplua`) VALUES (DEFAULT, 'Вратарь');
INSERT INTO `football_main`.`amplua` (`id_amplua`, `name_amplua`) VALUES (DEFAULT, 'Защитник');
INSERT INTO `football_main`.`amplua` (`id_amplua`, `name_amplua`) VALUES (DEFAULT, 'Полузащитник');
INSERT INTO `football_main`.`amplua` (`id_amplua`, `name_amplua`) VALUES (DEFAULT, 'Нападающий');

COMMIT;


-- -----------------------------------------------------
-- Data for table `football_main`.`stadiums`
-- -----------------------------------------------------
START TRANSACTION;
USE `football_main`;
INSERT INTO `football_main`.`stadiums` (`id_stadium`, `name_stadium`, `location`) VALUES (1, 'Спартак 1', 'Академия Спартака');
INSERT INTO `football_main`.`stadiums` (`id_stadium`, `name_stadium`, `location`) VALUES (2, 'Спартак 2', 'Академия Спартака');
INSERT INTO `football_main`.`stadiums` (`id_stadium`, `name_stadium`, `location`) VALUES (3, 'Спартак 3', 'Академия Спартака');
INSERT INTO `football_main`.`stadiums` (`id_stadium`, `name_stadium`, `location`) VALUES (4, 'Спартак 4', 'Академия Спартака');

COMMIT;


-- -----------------------------------------------------
-- Data for table `football_main`.`position`
-- -----------------------------------------------------
START TRANSACTION;
USE `football_main`;
INSERT INTO `football_main`.`position` (`id_pos`, `pos_name`) VALUES (1, 'Руководитель');
INSERT INTO `football_main`.`position` (`id_pos`, `pos_name`) VALUES (2, 'Главный судья');
INSERT INTO `football_main`.`position` (`id_pos`, `pos_name`) VALUES (3, 'Судья 1 категории');
INSERT INTO `football_main`.`position` (`id_pos`, `pos_name`) VALUES (4, 'Судья 2 категории');

COMMIT;


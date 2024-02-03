-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GameQuestDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `GameQuestDB` ;

-- -----------------------------------------------------
-- Schema GameQuestDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GameQuestDB` DEFAULT CHARACTER SET utf8 ;
USE `GameQuestDB` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `role` VARCHAR(100) NULL,
  `profile_picture` VARCHAR(1000) NULL DEFAULT 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `company_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `age_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `age_rating` ;

CREATE TABLE IF NOT EXISTS `age_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game` ;

CREATE TABLE IF NOT EXISTS `game` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `release_date` DATE NULL,
  `avatar_url` VARCHAR(1000) NULL,
  `trailer_url` VARCHAR(1000) NULL,
  `user_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `age_rating_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_game_user1_idx` (`user_id` ASC),
  INDEX `fk_game_company1_idx` (`company_id` ASC),
  INDEX `fk_game_age_rating1_idx` (`age_rating_id` ASC),
  CONSTRAINT `fk_game_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_age_rating1`
    FOREIGN KEY (`age_rating_id`)
    REFERENCES `age_rating` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform` ;

CREATE TABLE IF NOT EXISTS `platform` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `platform_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_character`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_character` ;

CREATE TABLE IF NOT EXISTS `game_character` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `character_avatar_url` VARCHAR(1000) NULL,
  `game_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_characters_game1_idx` (`game_id` ASC),
  CONSTRAINT `fk_characters_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_game_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_game_list` ;

CREATE TABLE IF NOT EXISTS `user_game_list` (
  `game_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `game_rating` INT NULL,
  PRIMARY KEY (`game_id`, `user_id`),
  INDEX `fk_game_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_game_has_user_game1_idx` (`game_id` ASC),
  CONSTRAINT `fk_game_has_user_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platform_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_game` ;

CREATE TABLE IF NOT EXISTS `platform_game` (
  `platform_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  PRIMARY KEY (`platform_id`, `game_id`),
  INDEX `fk_platform_has_game_game1_idx` (`game_id` ASC),
  INDEX `fk_platform_has_game_platform1_idx` (`platform_id` ASC),
  CONSTRAINT `fk_platform_has_game_platform1`
    FOREIGN KEY (`platform_id`)
    REFERENCES `platform` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_platform_has_game_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre_game` ;

CREATE TABLE IF NOT EXISTS `genre_game` (
  `genre_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  PRIMARY KEY (`genre_id`, `game_id`),
  INDEX `fk_genre_has_game_game1_idx` (`game_id` ASC),
  INDEX `fk_genre_has_game_genre1_idx` (`genre_id` ASC),
  CONSTRAINT `fk_genre_has_game_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genre_has_game_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_image` ;

CREATE TABLE IF NOT EXISTS `game_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(1000) NOT NULL,
  `game_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_game_image_game1_idx` (`game_id` ASC),
  CONSTRAINT `fk_game_image_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_character_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_character_image` ;

CREATE TABLE IF NOT EXISTS `game_character_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(1000) NOT NULL,
  `game_character_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_game_character_image_game_character1_idx` (`game_character_id` ASC),
  CONSTRAINT `fk_game_character_image_game_character1`
    FOREIGN KEY (`game_character_id`)
    REFERENCES `game_character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS student@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'student'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`) VALUES (1, 'admin', 'admin', 1, 'admin', 'https://png.pngtree.com/png-vector/20190629/ourmid/pngtree-office-work-user-icon-avatar-png-image_1527655.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`) VALUES (2, 'BillyBob', '123', 1, 'user', 'https://cdn-icons-png.flaticon.com/512/149/149071.png');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`) VALUES (3, 'JohnnyCage', '123', 0, 'user', 'https://cdn-icons-png.flaticon.com/512/149/149071.png');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`) VALUES (4, 'KintaroCao', '123', 1, 'user', 'https://cdn-icons-png.flaticon.com/512/149/149071.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `company` (`id`, `name`, `company_url`) VALUES (1, 'Microsoft', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWhgJJG9oTxy-VPIWn3TPLf8usxWa_fFVMTCHAta8obA&s');
INSERT INTO `company` (`id`, `name`, `company_url`) VALUES (2, 'Blizzard', 'https://blz-contentstack-images.akamaized.net/v3/assets/blta8f9a8e092360c6c/bltbe1a42777abcc0da/620d1898a38b0106946f17d2/thumbnail-home.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `age_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `age_rating` (`id`, `rating`) VALUES (1, 'E');
INSERT INTO `age_rating` (`id`, `rating`) VALUES (2, 'T');
INSERT INTO `age_rating` (`id`, `rating`) VALUES (3, 'M');
INSERT INTO `age_rating` (`id`, `rating`) VALUES (4, 'A');
INSERT INTO `age_rating` (`id`, `rating`) VALUES (5, 'RP');

COMMIT;


-- -----------------------------------------------------
-- Data for table `game`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `game` (`id`, `title`, `description`, `release_date`, `avatar_url`, `trailer_url`, `user_id`, `company_id`, `age_rating_id`) VALUES (1, 'Minecraft', 'Minecraft focuses on allowing the player to explore, interact with, and modify a dynamically-generated map made of one-cubic-meter-sized blocks. In addition to blocks, the environment features plants, mobs, and items. Some activities in the game include mining for ore, fighting hostile mobs, and crafting new blocks and tools by gathering various resources found in the game. The game\'s open-ended model allows players to create structures, creations, and artwork on various multiplayer servers or their single-player maps. Other features include redstone circuits for logic computations and remote actions, minecarts and tracks, and a mysterious underworld called the Nether. A designated but completely optional goal of the game is to travel to a dimension called the End, and defeat the ender dragon.', '2011-11-18', 'https://assets.nintendo.com/image/upload/ar_16:9,c_lpad,w_1240/b_white/f_auto/q_auto/ncom/software/switch/70010000000964/811461b8d1cacf1f2da791b478dccfe2a55457780364c3d5a95fbfcdd4c3086f', 'https://www.youtube.com/watch?v=MmB9b5njVbA&ab_channel=Minecraft', 1, 1, 1);
INSERT INTO `game` (`id`, `title`, `description`, `release_date`, `avatar_url`, `trailer_url`, `user_id`, `company_id`, `age_rating_id`) VALUES (2, 'World of Warcraft', 'World of Warcraft is a massively multiplayer online roleplaying game (MMORPG) set in the Warcraft universe. Players assume the roles of Warcraft heroes as they explore, adventure, and quest across a vast world. Being \"Massively Multiplayer,\" World of Warcraft allows thousands of players to interact within the same world. Whether adventuring together or fighting against each other in epic battles, players will form friendships, forge alliances, and compete with enemies for power and glory.', '2004-11-23', 'https://miro.medium.com/v2/resize:fit:720/format:webp/1*lxMnK_tEriPcNmZIrQGnBA.jpeg', 'https://www.youtube.com/watch?v=c55uHFbfeaw&ab_channel=IGN', 1, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'Action RPG');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'Racing');
INSERT INTO `genre` (`id`, `name`) VALUES (3, 'RTS');

COMMIT;


-- -----------------------------------------------------
-- Data for table `platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `platform` (`id`, `name`, `platform_url`) VALUES (1, 'PC', NULL);
INSERT INTO `platform` (`id`, `name`, `platform_url`) VALUES (2, 'X-box', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `game_character`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `game_character` (`id`, `name`, `description`, `character_avatar_url`, `game_id`) VALUES (1, 'Ender dragon', 'Minecraft character', 'https://netstorage-tuko.akamaized.net/images/3963b3338589a9d8.jpg?imwidth=720', 1);
INSERT INTO `game_character` (`id`, `name`, `description`, `character_avatar_url`, `game_id`) VALUES (2, 'Steve', 'Minecraft character', 'https://netstorage-tuko.akamaized.net/images/7806bcbd23858147.jpg?imwidth=720', 1);
INSERT INTO `game_character` (`id`, `name`, `description`, `character_avatar_url`, `game_id`) VALUES (3, 'Alex', 'Mincecraft chracter', 'https://netstorage-tuko.akamaized.net/images/d873b484fdfde66f.jpg?imwidth=720', 1);
INSERT INTO `game_character` (`id`, `name`, `description`, `character_avatar_url`, `game_id`) VALUES (4, 'Jaina', 'WOW character', 'https://static.wikia.nocookie.net/lunariauniverse/images/0/00/Jaina_Proudmoore.jpg/revision/latest?cb=20220307224028', 2);
INSERT INTO `game_character` (`id`, `name`, `description`, `character_avatar_url`, `game_id`) VALUES (5, 'Sylvanas', 'WOW character', 'https://static.wikia.nocookie.net/wowwiki/images/e/e3/SylvanasBfA.png/revision/latest?cb=20171104004146', 2);
INSERT INTO `game_character` (`id`, `name`, `description`, `character_avatar_url`, `game_id`) VALUES (6, 'Anduin', 'WOW character', 'https://static.wikia.nocookie.net/wowpedia/images/5/57/Anduin_by_Erik_Braddock_-_cropped.jpg/revision/latest?cb=20180913185332', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_game_list`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `user_game_list` (`game_id`, `user_id`, `game_rating`) VALUES (1, 1, 4);
INSERT INTO `user_game_list` (`game_id`, `user_id`, `game_rating`) VALUES (2, 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `platform_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `platform_game` (`platform_id`, `game_id`) VALUES (1, 1);
INSERT INTO `platform_game` (`platform_id`, `game_id`) VALUES (2, 1);
INSERT INTO `platform_game` (`platform_id`, `game_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `genre_game` (`genre_id`, `game_id`) VALUES (1, 1);
INSERT INTO `genre_game` (`genre_id`, `game_id`) VALUES (2, 1);
INSERT INTO `genre_game` (`genre_id`, `game_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `game_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `game_image` (`id`, `image_url`, `game_id`) VALUES (1, 'https://images.igdb.com/igdb/image/upload/t_original/sc8d2z.jpg', 1);
INSERT INTO `game_image` (`id`, `image_url`, `game_id`) VALUES (2, 'https://images.igdb.com/igdb/image/upload/t_original/sc8d31.jpg', 1);
INSERT INTO `game_image` (`id`, `image_url`, `game_id`) VALUES (3, 'https://images.igdb.com/igdb/image/upload/t_original/sc8d30.jpg', 1);
INSERT INTO `game_image` (`id`, `image_url`, `game_id`) VALUES (4, 'https://images.igdb.com/igdb/image/upload/t_original/jxrygijnsvlyv0nu03mg.jpg', 2);
INSERT INTO `game_image` (`id`, `image_url`, `game_id`) VALUES (5, 'https://images.igdb.com/igdb/image/upload/t_original/d2khfd34vxngas71dgci.jpg', 2);
INSERT INTO `game_image` (`id`, `image_url`, `game_id`) VALUES (6, 'https://images.igdb.com/igdb/image/upload/t_original/kqkixazzsokqgoxmuish.jpg', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `game_character_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `GameQuestDB`;
INSERT INTO `game_character_image` (`id`, `image_url`, `game_character_id`) VALUES (1, 'https://static.wikia.nocookie.net/wowwiki/images/0/0e/Sylvanas_timewalkers.jpg/revision/latest?cb=20130703163935', 5);
INSERT INTO `game_character_image` (`id`, `image_url`, `game_character_id`) VALUES (2, 'https://static.wikia.nocookie.net/wowwiki/images/f/f5/Sylvanas_Windrunner_High_Elf_by_Lost_In_Concept.jpg/revision/latest?cb=20110829095414', 5);
INSERT INTO `game_character_image` (`id`, `image_url`, `game_character_id`) VALUES (3, 'https://static.wikia.nocookie.net/wowwiki/images/2/24/Sylvanasconfrontsarthas.jpg/revision/latest?cb=20080909062901', 5);

COMMIT;


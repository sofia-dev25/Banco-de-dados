SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,
FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_
DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBS
TITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
-- -----------------------------------------------------
-- Table `mydb`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao` (
`nota` REAL NOT NULL,
`comentarioa` VARCHAR(45) NOT NULL,
PRIMARY KEY (`nota`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
`idusuario` INT NOT NULL,
`nome` VARCHAR(45) NOT NULL,
`Avaliacao_nota` REAL NOT NULL,
PRIMARY KEY (`idusuario`, `Avaliacao_nota`),
INDEX `fk_usuario_Avaliacao1_idx` (`Avaliacao_nota` ASC) VISIBLE,
CONSTRAINT `fk_usuario_Avaliacao1`
FOREIGN KEY (`Avaliacao_nota`)
REFERENCES `mydb`.`Avaliacao` (`nota`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`filme` (
`idfilme` INT NOT NULL,
`Título` VARCHAR(45) NOT NULL,
`duracao` REAL NOT NULL,
`ano_lancamento` INT NOT NULL,
PRIMARY KEY (`idfilme`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`filme_has_Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`filme_has_Avaliacao` (
`filme_idfilme` INT NOT NULL,
`Avaliacao_nota` REAL NOT NULL,
PRIMARY KEY (`filme_idfilme`, `Avaliacao_nota`),
INDEX `fk_filme_has_Avaliacao_Avaliacao1_idx` (`Avaliacao_nota` ASC) VISIBLE,
INDEX `fk_filme_has_Avaliacao_filme1_idx` (`filme_idfilme` ASC) VISIBLE,
CONSTRAINT `fk_filme_has_Avaliacao_filme1`
FOREIGN KEY (`filme_idfilme`)
REFERENCES `mydb`.`filme` (`idfilme`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_filme_has_Avaliacao_Avaliacao1`
FOREIGN KEY (`Avaliacao_nota`)
REFERENCES `mydb`.`Avaliacao` (`nota`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
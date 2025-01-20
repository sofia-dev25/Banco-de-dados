SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,
FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,N
O_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
`idAluno` INT NOT NULL,
`CPF` INT NOT NULL,
`Nome` VARCHAR(45) NOT NULL,
`matricola_curso` VARCHAR(45) NOT NULL,
PRIMARY KEY (`idAluno`, `CPF`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
`idProfessor` INT NOT NULL,
`Nome` VARCHAR(45) NOT NULL,
`CPF` INT NOT NULL,
`disciplinas` VARCHAR(45) NOT NULL,
PRIMARY KEY (`idProfessor`, `CPF`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
`idCurso` INT NOT NULL,
`nomeCurso` VARCHAR(45) NOT NULL,
`disciplina` VARCHAR(45) NOT NULL,
`cargaHorario` REAL NOT NULL,
`Professor_idProfessor` INT NOT NULL,
`Professor_CPF` INT NOT NULL,
PRIMARY KEY (`idCurso`, `cargaHorario`, `Professor_idProfessor`, `Professor_CPF`),
INDEX `fk_Curso_Professor1_idx` (`Professor_idProfessor` ASC, `Professor_CPF` ASC)
VISIBLE,
CONSTRAINT `fk_Curso_Professor1`
FOREIGN KEY (`Professor_idProfessor` , `Professor_CPF`)
REFERENCES `mydb`.`Professor` (`idProfessor` , `CPF`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Curso_has_Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso_has_Aluno` (
`Curso_idCurso` INT NOT NULL,
`Curso_cargaHorario` REAL NOT NULL,
`Aluno_idAluno` INT NOT NULL,
`Aluno_CPF` INT NOT NULL,
PRIMARY KEY (`Curso_idCurso`, `Curso_cargaHorario`, `Aluno_idAluno`, `Aluno_CPF`),
INDEX `fk_Curso_has_Aluno_Aluno1_idx` (`Aluno_idAluno` ASC, `Aluno_CPF` ASC)
VISIBLE,
INDEX `fk_Curso_has_Aluno_Curso_idx` (`Curso_idCurso` ASC, `Curso_cargaHorario`
ASC) VISIBLE,
CONSTRAINT `fk_Curso_has_Aluno_Curso`
FOREIGN KEY (`Curso_idCurso` , `Curso_cargaHorario`)
REFERENCES `mydb`.`Curso` (`idCurso` , `cargaHorario`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Curso_has_Aluno_Aluno1`
FOREIGN KEY (`Aluno_idAluno` , `Aluno_CPF`)
REFERENCES `mydb`.`Aluno` (`idAluno` , `CPF`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Professor_has_Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor_has_Aluno` (

`Professor_idProfessor` INT NOT NULL,
`Professor_CPF` INT NOT NULL,
`Aluno_idAluno` INT NOT NULL,
`Aluno_CPF` INT NOT NULL,
PRIMARY KEY (`Professor_idProfessor`, `Professor_CPF`, `Aluno_idAluno`,
`Aluno_CPF`),
INDEX `fk_Professor_has_Aluno_Aluno1_idx` (`Aluno_idAluno` ASC, `Aluno_CPF` ASC)
VISIBLE,
INDEX `fk_Professor_has_Aluno_Professor1_idx` (`Professor_idProfessor` ASC,
`Professor_CPF` ASC) VISIBLE,
CONSTRAINT `fk_Professor_has_Aluno_Professor1`
FOREIGN KEY (`Professor_idProfessor` , `Professor_CPF`)
REFERENCES `mydb`.`Professor` (`idProfessor` , `CPF`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Professor_has_Aluno_Aluno1`
FOREIGN KEY (`Aluno_idAluno` , `Aluno_CPF`)
REFERENCES `mydb`.`Aluno` (`idAluno` , `CPF`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
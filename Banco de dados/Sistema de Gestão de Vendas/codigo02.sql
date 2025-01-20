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
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
`idProdutos` INT NULL,
`nome` VARCHAR(45) NOT NULL,
`preço` FLOAT NOT NULL,
`estoque_disponivel` FLOAT NOT NULL,
PRIMARY KEY (`idProdutos`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
`idClientes` INT NOT NULL,
`nome` VARCHAR(45) NOT NULL,
`Telefone` INT NOT NULL,
`endereço` VARCHAR(45) NOT NULL,
`e-mail` VARCHAR(45) NOT NULL,
`Clientes_idClientes` INT NOT NULL,
PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`Pedidos` (
`idPedidos` INT NOT NULL,
`Cliente` VARCHAR(45) NOT NULL,
`lista_itens` INT NOT NULL,
`valor_total` REAL NOT NULL,
`Clientes_idClientes` INT NOT NULL,
PRIMARY KEY (`idPedidos`, `Clientes_idClientes`),
INDEX `fk_Pedidos_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
CONSTRAINT `fk_Pedidos_Clientes1`
FOREIGN KEY (`Clientes_idClientes`)
REFERENCES `mydb`.`Clientes` (`idClientes`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Produtos_has_Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos_has_Pedidos` (
`Produtos_idProdutos` INT NOT NULL,
`Pedidos_idPedidos` INT NOT NULL,
PRIMARY KEY (`Produtos_idProdutos`, `Pedidos_idPedidos`),
INDEX `fk_Produtos_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos` ASC) VISIBLE,
INDEX `fk_Produtos_has_Pedidos_Produtos1_idx` (`Produtos_idProdutos` ASC) VISIBLE,
CONSTRAINT `fk_Produtos_has_Pedidos_Produtos1`
FOREIGN KEY (`Produtos_idProdutos`)
REFERENCES `mydb`.`Produtos` (`idProdutos`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Produtos_has_Pedidos_Pedidos1`
FOREIGN KEY (`Pedidos_idPedidos`)
REFERENCES `mydb`.`Pedidos` (`idPedidos`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
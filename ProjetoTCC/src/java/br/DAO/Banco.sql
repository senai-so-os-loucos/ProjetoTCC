SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ProjetoTCC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjetoTCC` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ProjetoTCC` ;

-- -----------------------------------------------------
-- Table `ProjetoTCC`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoTCC`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Senha` INT(6) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoTCC`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoTCC`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `senha` INT(6) NOT NULL,
  `endereço` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(8) NULL,
  `celular` VARCHAR(8) NULL,
  `data_nascimento` DATE NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `adm` INT NOT NULL,
  `Salario` DOUBLE NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  INDEX `fk_Funcionario_Usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_Funcionario_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `ProjetoTCC`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoTCC`.`Adiantamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoTCC`.`Adiantamento` (
  `idAdiantamento` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATETIME NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `idFuncionario` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idAdiantamento`),
  INDEX `fk_Vales_Funcionario_idx` (`idFuncionario` ASC),
  INDEX `fk_Adiantamento_Usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_Vales_Funcionario`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `ProjetoTCC`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Adiantamento_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `ProjetoTCC`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoTCC`.`Sacar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoTCC`.`Sacar` (
  `idSacar` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATETIME NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `idFuncionario` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idSacar`),
  INDEX `fk_saques_Funcionario1_idx` (`idFuncionario` ASC),
  INDEX `fk_saques_Usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_saques_Funcionario1`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `ProjetoTCC`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_saques_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `ProjetoTCC`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoTCC`.`deposito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoTCC`.`deposito` (
  `iddeposito` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATETIME NOT NULL,
  `Descricao` VARCHAR(100) NOT NULL,
  `idFuncionario` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`iddeposito`),
  INDEX `fk_deposito_Funcionario1_idx` (`idFuncionario` ASC),
  INDEX `fk_deposito_Usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_deposito_Funcionario1`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `ProjetoTCC`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deposito_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `ProjetoTCC`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoTCC`.`saldo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoTCC`.`saldo` (
  `idsaldo` INT NOT NULL,
  `Valor` DOUBLE NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idsaldo`),
  INDEX `fk_saldo_Usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_saldo_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `ProjetoTCC`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

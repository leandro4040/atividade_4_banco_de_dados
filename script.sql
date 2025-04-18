-- MySQL Script generated by MySQL Workbench
-- Mon Mar 31 03:26:18 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PS` DEFAULT CHARACTER SET utf8 ;
USE `PS` ;

-- -----------------------------------------------------
-- Table `PS`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS`.`paciente` (
  `idpaciente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idpaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS`.`medico` (
  `idmedico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `especialidade` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idmedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS`.`pagamento` (
  `idpagamento` INT NOT NULL AUTO_INCREMENT,
  `valor_pago` DECIMAL(10,2) NOT NULL,
  `data_pagamento` DATETIME NOT NULL,
  `metodo_pagamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS`.`servico` (
  `idservico` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idservico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS`.`ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS`.`ordem_servico` (
  `idordem_servico` INT NOT NULL AUTO_INCREMENT,
  `data_solicitacao` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `idpaciente` INT NOT NULL,
  `idmedico` INT NOT NULL,
  `idpagamento` INT NOT NULL,
  `idservico` INT NOT NULL,
  PRIMARY KEY (`idordem_servico`),
  INDEX `fk_ordem_servico_paciente_idx` (`idpaciente` ASC),
  INDEX `fk_ordem_servico_medico1_idx` (`idmedico` ASC),
  INDEX `fk_ordem_servico_pagamento1_idx` (`idpagamento` ASC),
  INDEX `fk_ordem_servico_servico1_idx` (`idservico` ASC),
  CONSTRAINT `fk_ordem_servico_paciente`
    FOREIGN KEY (`idpaciente`)
    REFERENCES `PS`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_medico1`
    FOREIGN KEY (`idmedico`)
    REFERENCES `PS`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_pagamento1`
    FOREIGN KEY (`idpagamento`)
    REFERENCES `PS`.`pagamento` (`idpagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_servico1`
    FOREIGN KEY (`idservico`)
    REFERENCES `PS`.`servico` (`idservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- Wed Nov 10 12:54:51 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema projetopi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projetopi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projetopi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `projetopi` ;

-- -----------------------------------------------------
-- Table `projetopi`.`beneficios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`beneficios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`escolaridade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`escolaridade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`estadocivil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`estadocivil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`raca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`raca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`religiao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`religiao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `rg` VARCHAR(20) NULL DEFAULT NULL,
  `cpf` BIGINT NULL DEFAULT NULL,
  `nis` INT NULL DEFAULT NULL,
  `sus` TINYINT NULL DEFAULT NULL,
  `nascimento` DATE NULL DEFAULT NULL,
  `cidade_nasc` VARCHAR(100) NULL DEFAULT NULL,
  `estado` VARCHAR(2) NULL DEFAULT NULL,
  `num_filhos` INT NULL DEFAULT NULL,
  `endereco_completo` VARCHAR(300) NULL DEFAULT NULL,
  `telefone` BIGINT NULL DEFAULT NULL,
  `profissao` VARCHAR(100) NULL DEFAULT NULL,
  `renda_familiar` INT NULL DEFAULT NULL,
  `participacao_projetos_sociais` TINYINT(1) NULL DEFAULT NULL,
  `desc_projetos_sociais` VARCHAR(100) NULL DEFAULT NULL,
  `talentos` VARCHAR(300) NULL DEFAULT NULL,
  `conhece_cidade` TINYINT(1) NULL DEFAULT NULL,
  `locais_nao_visitados` VARCHAR(300) NULL DEFAULT NULL,
  `escolaridade_id` INT NOT NULL,
  `religiao_id` INT NOT NULL,
  `estadocivil_id` INT NOT NULL,
  `raca_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pessoa_escolaridade_idx` (`escolaridade_id` ASC) VISIBLE,
  INDEX `fk_pessoa_religiao1_idx` (`religiao_id` ASC) VISIBLE,
  INDEX `fk_pessoa_estadocivil1_idx` (`estadocivil_id` ASC) VISIBLE,
  INDEX `fk_pessoa_raca1_idx` (`raca_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_escolaridade`
    FOREIGN KEY (`escolaridade_id`)
    REFERENCES `projetopi`.`escolaridade` (`id`),
  CONSTRAINT `fk_pessoa_estadocivil1`
    FOREIGN KEY (`estadocivil_id`)
    REFERENCES `projetopi`.`estadocivil` (`id`),
  CONSTRAINT `fk_pessoa_raca1`
    FOREIGN KEY (`raca_id`)
    REFERENCES `projetopi`.`raca` (`id`),
  CONSTRAINT `fk_pessoa_religiao1`
    FOREIGN KEY (`religiao_id`)
    REFERENCES `projetopi`.`religiao` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`situacaosaude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`situacaosaude` (
  `idSituacaoSaude` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idSituacaoSaude`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`composicaofamiliar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`composicaofamiliar` (
  `pessoa_id` INT NOT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `estadocivil_id` INT NOT NULL,
  `cpf` BIGINT NULL DEFAULT NULL,
  `nascimento` DATE NULL DEFAULT NULL,
  `escolaridade_id` INT NOT NULL,
  `Ocupacao` VARCHAR(45) NULL DEFAULT NULL,
  `Formal` TINYINT NULL DEFAULT NULL,
  `idSituacaoSaude` INT NULL DEFAULT NULL,
  `vinculo` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_ComposicaoFamiliar_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  INDEX `fk_ComposicaoFamiliar_estadocivil1_idx` (`estadocivil_id` ASC) VISIBLE,
  INDEX `fk_ComposicaoFamiliar_escolaridade1_idx` (`escolaridade_id` ASC) VISIBLE,
  INDEX `fk_ComposicaoFamiliar_SituacaoSaude1_idx` (`idSituacaoSaude` ASC) VISIBLE,
  CONSTRAINT `fk_ComposicaoFamiliar_escolaridade1`
    FOREIGN KEY (`escolaridade_id`)
    REFERENCES `projetopi`.`escolaridade` (`id`),
  CONSTRAINT `fk_ComposicaoFamiliar_estadocivil1`
    FOREIGN KEY (`estadocivil_id`)
    REFERENCES `projetopi`.`estadocivil` (`id`),
  CONSTRAINT `fk_ComposicaoFamiliar_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`),
  CONSTRAINT `fk_ComposicaoFamiliar_SituacaoSaude1`
    FOREIGN KEY (`idSituacaoSaude`)
    REFERENCES `projetopi`.`situacaosaude` (`idSituacaoSaude`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`condicaosocial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`condicaosocial` (
  `pessoa_id` INT NOT NULL,
  `dengue` TINYINT NULL DEFAULT NULL,
  `qtd_dengue` INT NULL DEFAULT NULL,
  `luto` TINYINT NULL DEFAULT NULL,
  `descLuto` VARCHAR(45) NULL DEFAULT NULL,
  `motivoluto` VARCHAR(45) NULL DEFAULT NULL,
  `pscLa` TINYINT NULL DEFAULT NULL,
  `qtdpsc` INT NULL DEFAULT NULL,
  `fundcasa` TINYINT NULL DEFAULT NULL,
  `qtdfundcasa` INT NULL DEFAULT NULL,
  `prisional` TINYINT NULL DEFAULT NULL,
  `quemprisional` VARCHAR(100) NULL DEFAULT NULL,
  `acolhimento` TINYINT NULL DEFAULT NULL,
  `tipo_acolhimento` TINYINT NULL DEFAULT NULL,
  `local_acolhimento` VARCHAR(45) NULL DEFAULT NULL,
  `violencia` TINYINT NULL DEFAULT NULL,
  INDEX `fk_CondicaoSocial_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_CondicaoSocial_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`covid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`covid` (
  `pessoa_id` INT NOT NULL,
  `confirmacao` TINYINT(1) NULL DEFAULT NULL,
  `qtd_pessoas` INT NULL DEFAULT NULL,
  `familia_afetada` TINYINT(1) NULL DEFAULT NULL,
  INDEX `fk_covid_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_covid_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`dano_familiar_covid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`dano_familiar_covid` (
  `id_dano` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_dano`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`data cesta básica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`data cesta básica` (
  `pessoa_id` INT NOT NULL,
  `Coleta` DATE NULL DEFAULT NULL,
  INDEX `fk_Data Cesta Básica_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_Data Cesta Básica_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`lazer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`lazer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`necessidadetransporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`necessidadetransporte` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`programasaude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`programasaude` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`tipoinfraestrutura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`tipoinfraestrutura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`relacao habitacao x infraestrutura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`relacao habitacao x infraestrutura` (
  `tipoInfraestrutura_id` INT NOT NULL,
  `pessoa_id` INT NOT NULL,
  INDEX `fk_relacao habitacao x infraestrutura_tipoInfraestrutura_idx` (`tipoInfraestrutura_id` ASC) VISIBLE,
  INDEX `fk_relacao habitacao x infraestrutura_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_relacao habitacao x infraestrutura_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`),
  CONSTRAINT `fk_relacao habitacao x infraestrutura_tipoInfraestrutura`
    FOREIGN KEY (`tipoInfraestrutura_id`)
    REFERENCES `projetopi`.`tipoinfraestrutura` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`relação pessoa x beneficios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`relação pessoa x beneficios` (
  `beneficios_id` INT NOT NULL,
  `pessoa_id` INT NOT NULL,
  INDEX `fk_relação pessoa x beneficios_beneficios1_idx` (`beneficios_id` ASC) VISIBLE,
  INDEX `fk_relação pessoa x beneficios_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_relação pessoa x beneficios_beneficios1`
    FOREIGN KEY (`beneficios_id`)
    REFERENCES `projetopi`.`beneficios` (`id`),
  CONSTRAINT `fk_relação pessoa x beneficios_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`relação pessoa x dano covid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`relação pessoa x dano covid` (
  `pessoa_id` INT NOT NULL,
  `dano_familiar_covid_id_dano` INT NOT NULL,
  INDEX `fk_listadanosfamiliascovid_dano_familiar_covid1_idx` (`dano_familiar_covid_id_dano` ASC) VISIBLE,
  INDEX `fk_listadanosfamiliascovid_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_listadanosfamiliascovid_dano_familiar_covid1`
    FOREIGN KEY (`dano_familiar_covid_id_dano`)
    REFERENCES `projetopi`.`dano_familiar_covid` (`id_dano`),
  CONSTRAINT `fk_listadanosfamiliascovid_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`relação pessoa x lazer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`relação pessoa x lazer` (
  `pessoa_id` INT NOT NULL,
  `lazer_id` INT NOT NULL,
  INDEX `fk_listalazer_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  INDEX `fk_listalazer_lazer1_idx` (`lazer_id` ASC) VISIBLE,
  CONSTRAINT `fk_listalazer_lazer1`
    FOREIGN KEY (`lazer_id`)
    REFERENCES `projetopi`.`lazer` (`id`),
  CONSTRAINT `fk_listalazer_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`relação pessoa x necessidade transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`relação pessoa x necessidade transporte` (
  `pessoa_id` INT NOT NULL,
  `NecessidadeTransporte_Id` INT NOT NULL,
  `Tem` TINYINT NOT NULL,
  INDEX `fk_Relação Pessoa x Necessidade Transporte_pessoa_idx` (`pessoa_id` ASC) VISIBLE,
  INDEX `fk_Relação Pessoa x Necessidade Transporte_NecessidadeTra_idx` (`NecessidadeTransporte_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Relação Pessoa x Necessidade Transporte_NecessidadeTrans1`
    FOREIGN KEY (`NecessidadeTransporte_Id`)
    REFERENCES `projetopi`.`necessidadetransporte` (`Id`),
  CONSTRAINT `fk_Relação Pessoa x Necessidade Transporte_pessoa`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`relação pessoa x programasaude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`relação pessoa x programasaude` (
  `programasaude_id` INT NOT NULL,
  `pessoa_id` INT NOT NULL,
  INDEX `fk_relação pessoa x programasaude_programasaude1_idx` (`programasaude_id` ASC) VISIBLE,
  INDEX `fk_relação pessoa x programasaude_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_relação pessoa x programasaude_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`),
  CONSTRAINT `fk_relação pessoa x programasaude_programasaude1`
    FOREIGN KEY (`programasaude_id`)
    REFERENCES `projetopi`.`programasaude` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`violencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`violencia` (
  `idViolencia` INT NOT NULL AUTO_INCREMENT,
  `desc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idViolencia`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`relação pessoa x violência`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`relação pessoa x violência` (
  `pessoa_id` INT NOT NULL,
  `violencia_idViolencia` INT NOT NULL,
  INDEX `fk_table1_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  INDEX `fk_table1_violencia1_idx` (`violencia_idViolencia` ASC) VISIBLE,
  CONSTRAINT `fk_table1_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`),
  CONSTRAINT `fk_table1_violencia1`
    FOREIGN KEY (`violencia_idViolencia`)
    REFERENCES `projetopi`.`violencia` (`idViolencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`tipoimovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`tipoimovel` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetopi`.`situacaohabitacional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetopi`.`situacaohabitacional` (
  `pessoa_id` INT NOT NULL,
  `Tipo Imóve_Id` INT NOT NULL,
  `acesso_correio` TINYINT(1) NULL DEFAULT NULL,
  `entrega_local` TINYINT(1) NULL DEFAULT NULL,
  `area` TINYINT(1) NULL DEFAULT NULL,
  INDEX `fk_situacaohabitacional_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  INDEX `fk_situacaohabitacional_imovel_idx` (`Tipo Imóve_Id` ASC) VISIBLE,
  CONSTRAINT `fk_situacaohabitacional_imovel`
    FOREIGN KEY (`Tipo Imóve_Id`)
    REFERENCES `projetopi`.`tipoimovel` (`Id`),
  CONSTRAINT `fk_situacaohabitacional_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `projetopi`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

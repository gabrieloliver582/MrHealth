-- -----------------------------------------------------
-- Database db_mrHealth
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `db_mrHealth`;
CREATE DATABASE IF NOT EXISTS `db_mrHealth`;
USE `db_mrHealth`;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_usuario` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `nm_user` VARCHAR(45) NOT NULL,
  `nn_inventado` VARCHAR(65) NOT NULL,
  `ds_email` VARCHAR(60) NOT NULL,
  `ds_telefone` VARCHAR(11) NOT NULL,
  `vl_peso` DECIMAL(5,2) NOT NULL,
  `vl_altura` DECIMAL(3,2) NOT NULL,
  `dt_nasci` DATE NOT NULL,
  `tp_genero` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_login` (
  `id_login` INT NOT NULL AUTO_INCREMENT,
  `ds_user-email` VARCHAR(60) NOT NULL,
  `ds_password` VARCHAR(45) NOT NULL,
  `dt_ultimo_login` DATETIME NOT NULL,
  PRIMARY KEY (`id_login`),
  UNIQUE INDEX `ds_user_UNIQUE` (`ds_user-email` ASC),
  UNIQUE INDEX `ds_password_UNIQUE` (`ds_password` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_plano` (
  `id_plano` INT NOT NULL AUTO_INCREMENT,
  `nm_plano` VARCHAR(15) NOT NULL,
  `ds_plano` VARCHAR(100) NOT NULL,
  `vl_preco` DECIMAL NOT NULL,
  PRIMARY KEY (`id_plano`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_exercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_exercicio` (
  `id_exercicio` INT NOT NULL AUTO_INCREMENT,
  `nm_exercicio` VARCHAR(45) NOT NULL,
  `ds_exercici` VARCHAR(1000) NOT NULL,
  `md_video` VARCHAR(45) NOT NULL,
  `md_img` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_exercicio`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_refeicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_refeicao` (
  `id_alimentacao` INT NOT NULL AUTO_INCREMENT,
  `nm_alimentacao` VARCHAR(45) NOT NULL,
  `ds_alimentacao` VARCHAR(1000) NOT NULL,
  `md_video` VARCHAR(45) NOT NULL,
  `md_img` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_alimentacao`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_tag_exercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_tag_exercicio` (
  `id_tag` INT NOT NULL AUTO_INCREMENT,
  `nm_tag` VARCHAR(45) NOT NULL,
  `ds_tag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tag`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_tag_refeicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_tag_refeicao` (
  `id_tag` INT NOT NULL AUTO_INCREMENT,
  `nm_tag` VARCHAR(45) NOT NULL,
  `ds_tag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tag`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_objetivo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_objetivo_usuario` (
  `id_objetivo_usuario` INT NOT NULL AUTO_INCREMENT,
  `bt_status_exercicio` BIT(1) NOT NULL,
  `dt_status_exercicio` DATETIME NOT NULL,
  `tbl_tag_refeicao_id_tag` INT NOT NULL,
  `tbl_tag_exercicio_id_tag` INT NOT NULL,
  PRIMARY KEY (`id_objetivo_usuario`),
  INDEX `fk_tbl_objetivo_usuario_tbl_tag_refeicao1_idx` (`tbl_tag_refeicao_id_tag` ASC),
  INDEX `fk_tbl_objetivo_usuario_tbl_tag_exercicio1_idx` (`tbl_tag_exercicio_id_tag` ASC),
    FOREIGN KEY (`tbl_tag_refeicao_id_tag`)
    REFERENCES `db_mrHealth`.`tbl_tag_refeicao` (`id_tag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`tbl_tag_exercicio_id_tag`)
    REFERENCES `db_mrHealth`.`tbl_tag_exercicio` (`id_tag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`rel_plano_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`rel_plano_usuario` (
  `id_plano_usuario` INT NOT NULL AUTO_INCREMENT,
  `vl_preco` DECIMAL NULL,
  PRIMARY KEY (`id_plano_usuario`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_limitacao_exercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_limitacao_exercicio` (
  `id_limitacao_exercicio` INT NOT NULL AUTO_INCREMENT,
  `nm_limitacao` VARCHAR(45) NOT NULL,
  `ds_limitacao` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_limitacao_exercicio`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_igrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_igrediente` (
  `id_limitacao_exercicio` INT NOT NULL AUTO_INCREMENT,
  `nm_limitacao` VARCHAR(45) NOT NULL,
  `ds_limitacao` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_limitacao_exercicio`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`rel_objetivo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`rel_objetivo_usuario` (
  `id_objetivo_usuario` INT NOT NULL AUTO_INCREMENT,
  `tbl_objetivo_usuario_id_objetivo_usuario` INT NOT NULL,
  `tbl_usuario_id_user` INT NOT NULL,
  PRIMARY KEY (`id_objetivo_usuario`),
  INDEX `fk_rel_objetivo_usuario_tbl_objetivo_usuario_idx` (`tbl_objetivo_usuario_id_objetivo_usuario` ASC),
  INDEX `fk_rel_objetivo_usuario_tbl_usuario1_idx` (`tbl_usuario_id_user` ASC),
    FOREIGN KEY (`tbl_objetivo_usuario_id_objetivo_usuario`)
    REFERENCES `db_mrHealth`.`tbl_objetivo_usuario` (`id_objetivo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`tbl_usuario_id_user`)
    REFERENCES `db_mrHealth`.`tbl_usuario` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_status_exercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_status_exercicio` (
  `id_status_exercicio` INT NOT NULL AUTO_INCREMENT,
  `tbl_usuario_id_user` INT NOT NULL,
  PRIMARY KEY (`id_status_exercicio`),
  INDEX `fk_tbl_status_exercicio_tbl_usuario1_idx` (`tbl_usuario_id_user` ASC),
    FOREIGN KEY (`tbl_usuario_id_user`)
    REFERENCES `db_mrHealth`.`tbl_usuario` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`rel_exercicio_tag_exercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`rel_exercicio_tag_exercicio` (
  `id_exercicio_tag_exerciciocol` INT NOT NULL AUTO_INCREMENT,
  `tbl_exercicio_id_exercicio` INT NOT NULL,
  `tbl_tag_exercicio_id_tag` INT NOT NULL,
  PRIMARY KEY (`id_exercicio_tag_exerciciocol`),
  INDEX `fk_rel_exercicio_tag_exercicio_tbl_exercicio1_idx` (`tbl_exercicio_id_exercicio` ASC),
  INDEX `fk_rel_exercicio_tag_exercicio_tbl_tag_exercicio1_idx` (`tbl_tag_exercicio_id_tag` ASC),
    FOREIGN KEY (`tbl_exercicio_id_exercicio`)
    REFERENCES `db_mrHealth`.`tbl_exercicio` (`id_exercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`tbl_tag_exercicio_id_tag`)
    REFERENCES `db_mrHealth`.`tbl_tag_exercicio` (`id_tag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`rel_refeicao_tag_refeicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`rel_refeicao_tag_refeicao` (
  `id_refeicao_tag_refeicao` INT NOT NULL AUTO_INCREMENT,
  `tbl_tag_refeicao_id_tag` INT NOT NULL,
  `tbl_refeicao_id_alimentacao` INT NOT NULL,
  PRIMARY KEY (`id_refeicao_tag_refeicao`),
  INDEX `fk_rel_refeicao_tag_refeicao_tbl_tag_refeicao1_idx` (`tbl_tag_refeicao_id_tag` ASC),
  INDEX `fk_rel_refeicao_tag_refeicao_tbl_refeicao1_idx` (`tbl_refeicao_id_alimentacao` ASC),
    FOREIGN KEY (`tbl_tag_refeicao_id_tag`)
    REFERENCES `db_mrHealth`.`tbl_tag_refeicao` (`id_tag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`tbl_refeicao_id_alimentacao`)
    REFERENCES `db_mrHealth`.`tbl_refeicao` (`id_alimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_limitacao_exercico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_limitacao_exercico` (
  `id_limitacao_exercicio` INT NOT NULL AUTO_INCREMENT,
  `nm_limitacao` VARCHAR(45) NOT NULL,
  `ds_limitacao` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_limitacao_exercicio`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`tbl_limitacao_alimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`tbl_limitacao_alimentacao` (
  `id_limitacao_exercicio` INT NOT NULL AUTO_INCREMENT,
  `nm_limitacao` VARCHAR(45) NOT NULL,
  `ds_limitacao` VARCHAR(150) NOT NULL,
  `tbl_usuario_id_user` INT NOT NULL,
  `tbl_refeicao_id_alimentacao` INT NOT NULL,
  PRIMARY KEY (`id_limitacao_exercicio`),
  INDEX `fk_tbl_limitacao_alimentacao_tbl_usuario1_idx` (`tbl_usuario_id_user` ASC),
  INDEX `fk_tbl_limitacao_alimentacao_tbl_refeicao1_idx` (`tbl_refeicao_id_alimentacao` ASC),
    FOREIGN KEY (`tbl_usuario_id_user`)
    REFERENCES `db_mrHealth`.`tbl_usuario` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`tbl_refeicao_id_alimentacao`)
    REFERENCES `db_mrHealth`.`tbl_refeicao` (`id_alimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`rel_alimentacao_igrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`rel_alimentacao_igrediente` (
  `id_alimentacao_igrediente` INT NOT NULL AUTO_INCREMENT,
  `tbl_refeicao_id_alimentacao` INT NOT NULL,
  `tbl_igrediente_id_limitacao_exercicio` INT NOT NULL,
  PRIMARY KEY (`id_alimentacao_igrediente`),
  INDEX `fk_rel_alimentacao_igrediente_tbl_refeicao1_idx` (`tbl_refeicao_id_alimentacao` ASC),
  INDEX `fk_rel_alimentacao_igrediente_tbl_igrediente1_idx` (`tbl_igrediente_id_limitacao_exercicio` ASC),
    FOREIGN KEY (`tbl_refeicao_id_alimentacao`)
    REFERENCES `db_mrHealth`.`tbl_refeicao` (`id_alimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`tbl_igrediente_id_limitacao_exercicio`)
    REFERENCES `db_mrHealth`.`tbl_igrediente` (`id_limitacao_exercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_mrHealth`.`rel_exercicio_limitacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_mrHealth`.`rel_exercicio_limitacao` (
  `id_exercicio_limitacao` INT NOT NULL AUTO_INCREMENT,
  `tbl_exercicio_id_exercicio` INT NOT NULL,
  `tbl_limitacao_exercico_id_limitacao_exercicio` INT NOT NULL,
  PRIMARY KEY (`id_exercicio_limitacao`),
  INDEX `fk_rel_exercicio_limitacao_tbl_exercicio1_idx` (`tbl_exercicio_id_exercicio` ASC),
  INDEX `fk_rel_exercicio_limitacao_tbl_limitacao_exercico1_idx` (`tbl_limitacao_exercico_id_limitacao_exercicio` ASC),
    FOREIGN KEY (`tbl_exercicio_id_exercicio`)
    REFERENCES `db_mrHealth`.`tbl_exercicio` (`id_exercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`tbl_limitacao_exercico_id_limitacao_exercicio`)
    REFERENCES `db_mrHealth`.`tbl_limitacao_exercico` (`id_limitacao_exercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
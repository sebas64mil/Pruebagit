
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;


CREATE TABLE IF NOT EXISTS `mydb`.`EstadoDelCaso` (
  `idEstadoDelCaso` INT NOT NULL,
  `EstadoDelCasocol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstadoDelCaso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`caso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `ClienteNombre` VARCHAR(45) NOT NULL,
  `ClienteApellido` VARCHAR(45) NOT NULL,
  `Cedula` INT NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `Cedula_UNIQUE` (`Cedula` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Abogado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Abogado` (
  `idAbogado` INT NOT NULL,
  `AbogadoNombre` VARCHAR(45) NOT NULL,
  `Cedula` INT NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAbogado`),
  UNIQUE INDEX `Cedula_UNIQUE` (`Cedula` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`caso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`caso` (
  `idcaso` INT NOT NULL,
  `InfoCaso` VARCHAR(45) NOT NULL,
  `inicio` VARCHAR(45) NOT NULL,
  `final` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `EstadoDelCaso_idEstadoDelCaso` INT NOT NULL,
  PRIMARY KEY (`idcaso`, `EstadoDelCaso_idEstadoDelCaso`),
  INDEX `fk_caso_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_caso_EstadoDelCaso1_idx` (`EstadoDelCaso_idEstadoDelCaso` ASC) VISIBLE,
  CONSTRAINT `fk_caso_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_caso_EstadoDelCaso1`
    FOREIGN KEY (`EstadoDelCaso_idEstadoDelCaso`)
    REFERENCES `mydb`.`EstadoDelCaso` (`idEstadoDelCaso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`caso_has_Abogado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`caso_has_Abogado` (
  `caso_idcaso` INT NOT NULL,
  `Abogado_idAbogado` INT NOT NULL,
  PRIMARY KEY (`caso_idcaso`, `Abogado_idAbogado`),
  INDEX `fk_caso_has_Abogado_Abogado1_idx` (`Abogado_idAbogado` ASC) VISIBLE,
  INDEX `fk_caso_has_Abogado_caso1_idx` (`caso_idcaso` ASC) VISIBLE,
  CONSTRAINT `fk_caso_has_Abogado_caso1`
    FOREIGN KEY (`caso_idcaso`)
    REFERENCES `mydb`.`caso` (`idcaso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_caso_has_Abogado_Abogado1`
    FOREIGN KEY (`Abogado_idAbogado`)
    REFERENCES `mydb`.`Abogado` (`idAbogado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO estadodelcaso(idEstadoDelCaso,EstadoDelCasocol)VALUES(1,'En tramite');
INSERT INTO estadodelcaso(idEstadoDelCaso,EstadoDelCasocol)VALUES(2,'sin iniciar');
INSERT INTO estadodelcaso(idEstadoDelCaso,EstadoDelCasocol)VALUES(3,'Archivado');


INSERT INTO cliente(idCliente,ClienteNombre,ClienteApellido,Cedula,Direccion)VALUES(1,'ricardo','motoñez',48948,'Marcelston');
INSERT INTO cliente(idCliente,ClienteNombre,ClienteApellido,Cedula,Direccion)VALUES(2,'sandra','quintero',98383,'Korčula');
INSERT INTO cliente(idCliente,ClienteNombre,ClienteApellido,Cedula,Direccion)VALUES(3,'eduardo','lopez',35788,'Lake Tyree');

INSERT INTO abogado(idAbogado,AbogadoNombre,Cedula,Direccion)VALUES(1,'Andres',657,'Mancini a mare');
INSERT INTO abogado(idAbogado,AbogadoNombre,Cedula,Direccion)VALUES(2,'Andres',945,'Kowloon');
INSERT INTO abogado(idAbogado,AbogadoNombre,Cedula,Direccion)VALUES(3,'Andres',178,'Murazikshire');


INSERT INTO caso(idcaso,InfoCaso,inicio,final,Cliente_idCliente,EstadoDelCaso_idEstadoDelCaso)VALUES(1,'asesinato','08/03/2000','16/04/2001',1,1);
INSERT INTO caso(idcaso,InfoCaso,inicio,final,Cliente_id,EstadoDelCaso_id)VALUES(2,'robo','23/01/1995','12/05/1997',2,2);
INSERT INTO caso(idcaso,InfoCaso,inicio,final,Cliente_idCliente,EstadoDelCaso_idEstadoDelCaso)VALUES(3,'Secuestro','10/12/2016','25/12/2016',3,3);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

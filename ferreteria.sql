-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ferreteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ferreteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS Ferreteria DEFAULT CHARACTER SET utf8 ;
USE Ferreteria ;

-- -----------------------------------------------------
-- Table Ferreteria.product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ferreteria.product (
  idproduct INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  purchasePrice VARCHAR(45) NOT NULL,
  salesPrice VARCHAR(45) NOT NULL,
  PRIMARY KEY (idproduct))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Ferreteria.category
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ferreteria.category (
  idcategory INT NOT NULL,
  category VARCHAR(45) NOT NULL,
  PRIMARY KEY (idcategory))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Ferreteria.branch
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ferreteria.branch (
  idbranch INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  address VARCHAR(45) NOT NULL,
  manager VARCHAR(45) NOT NULL,
  PRIMARY KEY (idbranch))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Ferreteria.branch_has_product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ferreteria.branch_has_product (
  branch_idbranch INT NOT NULL,
  product_idproduct INT NOT NULL,
  PRIMARY KEY (branch_idbranch, product_idproduct),
  INDEX fk_branch_has_product_product1_idx (product_idproduct ASC) VISIBLE,
  INDEX fk_branch_has_product_branch_idx (branch_idbranch ASC) VISIBLE,
  CONSTRAINT fk_branch_has_product_branch
    FOREIGN KEY (branch_idbranch)
    REFERENCES Ferreteria.branch (idbranch)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_branch_has_product_product1
    FOREIGN KEY (product_idproduct)
    REFERENCES Ferreteria.product (idproduct)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Ferreteria.product_has_category
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ferreteria.product_has_category (
  product_idproduct INT NOT NULL,
  category_idcategory INT NOT NULL,
  PRIMARY KEY (product_idproduct, category_idcategory),
  INDEX fk_product_has_category_category1_idx (category_idcategory ASC) VISIBLE,
  INDEX fk_product_has_category_product1_idx (product_idproduct ASC) VISIBLE,
  CONSTRAINT fk_product_has_category_product1
    FOREIGN KEY (product_idproduct)
    REFERENCES Ferreteria.product (idproduct)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_product_has_category_category1
    FOREIGN KEY (category_idcategory)
    REFERENCES Ferreteria.category (idcategory)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO category(idcategory,category) VALUES ('1','plumbing');
INSERT INTO category(idcategory,category) VALUES ('2','metalworking');
INSERT INTO category(idcategory,category) VALUES ('3','furniture');
INSERT INTO category(idcategory,category) VALUES ('4','other');

INSERT INTO branch(idbranch,branch.name,address,manager)VALUES('1','El Tornillo de Oro','Calle 45 #12-30, Bogotá, Colombia','Andrés Gutiérrez');
INSERT INTO branch(idbranch,branch.name,address,manager)VALUES('2',' La Casa del Herrero',': Avenida Central #89-15, Medellín, Colombia','María Ramírez');


INSERT INTO product(idproduct,product.name,purchasePrice,salesPrice) VALUES ('123','screw','100','300');
INSERT INTO product(idproduct,product.name,purchasePrice,salesPrice) VALUES ('456','hammer','200','400');

INSERT INTO branch_has_product(branch_idbranch,product_idproduct) VALUES ('1','123');
INSERT INTO branch_has_product(branch_idbranch,product_idproduct) VALUES ('2','456');

INSERT INTO product_has_category(product_idproduct,category_idcategory)VALUES('123','3');
INSERT INTO product_has_category(product_idproduct,category_idcategory)VALUES('456','3');


SELECT * FROM product WHERE idproduct="123";

SELECT * FROM category;

SELECT * FROM product_has_category WHERE category_idcategory = "3";


UPDATE 

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
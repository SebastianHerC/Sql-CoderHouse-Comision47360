-- Cambiar el modo de SQL temporalmente
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Crear la base de datos "helpdeskdb" si no existe
CREATE DATABASE IF NOT EXISTS `helpdeskdb` DEFAULT CHARACTER SET utf8 ;
USE `helpdeskdb` ;

-- -----------------------------------------------------
-- Tabla `Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpdeskdb`.`Usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `rut` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`)
)
ENGINE = InnoDB;

-- Insertar datos en la tabla Usuarios
INSERT INTO `helpdeskdb`.`Usuarios` (`nombre`, `rut`, `email`)
VALUES ('Usuario 1', 123456789, 'usuario1@gimnasio.com'),
       ('Usuario 2', 987654321, 'usuario2@gimnasio.com'),
       ('Usuario 3', 555555555, 'usuario3@gimnasio.com');

-- -----------------------------------------------------
-- Tabla `Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpdeskdb`.`Profesores` (
  `id_profesor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `clase` VARCHAR(45) NOT NULL,
  `rut` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_profesor`)
)
ENGINE = InnoDB;

-- Insertar datos en la tabla Profesores
INSERT INTO `helpdeskdb`.`Profesores` (`nombre`, `clase`, `rut`, `email`)
VALUES ('Profesor 1', 'Clase 1', 111111111, 'profesor1@gimnasio.com'),
       ('Profesor 2', 'Clase 2', 222222222, 'profesor2@gimnasio.com');

-- -----------------------------------------------------
-- Tabla `Clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpdeskdb`.`Clases` (
  `id_clase` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_profesor` INT NOT NULL,
  `hora` DATETIME NOT NULL,
  `lugar` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_clase`)
)
ENGINE = InnoDB;

-- Insertar datos en la tabla Clases
INSERT INTO `helpdeskdb`.`Clases` (`fecha`, `id_cliente`, `id_profesor`, `hora`, `lugar`)
VALUES (NOW(), 1, 1, NOW(), 'Lugar 1'),
       (NOW(), 2, 2, NOW(), 'Lugar 2');

-- -----------------------------------------------------
-- Tabla `Trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpdeskdb`.`Trabajador` (
  `id_trabajador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `rut` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `horario` DATETIME NOT NULL,
  PRIMARY KEY (`id_trabajador`)
)
ENGINE = InnoDB;

-- Insertar datos en la tabla Trabajador
INSERT INTO `helpdeskdb`.`Trabajador` (`nombre`, `rut`, `email`, `horario`)
VALUES ('Trabajador 1', 333333333, 'trabajador1@gimnasio.com', NOW()),
       ('Trabajador 2', 444444444, 'trabajador2@gimnasio.com', NOW());

-- -----------------------------------------------------
-- Tabla `Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpdeskdb`.`Ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `id_producto` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `hora` DATETIME NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_venta`)
)
ENGINE = InnoDB;

-- Insertar datos en la tabla Ventas
INSERT INTO `helpdeskdb`.`Ventas` (`id_producto`, `fecha`, `hora`, `id_usuario`)
VALUES (1, NOW(), NOW(), 1),
       (2, NOW(), NOW(), 2);

-- -----------------------------------------------------
-- Tabla `Articulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpdeskdb`.`Articulos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_producto`)
)
ENGINE = InnoDB;

-- Insertar datos en la tabla Articulos
INSERT INTO `helpdeskdb`.`Articulos` (`descripcion`)
VALUES ('Artículo 1'),
       ('Artículo 2');

-- -----------------------------------------------------
-- Tabla `Subscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `helpdeskdb`.`Subscripcion` (
  `id_subscripcion` INT NOT NULL AUTO_INCREMENT,
  `id_venta` INT NOT NULL,
  `id_trabajador` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_profesor` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id_subscripcion`)
)
ENGINE = InnoDB;

-- Insertar datos


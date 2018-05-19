-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.31-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para arac
CREATE DATABASE IF NOT EXISTS `arac` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `arac`;

-- Volcando estructura para tabla arac.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `numCompra` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `encargadoCompra` varchar(15) DEFAULT NULL,
  `nombreNegocio` varchar(45) NOT NULL,
  `motivoCompra` varchar(65) NOT NULL,
  `lugarCompra` varchar(45) NOT NULL,
  `montoTotalCompra` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`numCompra`),
  KEY `encargadoCompra` (`encargadoCompra`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`encargadoCompra`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `primerApellido` varchar(20) NOT NULL,
  `segundoApellido` varchar(20) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `puesto` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `numArticulo` int(5) NOT NULL,
  `nombreArticulo` varchar(45) NOT NULL,
  `cantidad` int(5) NOT NULL,
  `descripcionArticulo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`numArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.prevista
CREATE TABLE IF NOT EXISTS `prevista` (
  `numPrevista` int(10) NOT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `tipoPrevista` int(5) DEFAULT NULL,
  `dueño` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`numPrevista`),
  KEY `tipoPrevista` (`tipoPrevista`),
  KEY `dueño` (`dueño`),
  CONSTRAINT `prevista_ibfk_1` FOREIGN KEY (`tipoPrevista`) REFERENCES `tipoprevista` (`idTipo`),
  CONSTRAINT `prevista_ibfk_2` FOREIGN KEY (`dueño`) REFERENCES `socio` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.recibo
CREATE TABLE IF NOT EXISTS `recibo` (
  `numRecibo` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `cobra` varchar(15) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `numPrevista` int(10) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`numRecibo`),
  KEY `cobra` (`cobra`),
  KEY `numTomaAgua` (`numPrevista`),
  CONSTRAINT `recibo_ibfk_1` FOREIGN KEY (`cobra`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `recibo_ibfk_2` FOREIGN KEY (`numPrevista`) REFERENCES `prevista` (`numPrevista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.salidainventario
CREATE TABLE IF NOT EXISTS `salidainventario` (
  `numSalidaInventario` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `descripcionSalida` varchar(45) DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL,
  `responsable` varchar(15) DEFAULT NULL,
  `articulo` int(5) DEFAULT NULL,
  PRIMARY KEY (`numSalidaInventario`),
  KEY `articulo` (`articulo`),
  KEY `responsable` (`responsable`),
  CONSTRAINT `salidainventario_ibfk_1` FOREIGN KEY (`articulo`) REFERENCES `inventario` (`numArticulo`),
  CONSTRAINT `salidainventario_ibfk_2` FOREIGN KEY (`responsable`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.socio
CREATE TABLE IF NOT EXISTS `socio` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `primerApellido` varchar(15) NOT NULL,
  `segundoApellido` varchar(15) NOT NULL,
  `telefono` int(15) NOT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.tipoprevista
CREATE TABLE IF NOT EXISTS `tipoprevista` (
  `idTipo` int(5) NOT NULL,
  `tarifaMes` int(5) DEFAULT NULL,
  `tipoPrevista` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla arac.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `numUsuario` int(3) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `empleado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`numUsuario`),
  KEY `empleado` (`empleado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

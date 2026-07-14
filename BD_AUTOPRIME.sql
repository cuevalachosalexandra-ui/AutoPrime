-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: autoprime
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `modulo` varchar(50) NOT NULL,
  `accion` varchar(30) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria`),
  KEY `fk_auditoria_usuario` (`id_usuario`),
  CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,1,'Usuarios','INSERTAR','Registró usuario: Miguel','2026-07-09 16:54:39'),(2,1,'Usuarios','INSERTAR','Registró usuario: Alexandra Cueva','2026-07-09 16:56:26'),(3,1,'Usuarios','ELIMINAR','Eliminó usuario ID: 2','2026-07-09 16:56:46'),(4,1,'Usuarios','INSERTAR','Registró usuario: vendedor','2026-07-09 16:57:00'),(5,1,'Usuarios','INSERTAR','Registró usuario: Rubi','2026-07-09 17:00:21'),(6,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Miguel','2026-07-12 17:15:49'),(7,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Miguel','2026-07-12 17:15:57'),(8,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Rubí','2026-07-12 17:16:24'),(9,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Thiago','2026-07-12 17:18:08'),(10,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Rubi','2026-07-12 17:18:22'),(11,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Thiago','2026-07-12 17:18:27'),(12,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Patricio','2026-07-12 17:18:58'),(13,10,'Usuarios','ACTUALIZAR','Actualizó usuario: Alexandra','2026-07-12 21:55:32'),(14,10,'Usuarios','INSERTAR','Registró usuario: Rodrigo','2026-07-12 23:02:24'),(15,10,'Usuarios','ACTUALIZAR','Actualizó usuario: Jose','2026-07-12 23:05:35'),(16,10,'Usuarios','ACTUALIZAR','Actualizó usuario: Rodrigo','2026-07-12 23:05:57'),(17,10,'Usuarios','ACTUALIZAR','Actualizó usuario: Alexandra','2026-07-12 23:06:05'),(18,10,'Usuarios','ACTUALIZAR','Actualizó usuario: Miguel','2026-07-12 23:06:23'),(19,10,'Usuarios','ACTUALIZAR','Actualizó usuario: Thiago','2026-07-12 23:06:41'),(20,1,'Usuarios','ACTUALIZAR','Actualizó usuario: Alexandra','2026-07-12 23:43:04');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_repuesto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_repuesto` (`id_repuesto`),
  KEY `fk_entrada_usuario` (`id_usuario`),
  CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id`),
  CONSTRAINT `fk_entrada_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (1,1,5,'2026-06-03','Reacsa',NULL),(2,2,10,'2026-06-03','Reacsa',NULL),(3,1,4,'2026-06-21','Reacsa',NULL),(4,250,5,'2026-07-10','Repuestos Elite S.A.C.',NULL),(5,2,5,'2026-07-10','Euro Motors Import S.A.C.',1),(6,2,5,'2026-07-12','Etna',1),(7,3,5,'2026-07-12','Etna',1),(8,206,10,'2026-07-11','Euro Motors Import S.A.C.',1),(9,205,8,'2026-07-12','Euro Motors Import S.A.C.',1),(10,208,7,'2026-07-12','Denso',10),(11,1,4,'2026-07-10','Euro Motors Import S.A.C.',1);
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_repuesto` int DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_repuesto` (`id_repuesto`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `cargo_contacto` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `estado` char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (2,'20100070922','Derco Perú S.A.','Carlos Ramírez','Ejecutivo de Ventas','987655500','ventas@derco.pe','Av. Nicolás Ayllón 2648, Ate, Lima','A'),(3,'20131312955','Divemotor S.A.','Luis Herrera','Asesor Comercial','945632222','repuestos@divemotor.com.pe','Av. Nicolás Ayllón 2520, Ate, Lima','I'),(4,'20536557858','Motored S.A.','Ana Torres','Ejecutiva Comercial','965874123','contacto@motored.pe','Av. Canadá 3250, San Luis, Lima','A'),(5,'20601234567','Auto Parts Import S.A.C.','María Sánchez','Gerente Comercial','912345678','ventas@autopartsimport.pe','Av. Argentina 1850, Cercado de Lima','A'),(6,'20547896521','Premium Auto Repuestos S.A.C.','José Gutiérrez','Supervisor de Ventas','923456781','comercial@premiumauto.pe','Av. Colonial 1200, Cercado de Lima','A'),(7,'20607894561','Euro Motors Import S.A.C.','Patricia León','Asesora Comercial','934567892','ventas@euromotors.pe','Av. Universitaria 4500, Los Olivos','A'),(8,'20589654123','Repuestos Elite S.A.C.','Miguel Salazar','Coordinador Comercial','956789100','pedidos@repuestoselite.pe','Av. Tomás Valle 1890, Callao','A'),(10,'20578451236','Auto Luxury Import S.A.C.','Fernando Castro','Gerente de Ventas','944321876','ventas@autoluxury.pe','Av. Javier Prado Este 5200, La Molina','A'),(11,'20619874563','Performance Motors S.A.C.','Claudia Rojas','Asesora de Repuestos','988123456','contacto@performancemotors.pe','Av. Benavides 3100, Miraflores','A'),(14,'20610000001','AutoParts Import S.A.C.','Carlos Mendoza','Gerente Comercial','987654301','carlos.mendoza@autoparts.com','Av. México 1250, La Victoria, Lima','A'),(15,'20610000002','Repuestos Andinos S.A.C.','María López','Ejecutiva de Ventas','987654302','maria.lopez@repuestosandinos.com','Av. Aviación 4500, Surquillo, Lima','A'),(16,'20610000003','Motores del Perú S.A.C.','Luis Ramírez','Jefe Comercial','987654303','luis.ramirez@motoresperu.com','Jr. Parinacochas 890, La Victoria, Lima','A'),(18,'20610000005','Distribuidora Mecánica Perú S.A.C.','Pedro Sánchez','Supervisor de Ventas','987654305','pedro.sanchez@dimeperu.com','Av. Industrial 1020, Trujillo','A'),(19,'20610000006','Repuestos Express S.A.C.','Sofía Castillo','Gerente de Ventas','987654306','sofia.castillo@repuestosexpress.com','Av. Javier Prado 2350, San Borja','A'),(20,'20610000007','Global Auto Parts S.A.C.','Miguel Díaz','Representante Comercial','987654307','miguel.diaz@globalautoparts.com','Av. Canadá 1450, La Victoria','A'),(21,'20610000008','Importaciones Car Center S.A.C.','Rosa Flores','Coordinadora Comercial','987654308','rosa.flores@carcenter.com','Av. Colonial 2230, Callao','A'),(22,'20610000009','Tecno Repuestos S.A.C.','Jorge Ruiz','Gerente General','987654309','jorge.ruiz@tecnorepuestos.com','Av. Salaverry 850, Chiclayo','A'),(23,'20610000010','Grupo Automotriz Perú S.A.C.','Patricia Vega','Ejecutiva Comercial','987654310','patricia.vega@grupoautomotriz.com','Av. Bolognesi 420, Piura','A'),(24,'20610000011','Autosupply Perú S.A.C.','Fernando Rojas','Jefe de Ventas','987654311','fernando.rojas@autosupply.com','Av. Balta 980, Chiclayo','A'),(25,'20610000012','Mega Repuestos S.A.C.','Carmen Herrera','Supervisora Comercial','987654312','carmen.herrera@megarepuestos.com','Av. Ejército 1500, Arequipa','A'),(26,'20610000013','Importadora Racing Parts S.A.C.','Diego Castro','Gerente Comercial','987654313','diego.castro@racingparts.com','Av. Universitaria 2100, Lima','A'),(27,'20610000014','Perú Motor Parts S.A.C.','Julia Navarro','Asesora Comercial','987654314','julia.navarro@motorparts.com','Av. América Norte 1250, Trujillo','A'),(28,'20610000015','Repuestos Premium S.A.C.','Ricardo Paredes','Representante de Ventas','987654315','ricardo.paredes@premiumparts.com','Av. San Martín 540, Chiclayo','A'),(29,'20610000016','Distribuidora Diesel Perú S.A.C.','Sandra Campos','Gerente Comercial','987654316','sandra.campos@dieselperu.com','Av. Panamericana Norte Km 780, Chiclayo','A'),(30,'20610000017','Importadora Nippon Parts S.A.C.','Óscar Medina','Jefe Comercial','987654317','oscar.medina@nipponparts.com','Av. República de Panamá 4200, Lima','A'),(31,'20610000018','Auto Solution Perú S.A.C.','Daniela Silva','Ejecutiva de Ventas','987654318','daniela.silva@autosolution.com','Av. Angamos 1850, Surquillo','A'),(32,'20610000019','Master Repuestos S.A.C.','Raúl Guerrero','Supervisor Comercial','987654319','raul.guerrero@masterrepuestos.com','Av. Los Incas 720, Cusco','A'),(34,'20610000021','Importadora Santa Rosa S.A.C.','Javier León','Representante Comercial','987654321','javier.leon@santarosa.com','Av. Sánchez Cerro 1250, Piura','A'),(35,'20610000022','Auto Repuestos del Pacífico S.A.C.','Melissa Cruz','Coordinadora Comercial','987654322','melissa.cruz@arpacifico.com','Av. El Sol 640, Cusco','A'),(36,'20610000023','Repuestos Continental S.A.C.','Héctor Peña','Gerente Comercial','987654323','hector.pena@continental.com','Av. Progreso 1200, Chimbote','A'),(37,'20610000024','Speed Motors Parts S.A.C.','Andrea Molina','Asesora Comercial','987654324','andrea.molina@speedmotors.com','Av. América Sur 1350, Trujillo','A'),(38,'20610000025','Importadora AutoMax S.A.C.','José Cabrera','Jefe Comercial','987654325','jose.cabrera@automax.com','Av. La Marina 2250, San Miguel','A'),(39,'20610000026','Distribuidora Full Motor S.A.C.','Natalia Fuentes','Ejecutiva Comercial','987654326','natalia.fuentes@fullmotor.com','Av. Pedro Ruiz 860, Chiclayo','A'),(40,'20610000027','AutoRepuestos Elite S.A.C.','Gustavo Romero','Supervisor de Ventas','987654327','gustavo.romero@eliteparts.com','Av. Faucett 980, Callao','A'),(41,'20610000028','Importadora Velocity Parts S.A.C.','Paola Miranda','Gerente Comercial','987654328','paola.miranda@velocityparts.com','Av. Brasil 1520, Jesús María','A'),(42,'20610000029','Comercial Autotec S.A.C.','Kevin Valdez','Ejecutivo Comercial','987654333','kevin.valdez@autotec.com','Av. José Pardo 640, Chiclayo','A'),(43,'20610000030','Repuestos Master Car S.A.C.','Lucía Espinoza','Jefa de Ventas','987654330','lucia.espinoza@mastercar.com','Av. Santa Victoria 420, Chiclayo','A'),(44,'20610000031','Importadora AutoDrive S.A.C.','Marco Gutiérrez','Gerente Comercial','987654331','marco.gutierrez@autodrive.com','Av. Nicolás de Piérola 450, Chiclayo','A'),(45,'20610000032','Repuestos Continental Motors S.A.C.','Elena Vargas','Jefa de Ventas','987654332','elena.vargas@continentalmotors.com','Av. José Leonardo Ortiz 1250, Chiclayo','A'),(46,'20610000033','AutoRepuestos Fénix S.A.C.','Renzo Salazar','Supervisor Comercial','987654333','renzo.salazar@fenixparts.com','Av. Sáenz Peña 870, Callao','A'),(47,'20610000034','Corporación MotorCar S.A.C.','Diana Benites','Ejecutiva de Cuentas','987654334','diana.benites@motorcar.com','Av. Larco 980, Trujillo','A'),(48,'20610000035','Importadora Auto World S.A.C.','Hugo Córdova','Gerente de Ventas','987654335','hugo.cordova@autoworld.com','Av. Ejército 2100, Arequipa','A'),(49,'20610000036','Repuestos Elite Perú S.A.C.','Gabriela Núñez','Coordinadora Comercial','987654336','gabriela.nunez@eliteperu.com','Av. Grau 740, Piura','A'),(50,'20610000037','Distribuidora Premium Parts S.A.C.','Cristian Lozano','Representante Comercial','987654337','cristian.lozano@premiumparts.com','Av. Salaverry 1430, Chiclayo','A'),(51,'20610000038','Importadora Turbo Motors S.A.C.','Valeria Campos','Jefa Comercial','987654338','valeria.campos@turbomotors.com','Av. Túpac Amaru 1840, Lima','A'),(52,'20610000039','Auto Supply Norte S.A.C.','Eduardo Carrasco','Gerente General','987654339','eduardo.carrasco@autosupplynorte.com','Av. Francisco Bolognesi 520, Chiclayo','A'),(53,'20610000040','Corporación Repuestos del Pacífico S.A.C.','Fiorella Castillo','Ejecutiva Comercial','987654340','fiorella.castillo@repuestospacifico.com','Av. Prolongación Bolognesi 350, Chiclayo','A');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuestos`
--

DROP TABLE IF EXISTS `repuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuestos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `stock_minimo` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `uk_repuesto_nombre_marca` (`nombre`,`marca`),
  KEY `fk_repuesto_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_repuesto_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuestos`
--

LOCK TABLES `repuestos` WRITE;
/*!40000 ALTER TABLE `repuestos` DISABLE KEYS */;
INSERT INTO `repuestos` VALUES (1,NULL,'Filtro de Aceite','Toyota',35.50,32,NULL,5),(2,'REP002','Pastillas de Freno','Bosch',120.00,0,NULL,5),(3,'REP003','Batería 12V','Etna',280.00,20,NULL,5),(204,'REP004','Amortiguador Delantero','Monroe',250.00,12,NULL,5),(205,'REP005','Correa de Distribución','Gates',95.00,26,NULL,5),(206,'REP006','Filtro de Aire','Mann Filter',40.00,29,NULL,5),(207,'REP007','Filtro de Combustible','Bosch',55.00,19,NULL,5),(208,'REP008','Radiador','Denso',450.00,14,NULL,5),(209,'REP009','Bomba de Agua','Aisin',180.00,14,NULL,5),(239,NULL,'Manguera de radiador','Gates',60.00,35,NULL,5),(244,NULL,'Amortiguador Trasero','Monroe',240.00,14,NULL,5),(250,NULL,'Alternador','Valeo',680.00,8,NULL,5),(252,NULL,'Disco de Freno Delantero','Brembo',320.00,10,NULL,5),(253,NULL,'Disco de Freno Trasero','Brembo',290.00,10,NULL,5),(254,NULL,'Kit de Embrague','LUK',780.00,8,NULL,5),(255,NULL,'Bujía de Iridio','NGK',65.00,50,NULL,5),(256,NULL,'Bobina de Encendido','Denso',280.00,15,NULL,5),(257,NULL,'Sensor de Oxígeno','Bosch',360.00,0,NULL,5),(258,NULL,'Sensor MAF','Bosch',420.00,8,NULL,5),(260,NULL,'Termostato','Wahler',95.00,20,NULL,5),(261,NULL,'Bomba de Combustible','Denso',420.00,10,NULL,5),(262,NULL,'Junta de Culata','Victor Reinz',180.00,12,NULL,5),(263,NULL,'Retén de Cigüeñal','Elring',45.00,30,NULL,5),(264,NULL,'Tensor de Correa','Gates',160.00,18,NULL,5),(265,NULL,'Polea Tensora','INA',180.00,15,NULL,5),(266,NULL,'Correa Poly V','Continental',95.00,25,NULL,5),(267,NULL,'Soporte de Motor','Febi Bilstein',280.00,12,NULL,5),(268,NULL,'Terminal de Dirección','TRW',120.00,20,NULL,5),(269,NULL,'Rótula de Suspensión','TRW',145.00,18,NULL,5),(270,NULL,'Barra Estabilizadora','Lemforder',180.00,15,NULL,5),(271,NULL,'Bieleta de Suspensión','Lemforder',110.00,20,NULL,5),(272,NULL,'Rodamiento de Rueda','SKF',220.00,16,NULL,5),(273,NULL,'Cubo de Rueda','SKF',380.00,8,NULL,5),(274,NULL,'Cremallera de Dirección','ZF',1350.00,3,NULL,5),(275,NULL,'Bomba de Dirección Hidráulica','ZF',890.00,5,NULL,5),(276,NULL,'Compresor de Aire Acondicionado','Denso',1450.00,4,NULL,5),(277,NULL,'Condensador A/C','Valeo',680.00,6,NULL,5),(278,NULL,'Evaporador A/C','Valeo',620.00,6,NULL,5),(279,NULL,'Ventilador de Radiador','Denso',480.00,8,NULL,5),(280,NULL,'Motor de Arranque','Bosch',720.00,5,NULL,5),(281,NULL,'Inyector de Combustible','Denso',590.00,12,NULL,5),(282,NULL,'Turbo Compresor','Garrett',2850.00,2,NULL,5),(283,NULL,'Intercooler','Mishimoto',1350.00,4,NULL,5),(284,NULL,'Catalizador','Bosal',950.00,5,NULL,5),(285,NULL,'Silenciador de Escape','Bosal',520.00,8,NULL,5),(286,NULL,'Kit Cadena de Distribución','INA',980.00,6,NULL,5),(287,NULL,'Módulo ABS','Bosch',1800.00,3,NULL,5),(288,NULL,'ECU Motor','Bosch',3200.00,2,NULL,5),(289,NULL,'Filtro de Cabina','Mann Filter',55.00,25,NULL,5),(290,NULL,'Espejo Retrovisor','TYC',380.00,10,NULL,5),(291,NULL,'Faro Delantero','Hella',980.00,6,NULL,5),(292,NULL,'Faro Posterior','Hella',760.00,6,NULL,5),(293,NULL,'Parachoque Delantero','TYC',950.00,5,NULL,5),(294,NULL,'Parachoque Trasero','TYC',900.00,5,NULL,5),(295,NULL,'Capó','TYC',1200.00,3,NULL,5),(296,NULL,'Guardafango Izquierdo','TYC',450.00,8,NULL,5),(297,NULL,'Guardafango Derecho','TYC',450.00,8,NULL,5),(298,NULL,'Parrilla Frontal','Depo',380.00,10,NULL,5),(299,NULL,'Luna Espejo','TYC',90.00,20,NULL,5),(300,NULL,'Cable de Bujía','NGK',140.00,18,NULL,5),(301,NULL,'Tapa de Radiador','Denso',45.00,25,NULL,5),(303,NULL,'Tapón de Cárter','Toyota',20.00,40,NULL,5),(304,NULL,'Filtro de Transmisión','Mann Filter',95.00,15,NULL,5),(305,NULL,'Aceite de Transmisión','Mobil',95.00,35,NULL,5),(306,NULL,'Aceite de Motor 5W30','Mobil',180.00,40,NULL,5),(307,NULL,'Aceite de Motor 10W40','Castrol',165.00,30,NULL,5),(308,NULL,'Líquido de Frenos DOT4','Bosch',45.00,35,NULL,5),(309,NULL,'Refrigerante','Prestone',55.00,30,NULL,5),(310,NULL,'Limpiaparabrisas','Bosch',65.00,30,NULL,5),(311,NULL,'Motor Limpiaparabrisas','Valeo',380.00,8,NULL,5),(312,NULL,'Bomba Lavaparabrisas','Denso',90.00,15,NULL,5),(313,NULL,'Manija Exterior','TYC',120.00,12,NULL,5),(314,NULL,'Manija Interior','TYC',90.00,12,NULL,5),(315,NULL,'Elevavidrio Eléctrico','Valeo',350.00,8,NULL,5),(316,NULL,'Chapa de Puerta','Toyota',180.00,10,NULL,5),(317,NULL,'Switch de Encendido','Bosch',220.00,8,NULL,5),(318,NULL,'Relay Universal','Bosch',30.00,40,NULL,5),(319,NULL,'Fusible Automotriz','Bosch',5.00,100,NULL,5),(320,NULL,'Caja de Fusibles','Bosch',280.00,5,NULL,5),(321,NULL,'Sensor CKP','Bosch',290.00,10,NULL,5),(322,NULL,'Sensor CMP','Bosch',290.00,10,NULL,5),(323,NULL,'Sensor de Temperatura','Denso',95.00,18,NULL,5),(324,NULL,'Sensor de Velocidad','Bosch',180.00,15,NULL,5),(325,NULL,'Polea de Cigüeñal','INA',350.00,8,NULL,5),(326,NULL,'Volante de Motor','LUK',950.00,5,NULL,5),(327,NULL,'Horquilla de Embrague','LUK',180.00,10,NULL,5),(328,NULL,'Cilindro Maestro de Embrague','AISIN',290.00,8,NULL,5),(329,NULL,'Cilindro Esclavo de Embrague','AISIN',240.00,8,NULL,5),(330,NULL,'Bomba de Freno','Bosch',380.00,8,NULL,5),(331,NULL,'Servofreno','Bosch',750.00,4,NULL,5),(332,NULL,'Caliper Delantero','TRW',420.00,6,NULL,5),(333,NULL,'Caliper Trasero','TRW',390.00,6,NULL,5),(334,NULL,'Tambor de Freno','TRW',260.00,8,NULL,5),(335,NULL,'Zapatas de Freno','Bosch',180.00,12,NULL,5),(336,NULL,'Cruceta de Cardán','SKF',160.00,12,NULL,5),(337,NULL,'Palier Completo','SKF',780.00,5,NULL,5),(338,NULL,'Homocinética','SKF',420.00,8,NULL,5),(339,NULL,'Retén de Rueda','SKF',45.00,30,NULL,5),(340,NULL,'Rodillo Tensor','INA',180.00,15,NULL,5),(341,NULL,'Banda de Accesorios','Continental',120.00,20,NULL,5),(342,NULL,'Kit de Empaques de Motor','Victor Reinz',380.00,6,NULL,5),(362,NULL,'Sensor MAP','Delphi',280.00,10,NULL,5),(446,NULL,'Aceite sintético 5W-30 1L','Castrol',38.00,25,NULL,5),(447,NULL,'Filtro de Aceite','Tecfil',120.00,20,NULL,5),(501,NULL,'Sensor MAF Electrónico','Bosch',850.00,10,NULL,5),(502,NULL,'Llanta Carbono Premium','Rays',1200.00,16,NULL,5),(503,NULL,'Neumático Run Flat','Pirelli',2800.00,20,NULL,5);
/*!40000 ALTER TABLE `repuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuestos_backup`
--

DROP TABLE IF EXISTS `repuestos_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuestos_backup` (
  `id` int NOT NULL DEFAULT '0',
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuestos_backup`
--

LOCK TABLES `repuestos_backup` WRITE;
/*!40000 ALTER TABLE `repuestos_backup` DISABLE KEYS */;
INSERT INTO `repuestos_backup` VALUES (1,NULL,'Filtro de Aceite','Toyota',35.50,30,NULL),(2,'REP002','Pastillas de Freno','Bosch',120.00,20,NULL),(3,'REP003','Batería 12V','Etna',280.00,10,NULL),(204,'REP004','Amortiguador Delantero','Monroe',250.00,12,NULL),(205,'REP005','Correa de Distribución','Gates',95.00,18,NULL),(206,'REP006','Filtro de Aire','Mann Filter',40.00,20,NULL),(207,'REP007','Filtro de Combustible','Bosch',55.00,20,NULL),(208,'REP008','Radiador','Denso',450.00,8,NULL),(209,'REP009','Bomba de Agua','Aisin',180.00,14,NULL),(239,NULL,'Manguera de radiador','Gates',60.00,35,NULL),(241,NULL,'Pastillas de Freno','Bosch',120.00,23,NULL),(242,NULL,'Batería 12V','Etna',280.00,10,NULL),(243,NULL,'Amortiguador Delantero','Monroe',250.00,12,NULL),(244,NULL,'Amortiguador Trasero','Monroe',240.00,15,NULL),(247,NULL,'Filtro de Combustible','Bosch',55.00,20,NULL),(248,NULL,'Radiador','Denso',450.00,8,NULL),(249,NULL,'Bomba de Agua','Aisin',180.00,14,NULL),(250,NULL,'Alternador','Valeo',680.00,8,NULL),(251,NULL,'Manguera de Radiador','Gates',60.00,35,NULL),(252,NULL,'Disco de Freno Delantero','Brembo',320.00,10,NULL),(253,NULL,'Disco de Freno Trasero','Brembo',290.00,10,NULL),(254,NULL,'Kit de Embrague','LUK',780.00,8,NULL),(255,NULL,'Bujía de Iridio','NGK',65.00,50,NULL),(256,NULL,'Bobina de Encendido','Denso',280.00,15,NULL),(257,NULL,'Sensor de Oxígeno','Bosch',350.00,10,NULL),(258,NULL,'Sensor MAF','Bosch',420.00,8,NULL),(260,NULL,'Termostato','Wahler',95.00,20,NULL),(261,NULL,'Bomba de Combustible','Denso',420.00,10,NULL),(262,NULL,'Junta de Culata','Victor Reinz',180.00,12,NULL),(263,NULL,'Retén de Cigüeñal','Elring',45.00,30,NULL),(264,NULL,'Tensor de Correa','Gates',160.00,18,NULL),(265,NULL,'Polea Tensora','INA',180.00,15,NULL),(266,NULL,'Correa Poly V','Continental',95.00,25,NULL),(267,NULL,'Soporte de Motor','Febi Bilstein',280.00,12,NULL),(268,NULL,'Terminal de Dirección','TRW',120.00,20,NULL),(269,NULL,'Rótula de Suspensión','TRW',145.00,18,NULL),(270,NULL,'Barra Estabilizadora','Lemforder',180.00,15,NULL),(271,NULL,'Bieleta de Suspensión','Lemforder',110.00,20,NULL),(272,NULL,'Rodamiento de Rueda','SKF',220.00,16,NULL),(273,NULL,'Cubo de Rueda','SKF',380.00,8,NULL),(274,NULL,'Cremallera de Dirección','ZF',1350.00,3,NULL),(275,NULL,'Bomba de Dirección Hidráulica','ZF',890.00,5,NULL),(276,NULL,'Compresor de Aire Acondicionado','Denso',1450.00,4,NULL),(277,NULL,'Condensador A/C','Valeo',680.00,6,NULL),(278,NULL,'Evaporador A/C','Valeo',620.00,6,NULL),(279,NULL,'Ventilador de Radiador','Denso',480.00,8,NULL),(280,NULL,'Motor de Arranque','Bosch',720.00,5,NULL),(281,NULL,'Inyector de Combustible','Denso',590.00,12,NULL),(282,NULL,'Turbo Compresor','Garrett',2850.00,2,NULL),(283,NULL,'Intercooler','Mishimoto',1350.00,4,NULL),(284,NULL,'Catalizador','Bosal',950.00,5,NULL),(285,NULL,'Silenciador de Escape','Bosal',520.00,8,NULL),(286,NULL,'Kit Cadena de Distribución','INA',980.00,6,NULL),(287,NULL,'Módulo ABS','Bosch',1800.00,3,NULL),(288,NULL,'ECU Motor','Bosch',3200.00,2,NULL),(289,NULL,'Filtro de Cabina','Mann Filter',55.00,25,NULL),(290,NULL,'Espejo Retrovisor','TYC',380.00,10,NULL),(291,NULL,'Faro Delantero','Hella',980.00,6,NULL),(292,NULL,'Faro Posterior','Hella',760.00,6,NULL),(293,NULL,'Parachoque Delantero','TYC',950.00,5,NULL),(294,NULL,'Parachoque Trasero','TYC',900.00,5,NULL),(295,NULL,'Capó','TYC',1200.00,3,NULL),(296,NULL,'Guardafango Izquierdo','TYC',450.00,8,NULL),(297,NULL,'Guardafango Derecho','TYC',450.00,8,NULL),(298,NULL,'Parrilla Frontal','Depo',380.00,10,NULL),(299,NULL,'Luna Espejo','TYC',90.00,20,NULL),(300,NULL,'Cable de Bujía','NGK',140.00,18,NULL),(301,NULL,'Tapa de Radiador','Denso',45.00,25,NULL),(302,NULL,'Depósito de Refrigerante','Dorman',180.00,10,NULL),(303,NULL,'Tapón de Cárter','Toyota',20.00,40,NULL),(304,NULL,'Filtro de Transmisión','Mann Filter',95.00,15,NULL),(305,NULL,'Aceite de Transmisión','Mobil',95.00,35,NULL),(306,NULL,'Aceite de Motor 5W30','Mobil',180.00,40,NULL),(307,NULL,'Aceite de Motor 10W40','Castrol',165.00,30,NULL),(308,NULL,'Líquido de Frenos DOT4','Bosch',45.00,35,NULL),(309,NULL,'Refrigerante','Prestone',55.00,30,NULL),(310,NULL,'Limpiaparabrisas','Bosch',65.00,30,NULL),(311,NULL,'Motor Limpiaparabrisas','Valeo',380.00,8,NULL),(312,NULL,'Bomba Lavaparabrisas','Denso',90.00,15,NULL),(313,NULL,'Manija Exterior','TYC',120.00,12,NULL),(314,NULL,'Manija Interior','TYC',90.00,12,NULL),(315,NULL,'Elevavidrio Eléctrico','Valeo',350.00,8,NULL),(316,NULL,'Chapa de Puerta','Toyota',180.00,10,NULL),(317,NULL,'Switch de Encendido','Bosch',220.00,8,NULL),(318,NULL,'Relay Universal','Bosch',30.00,40,NULL),(319,NULL,'Fusible Automotriz','Bosch',5.00,100,NULL),(320,NULL,'Caja de Fusibles','Bosch',280.00,5,NULL),(321,NULL,'Sensor CKP','Bosch',290.00,10,NULL),(322,NULL,'Sensor CMP','Bosch',290.00,10,NULL),(323,NULL,'Sensor de Temperatura','Denso',95.00,18,NULL),(324,NULL,'Sensor de Velocidad','Bosch',180.00,15,NULL),(325,NULL,'Polea de Cigüeñal','INA',350.00,8,NULL),(326,NULL,'Volante de Motor','LUK',950.00,5,NULL),(327,NULL,'Horquilla de Embrague','LUK',180.00,10,NULL),(328,NULL,'Cilindro Maestro de Embrague','AISIN',290.00,8,NULL),(329,NULL,'Cilindro Esclavo de Embrague','AISIN',240.00,8,NULL),(330,NULL,'Bomba de Freno','Bosch',380.00,8,NULL),(331,NULL,'Servofreno','Bosch',750.00,4,NULL),(332,NULL,'Caliper Delantero','TRW',420.00,6,NULL),(333,NULL,'Caliper Trasero','TRW',390.00,6,NULL),(334,NULL,'Tambor de Freno','TRW',260.00,8,NULL),(335,NULL,'Zapatas de Freno','Bosch',180.00,12,NULL),(336,NULL,'Cruceta de Cardán','SKF',160.00,12,NULL),(337,NULL,'Palier Completo','SKF',780.00,5,NULL),(338,NULL,'Homocinética','SKF',420.00,8,NULL),(339,NULL,'Retén de Rueda','SKF',45.00,30,NULL),(340,NULL,'Rodillo Tensor','INA',180.00,15,NULL),(341,NULL,'Banda de Accesorios','Continental',120.00,20,NULL),(342,NULL,'Kit de Empaques de Motor','Victor Reinz',380.00,6,NULL),(344,NULL,'Pastillas de Freno','Bosch',120.00,23,NULL),(345,NULL,'Batería 12V','Etna',280.00,10,NULL),(346,NULL,'Amortiguador Delantero','Monroe',250.00,12,NULL),(347,NULL,'Amortiguador Trasero','Monroe',240.00,15,NULL),(348,NULL,'Correa de Distribución','Gates',95.00,18,NULL),(350,NULL,'Filtro de Combustible','Bosch',55.00,20,NULL),(351,NULL,'Radiador','Denso',450.00,8,NULL),(352,NULL,'Bomba de Agua','Aisin',180.00,14,NULL),(353,NULL,'Alternador','Valeo',680.00,3,NULL),(354,NULL,'Manguera de Radiador','Gates',60.00,35,NULL),(355,NULL,'Disco de Freno Delantero','Brembo',320.00,10,NULL),(356,NULL,'Disco de Freno Trasero','Brembo',290.00,10,NULL),(357,NULL,'Kit de Embrague','LUK',780.00,8,NULL),(358,NULL,'Bujía de Iridio','NGK',65.00,50,NULL),(359,NULL,'Bobina de Encendido','Denso',280.00,15,NULL),(360,NULL,'Sensor de Oxígeno','Bosch',350.00,10,NULL),(361,NULL,'Sensor MAF','Bosch',420.00,8,NULL),(362,NULL,'Sensor MAP','Delphi',280.00,10,NULL),(363,NULL,'Termostato','Wahler',95.00,20,NULL),(364,NULL,'Bomba de Combustible','Denso',420.00,10,NULL),(365,NULL,'Junta de Culata','Victor Reinz',180.00,12,NULL),(366,NULL,'Retén de Cigüeñal','Elring',45.00,30,NULL),(367,NULL,'Tensor de Correa','Gates',160.00,18,NULL),(368,NULL,'Polea Tensora','INA',180.00,15,NULL),(369,NULL,'Correa Poly V','Continental',95.00,25,NULL),(370,NULL,'Soporte de Motor','Febi Bilstein',280.00,12,NULL),(371,NULL,'Terminal de Dirección','TRW',120.00,20,NULL),(372,NULL,'Rótula de Suspensión','TRW',145.00,18,NULL),(373,NULL,'Barra Estabilizadora','Lemforder',180.00,15,NULL),(374,NULL,'Bieleta de Suspensión','Lemforder',110.00,20,NULL),(375,NULL,'Rodamiento de Rueda','SKF',220.00,16,NULL),(376,NULL,'Cubo de Rueda','SKF',380.00,8,NULL),(377,NULL,'Cremallera de Dirección','ZF',1350.00,3,NULL),(378,NULL,'Bomba de Dirección Hidráulica','ZF',890.00,5,NULL),(379,NULL,'Compresor de Aire Acondicionado','Denso',1450.00,4,NULL),(380,NULL,'Condensador A/C','Valeo',680.00,6,NULL),(381,NULL,'Evaporador A/C','Valeo',620.00,6,NULL),(382,NULL,'Ventilador de Radiador','Denso',480.00,8,NULL),(383,NULL,'Motor de Arranque','Bosch',720.00,5,NULL),(384,NULL,'Inyector de Combustible','Denso',590.00,12,NULL),(385,NULL,'Turbo Compresor','Garrett',2850.00,2,NULL),(386,NULL,'Intercooler','Mishimoto',1350.00,4,NULL),(387,NULL,'Catalizador','Bosal',950.00,5,NULL),(388,NULL,'Silenciador de Escape','Bosal',520.00,8,NULL),(389,NULL,'Kit Cadena de Distribución','INA',980.00,6,NULL),(390,NULL,'Módulo ABS','Bosch',1800.00,3,NULL),(391,NULL,'ECU Motor','Bosch',3200.00,2,NULL),(392,NULL,'Filtro de Cabina','Mann Filter',55.00,25,NULL),(393,NULL,'Espejo Retrovisor','TYC',380.00,10,NULL),(394,NULL,'Faro Delantero','Hella',980.00,6,NULL),(395,NULL,'Faro Posterior','Hella',760.00,6,NULL),(396,NULL,'Parachoque Delantero','TYC',950.00,5,NULL),(397,NULL,'Parachoque Trasero','TYC',900.00,5,NULL),(398,NULL,'Capó','TYC',1200.00,3,NULL),(399,NULL,'Guardafango Izquierdo','TYC',450.00,8,NULL),(400,NULL,'Guardafango Derecho','TYC',450.00,8,NULL),(401,NULL,'Parrilla Frontal','Depo',380.00,10,NULL),(402,NULL,'Luna Espejo','TYC',90.00,20,NULL),(403,NULL,'Cable de Bujía','NGK',140.00,18,NULL),(404,NULL,'Tapa de Radiador','Denso',45.00,25,NULL),(405,NULL,'Depósito de Refrigerante','Dorman',180.00,10,NULL),(406,NULL,'Tapón de Cárter','Toyota',20.00,40,NULL),(407,NULL,'Filtro de Transmisión','Mann Filter',95.00,15,NULL),(408,NULL,'Aceite de Transmisión','Mobil',95.00,35,NULL),(409,NULL,'Aceite de Motor 5W30','Mobil',180.00,40,NULL),(410,NULL,'Aceite de Motor 10W40','Castrol',165.00,30,NULL),(411,NULL,'Líquido de Frenos DOT4','Bosch',45.00,35,NULL),(412,NULL,'Refrigerante','Prestone',55.00,30,NULL),(413,NULL,'Limpiaparabrisas','Bosch',65.00,30,NULL),(414,NULL,'Motor Limpiaparabrisas','Valeo',380.00,8,NULL),(415,NULL,'Bomba Lavaparabrisas','Denso',90.00,15,NULL),(416,NULL,'Manija Exterior','TYC',120.00,12,NULL),(417,NULL,'Manija Interior','TYC',90.00,12,NULL),(418,NULL,'Elevavidrio Eléctrico','Valeo',350.00,8,NULL),(419,NULL,'Chapa de Puerta','Toyota',180.00,10,NULL),(420,NULL,'Switch de Encendido','Bosch',220.00,8,NULL),(421,NULL,'Relay Universal','Bosch',30.00,40,NULL),(422,NULL,'Fusible Automotriz','Bosch',5.00,100,NULL),(423,NULL,'Caja de Fusibles','Bosch',280.00,5,NULL),(424,NULL,'Sensor CKP','Bosch',290.00,10,NULL),(425,NULL,'Sensor CMP','Bosch',290.00,10,NULL),(426,NULL,'Sensor de Temperatura','Denso',95.00,18,NULL),(427,NULL,'Sensor de Velocidad','Bosch',180.00,15,NULL),(428,NULL,'Polea de Cigüeñal','INA',350.00,8,NULL),(429,NULL,'Volante de Motor','LUK',950.00,5,NULL),(430,NULL,'Horquilla de Embrague','LUK',180.00,10,NULL),(431,NULL,'Cilindro Maestro de Embrague','AISIN',290.00,8,NULL),(432,NULL,'Cilindro Esclavo de Embrague','AISIN',240.00,8,NULL),(433,NULL,'Bomba de Freno','Bosch',380.00,8,NULL),(434,NULL,'Servofreno','Bosch',750.00,4,NULL),(435,NULL,'Caliper Delantero','TRW',420.00,6,NULL),(436,NULL,'Caliper Trasero','TRW',390.00,6,NULL),(437,NULL,'Tambor de Freno','TRW',260.00,8,NULL),(438,NULL,'Zapatas de Freno','Bosch',180.00,12,NULL),(439,NULL,'Cruceta de Cardán','SKF',160.00,12,NULL),(440,NULL,'Palier Completo','SKF',780.00,5,NULL),(441,NULL,'Homocinética','SKF',420.00,8,NULL),(442,NULL,'Retén de Rueda','SKF',45.00,30,NULL),(443,NULL,'Rodillo Tensor','INA',180.00,15,NULL),(444,NULL,'Banda de Accesorios','Continental',120.00,20,NULL),(445,NULL,'Kit de Empaques de Motor','Victor Reinz',380.00,6,NULL),(446,NULL,'Aceite sintético 5W-30 1L','Castrol',38.00,25,NULL),(447,NULL,'Filtro de Aceite','Tecfil',120.00,20,NULL),(448,NULL,'HOLA','Tecfil',100.00,10,NULL),(449,NULL,'Filtro de Aceite','Tecfil',120.00,5,NULL),(450,NULL,'Radiador','Denso',450.00,7,NULL);
/*!40000 ALTER TABLE `repuestos_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidas`
--

DROP TABLE IF EXISTS `salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salidas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repuesto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_salida_usuario` (`id_usuario`),
  CONSTRAINT `fk_salida_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidas`
--

LOCK TABLES `salidas` WRITE;
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
INSERT INTO `salidas` VALUES (1,207,2,'2026-06-04 10:09:07',NULL),(2,2,2,'2026-06-22 09:52:05',NULL),(3,210,3,'2026-06-22 09:52:30',NULL),(4,1,2,'2026-07-09 08:22:15',NULL),(5,1,2,'2026-07-09 08:25:59',NULL),(6,1,2,'2026-07-09 08:26:20',NULL),(7,1,2,'2026-07-09 08:26:35',NULL),(8,2,8,'2026-07-12 09:16:44',1),(9,206,1,'2026-07-13 01:02:37',1),(10,207,1,'2026-07-13 01:03:16',1),(11,208,1,'2026-07-13 01:08:53',1),(12,244,1,'2026-07-13 01:20:34',1),(13,257,2,'2026-07-13 09:00:50',10),(14,257,9,'2026-07-13 09:43:52',1),(15,2,30,'2026-07-14 01:56:32',1);
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Alexandra','admin2','123456','ADMIN'),(7,'Miguel','migue','123456','EMPLEADO'),(9,'Thiago','vendedor','123456','EMPLEADO'),(10,'Jose','autoprime1','autoprime1','EMPLEADO'),(11,'Rodrigo','vendedor3','3333','EMPLEADO');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-13 20:52:04

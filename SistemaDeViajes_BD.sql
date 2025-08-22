Drop database if exists DBSistemaDeViajes;
Create database DBSistemaDeViajes;

use DBSistemaDeViajes;

create table Proveedor(
	codigoProveedor int not null auto_increment,
    nombreEmpresa varchar(75) not null,
    descripcionServicios varchar(255) not null,
    telefono varchar(12) not null,
    direccion varchar(255) not null,
    email varchar(100) not null,
    calificacionPromedio decimal(3,2) not null,
    estado boolean not null,
    primary key PK_codigoProveedor(codigoProveedor)
);

create table Compra(
	codigoCompra int not null auto_increment,
    total decimal(10,2) not null,
    observaciones varchar(255) not null,
    fechaCompra date not null,
    estado boolean not null,
    codigoProveedor int not null,
    primary key PK_codigoCompra(codigoCompra)
);

create table DetalleCompra(
	codigoDetalleCompra int not null auto_increment,
    observaciones varchar(255),
    fechaServicio date not null,
    precioUnitario decimal(10,2) not null,
    cantidad int not null,
    estado boolean not null,
    codigoCompra int not null,
    codigoProveedor int not null,
    primary key PK_codigoDetalleCompra(codigoDetalleCompra),
    constraint FK_DetalleCompra_Compra foreign key (codigoCompra) references Compra(codigoCompra),
    constraint FK_DetalleCompra_Proveedor foreign key (codigoProveedor) references Proveedor(codigoProveedor)
);

create table Disponibilidad(
	codigoDisponibilidad int not null auto_increment,
    cuposDisponibles int not null,
    fecha date not null,
    horaInicio time not null, 
    horaFin time not null,
    estado boolean not null,
    primary key PK_codigoDisponibilidad(codigoDisponibilidad)
);

create table Servicio(
	codigoServicio int not null auto_increment,
    nombre varchar(255) not null,
    tipoServicio varchar(255) not null,
    descripcion varchar(255),
    capacidadMaxima int not null,
    incluye varchar(255),
    precio decimal(10,2) not null,
    duracion varchar(255),
    estado boolean not null,
    codigoCompra int not null,
    codigoDisponibilidad int not null,
    primary key PK_codigoServicio(codigoServicio),
    constraint FK_Servicio_Compra foreign key (codigoCompra) references Compra(codigoCompra),
    constraint FK_Servicio_Disponibilidad foreign key (codigoDisponibilidad) references Disponibilidad(codigoDisponibilidad)
);

create table Destino(
	codigoDestino int not null auto_increment,
    nombre varchar(75) not null,
    descripcion varchar(255) not null,
    pais varchar(75) not null,
    ciudad varchar(75) not null,
    informacionTuristica varchar(255) not null,
    clima varchar(75) not null,
    mejorEpocaVisita varchar(255) not null,
    estado boolean not null,
    codigoServicio int not null,
    primary key PK_codigoDestino(codigoDestino),
    constraint FK_Destino_Servicio foreign key(codigoServicio) references Servicio(codigoServicio)
);

create table Cliente(
	codigoCliente int not null auto_increment,
    nombre varchar(75) not null,
    apellido varchar(75) not null,
    telefono varchar(8),
    email varchar(100) not null,
    direccion varchar(255),
    fechaRegistro date not null,
    estado boolean not null,
    primary key PK_codigoCliente(codigoCliente)
);

create table Usuario(
	codigoUsuario int not null auto_increment,
    nombreUsuario varchar(75) not null,
    contrasenia varchar(75) not null,
    rol varchar(45) not null,
    estado boolean not null,
    codigoCliente int not null,
    primary key PK_codigoUsuario(codigoUsuario),
    constraint FK_Usuario_Cliente foreign key(codigoCliente) references Cliente(codigoCliente)
);

create table Venta(
	codigoVenta int not null auto_increment,
    comision decimal(10,2) not null,
    observaciones varchar(255) not null,
    fechaVenta date not null,
    descuento decimal(3,2),
    estado boolean not null,
    codigoServicio int not null,
    primary key PK_codigoVenta(codigoVenta),
    constraint FK_Venta_Servicio foreign key (codigoServicio) references Servicio(codigoServicio)
);

create table DetalleVenta(
	codigoDetalleVenta int not null auto_increment,
    observaciones varchar(255),
    fechaServicio date not null,
    precioUnitario decimal(10,2) not null,
    cantidad int not null,
    estado boolean not null,
    codigoVenta int not null,
    codigoCliente int not null,
    primary key PK_codigoDetalleVenta(codigoDetalleVenta),
    constraint FK_DetalleVenta_Venta foreign key (codigoVenta) references Venta(codigoVenta),
    constraint FK_DetalleVenta_Cliente foreign key (codigoCliente) references Cliente(codigoCliente)
);

create table MetodoPago(
	codigoMetodoPago int not null auto_increment,
    nombre varchar(50) not null,
    descripcion varchar(255),
    comision decimal(10,2) not null,
    tipo varchar(50) not null,
    estado boolean not null,
    primary key PK_codigoMetodoPago(codigoMetodoPago)
);

create table EstadoPago(
	codigoEstadoPago int not null auto_increment,
    notificacionEnviada boolean not null,
    observaciones varchar(255),
    fechaCambio date not null,
    estado boolean not null,
    primary key PK_codigoEstadoPago(codigoEstadoPago)
);

create table pago (
    codigoPago int not null auto_increment,
    monto decimal(10, 2) not null,
    datosValidos varchar(100) not null,
    fechaPago date not null,
    observaciones varchar(255),
    estado boolean not null,
    codigoCompra int not null,
    codigoVenta int not null,
    codigoMetodoPago int not null,
    codigoEstadoPago int not null,
    primary key pk_codigoPago (codigoPago),
    constraint fk_Pago_Compra foreign key (codigoCompra)  references Compra(codigoCompra),
    constraint fk_Pago_Venta foreign key (codigoVenta) references Venta(codigoVenta),
    constraint fk_Pago_MetodoPago foreign key (codigoMetodoPago) references MetodoPago(codigoMetodoPago),
    constraint fk_Pago_EstadoPago foreign key (codigoEstadoPago) references EstadoPago(codigoEstadoPago)
);

insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Aventura Maya', 'Tours a Ruinas Mayas y Cenotes', '50212345678', 'Calle 10, Ciudad de Guatemala', 'contacto@aventuramaya.com', 4.75, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Viajes Sndinos', 'Excursiones a Montañas y Volcanes', '50287654321', 'Av. Reforma, Ciudad de Guatemala', 'info@viajesandinos.com', 4.60, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Mar Szul', 'Paquetes Turísticos a Playas', '50222334455', 'Zona 10, Ciudad de Guatemala', 'reservas@marazul.com', 4.50, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Explora Mundo', 'Viajes Internacionales y Nacionales', '50233445566', 'Zona 15, Ciudad de Guatemala', 'ventas@exploramundo.com', 4.85, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Ecotur', 'Ecoturismo y Senderismo', '50244556677', 'Zona 1, Antigua Guatemala', 'info@ecotur.com', 4.40, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Sky Travel', 'Tours en Helicóptero y Avioneta', '50255667788', 'Zona 9, Ciudad de Guatemala', 'contact@skytravel.com', 4.90, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Aventura Xtrem', 'Deportes Extremos y Aventuras', '50266778899', 'Zona 4, Quetzaltenango', 'extrem@aventurax.com', 4.55, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Rutas del Vafé', 'Tours de Café y Cultura', '50277889900', 'Zona 1, Cobán', 'cafe@rutasdelcafe.com', 4.70, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Paraíso Natural', 'Resorts y Hospedaje en la Naturaleza', '50288990011', 'Zona 2, Petén', 'info@paraisonatural.com', 4.65, true);
insert into proveedor (nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio, estado) values ('Cultura Viva', 'Tours Culturales y Gastronómicos', '50299001122', 'Zona 6, Chichicastenango', 'cultura@vivagt.com', 4.80, true);

insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (1500.00, 'Compra de Paquetes Turísticos para Temporada Alta', '2025-01-10', true, 1);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (2500.50, 'Paquetes para Semana Santa', '2025-02-05', true, 2);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (1800.75, 'Reserva de Hospedajes en Playa', '2025-02-15', true, 3);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (3200.00, 'Compra de Vuelos y Excursiones', '2025-03-01', true, 4);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (900.00, 'Paquetes Ecoturísticos', '2025-03-10', true, 5);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (2300.00, 'Tours Aéreos y Excursiones', '2025-03-15', true, 6);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (1500.50, 'Aventuras Extremas y Deportes', '2025-03-20', true, 7);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (800.00, 'Tours de Café y Culturales', '2025-03-25', true, 8);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (2100.00, 'Reservas en Resorts Naturales', '2025-04-01', true, 9);
insert into compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (1300.00, 'Tours Gastronómicos y Culturales', '2025-04-05', true, 10);

insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Tour Guiado a Ruinas Mayas', '2025-05-01', 500.00, true, 3, 1, 1);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Ascenso Volcán con Camping', '2025-05-05', 250.00, true, 2, 2, 2);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Hospedaje en Playa Blanca', '2025-05-10', 300.00, true, 2, 3, 3);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Vuelo Ida y Vuelta a Cancún', '2025-05-15', 800.00, true, 1, 4, 4);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Tour Selva Petén', '2025-05-20', 190.00, true, 4, 5, 5);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Vuelo Panorámico en Helicóptero', '2025-05-25', 1200.00, true, 1, 6, 6);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Rafting en Río Cahabón', '2025-05-30', 350.00, true, 3, 7, 7);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Ruta del Café con Degustación', '2025-06-02', 100.00, true, 5, 8, 8);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Resort el Paraíso', '2025-06-05', 450.00, true, 2, 9, 9);
insert into detalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoCompra, codigoProveedor) values ('Tour Gastronómico Chichi', '2025-06-08', 150.00, true, 4, 10, 10);

insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (15, '2025-05-01', '08:00:00', '12:00:00', true);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (20, '2025-05-05', '06:00:00', '18:00:00', true);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (10, '2025-05-10', '14:00:00', '20:00:00', true);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (8, '2025-05-15', '09:00:00', '11:00:00', false);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (25, '2025-05-20', '07:00:00', '16:00:00', true);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (12, '2025-05-25', '10:00:00', '12:00:00', true);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (18, '2025-05-30', '13:00:00', '17:00:00', true);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (30, '2025-06-02', '08:00:00', '15:00:00', true);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (16, '2025-06-05', '09:00:00', '14:00:00', false);
insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (22, '2025-06-08', '10:00:00', '18:00:00', true);

insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Tour a Tikal', 'Turismo Cultural', 'Visita Guiada a las Ruinas Mayas', 20, 'Transporte, Guía, Almuerzo', 500.00, '8 Horas', true, 1, 1);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Ascenso al Volcán Acatenango', 'Aventura', 'Subida Nocturna con Camping', 15, 'Guía, Equipo de Campamento', 250.00, '2 Días', true, 2, 2);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Hospedaje en Playa blanca', 'Hospedaje', '3 Noches en Hotel Frente al Mar', 10, 'Desayuno Incluido', 300.00, '3 Días', true, 3, 3);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Vuelo a Cancún', 'Transporte Aéreo', 'Boleto de Avión Ida y Vuelta', 30, 'Bebida de Cortesía', 800.00, '4 Horas', false, 4, 4);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Tour Selva Petén', 'Aventura', 'Recorrido por la Selva', 25, 'Guía, Snacks', 190.00, '6 Horas', true, 5, 5);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Vuelo Panorámico en Helicóptero', 'Aéreo', 'Recorrido Aéreo por la Ciudad', 6, 'Agua y Fotos', 1200.00, '1 Hora', true, 6, 6);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Rafting Río Cahabón', 'Aventura', 'Descenso en Rápidos', 18, 'Equipo y Guía', 350.00, '5 Horas', true, 7, 7);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Ruta del Café', 'Cultural', 'Bisita a Fincas de Café', 30, 'Degustación Incluida', 100.00, '4 Horas', true, 8, 8);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Resort el Paraíso', 'Hospedaje', 'Paquete de Lujo Todo Incluido', 20, 'Todas las Comidas', 450.00, '3 Días', false, 9, 9);
insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values ('Tour Gastronómico Chichi', 'Cultural', 'Recorrido Culinario por Mercados', 25, 'Degustaciones', 150.00, '5 Horas', true, 10, 10);

insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Tikal', 'Ciudad Maya en la Selva', 'Guatemala', 'Flores', 'Ruinas y Naturaleza', 'Tropical', 'Noviembre-Abril', true, 1);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Volcan Acatenango', 'Volcán Activo con Vistas al Fuego', 'Guatemala', 'Chimaltenango', 'Aventura y Camping', 'Templado', 'Diciembre-Febrero', true, 2);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Playa Blanca', 'Playa Virgen de Arena Blanca', 'Guatemala', 'Izabal', 'Snorkel y Descanso', 'Tropical', 'Marzo-Junio', true, 3);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Cancún', 'Destino Turístico Raribeño', 'México', 'Cancún', 'Playas y Vida Nocturna', 'Tropical', 'Diciembre-Abril', true, 4);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Selva Petén', 'Recorridos por Naturaleza', 'Guatemala', 'Petén', 'Fauna y Flora', 'Húmedo', 'Noviembre-Febrero', true, 5);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Ciudad de Guatemala', 'Vista Aérea Panorámica', 'Guatemala', 'Guatemala', 'Edificios y Volcanes', 'Templado', 'Todo el Año', true, 6);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Río Cahabón', 'Rápidos de Aguas Cristalinas', 'Guatemala', 'Alta Verapaz', 'Rafting y Kayak', 'Húmedo', 'Mayo-Julio', true, 7);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Rutas del Café', 'Fincas y Cultura Cafetera', 'Guatemala', 'Cobán', 'Degustación y Tours', 'Templado', 'Enero-Marzo', true, 8);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Resort Paraíso Natural', 'Hotel en Medio de la Naturaleza', 'Guatemala', 'Petén', 'Relax y Spa', 'Tropical', 'Noviembre-Marzo', true, 9);
insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values ('Chichicastenango', 'Mercado Tradicional', 'Guatemala', 'Chichicastenango', 'Cultura y Artesanías', 'Templado', 'Todo el Año', true, 10);

insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Juan', 'Perez', '12345678', 'juan.perez@gmail.com', 'Zona 1, Ciudad de Guatemala', '2024-01-15', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Maria', 'Gonzalez', '78456123', 'maria.gonzalez@hotmail.com', 'Zona 10, Ciudad de Guatemala', '2024-03-20', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Carlos', 'Lopez', '6547123', 'carlos.lopez@yahoo.com', 'Zona 4, Ciudad de Guatemala', '2024-04-10', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Ana', 'Martinez', '15632478', 'ana.martinez@gmail.com', 'Zona 7, Ciudad de Guatemala', '2024-05-05', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Luis', 'Rodriguez', '96584123', 'luis.rodriguez@gmail.com', 'Zona 2, Ciudad de Guatemala', '2024-06-12', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Sofia', 'Ramirez', '86594123', 'sofia.ramirez@hotmail.com', 'Zona 15, Ciudad de Guatemala', '2024-07-22', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Miguel', 'Diaz', '12396378', 'miguel.diaz@yahoo.com', 'Zona 3, Ciudad de Guatemala', '2024-08-30', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Carla', 'Fernandez', '23647859', 'carla.fernandez@gmail.com', 'Zona 1, Ciudad de Guatemala', '2024-09-18', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Jorge', 'Gomez', '87423615', 'jorge.gomez@hotmail.com', 'Zona 6, Ciudad de Guatemala', '2024-10-24', true);
insert into cliente (nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values ('Paula', 'Castillo', '41289673', 'paula.castillo@yahoo.com', 'Zona 11, Ciudad de Guatemala', '2024-11-15', true);

insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('juanp', 'pass123', 'Cliente', true, 1);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('mariag', 'pass456', 'Empleado', true, 2);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('carlosl', 'pass789', 'Cliente', true, 3);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('anam', 'pass234', 'Cliente', true, 4);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('luisr', 'pass567', 'Cliente', true, 5);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('sofiar', 'pass890', 'Cliente', true, 6);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('migueld', 'pass345', 'Cliente', true, 7);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('carlaf', 'pass678', 'Cliente', true, 8);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('jorgeg', 'pass901', 'Empleado', true, 9);
insert into usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values ('paulac', 'pass012', 'Cliente', true, 10);

insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (100.00, 'Venta Paquete Tour Tikal', '2025-06-01', 0.10, true, 1);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (150.00, 'Venta Paquete Ascenso Volcán', '2025-06-05', 0.15, true, 2);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (80.00, 'Venta Hospedaje Playa Blanca', '2025-06-10', 0.05, true, 3);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (200.00, 'Venta Vuelo Cancún', '2025-06-15', 0.20, true, 4);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (60.00, 'Venta Tour Selva Petén', '2025-06-20', 0.10, true, 5);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (250.00, 'Venta Vuelo Helicóptero', '2025-06-25', 0.25, true, 6);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (120.00, 'Venta Rafting Río Cahabón', '2025-06-30', 0.15, true, 7);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (50.00, 'Venta Ruta Café', '2025-07-05', 0.05, true, 8);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (180.00, 'Venta Resort Paraíso Natural', '2025-07-10', 0.10, true, 9);
insert into venta (comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values (70.00, 'Venta Tour Gastronómico Chichi', '2025-07-15', 0.10, true, 10);

insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Tour Guiado a Tikal', '2025-07-01', 550.00, true, 2, 1, 1);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Ascenso Volcán Acatenango', '2025-07-05', 270.00, true, 1, 2, 2);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Hospedaje Playa Blanca', '2025-07-10', 320.00, true, 1, 3, 3);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Vuelo Cancún Ida y Vuelta', '2025-07-15', 900.00, true, 1, 4, 4);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Tour Selva Petén', '2025-07-20', 200.00, true, 3, 5, 5);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Vuelo Helicóptero Panorámico', '2025-07-25', 1300.00, true, 1, 6, 6);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Rafting Río Cahabón', '2025-07-30', 370.00, true, 2, 7, 7);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Ruta del Café Degustación', '2025-08-01', 110.00, true, 4, 8, 8);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Resort Paraíso Natural', '2025-08-05', 470.00, true, 1, 9, 9);
insert into detalleVenta (observaciones, fechaServicio, precioUnitario, cantidad, estado, codigoVenta, codigoCliente) values ('Tour Gastronómico Chichi', '2025-08-10', 160.00, true, 3, 10, 10);

insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Tarjeta de Crédito', 'Pagos con Tarjetas VISA, MasterCard', 2.50, 'Electrónico', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Efectivo', 'Pago Directo en Oficina', 0.00, 'Manual', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Transferencia Bancaria', 'Pago Vía Banca en Línea', 1.00, 'Electrónico', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('PayPal', 'Pagos por Plataforma PayPal', 3.00, 'Electrónico', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Cheque', 'Pago con Cheque a Nombre de la Empresa', 0.50, 'Manual', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Pago Móvil', 'Pagos Vía App Móvil', 1.50, 'Electrónico', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Vale de Viaje', 'Bonos Para Viajes', 0.00, 'Manual', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Tarjeta de Débito', 'Pagos con Tarjetas Débito', 1.80, 'Electrónico', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Cripto', 'Pagos con Criptomonedas', 4.00, 'Electrónico', true);
insert into metodoPago (nombre, descripcion, comision, tipo, estado) values ('Depósito en Cuenta', 'Depósitos Bancarios', 1.00, 'Manual', true);

insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (true, 'Pago Aprobado y Confirmado', '2025-07-15', true);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (false, 'Pendiente de Confirmación', '2025-07-10', false);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (true, 'Pago Rechazado por Banco', '2025-07-12', false);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (true, 'Reembolso Procesado', '2025-07-20', true);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (false, 'En Proceso de Validación', '2025-07-18', false);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (true, '¨Pago Completado', '2025-07-22', true);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (false, 'Pago Pendiente', '2025-07-25', false);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (true, 'Pago Cancelado', '2025-07-27', false);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (true, 'Pago en Revisión', '2025-07-29', false);
insert into estadoPago (notificacionEnviada, observaciones, fechaCambio, estado) values (true, 'Pago Confirmado', '2025-07-30', true);

insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (1500.00, 'Tarjeta Validada', '2025-07-15', 'Pago Completo', true, 1, 1, 1, 1);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (2500.50, 'Efectivo Recibido', '2025-07-10', 'Pago en Efectivo', true, 2, 2, 2, 2);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (1800.75, 'Transferencia Confirmada', '2025-07-12', 'Pago Vía transferencia', true, 3, 3, 3, 3);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (3200.00, 'PayPal Validado', '2025-07-20', 'Pago por PayPal', true, 4, 4, 4, 4);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (900.00, 'Cheque Recibido', '2025-07-18', 'Pago con Cheque', true, 5, 5, 5, 5);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (2300.00, 'Pago Móvil Aceptado', '2025-07-22', 'Pago por App Móvil', true, 6, 6, 6, 6);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (1500.50, 'Vale Aplicado', '2025-07-25', 'Bono de Viaje', true, 7, 7, 7, 7);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (800.00, 'Tarjeta Débito Válida', '2025-07-27', 'Pago con Débito', true, 8, 8, 8, 8);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (2100.00, 'Criptomoneda Confirmada', '2025-07-29', 'Pago con Cripto', true, 9, 9, 9, 9);
insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values (1300.00, 'Depósito Bancario', '2025-07-30', 'Depósito Recibido', true, 10, 10, 10, 10);

select * from Cliente;


Update Cliente 
	set 
    nombre = 'PatoLucas', 
    apellido = 'Donald',
    telefono = 59865968, 
    email = 'patolucas@kinal.edu.gt', 
    direccion = 'zona 11, ciudad de guatemala', 
    fechaRegistro= '2025-03-3',
    estado= true 
    where codigoCliente = 1;


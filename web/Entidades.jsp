<%-- 
    Document   : Entidades
    Created on : 18 ago 2025, 21:45:48
    Author     : Diego Sebastian
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entidades</title>
        <link rel="stylesheet" href="styles/stylejspdest.css">
        <link rel="stylesheet" href="styles/stylejsp.css">
        <link rel="stylesheet" href="styles/stylep.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar">
            <div class="nav-left">
                <img src="img/logo.png" alt="Logo" class="nav-logo">
                <a href="PrincipalEmpleado.jsp" class="nav-btn"><i class="fa-solid fa-house"></i>Inicio</a>
                <a href="Entidades.jsp" class="nav-btn"><i class="fa-solid fa-file"></i>Entidades</a>
            </div>

            <div class="nav-right">
                <a href="index.jsp" class="nav-btn"><i class="fa-solid fa-user"></i>Iniciar Sesion</a>
                <span class="nav-title">Principal</span>
            </div>
        </nav>
        
        <div class="info-container">
        <div class="info-box" onclick="showInfo('proveedor')">Proveedor</div>
        <div class="info-box" onclick="showInfo('compra')">Compra</div>
        <div class="info-box" onclick="showInfo('detalleCompra')">Detalle de Compras</div>
        <div class="info-box" onclick="showInfo('disponibilidad')">Disponibilidad</div>
        <div class="info-box" onclick="showInfo('servicios')">Servicios</div>
        <div class="info-box" onclick="showInfo('destinos')">Destinos</div>
        <div class="info-box" onclick="showInfo('clientes')">Clientes</div>
        <div class="info-box" onclick="showInfo('usuarios')">Usuarios</div>
        <div class="info-box" onclick="showInfo('ventas')">Ventas</div>
        <div class="info-box" onclick="showInfo('detalleVenta')">Detalles de Ventas</div>
        <div class="info-box" onclick="showInfo('metodoPago')">Metodo de Pagos</div>
        <div class="info-box" onclick="showInfo('estadoPago')">Estado de Pagos</div>
        <div class="info-box" onclick="showInfo('pago')">Pagos</div>
    </div>
        
        <!-- Contenidos dinámicos -->
    <div id="proveedor" class="info-content">
        <h3>Nuestros Proveedores</h3>
        <p>Contamos con una red confiable de proveedores que nos permiten ofrecer la mejor calidad en vuelos, hospedajes y experiencias de viaje.</p>
        <button onclick="location.href='Controlador?menu=Proveedor&accion=Listar'" class="btn btn-success">Ver Proveedores</button>
    </div>

    <div id="compra" class="info-content">
        <h3>Nuestras Compras</h3>
        <p>Gestionamos las compras de servicios y productos turísticos de manera eficiente para garantizar precios accesibles y calidad garantizada.</p>
        <button onclick="location.href='Controlador?menu=Compra&accion=Listar'" class="btn btn-success">Ver Compras</button>
    </div>

    <div id="detalleCompra" class="info-content">
        <h3>Detalle de Nuestras Compras</h3>
        <p>Consulta la información detallada de cada compra realizada, incluyendo fechas, costos y proveedores asociados.</p>
        <button onclick="location.href='Controlador?menu=DetalleCompra&accion=Listar'" class="btn btn-success">Ver Detalle De Compras</button>
    </div>

    <div id="disponibilidad" class="info-content">
        <h3>Disponibilidad de Servicios</h3>
        <p>Verifica en tiempo real la disponibilidad de vuelos, hoteles y actividades en nuestros destinos.</p>
        <button onclick="location.href='Controlador?menu=Disponibilidad&accion=Listar'" class="btn btn-success">Ver Disponibilidad</button>
    </div>

    <div id="servicios" class="info-content">
        <h3>Nuestros Servicios</h3>
        <p>Ofrecemos asesoría personalizada, paquetes turísticos, reservas de transporte, hospedaje y experiencias únicas en cada destino.</p>
        <button onclick="location.href='Controlador?menu=Servicio&accion=Listar'" class="btn btn-success">Ver Servicios</button>
    </div>

    <div id="destinos" class="info-content">
        <h3>Nuestros Destinos</h3>
        <p>Explora los destinos nacionales e internacionales que tenemos disponibles para ti, desde playas paradisíacas hasta ciudades icónicas.</p>
        <button onclick="location.href='Controlador?menu=Destino&accion=Listar'" class="btn btn-success">Ver Destinos</button>
    </div>

    <div id="clientes" class="info-content">
        <h3>Nuestros Clientes</h3>
        <p>Trabajamos día a día para brindar experiencias inolvidables a nuestros clientes, quienes confían en nosotros para sus viajes.</p>
        <button onclick="location.href='Controlador?menu=Cliente&accion=Listar'" class="btn btn-success">Ver Clientes</button>
    </div>

    <div id="usuarios" class="info-content">
        <h3>Nuestros Usuarios</h3>
        <p>Administramos de forma segura a nuestros usuarios internos para garantizar un servicio confiable y eficiente.</p>
        <button onclick="location.href='Controlador?menu=Usuario&accion=Listar'" class="btn btn-success">Ver Usuarios</button>
    </div>

    <div id="ventas" class="info-content">
        <h3>Nuestras Ventas</h3>
        <p>Consulta las ventas realizadas, paquetes adquiridos y estadísticas de comercialización en nuestra agencia.</p>
        <button onclick="location.href='Controlador?menu=Venta&accion=Listar'" class="btn btn-success">Ver Ventas</button>
    </div>

    <div id="detalleVenta" class="info-content">
        <h3>Detalle de Nuestras Ventas</h3>
        <p>Accede al detalle de cada venta efectuada, incluyendo información de clientes, destinos y métodos de pago.</p>
        <button onclick="location.href='Controlador?menu=DetalleVenta&accion=Listar'" class="btn btn-success">Ver Detalle de Ventas</button>
    </div>

    <div id="metodoPago" class="info-content">
        <h3>Métodos de Pago</h3>
        <p>Ponemos a tu disposición distintos métodos de pago seguros y confiables para tu comodidad.</p>
        <button onclick="location.href='Controlador?menu=MetodoPago&accion=Listar'" class="btn btn-success">Ver Metodo de Pagos</button>
    </div>

    <div id="estadoPago" class="info-content">
        <h3>Estado de Pagos</h3>
        <p>Revisa el estado actual de tus pagos y gestiona fácilmente cualquier transacción pendiente.</p>
        <button onclick="location.href='Controlador?menu=EstadoPago&accion=Listar'" class="btn btn-success">Ver Estado de Pagos</button>
    </div>

    <div id="pago" class="info-content">
        <h3>Pagos</h3>
        <p>Gestiona y consulta todos los pagos realizados en nuestra agencia de forma rápida y segura.</p>
        <button onclick="location.href='Controlador?menu=Pago&accion=Listar'" class="btn btn-success">Ver Pagos</button>
    </div>

    <script src="scripts/script.js"></script>
        
    </body>
</html>

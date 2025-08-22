<%-- 
    Document   : Servicios
    Created on : 21 ago 2025, 17:27:33
    Author     : Diego Sebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
        <link rel="stylesheet" href="styles/stylep.css">
        <link rel="stylesheet" href="styles/stylejspserv.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body class="body">
        <!-- Navbar -->
        <nav class="navbar">
            <div class="nav-left">
                <img src="img/logo.png" alt="Logo" class="nav-logo">
                <a href="Principal.jsp" class="nav-btn"><i class="fa-solid fa-house"></i>Inicio</a>
                <a href="Servicios.jsp" class="nav-btn"><i class="fa-solid fa-briefcase"></i>Servicios</a>
                <a href="Destinos.jsp" class="nav-btn"><i class="fa-solid fa-location-dot"></i>Destinos</a>
            </div>

            <div class="nav-right">
                <a href="index.jsp" class="nav-btn"><i class="fa-solid fa-user"></i>Iniciar Sesion</a>
                <span class="nav-title">Principal</span>
            </div>
        </nav>

        <!-- Contenido Principal -->
        <div class="container">
            <h2 class="text-center mb-4" style="color:#2c3e50;">Descubre Nuestros Servicios Turísticos en Guatemala</h2>
            
            <div class="d-flex justify-content-center">
                <!-- Servicio Transporte -->
                <div class="card" style="max-width: 250px;">
                    <img src="img/transporte.jpg" class="card-img-top rounded" alt="Transporte">
                    <div class="card-body text-center">
                        <h5 class="card-title" style="color:#1abc9c;">Transporte</h5>
                        <p class="card-text">Viaja cómodamente por toda Guatemala con nuestro servicio de transporte seguro y confiable.</p>
                    </div>
                </div>

                <!-- Servicio Hoteles -->
                <div class="card" style="max-width: 250px;">
                    <img src="img/hotel.jpg" class="card-img-top rounded" alt="Hoteles">
                    <div class="card-body text-center">
                        <h5 class="card-title" style="color:#1abc9c;">Hoteles</h5>
                        <p class="card-text">Hospédate en los mejores hoteles con ambientes únicos y servicio de calidad.</p>
                    </div>
                </div>

                <!-- Servicio Hospedajes -->
                <div class="card" style="max-width: 250px;">
                    <img src="img/hospedaje.jpg" class="card-img-top rounded" alt="Hospedajes">
                    <div class="card-body text-center">
                        <h5 class="card-title" style="color:#1abc9c;">Hospedajes</h5>
                        <p class="card-text">Encuentra opciones de hospedaje en fincas, cabañas y lugares encantadores.</p>
                    </div>
                </div>

                <!-- Servicio Tours -->
                <div class="card" style="max-width: 250px;">
                    <img src="img/tours.jpg" class="card-img-top rounded" alt="Tours">
                    <div class="card-body text-center">
                        <h5 class="card-title" style="color:#1abc9c;">Tours</h5>
                        <p class="card-text">Descubre ruinas mayas, lagos, volcanes y la riqueza cultural de Guatemala con nuestros tours.</p>
                    </div>
                </div>
            </div>
        </div>
        
         <!-- Pie de Página -->
        <footer>
            <!-- Redes sociales -->
            <div class="footer-redes">
                <hr>
                <div class="redes">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
                <hr>
            </div>

            <!-- Información -->
            <div class="footer-info">
                <p class="empresa">© Aero Adventure F3</p>
                <div class="links">
                    <a href="#">Contacto</a>
                    <a href="#">Fundación Kinal</a>
                </div>
            </div>
        </footer>

         
        <script src="https://kit.fontawesome.com/your-kit-id.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>

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
        <link rel="stylesheet" href="styles/stylejspdest.css">
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

        <!-- Carrusel de información -->
        <div class="carousel-preguntas">
            <button class="prev">&#10094;</button>

            <div class="carousel-track-container">
              <div class="carousel-track">

                <div class="card-pregunta">
                  <img src="img/p1.jpg" alt="Cómo funciona">
                  <h5>¿Cómo Funciona?</h5>
                  <p>Descubre cómo planificar tu viaje fácilmente.</p>
                </div>

                <div class="card-pregunta">
                  <img src="img/p2.jpg" alt="Cómo reservo">
                  <h5>¿Cómo Reservo?</h5>
                  <p>Con pocos clics aseguras tu próximo destino.</p>
                </div>

                <div class="card-pregunta">
                  <img src="img/p3.jpg" alt="Disponibilidad">
                  <h5>¿Cómo Sé Si Está Disponible?</h5>
                  <p>Revisa en tiempo real los lugares y fechas.</p>
                </div>

                <div class="card-pregunta">
                  <img src="img/p4.jpg" alt="Próximo viaje">
                  <h5>¿Cuándo Será el Próximo Viaje?</h5>
                  <p>Consulta nuestro calendario actualizado.</p>
                </div>

                <div class="card-pregunta">
                  <img src="img/p5.jpg" alt="Pagos">
                  <h5>¿Cómo Realizo el Pago?</h5>
                  <p>Ofrecemos opciones seguras y rápidas.</p>
                </div>

                <div class="card-pregunta">
                  <img src="img/p6.jpg" alt="Cancelaciones">
                  <h5>¿Puedo Cancelar?</h5>
                  <p>Conoce nuestras políticas de cancelación.</p>
                </div>

                <div class="card-pregunta">
                  <img src="img/p7.jpg" alt="Descuentos">
                  <h5>¿Hay Descuentos?</h5>
                  <p>Aprovecha precios especiales para grupos.</p>
                </div>

                <div class="card-pregunta">
                  <img src="img/p8.jpg" alt="Seguridad">
                  <h5>¿Es Seguro Viajar?</h5>
                  <p>Tu seguridad es nuestra prioridad en cada viaje.</p>
                </div>

              </div>
        </div>

        <button class="next">&#10095;</button>
      </div>

        <!-- Destinos turísticos -->
        <div class="destinos-container">
          <!-- Tarjeta de ejemplo -->
          <div class="card-destino">
            <img src="img/antigua.jpg" alt="Antigua Guatemala">
            <div class="card-body">
              <span class="badge bg-success">9.5 Excelente</span>
              <h5>Antigua Guatemala</h5>
              <p>Sacatepéquez</p>
              <p class="precio">Desde <span>Q450</span> por noche</p>
            </div>
          </div>

          <div class="card-destino">
            <img src="img/atitlan.jpg" alt="Lago Atitlán">
            <div class="card-body">
              <span class="badge bg-success">9.2 Excelente</span>
              <h5>Lago de Atitlán</h5>
              <p>Sololá</p>
              <p class="precio">Desde <span>Q600</span> por noche</p>
              <a class="btn btn-success" href="Destinos/Destino.jsp"></a>
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

        <script src="scripts/script.js"></script>
        <script src="https://kit.fontawesome.com/your-kit-id.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
s
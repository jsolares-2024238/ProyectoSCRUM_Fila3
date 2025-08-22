<%-- 
    Document   : Principal
    Created on : 9/07/2025, 20:15:02
    Author     : Joshua Vladimir Solares González
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sistema de Viajes (Empleados)</title>
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
                <a href="PrincipalEmpleado.jsp" class="nav-btn"><i class="fa-solid fa-house"></i>Inicio</a>
                <a href="Entidades.jsp" class="nav-btn"><i class="fa-solid fa-file"></i>Entidades</a>
            </div>

            <div class="nav-right">
                <a href="index.jsp" class="nav-btn"><i class="fa-solid fa-user"></i>Iniciar Sesion</a>
                <span class="nav-title">Principal</span>
            </div>
        </nav>
    
    <h1>Aero Adventure F3</h1>
    <!-- Submenú con cuadros -->
    <div class="info-container">
        <div class="info-box" onclick="showInfo('historia')">Historia</div>
        <div class="info-box" onclick="showInfo('mision')">Misión</div>
        <div class="info-box" onclick="showInfo('vision')">Visión</div>
        <div class="info-box" onclick="showInfo('descripcion')">Descripción</div>
    </div>

    <!-- Contenidos dinámicos -->
    <div id="historia" class="info-content">
        <h3>Nuestra Historia</h3>
        <p>En Aero Adventure F3 llevamos más de 10 años creando experiencias de viaje únicas. Nos especializamos en conectar personas con culturas, historias y paisajes de una manera auténtica, ofreciendo aventuras fuera de los circuitos tradicionales.</p>
        <p>A través de la tecnología, ofrecemos itinerarios totalmente personalizables para que cada viajero viva una experiencia que se ajuste a sus deseos y expectativas. Además, estamos comprometidos con el turismo responsable, apoyando proyectos sostenibles y respetuosos con el medio ambiente y las comunidades locales.</p>
        <p>En Aero Adventure F3, creemos que cada viaje debe ser una historia inolvidable, donde el destino no solo sea un lugar, sino una experiencia que te transforme.</p>
        <video class="video-forma"width="100%" height="auto" controls>
        <source src="videos/Historia.mp4" type="video/mp4">
        Tu navegador no soporta el elemento de video.
    </video>
    </div>

    <div id="mision" class="info-content">
        <h3>Misión</h3>
        <p>Nuestra misión es brindar viajes accesibles, seguros y memorables, diseñados para todo tipo de viajeros. Nos comprometemos a eliminar barreras que dificulten el acceso al turismo, ofreciendo soluciones inclusivas y opciones adaptadas a cada necesidad y presupuesto.</p>
        <p>Priorizamos la seguridad y el bienestar de nuestros clientes en cada etapa del viaje, colaborando con proveedores confiables y cumpliendo con altos estándares de calidad.</p>
        <p> Además, buscamos despertar la pasión por descubrir el mundo, creando experiencias que conecten a las personas con nuevas culturas, paisajes y formas de ver la vida.</p>
        <video class="video-forma"width="100%" height="auto" controls>
        <source src="videos/Mision.mp4" type="video/mp4">
        Tu navegador no soporta el elemento de video.
    </video>
    </div>

    <div id="vision" class="info-content">
        <h3>Visión</h3>
        <p>Ser la agencia de viajes líder en innovación, redefiniendo la industria mediante el uso de tecnologías avanzadas y soluciones creativas que mejoren cada aspecto del viaje.</p>
        <p> Nuestro objetivo es ofrecer experiencias personalizadas que no solo se adapten a las preferencias y necesidades de cada cliente, sino que también transformen la forma en que viajan y exploran el mundo.</p>
        <p>A través de herramientas digitales inteligentes, una atención al cliente excepcional y alianzas estratégicas, buscamos anticipar las expectativas y ofrecer viajes únicos, que generen recuerdos inolvidables y marquen una diferencia real en la forma en que las personas viven el turismo.</p>
        <video class="video-forma"width="100%" height="auto" controls>
        <source src="videos/Vision.mp4" type="video/mp4">
        Tu navegador no soporta el elemento de video.
    </video>
    </div>

    <div id="descripcion" class="info-content">
        <h3>Descripción</h3>
        <p>En nuestra agencia, ofrecemos una amplia variedad de servicios turísticos diseñados para satisfacer las necesidades de cada viajero. Desde paquetes turísticos completos que incluyen transporte, alojamiento y actividades, hasta reservas de vuelos y hoteles cuidadosamente seleccionados para asegurar la máxima calidad y confort.</p>
        <p>Nos especializamos en ofrecer actividades personalizadas que van desde tours culturales hasta experiencias de aventura, garantizando momentos únicos e inolvidables.</p>
        <p>Todo esto con un enfoque constante en la calidad y satisfacción del cliente, brindando atención personalizada y soporte durante todo el proceso, desde la planificación hasta el regreso a casa. Nuestro compromiso es ofrecerte viajes que no solo cumplan, sino que superen tus expectativas.</p>
        <video class="video-forma"width="100%" height="auto" controls>
        <source src="videos/Descripcion.mp4" type="video/mp4">
        Tu navegador no soporta el elemento de video.
    </video>
    </div>

    <!-- JS -->
    <script>
        function showInfo(id) {
            document.querySelectorAll('.info-content').forEach(el => el.classList.remove('active'));
            document.getElementById(id).classList.add('active');
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>
</html>

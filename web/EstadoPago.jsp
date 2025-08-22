<%-- 
    Document   : EstadoPago
    Created on : 16 ago 2025, 13:21:54
    Author     : Diego Sebastian
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estado Pago</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    </head>
    <body>
         <!-- Barra de navegación -->
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
        <div class="d-flex">
            <div class="card col-sm-12">
                <div class="card-body">
                    <form action="Controlador?menu=EstadoPago" method="POST">
                        <div class="form-group">
                            <label><strong>Notificación Enviada:</strong></label>
                            <input type="text" value="${estadoPago.getNotificacionEnviada()}" name="txtNotificacionEnviada" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Observaciones:</strong></label>
                            <input type="text" value="${estadoPago.getObservaciones()}" name="txtObservaciones" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Fecha Cambio:</strong></label>
                            <input type="date" value="${estadoPago.getFechaCambio()}" name="txtFechaCambio" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${estadoPago.getEstado()}" name="txtEstado" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="col-sm-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                        <th>CODIGO</th>
                        <th>NOTIFICACIÓN</th>
                        <th>OBSERVACIONES</th>
                        <th>FECHA</th>
                        <th>ESTADO</th>
                        <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="estadoPago" items="${estadoPagos}">
                            <tr>
                                <td>${estadoPago.getCodigoEstadoPago()}</td>
                                <td>${estadoPago.getNotificacionEnviada()}</td>
                                <td>${estadoPago.getObservaciones()}</td>
                                <td>${estadoPago.getFechaCambio()}</td>
                                <td>${estadoPago.getEstado()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=EstadoPago&accion=Editar&codigoEstadoPago=${estadoPago.getCodigoEstadoPago()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=EstadoPago&accion=Eliminar&codigoEstadoPago=${estadoPago.getCodigoEstadoPago()}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

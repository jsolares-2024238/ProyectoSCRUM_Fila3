<%-- 
    Document   : EstadoPago
    Created on : 16 ago 2025, 13:21:54
    Author     : Diego Sebastian
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estado Pago</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Entidades" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Estado de Pago</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
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
                            <input type="text" value="${estadoPago.getFechaCambio()}" name="txtFechaCambio" class="form-control">
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
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                        <th>CODIGO</th>
                        <th>NOTIFICACIÓN</th>
                        <th>OBSERVACIONES</th>
                        <th>FECHA</th>
                        <th>ESTADO</th>
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

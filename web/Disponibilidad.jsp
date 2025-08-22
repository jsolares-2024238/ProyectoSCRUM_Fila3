<%-- 
    Document   : Disponibilidad
    Created on : 17 ago 2025, 19:31:43
    Author     : Louis Xiloj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disponibilidad</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Principal" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Disponibilidad</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <c:if test="${not empty vacio}">
                        <div class="alert alert-danger" role="alert">${vacio}</div>
                    </c:if>
                    <c:if test="${not empty lleno}">
                        <div class="alert alert-danger" role="alert">${lleno}</div>
                    </c:if>    
                    <c:if test="${not empty estadoInvalido}">
                        <div class="alert alert-danger" role="alert">${estadoInvalido}</div>
                    </c:if>
                    <form action="Controlador?menu=Disponibilidad" method="POST">
                        <div class="form-group">
                            <label><strong>Cupos Diponibles:</strong></label>
                            <input type="text" value="${disponibilidad.getCuposDisponibles()}" name="txtCuposDisponibles" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Fecha:</strong></label>
                            <input type="text" value="${disponibilidad.getFecha()}" name="txtFecha" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Hora Inicio:</strong></label>
                            <input type="text" value="${disponibilidad.getHoraInicio()}" name="txtHoraInicio" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Hora Fin:</strong></label>
                            <input type="text" value="${disponibilidad.getHoraFin()}" name="txtHoraFin" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${disponibilidad.getEstado()}" name="txtEstado" class="form-control" placeholder="True/False">
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
                        <th>CUPOS DISPONIBLES</th>
                        <th>FECHA</th>
                        <th>HORA INICIO</th>
                        <th>HORA FIN</th>
                        <th>ESTADO</th>
                        <th style="display:flex; justify-content: center">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="disponibilidad" items="${disponibilidades}">
                            <tr>
                                <td>${disponibilidad.getCodigoDisponibilidad()}</td>
                                <td>${disponibilidad.getCuposDisponibles()}</td>
                                <td>${disponibilidad.getFecha()}</td>
                                <td>${disponibilidad.getHoraInicio()}</td>
                                <td>${disponibilidad.getHoraFin()}</td>
                                <td>${disponibilidad.getEstado()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Disponibilidad&accion=Editar&codigoDisponibilidad=${disponibilidad.getCodigoDisponibilidad()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Disponibilidad&accion=Eliminar&codigoDisponibilidad=${disponibilidad.getCodigoDisponibilidad()}"onclick="return confirm('Advertencia:\n\n' +'Está a punto de eliminar esta disponibilidad.\n' +'Todos los servicios asociados, destinos, ventas y pagos relacionados con esta disponibilidad serán eliminados permanentemente.\n\n' +'¿Desea continuar?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : Servicio
    Created on : 18 ago 2025, 19:57:55
    Author     : xsbra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicio</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Principal" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Servicio</span>
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
                    <form action="Controlador?menu=Servicio" method="POST">
                        <div class="form-group">
                            <label><strong>Nombre Servicio:</strong></label>
                            <input type="text" value="${servicio.getNombre()}" name="txtNombre" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Tipo de Servicio:</strong></label>
                            <input type="text" value="${servicio.getTipoDeServicio()}" name="txtTipoDeServicio" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Descripcion:</strong></label>
                            <input type="text" value="${servicio.getDescripcion()}" name="txtDescripcion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Capacidad Maxima:</strong></label>
                            <input type="text" value="${servicio.getCapacidadMaxima()}" name="txtCapacidadMaxima" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Incluye:</strong></label>
                            <input type="text" value="${servicio.getIncluye()}" name="txtIncluye" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Precio:</strong></label>
                            <input type="text" value="${servicio.getPrecio()}" name="txtPrecio" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Duración:</strong></label>
                            <input type="text" value="${servicio.getDuracion()}" name="txtDuracion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${servicio.getEstado()}" name="txtEstado" class="form-control" placeholder="True/False">
                        </div>
                        <div class="form-group">
                            <label><strong>Codigo Compra:</strong></label>
                            <input type="text" value="${servicio.getCodigoCompra()}" name="txtCodigoCompra" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label><strong>Codigo Disponibilidad:</strong></label>
                            <input type="text" value="${servicio.getCodigoDisponibilidad()}" name="txtCodigoDisponibilidad" class="form-control">
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
                        <th>NOMBRE</th>
                        <th>TIPO DE SERVICIO</th>
                        <th>DESCRIPCION</th>
                        <th>CAPACIDAD MAXIMA</th>
                        <th>INCLUYE</th>
                        <th>PRECIO</th>
                        <th>DURACION</th>
                        <th>ESTADO</th>
                        <th>CODIGO COMPRA</th>
                        <th>CODIGO DISPONIBILIDAD</th>
                        <th style="display:flex; justify-content: center">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="servicio" items="${servicios}">
                            <tr>
                                <td>${servicio.getCodigoServicio()}</td>
                                <td>${servicio.getNombre()}</td>
                                <td>${servicio.getTipoDeServicio()}</td>
                                <td>${servicio.getDescripcion()}</td>
                                <td>${servicio.getCapacidadMaxima()}</td>
                                <td>${servicio.getIncluye()}</td>
                                <td>${servicio.getPrecio()}</td>
                                <td>${servicio.getDuracion()}</td>
                                <td>${servicio.getEstado()}</td>
                                <td>${servicio.getCodigoCompra()}</td>
                                <td>${servicio.getCodigoDisponibilidad()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Servicio&accion=Editar&codigoServicio=${servicio.getCodigoServicio()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Servicio&accion=Eliminar&codigoServicio=${servicio.getCodigoServicio()}" onclick="return confirm('Advertencia:\n\n' +'Está a punto de eliminar este servicio.\n' +'Todos los destinos, ventas, detalles de venta y pagos asociados a este servicio serán eliminados permanentemente.\n\n' +'¿Desea continuar?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

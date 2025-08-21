<%-- 
    Document   : Proveedor
    Created on : Aug 17, 2025, 3:44:38 PM
    Author     : Diego Espinoza
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Venta</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Entidades" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Detalle Venta</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=DetalleVenta" method="POST">
                        <div class="form-group">
                            <label><strong> Observaciones</strong></label>
                            <input type="text" value="${detalleVenta.getObservaciones()}" name="txtObservaciones" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>FechaServicio</strong></label>
                            <input type="date" value="${detalleVenta.getFechaServicio()}" name="txtFechaServicio" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>PrecioUnitario</strong></label>
                            <input type="text" value="${detalleVenta.getPrecioUnitario()}" name="txtPrecioUnitario" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Cantidad</strong></label>
                            <input type="text" value="${detalleVenta.getCantidad()}" name="txtCantidad" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado</strong></label>
                            <input type="text" value="${detalleVenta.getEstado()}" name="txtEstado" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>CodigoVenta</strong></label>
                            <input type="text" value="${detalleVenta.getCodigoVenta()}" name="txtCodigoVenta" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>CodigoCliente</strong></label>
                            <input type="text" value="${detalleVenta.getCodigoCliente()}" name="txtCodigoCliente" class="form-control">
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
                        <th>OBSERVACIONES</th>
                        <th>FECHASERVICIO</th>
                        <th>PRECIO UNITARIO</th>
                        <th>CANTIDAD</th>
                        <th>ESTADO</th>
                        <th>CODIGOVENTA</th>
                        <th>CODIGOCLIENTE</th>
                        <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dv" items="${detalleVentas}">
                            <tr>
                                <td>${dv.getCodigoDetalleVenta()}</td>
                                <td>${dv.getObservaciones()}</td>
                                <td>${dv.getFechaServicio()}</td>
                                <td>${dv.getPrecioUnitario()}</td>
                                <td>${dv.getCantidad()}</td>
                                <td>${dv.getEstado()}</td>
                                <td>${dv.getCodigoVenta()}</td>
                                <td>${dv.getCodigoCliente()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=DetalleVenta&accion=Editar&codigoDetalleVenta=${dv.getCodigoDetalleVenta()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=DetalleVenta&accion=Eliminar&codigoDetalleVenta=${dv.getCodigoDetalleVenta()}"  onclick="return confirm('¿Seguro que desea eliminar este DetalleVenta?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : DetalleCompra
    Created on : 18 ago 2025, 16:53:49
    Author     : Jose Rodas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DetalleCompra</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Principal" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Detalles de las Compras</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=DetalleCompra" method="POST">
                        <div class="form-group">
                            <label><strong>Observaciones:</strong></label>
                            <input type="text" value="${detalleCompra.getObservaciones()}" name="txtObservacionesDetalleCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Fecha del Servicio:</strong></label>
                            <input type="text" value="${detalleCompra.getFechaServicio()}" name="txtDetalleFechaServicio" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Precio Unitario:</strong></label>
                            <input type="text" value="${detalleCompra.getPrecioUnitario()}" name="txtPrecioUnitario" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Cantidad:</strong></label>
                            <input type="text" value="${detalleCompra.getCantidad()}" name="txtDetalleCantidad" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${detalleCompra.getEstado()}" name="txtDetalleEstadoCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Código Compra:</strong></label>
                            <input type="text" value="${detalleCompra.getCodigoCompra()}" name="txtDetCodigoCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Código del Proveedor:</strong></label>
                            <input type="text" value="${detalleCompra.getCodigoProveedor()}" name="txtDetCodigoProveedor" class="form-control">
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
                        <th>FECHA</th>
                        <th>PRECIO</th>
                        <th>CANTIDAD</th>
                        <th>ESTADO  </th>
                        <th>COMPRA</th>
                        <th>PROVEEDOR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="detalleCompra" items="${detalleCompras}">
                            <tr>
                                <td>${detalleCompra.getCodigoDetalleCompra()}</td>
                                <td>${detalleCompra.getObservaciones()}</td>
                                <td>${detalleCompra.getFechaServicio()}</td>
                                <td>${detalleCompra.getPrecioUnitario()}</td>
                                <td>${detalleCompra.getCantidad()}</td>
                                <td>${detalleCompra.getEstado()}</td>
                                <td>${detalleCompra.getCodigoCompra()}</td>
                                <td>${detalleCompra.getCodigoProveedor()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=DetalleCompra&accion=Editar&codigoDetalleCompra=${detalleCompra.getCodigoDetalleCompra()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=DetalleCompra&accion=Eliminar&codigoDetalleCompra=${detalleCompra.getCodigoDetalleCompra()}"onclick="return confirm('¿Seguro que desea eliminar los datos?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

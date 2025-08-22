<%-- 
    Document   : Compra
    Created on : 16 ago 2025, 21:29:13
    Author     : Jose Rodas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Entidades" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Compras</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Compra" method="POST">
                        <div class="form-group">
                            <label><strong>Total:</strong></label>
                            <input type="text" value="${compra.getTotal()}" name="txtTotal" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Observaciones:</strong></label>
                            <input type="text" value="${compra.getObservaciones()}" name="txtObservacionesCompras" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Fecha de la Compra:</strong></label>
                            <input type="text" value="${compra.getFechaCompra()}" name="txtFechaCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${compra.getEstado()}" name="txtEstadoCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Código del Proveedor:</strong></label>
                            <input type="text" value="${compra.getCodigoProveedor()}" name="txtCodigoProveedor" class="form-control">
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
                        <th>TOTAL</th>
                        <th>OBSERVACIONES</th>
                        <th>FECHA</th>
                        <th>ESTADO</th>
                        <th>PROVEEDOR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="compra" items="${compras}">
                            <tr>
                                <td>${compra.getCodigoCompra()}</td>
                                <td>${compra.getTotal()}</td>
                                <td>${compra.getObservaciones()}</td>
                                <td>${compra.getFechaCompra()}</td>
                                <td>${compra.getEstado()}</td>
                                <td>${compra.getCodigoProveedor()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Compra&accion=Editar&codigoCompra=${compra.getCodigoCompra()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Compra&accion=Eliminar&codigoCompra=${compra.getCodigoCompra()}"onclick="return confirm('¿Seguro que desea eliminar los datos de la compra?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
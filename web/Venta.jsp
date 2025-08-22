<%-- 
    Document   : Venta
    Created on : Aug 17, 2025, 3:44:38 PM
    Author     : Diego Espinoza
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venta</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Entidades" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Ventas</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Venta" method="POST">
                        <div class="form-group">
                            <label><strong> Comision:</strong></label>
                            <input type="text" value="${venta.getComision()}" name="txtComision" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Observaciones:</strong></label>
                            <input type="text" value="${venta.getObservaciones()}" name="txtObservaciones" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>FechaVenta</strong></label>
                            <input type="date" value="${venta.getFechaVenta()}" name="txtFechaVenta" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Descuento</strong></label>
                            <input type="text" value="${venta.getDescuento()}" name="txtDescuento" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado</strong></label>
                            <input type="text" value="${venta.getEstado()}" name="txtEstado" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>CodigoServicio</strong></label>
                            <input type="text" value="${venta.getCodigoServicio()}" name="txtCodigoServicio" class="form-control">
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
                        <th>COMISION</th>
                        <th>OBSERVACIONES</th>
                        <th>FECHAVENTA</th>
                        <th>DESCUENTO</th>
                        <th>ESTADO</th>
                        <th>CODIGOSERVICIO</th>
                        <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="v" items="${Ventas}">
                            <tr>
                                <td>${v.getCodigoVenta()}</td>
                                <td>${v.getComision()}</td>
                                <td>${v.getObservaciones()}</td>
                                <td>${v.getFechaVenta()}</td>
                                <td>${v.getDescuento()}</td>
                                <td>${v.getEstado()}</td>
                                <td>${v.getCodigoServicio()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Venta&accion=Editar&codigoVenta=${v.getCodigoVenta()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Venta&accion=Eliminar&codigoVenta=${v.getCodigoVenta()}"  onclick="return confirm('¿Seguro que desea eliminar esta venta?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

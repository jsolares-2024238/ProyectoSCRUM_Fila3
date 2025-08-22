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
            <div class="col-sm-12">
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

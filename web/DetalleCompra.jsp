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
                    <form action="Controlador?menu=DetalleCompra" method="POST">
                        <div class="form-group">
                            <label><strong>Observaciones:</strong></label>
                            <input type="text" value="${detalleCompra.getObservaciones()}" name="txtObservacionesDetalleCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Fecha del Servicio:</strong></label>
                            <input type="date" value="${detalleCompra.getFechaServicio()}" name="txtDetalleFechaServicio" class="form-control">
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
            <div class="col-sm-12">
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
                        <th>ACCIONES</th>
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

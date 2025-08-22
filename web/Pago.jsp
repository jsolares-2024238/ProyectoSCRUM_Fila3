<%-- 
    Document   : Pago
    Created on : 17 ago 2025, 1:35:39 p. m.
    Author     : Joshua Solares
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pago</title>
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
                    <form action="Controlador?menu=Pago" method="POST">
                        <div class="form-group">
                            <label><strong>Monto:</strong></label>
                            <input type="text" value="${pago.getMonto()}" name="txtMonto" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Datos Validos:</strong></label>
                            <input type="text" value="${pago.getDatosValidos()}" name="txtDatosValidos" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Fecha Pago:</strong></label>
                            <input type="date" value="${pago.getFechaPago()}" name="txtFechaPago" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Observaciones</strong></label>
                            <input type="text" value="${pago.getObservaciones()}" name="txtObservaciones" class="form-control">
                        </div>
                         <div class="form-group">
                            <label><strong>Estado</strong></label>
                            <input type="text" value="${pago.getEstado()}" name="txtEstado" class="form-control" placeholder="true / false">
                        </div>
                        <div class="form-group">
                            <label><strong>Código Compra:</strong></label>
                            <input type="text" value="${pago.getCodigoCompra()}" name="txtCodigoCompra" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Código Venta:</strong></label>
                            <input type="text" value="${pago.getCodigoVenta()}" name="txtCodigoVenta" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Código Método Pago:</strong></label>
                            <input type="text" value="${pago.getCodigoMetodoPago()}" name="txtCodigoMetodoPago" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Código Estado Pago:</strong></label>
                            <input type="text" value="${pago.getCodigoEstadoPago()}" name="txtCodigoEstadoPago" class="form-control">
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
                        <th>CÓDIGO</th>
                        <th>MONTO</th>
                        <th>DATOS</th>
                        <th>FECHA PAGO</th>
                        <th>OBSERVACIONES</th>
                        <th>ESTADO</th>
                        <th>CÓDIGO COMPRA</th>
                        <th>CÓDIGO VENTA</th>
                        <th>CÓDIGO MÉTODO PAGO</th>
                        <th>CÓDIGO ESTADO PAGO</th>
                        <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pago" items="${Pagos}">
                            <tr>
                                <td>${pago.getCodigoPago()}</td>
                                <td>${pago.getMonto()}</td>
                                <td>${pago.getDatosValidos()}</td>
                                <td>${pago.getFechaPago()}</td>
                                <td>${pago.getObservaciones()}</td>
                                <td>${pago.getEstado()}</td>
                                <td>${pago.getCodigoCompra()}</td>
                                <td>${pago.getCodigoVenta()}</td>
                                <td>${pago.getCodigoMetodoPago()}</td>
                                <td>${pago.getCodigoEstadoPago()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Pago&accion=Editar&codigoPago=${pago.getCodigoPago()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Pago&accion=Eliminar&codigoPago=${pago.getCodigoPago()}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

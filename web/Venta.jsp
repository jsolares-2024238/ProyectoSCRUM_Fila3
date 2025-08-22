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
            <div class="col-sm-12">
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

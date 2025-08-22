<%-- 
    Document   : Proveedor
    Created on : Aug 17, 2025, 3:44:38 PM
    Author     : Diego Molina
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedor</title>
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
                    <form action="Controlador?menu=Proveedor" method="POST">
                        <div class="form-group">
                            <label><strong>Nombre Empresa:</strong></label>
                            <input type="text" value="${proveedor.getNombreEmpresa()}" name="txtNombreEmpresa" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Descripción de Servicios:</strong></label>
                            <input type="text" value="${proveedor.getDescripcionServicios()}" name="txtDescripcion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Teléfono:</strong></label>
                            <input type="text" value="${proveedor.getTelefono()}" name="txtTelefono" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Dirección:</strong></label>
                            <input type="text" value="${proveedor.getDireccion()}" name="txtDireccion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Email:</strong></label>
                            <input type="text" value="${proveedor.getEmail()}" name="txtEmail" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Calificación Promedio:</strong></label>
                            <input type="text" value="${proveedor.getCalificacionPromedio()}" name="txtCalificacion" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${proveedor.getEstado()}" name="txtCalificacion" class="form-control" >
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
                        <th>NOMBRE</th>
                        <th>DESCRIPCION</th>
                        <th>TELEFONO</th>
                        <th>DIRECCION</th>
                        <th>EMAIL</th>
                        <th>CALIFICACION</th>
                        <th>ESTADO</th>
                        <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${Proveedores}">
                            <tr>
                                <td>${p.getCodigoProveedor()}</td>
                                <td>${p.getNombreEmpresa()}</td>
                                <td>${p.getDescripcionServicios()}</td>
                                <td>${p.getTelefono()}</td>
                                <td>${p.getDireccion()}</td>
                                <td>${p.getEmail()}</td>
                                <td>${p.getCalificacionPromedio()}</td>
                                <td>${p.getEstado()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Proveedor&accion=Editar&codigoProveedor=${p.getCodigoProveedor()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Proveedor&accion=Eliminar&codigoProveedor=${p.getCodigoProveedor()}"  onclick="return confirm('¿Seguro que desea eliminar este proveedor?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

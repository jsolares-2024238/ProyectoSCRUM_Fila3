<%-- 
    Document   : Proveedor
    Created on : Aug 17, 2025, 3:44:38 PM
    Author     : Diego Molina
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedor</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Entidades" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Usuarios</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Usuario" method="POST">
                        <div class="form-group">
                            <label><strong>Nombre de Usuario:</strong></label>
                            <input type="text" value="${usuario.getNombreUsuario()}" name="txtNombreUsuario" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Contraseña:</strong></label>
                            <input type="text" value="${usuario.getContrasenia()}" name="txtContrasenia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Rol:</strong></label>
                            <select name="txtRol" class="form-control">
                                <option value="admin" ${usuario.getRol() == 'admin' ? 'selected' : ''}>Administrador</option>
                                <option value="user" ${usuario.getRol() == 'user' ? 'selected' : ''}>Usuario</option>
                                <option value="guest" ${usuario.getRol() == 'guest' ? 'selected' : ''}>Invitado</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${usuario.getEstado()}" name="txtEstado" class="form-control" placeholder="1 para Activo, 0 para Inactivo">
                        </div>
                        <div class="form-group">
                            <label><strong>Código del Cliente:</strong></label>
                            <input type="text" value="${usuario.getCodigoCliente()}" name="txtCodigoCliente" class="form-control">
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
                        <th>USUARIO</th>
                        <th>CONTRASEÑA</th>
                        <th>ROL</th>
                        <th>ESTADO</th>
                        <th>CODIGO CLIENTE</th>
                        <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${Usuarios}">
                            <tr>
                                <td>${u.getCodigoUsuario()}</td>
                                <td>${u.getNombreUsuario()}</td>
                                <td>${u.getContrasenia()}</td>
                                <td>${u.getRol()}</td>
                                <td>${u.getEstado()}</td>
                                <td>${u.getCodigoCliente()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Usuario&accion=Editar&codigoUsuario=${u.getCodigoUsuario()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Usuario&accion=Eliminar&codigoUsuario=${u.getCodigoUsuario()}"  onclick="return confirm('¿Seguro que desea eliminar este usuario?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : Cliente
    Created on : 19 ago 2025, 08:05:22
    Author     : informatica
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
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
                    <form action="Controlador?menu=Cliente" method="POST">
                        <div class="form-group">
                            <label><strong>Nombre:</strong></label>
                            <input type="text" value="${cliente.getNombre()}" name="txtNombre" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Apellido:</strong></label>
                            <input type="text" value="${cliente.getApellido()}" name="txtApellido" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Teléfono:</strong></label>
                            <input type="text" value="${cliente.getTelefono()}" name="txtTelefono" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Email:</strong></label>
                            <input type="text" value="${cliente.getEmail()}" name="txtEmail" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Direccion:</strong></label>
                            <input type="text" value="${cliente.getDireccion()}" name="txtDireccion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Fecha de Registro:</strong></label>
                            <input type="Date" value="${cliente.getFechaRegistro()}" name="txtFechaRegistro" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${cliente.getEstado()}" name="txtEstado" class="form-control" placeholder="1 para Activo, 0 para Inactivo">
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
                        <th>APELLIDO</th>
                        <th>TELEFONO</th>
                        <th>EMAIL</th>
                        <th>DIRECCION</th>
                        <th>REGISTRO</th>
                        <th>ESTADO</th>
                        <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cl" items="${Clientes}">
                            <tr>
                                <td>${cl.getCodigoCliente()}</td>
                                <td>${cl.getNombre()}</td>
                                <td>${cl.getApellido()}</td>
                                <td>${cl.getTelefono()}</td>
                                <td>${cl.getEmail()}</td>
                                <td>${cl.getDireccion()}</td>
                                <td>${cl.getFechaRegistro()}</td>
                                <td>${cl.getEstado()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Cliente&accion=Editar&codigoCliente=${cl.getCodigoCliente()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Cliente&accion=Eliminar&codigoCliente=${cl.getCodigoCliente()}"  onclick="return confirm('¿Seguro que desea eliminar este Cliente?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
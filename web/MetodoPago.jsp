<%-- 
    Document   : MetodoPago
    Created on : 19 ago 2025, 08:08:32
    Author     : informatica
--%>

<%-- MetodoPago.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Método de Pago</title>
    <link rel="stylesheet" href="styles/stylejsp.css">
</head>
<body>
     <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Principal" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Metodo Pago</span>
        </nav>
<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-danger text-white d-flex justify-content-between align-items-center">
            
           
        </div>

        <div class="card-body">
          
            <form action="Controlador?menu=MetodoPago" method="POST" class="mb-4">
                <input type="hidden" name="codigoMetodoPago" value="${metodoPago.codigoMetodoPago}"/>

                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="txtNombre">Nombre</label>
                        <input id="txtNombre" type="text" name="txtNombre" class="form-control"
                               value="${metodoPago.nombre}" required>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="txtDescripcion">Descripción</label>
                        <input id="txtDescripcion" type="text" name="txtDescripcion" class="form-control"
                               value="${metodoPago.descripcion}">
                    </div>

                    <div class="form-group col-md-2">
                        <label for="txtComision">Comisión</label>
                        <input id="txtComision" type="number" step="0.01" min="0" name="txtComision"
                               class="form-control" value="${metodoPago.comision}" required>
                    </div>

                    <div class="form-group col-md-3">
                        <label for="txtTipo">Tipo</label>
                        <input id="txtTipo" type="text" name="txtTipo" class="form-control"
                               value="${metodoPago.tipo}" required>
                    </div>
                </div>

                
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="txtEstado">Estado</label>
                        <select id="txtEstado" name="txtEstado" class="form-control" required>
                            <option value="">--Seleccione--</option><!-- NUEVO: estado -->
                            <option value="true"  ${metodoPago.estado == true  ? 'selected' : ''}>ACTIVO</option>
                            <option value="false" ${metodoPago.estado == false ? 'selected' : ''}>INACTIVO</option>
                        </select><!-- NUEVO: estado -->
                    </div><!-- NUEVO: estado -->
                </div><!-- NUEVO: estado -->

                <c:choose>
                    <c:when test="${not empty metodoPago.codigoMetodoPago}">
                        <button type="submit" name="accion" value="Actualizar" class="btn btn-primary">Actualizar</button>
                        <a href="Controlador?menu=MetodoPago&accion=Listar" class="btn btn-secondary ml-2">Cancelar</a>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" name="accion" value="Agregar" class="btn btn-success">Agregar</button>
                    </c:otherwise>
                </c:choose>
            </form>

            
            <div class="table-responsive">
                <table class="table table-striped table-bordered mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Comisión</th>
                            <th>Tipo</th>
                            <th><!-- NUEVO: estado -->Estado</th>
                            <th style="width:160px">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="mp" items="${metodoPagos}">
                            <tr>
                                <td>${mp.codigoMetodoPago}</td>
                                <td>${mp.nombre}</td>
                                <td>${mp.descripcion}</td>
                                <td>${mp.comision}</td>
                                <td>${mp.tipo}</td>
                                <td><!-- NUEVO: estado -->${mp.estado ? 'ACTIVO' : 'INACTIVO'}</td>
                                <td>
                                    <a class="btn btn-warning btn-sm"
                                       href="Controlador?menu=MetodoPago&accion=Editar&codigoMetodoPago=${mp.codigoMetodoPago}">
                                        Editar
                                    </a>
                                    <a class="btn btn-danger" href="Controlador?menu=MetodoPago&accion=Delete&codigoMetodoPago=${mp.codigoMetodoPago}"  onclick="return confirm('¿Seguro que desea eliminar este Pago?');">Eliminar</a>               
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty metodoPagos}">
                            <tr><td colspan="7" class="text-center"><!-- NUEVO: estado (colspan 7 por nueva columna) -->No hay métodos de pago registrados.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></scrip

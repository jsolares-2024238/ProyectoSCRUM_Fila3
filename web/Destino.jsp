<%-- 
    Document   : Destino
    Created on : 18/08/2025, 18:54:09
    Author     : Christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Destino</title>
        <link rel="stylesheet" href="styles/stylejsp.css">
    </head>
    <body>
         <!-- Barra de navegación -->
        <nav class="navbar">
            <a href="Controlador?menu=Principal" class="nav-btn">Inicio</a>
            <a href="Controlador?menu=Entidades" class="nav-btn">Entidades</a>
            <span class="nav-title">Gestión de Destino:</span>
        </nav>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Destino" method="POST">
                        <div class="form-group">
                            <label><strong>Nombre:</strong></label>
                            <input type="text" value="${destino.getNombre()}" name="txtNombre" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Descripcion:</strong></label>
                            <input type="text" value="${destino.getDescripcion()}" name="txtDescripcion" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Pais:</strong></label>
                            <input type="text" value="${destino.getPais()}" name="txtPais" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Ciudad:</strong></label>
                            <input type="text" value="${destino.getCiudad()}" name="txtCiudad" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>InformacionTuristica:</strong></label>
                            <input type="text" value="${destino.getInformacionTuristica()}" name="txtInformacionTuristica" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Clima:</strong></label>
                            <input type="text" value="${destino.getClima()}" name="txtClima" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>MejorEpocaVisita:</strong></label>
                            <input type="text" value="${destino.getMejorEpocaVisita()}" name="txtMejorEpocaVisita" class="form-control">
                        </div>
                        <div class="form-group">
                            <label><strong>Estado:</strong></label>
                            <input type="text" value="${destino.getEstado()}" name="txtEstado" class="form-control" placeholder="True/False">
                        </div>
                        <div class="form-group">
                            <label><strong>CodigoServicio:</strong></label>
                            <input type="text" value="${destino.getCodigoServicio()}" name="txtCodigoServicio" class="form-control">
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
                        <th>NOMBRE</th>
                        <th>DESCRIPCION</th>
                        <th>PAIS</th>
                        <th>CIUDAD</th>
                        <th>INFORMACION TURISTICA</th>
                        <th>CLIMA</th>
                        <th>MEJOR EPOCA VISITA</th>
                        <th>ESTADO</th>
                        <th>CODIGO SERVICIO</th>
                        <th style="display:flex; justify-content: center">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="destino" items="${destinos}">
                            <tr>
                                <td>${destino.getCodigoDestino()}</td>
                                <td>${destino.getNombre()}</td>
                                <td>${destino.getDescripcion()}</td>
                                <td>${destino.getPais()}</td>
                                <td>${destino.getCiudad()}</td>
                                <td>${destino.getInformacionTuristica()}</td>
                                <td>${destino.getClima()}</td>
                                <td>${destino.getMejorEpocaVisita()}</td>
                                <td>${destino.getEstado()}</td>
                                <td>${destino.getCodigoServicio()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Destino&accion=Editar&codigoDestino=${destino.getCodigoDestino()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Destino&accion=Eliminar&codigoDestino=${destino.getCodigoDestino()}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

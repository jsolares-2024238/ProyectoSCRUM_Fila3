<%-- 
    Document   : index
    Created on : 23/07/2025
    Author     : Diego Molina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicación de Java EE</title>
        <link rel="stylesheet" href="styles/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
        <body>
             <div class="container">
                <div class="card">
                    <div class="card-body">
                        <form class="form-sign" action="Validar" method="POST">
                            <div class="form-group text-center">
                                <h3>Login</h3>
                                <img src="img/user.png" alt="Usuario" width="120"/><br>
                                <label>Bienvenido al Sistema</label>
                            </div>
                            <div class="form-group">
                                <label><strong>Email</strong></label>
                                <input type="text" name="txtUser">
                            </div>
                            <div class="form-group">
                                <label><strong>Contraseña</strong></label>
                                <input type="password" name="txtPass">
                            </div>
                            <input type="submit" name="accion" value="Ingresar" class="btn-primary">
                            
                            <%-- 
                                <button type="submit" formaction="RegistrarCliente.jsp" class="btn-primary">Registrarse</button>
                            --%>
                        </form>
                    </div>
                </div>
            </div>

            <script src="scripts/script.js"></script>
        </body>
</html>

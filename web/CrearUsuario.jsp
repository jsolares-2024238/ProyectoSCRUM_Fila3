<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Cliente</title>
    <link rel="stylesheet" href="styles/stylereg.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">

    <div class="register-container">
        <div class="register-card">

            <!-- Lado izquierdo -->
            <div class="register-left">
                <div class="icon-user">
                    <img src="img/user-icon.png" alt="Usuario">
                </div>
                <h3>Aero Adventura F3</h3>
            </div>

            <!-- Lado derecho -->
            <div class="register-right">
                <h2>Registrar Cliente</h2>
                <form action="Controlador?menu=AgregarUsuario&accion=Agregar" method="post">
                    <input type="hidden" name="txtCodigoCliente" value="${codigoCliente}" class="form-control">
                    <input type="text" name="txtUsuario" placeholder="Usuario" class="form-control" required>
                    <input type="password" name="txtPass" placeholder="Contraseña" class="form-control" required>
                    <select name="txtRol" class="form-control">
                        <option value="Cliente">Cliente</option>
                        <option value="Admin">Administrador</option>
                    </select>
                    <input type="text" name="txtEstado" placeholder="Estado" class="form-control" required>
                    <input type="submit" value="Agregar" class="btn btn-primary">
                </form>
            </div>

        </div>
    </div>


</body>
</html>

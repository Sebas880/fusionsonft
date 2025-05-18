<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>
    <!-- Agregar Bootstrap para estilos -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff; /* Fondo azul claro */
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #007bff; /* Azul */
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Iniciar sesión</h2>

        <form id="loginForm" method="post">
            <div class="form-group">
                <label for="correo">Correo:</label>
                <input type="email" class="form-control" id="correo" name="correo" required>
            </div>

            <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="password" class="form-control" id="contrasena" name="contrasena" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
        </form>

        <%
            // Procesar los datos del formulario y simular validación
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");

            if (correo != null && contrasena != null) {
                // Simulación de inicio de sesión exitoso (sin validación real)
                // Cualquier correo y contraseña serán considerados correctos
                response.sendRedirect("bienvenido.jsp"); // Redirigir a la página de bienvenida
            }
        %>
    </div>

    <!-- Agregar los scripts de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

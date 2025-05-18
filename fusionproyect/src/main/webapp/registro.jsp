<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
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
        .alert {
            display: none;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Registro de Usuario</h2>
        <form id="registroForm" action="RegistrarUsuario" method="post" onsubmit="mostrarMensaje(event)">
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <div class="form-group">
                <label for="correo">Correo:</label>
                <input type="email" class="form-control" id="correo" name="correo" required>
            </div>

            <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="password" class="form-control" id="contrasena" name="contrasena" required>
            </div>

            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion">
            </div>

            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" class="form-control" id="telefono" name="telefono">
            </div>

            <button type="submit" class="btn btn-primary btn-block">Registrar</button>
        </form>

        <!-- Mensaje de éxito -->
        <div id="mensajeExitoso" class="alert alert-success mt-3" role="alert">
            ¡Registro exitoso! Bienvenido.
        </div>

        <!-- Botón para volver a la página principal -->
        <div id="volverPrincipal" class="mt-3" style="display:none;">
            <a href="index.jsp" class="btn btn-secondary btn-block">Volver a la Página Principal</a>
        </div>
    </div>

    <!-- Agregar los scripts de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Script para mostrar mensaje de registro exitoso -->
    <script>
        function mostrarMensaje(event) {
            event.preventDefault(); // Evita que se envíe el formulario inmediatamente
            // Muestra el mensaje de éxito
            document.getElementById('mensajeExitoso').style.display = 'block';
            // Muestra el botón de volver a la página principal
            document.getElementById('volverPrincipal').style.display = 'block';
            // Oculta el mensaje después de 3 segundos
            setTimeout(function() {
                document.getElementById('mensajeExitoso').style.display = 'none';
            }, 3000);
            // Aquí puedes agregar el código para enviar el formulario si deseas
            // document.getElementById('registroForm').submit();
        }
    </script>
</body>
</html>

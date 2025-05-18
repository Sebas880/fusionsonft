<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Cierra la sesión
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sesión cerrada</title>
    <meta http-equiv="refresh" content="6;URL=index.jsp"> <!-- Redirección en 6 segundos -->

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #e3f2fd; /* Azul claro */
        }
        .card {
            margin-top: 80px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            border-left: 6px solid #0d6efd;
        }
        .icon-check {
            font-size: 3rem;
            color: #0d6efd;
        }
        .btn-custom {
            background-color: #0d6efd;
            color: white;
        }
    </style>
</head>
<body>

    <div class="container d-flex justify-content-center">
        <div class="card text-center p-5 mt-5">
            <div class="card-body">
                <div class="icon-check mb-3">
                    😎
                </div>
                <h3 class="card-title text-primary">¡Sesión cerrada correctamente!</h3>
                <p class="card-text">Serás redirigido al inicio en 6 segundos...</p>
                <a href="index.jsp" class="btn btn-custom mt-3">Volver al inicio ahora</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmación de Pago</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #121212;
            margin: 0;
            padding: 0;
            color: #ecf0f1;
        }

        .container {
            max-width: 800px;
            margin: 60px auto;
            padding: 40px;
            background: #1f1f1f;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            border-radius: 12px;
            text-align: center;
        }

        h2 {
            color: #1abc9c;
            margin-bottom: 20px;
        }

        p {
            font-size: 20px;
            margin: 20px 0;
        }

        .monto {
            font-size: 24px;
            font-weight: bold;
            color: #3498db;
        }

        .volver {
            margin-top: 40px;
        }

        .volver a {
            text-decoration: none;
            background-color: #2980b9;
            color: white;
            padding: 14px 28px;
            font-size: 18px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .volver a:hover {
            background-color: #1c5980;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>¡Pago realizado con éxito!</h2>

    <%
        String totalStr = request.getParameter("total");
        if (totalStr != null && !totalStr.isEmpty()) {
            double total = Double.parseDouble(totalStr.replace(",", ""));
            DecimalFormat df = new DecimalFormat("#0.00");
    %>
        <p>Gracias por tu compra. El monto total pagado fue:</p>
        <p class="monto">$<%= df.format(total) %></p>
    <%
            // Limpia el carrito después del pago
            session.removeAttribute("carrito");
        } else {
    %>
        <p>No se recibió el monto del pago.</p>
    <%
        }
    %>

    <div class="volver">
        <a href="index.jsp">Volver al inicio</a>
    </div>
</div>
</body>
</html>

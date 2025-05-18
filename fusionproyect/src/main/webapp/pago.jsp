<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Pago</title>
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

        .form-group {
            margin: 15px 0;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            background-color: #333;
            border: 1px solid #444;
            border-radius: 6px;
            color: #fff;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            padding: 12px 24px;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }

        .btn-back {
            background-color: #e74c3c;
            color: white;
            padding: 12px 24px;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-back:hover {
            background-color: #c0392b;
        }
    </style>

    <script>
        // Mostrar los campos de tarjeta solo si el usuario selecciona 'Tarjeta de Crédito' o 'Tarjeta de Débito'
        function toggleTarjetaFields() {
            var metodoPago = document.getElementById('metodo_pago').value;
            var tarjetaCampos = document.getElementById('tarjetaCampos');
            if (metodoPago === 'credito' || metodoPago === 'debito') {
                tarjetaCampos.style.display = 'block';
            } else {
                tarjetaCampos.style.display = 'none';
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Formulario de Pago</h2>

    <%
        String totalStr = request.getParameter("total");
        double total = 0.0;
        if (totalStr != null && !totalStr.isEmpty()) {
            total = Double.parseDouble(totalStr.replace(",", ""));
        }
        DecimalFormat df = new DecimalFormat("#0.00");
    %>
    <p><strong>Total a Pagar:</strong> $<%= df.format(total) %></p>

    <form action="confirmacion.jsp" method="POST" class="mt-4">
        <!-- Monto a Pagar -->
        <div class="form-group">
            <label for="monto">Monto a Pagar ($):</label>
            <input type="text" id="monto" name="monto" class="form-control" value="<%= df.format(total) %>" readonly>
        </div>

        <!-- Método de Pago -->
        <div class="form-group">
            <label for="metodo_pago">Método de Pago:</label>
            <select name="metodo_pago" id="metodo_pago" class="form-control" required onchange="toggleTarjetaFields()">
                <option value="">Selecciona un método de pago</option>
                <option value="credito">Tarjeta de Crédito</option>
                <option value="debito">Tarjeta de Débito</option>
                <option value="paypal">PayPal</option>
            </select>
        </div>

        <!-- Campos de Tarjeta solo si es necesario -->
        <div id="tarjetaCampos" style="display:none;">
            <div class="form-group">
                <label for="numero_tarjeta">Número de Tarjeta:</label>
                <input type="text" name="numero_tarjeta" id="numero_tarjeta" class="form-control" pattern="\d{16}" maxlength="16">
            </div>
            <div class="form-group">
                <label for="fecha_vencimiento">Fecha de Vencimiento (MM/AA):</label>
                <input type="text" name="fecha_vencimiento" id="fecha_vencimiento" class="form-control" pattern="\d{2}/\d{2}">
            </div>
            <div class="form-group">
                <label for="codigo_seguridad">Código de Seguridad (CVV):</label>
                <input type="text" name="codigo_seguridad" id="codigo_seguridad" class="form-control" pattern="\d{3}" maxlength="3">
            </div>
        </div>

        <!-- Dirección de Envío -->
        <div class="form-group">
            <label for="direccion">Dirección de Entrega:</label>
            <input type="text" name="direccion" id="direccion" class="form-control" required>
        </div>

        <!-- Botón de Envío -->
        <button type="submit" class="btn-submit">Pagar</button>
        <a href="carrito.jsp" class="btn-back">Volver al Carrito</a>
    </form>
</div>
</body>
</html>

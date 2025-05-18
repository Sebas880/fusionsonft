<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.DecimalFormat" %>
<%
    // Obtener la sesión (crearla si no existe)
    HttpSession sesion = request.getSession(true);

    // Obtener carrito
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) sesion.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
        sesion.setAttribute("carrito", carrito);
    }

    // Eliminar producto si se envió
    String idEliminar = request.getParameter("eliminar");
    if (idEliminar != null) {
        Iterator<Map<String, Object>> it = carrito.iterator();
        while (it.hasNext()) {
            Map<String, Object> producto = it.next();
            // Asegurarse de que 'id' no sea null antes de intentar convertirlo a String
            Object id = producto.get("id");
            if (id != null && id.toString().equals(idEliminar)) {
                it.remove();
                break;
            }
        }
        sesion.setAttribute("carrito", carrito);
    }

    DecimalFormat df = new DecimalFormat("#0.00");
    double total = 0.0;
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #1c1c1c; color: #fff; }
        .container { max-width: 800px; margin-top: 50px; }
        .btn-custom { background-color: #0056b3; border-color: #004085; }
        .table thead { background-color: #0056b3; }
        .table th, .table td { text-align: center; }
        .table tbody tr:nth-child(odd) { background-color: #333; }
        .table tbody tr:nth-child(even) { background-color: #444; }
        .alert-custom { background-color: #0056b3; color: #fff; }
    </style>
</head>
<body>

<div class="container">
    <h1 class="text-center">Carrito de Compras</h1>

    <%
    if (carrito.isEmpty()) {
    %>
        <div class="alert alert-custom text-center" role="alert">
            <p>Tu carrito está vacío.</p>
            <a href="catalogo.jsp" class="btn btn-primary">🛍️ Ver Productos</a>
            <a href="index.jsp" class="btn btn-secondary">🏠 Regresar a la Página Principal</a>
            <a href="pago.jsp" class="btn btn-secondary">💳 Ir a Pago</a>
        </div>
    <%
    } else {
    %>
        <form method="get" action="carrito.jsp">
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Map<String, Object> producto : carrito) {
                        String nombre = (String) producto.get("nombre");
                        Number precioObj = (Number) producto.get("precio");
                        double precio = precioObj.doubleValue();
                        int cantidad = ((Number) producto.get("cantidad")).intValue();
                        double subtotal = precio * cantidad;
                        total += subtotal;
                %>
                    <tr>
                        <td><%= nombre %></td>
                        <td>$<%= df.format(precio) %></td>
                        <td><%= cantidad %></td>
                        <td>$<%= df.format(subtotal) %></td>
                        <td>
                            <button type="submit" name="eliminar" value="<%= producto.get("id") %>" class="btn btn-danger">Eliminar</button>
                            
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </form>

        <p class="text-center"><strong>Total a pagar:</strong> $<%= df.format(total) %></p>

        <div class="d-flex justify-content-between">
            <a href="catalogo.jsp" class="btn btn-custom">🔄 Seguir Comprando</a>
            <a href="pago.jsp?total=<%= df.format(total) %>" class="btn btn-success">💳 Realizar Pago</a>
        </div>
    <%
    }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

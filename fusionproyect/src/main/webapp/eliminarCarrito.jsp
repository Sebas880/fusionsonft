<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Producto del Carrito</title>
</head>
<body>

<%
    // Obtener el carrito de la sesión
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
    String productoAEliminar = request.getParameter("eliminar"); // Cambié 'producto' por 'eliminar' para que coincida con el botón de eliminación

    if (carrito != null && productoAEliminar != null) {
        // Buscar y eliminar el producto del carrito utilizando el ID
        Iterator<Map<String, Object>> iter = carrito.iterator();
        while (iter.hasNext()) {
            Map<String, Object> producto = iter.next();
            String idProducto = (String) producto.get("id"); // Cambié a 'id' en lugar de 'nombre'
            if (idProducto != null && idProducto.equals(productoAEliminar)) { // Compara por ID
                iter.remove(); // Eliminar el producto
                break; // Salir del loop una vez que el producto sea eliminado
            }
        }
        
        // Volver a guardar el carrito actualizado en la sesión
        session.setAttribute("carrito", carrito);
    }
    
    // Redirigir de nuevo a la página del carrito
    response.sendRedirect("carrito.jsp");
%>

</body>
</html>

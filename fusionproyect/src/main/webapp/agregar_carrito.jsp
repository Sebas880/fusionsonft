<%@ page import="java.util.*, javax.servlet.http.*" %>
<%
    HttpSession sesion = request.getSession();

    // Validación de sesión
    if (sesion.getAttribute("productos") == null) {
        response.sendRedirect("catalogo.jsp");
        return;
    }

    // Obtener productos seleccionados
    String[] seleccionados = request.getParameterValues("productosSeleccionados");

    if (seleccionados != null && seleccionados.length > 0) {
        List<Map<String, Object>> productos = (List<Map<String, Object>>) sesion.getAttribute("productos");
        List<Map<String, Object>> carrito = (List<Map<String, Object>>) sesion.getAttribute("carrito");

        if (carrito == null) {
            carrito = new ArrayList<>();
        }


        // Buscar los productos seleccionados por nombre
        for (String nombre : seleccionados) {
            boolean productoExistente = false;
            for (Map<String, Object> p : carrito) {
                if (p.get("nombre").equals(nombre)) {
                    // Si el producto ya existe en el carrito, solo incrementa la cantidad
                    int cantidad = (Integer) p.get("cantidad");
                    p.put("cantidad", cantidad + 1);
                    productoExistente = true;
                    break;
                }
            }

            // Si el producto no existe en el carrito, lo agregamos con cantidad 1
            if (!productoExistente) {
                for (Map<String, Object> p : productos) {
                    if (p.get("nombre").equals(nombre)) {
                        Map<String, Object> productoNuevo = new HashMap<>(p);
                        productoNuevo.put("cantidad", 1); // Asignamos cantidad 1
                        carrito.add(productoNuevo);
                        break;
                    }
                }
            }
        }

        sesion.setAttribute("carrito", carrito);
    }

    // Redirección absoluta recomendada
    response.sendRedirect(request.getContextPath() + "/carrito.jsp");
%>
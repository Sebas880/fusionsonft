<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.servlet.http.*" %>
<%
    HttpSession sesion = request.getSession();
    List<Map<String, Object>> productos = (List<Map<String, Object>>) sesion.getAttribute("productos");
    //String usuario = (String) sesion.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Catálogo de Productos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      background-color: #121212;
      color: #fff;
      font-family: 'Roboto', sans-serif;
    }
    .logo-container {
      text-align: center;
      margin-top: 30px;
      margin-bottom: 10px;
    }
    .logo-container img {
      max-width: 200px;
      height: auto;
    }
    .producto-card {
      background-color: #1e1e1e;
      border: 1px solid #333;
      border-radius: 10px;
      padding: 15px;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      transition: all 0.3s ease;
    }
    .producto-card:hover {
      border: 2px solid #00bcd4;
      box-shadow: 0 0 15px #00bcd4;
    }
    .producto-card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
      border-radius: 10px;
      margin-bottom: 10px;
    }
    .producto-card .card-title,
    .producto-card .card-text {
      text-align: center;
    }
    .like-btn {
      background-color: transparent;
      border: none;
      color: #00bcd4;
      cursor: pointer;
      font-size: 18px;
    }
    .checkbox-container {
      text-align: center;
      margin-top: 10px;
    }
    .botones-finales {
      text-align: center;
      margin-top: 40px;
    }
    .btn-final {
      margin: 10px;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 10px;
    }
  </style>
</head>
<body>

<!-- Logo centrado -->
<div class="logo-container">
  <img src="imagenes/logo.jpg" alt="FusionSoft Logo" />
</div>

<div class="container my-4">
  <h2 class="text-center mb-4">Catálogo de Productos</h2>

  <form method="post" action="agregar_carrito.jsp" id="formPrincipal">
  <div class="row">
    <% for (Map<String, Object> producto : productos) { %>
      <div class="col-md-4 mb-4 d-flex">
        <div class="producto-card w-100">
          <img src="<%= producto.get("imagen") %>" alt="<%= producto.get("nombre") %>" />
          <h5 class="card-title"><%= producto.get("nombre") %></h5>
          <p class="card-text"><%= producto.get("descripcion") %></p>
          <p class="card-text">Precio: $<%= producto.get("precio") %></p>

          <!-- Botón "Me gusta" modificado -->
          <div class="text-center">
            <button type="submit" form="formPrincipal" formaction="like.jsp" 
                    name="nombreProducto" value="<%= producto.get("nombre") %>" 
                    class="like-btn">❤️ Me gusta (<%= producto.get("likes") %>)</button>
          </div>

          <div class="checkbox-container">
            <label>
              <input type="checkbox" name="productosSeleccionados" value="<%= producto.get("nombre") %>" />
              Seleccionar
            </label>
          </div>
        </div>
      </div>
    <% } %>
  </div>

  <div class="botones-finales">
    <a href="index.jsp" class="btn btn-outline-light btn-final">🔙 Regresar</a>
    <button type="submit" class="btn btn-success btn-final">🛒 Agregar productos seleccionados</button>
  </div>
</form>

</div>

</body>
</html>

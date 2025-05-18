<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, javax.servlet.http.*" %>
<%
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("productos") == null) {
        List<Map<String, Object>> productos = new ArrayList<>();
        productos.add(Map.of("nombre", "Auriculares Bluetooth", "imagen", "imagenes/Auriculares.jpg", "descripcion", "Auriculares inalámbricos con sonido HD.", "precio", 50, "likes", 0));
        productos.add(Map.of("nombre", "Smartwatch", "imagen", "imagenes/Smartwatch.jpg", "descripcion", "Reloj inteligente con monitor de salud.", "precio", 200, "likes", 0));
        productos.add(Map.of("nombre", "Tablet", "imagen", "imagenes/Tablet.jpg", "descripcion", "Tablet de 10 pulgadas con alta resolución.", "precio", 300, "likes", 0));
        productos.add(Map.of("nombre", "Laptop Dell XPS 15", "imagen", "imagenes/Laptop.jpg", "descripcion", "Potente laptop con procesador Intel i7 y 16GB de RAM.", "precio", 1500, "likes", 0));
        productos.add(Map.of("nombre", "Smartphone Samsung Galaxy S24", "imagen", "imagenes/Smartphone.jpg", "descripcion", "Pantalla AMOLED de 120Hz y cámara de 108MP.", "precio", 1200, "likes", 0));
        productos.add(Map.of("nombre", "Monitor LG UltraWide 34''", "imagen", "imagenes/Monitor.jpg", "descripcion", "Resolución 3440x1440 para una mejor experiencia visual.", "precio", 500, "likes", 0));
        productos.add(Map.of("nombre", "Auriculares Sony WH-1000XM5", "imagen", "imagenes/AuricularesSony.jpg", "descripcion", "Cancelación de ruido de última generación.", "precio", 350, "likes", 0));
        productos.add(Map.of("nombre", "Teclado mecánico Logitech G915", "imagen", "imagenes/Teclado.jpg", "descripcion", "Teclado inalámbrico con switches mecánicos de bajo perfil.", "precio", 250, "likes", 0));
        sesion.setAttribute("productos", productos);
    }

    List<Map<String, Object>> productos = (List<Map<String, Object>>) sesion.getAttribute("productos");
    String usuario = (String) sesion.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>FusionSoft - Catálogo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      background-color: #121212;
      color: #fff;
      font-family: 'Roboto', sans-serif;
    }
    .navbar {
      background-color: #0d0d0d;
    }
    .navbar-brand {
      color: #00bcd4;
      font-weight: bold;
    }
    .navbar-nav .nav-link {
      color: #fff !important;
    }
    .hero-section {
      text-align: center;
      margin-top: 40px;
      padding: 40px 0;
      background-color: #0d0d0d;
    }
    .hero-section h1 {
      font-size: 40px;
      color: #00bcd4;
    }
    .hero-section .btn {
      background-color: #00bcd4;
      color: white;
      border-radius: 30px;
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
    .producto-card .card-text,
    .producto-card form {
      text-align: center;
    }
    .like-btn {
      background-color: transparent;
      border: none;
      color: #00bcd4;
      cursor: pointer;
      font-size: 18px;
    }
    .btn-agregar {
      background-color: #00bcd4;
      color: #fff;
      margin-top: 10px;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="imagenes/logo.jpg" alt="Logo" style="height: 40px; margin-right: 10px;" />
      FusionSoft
    </a>
    <form class="d-flex form-inline">
      <input class="form-control me-2" type="search" placeholder="Buscar productos" />
      <button class="btn btn-outline-light" type="submit">Buscar</button>
    </form>
    <div class="navbar-nav ms-auto">
      <a class="nav-link" href="carrito.jsp">Carrito</a>
      <a class="nav-link" href="registro.jsp">Crear cuenta</a>
      <a class="nav-link" href="login.jsp">Iniciar sesión</a>
      <a class="nav-link" href="logout.jsp">Cerrar sesión</a>

    </div>
  </div>
</nav>

<div class="hero-section">
  <h1>Bienvenido a FusionSoft</h1>
  <p>Los mejores productos de tecnología al alcance de tu mano</p>
  <a href="catalogo.jsp" class="btn btn-lg">Ver Productos</a>
</div>

<div class="container text-center my-5">
  <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#misionModal">Misión</button>
  <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#visionModal">Visión</button>
</div>

<!-- Modal Misión -->
<div class="modal fade" id="misionModal" tabindex="-1" aria-labelledby="misionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-info">
      <div class="modal-header">
        <h5 class="modal-title" id="misionModalLabel">Nuestra Misión</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body bg-secondary text-info">
        <p>En FusionSoft, nos comprometemos a proporcionar soluciones innovadoras en tecnología...</p>
      </div>
    </div>
  </div>
</div>

<!-- Modal Visión -->
<div class="modal fade" id="visionModal" tabindex="-1" aria-labelledby="visionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-info">
      <div class="modal-header">
        <h5 class="modal-title" id="visionModalLabel">Nuestra Visión</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body bg-secondary text-info">
        <p>Ser líderes en el mercado tecnológico mediante la innovación y excelencia en servicio.</p>
      </div>
    </div>
  </div>
</div>

<div class="container my-5">
  <h2 class="text-center mb-4">Productos Destacados</h2>
  <div class="row">
    <% for (Map<String, Object> producto : productos) { %>
      <div class="col-md-4 mb-4 d-flex">
        <div class="producto-card w-100">
          <img src="<%= producto.get("imagen") %>" alt="<%= producto.get("nombre") %>" />
          <h5 class="card-title"><%= producto.get("nombre") %></h5>
          <p class="card-text"><%= producto.get("descripcion") %></p>
          <p class="card-text">Precio: $<%= producto.get("precio") %></p>

          <form method="post" action="like.jsp">
            <input type="hidden" name="nombreProducto" value="<%= producto.get("nombre") %>"/>
            <button type="submit" class="like-btn">❤️ Me gusta (<%= producto.get("likes") %>)</button>
          </form>

          <form method="post" action="agregarCarrito.jsp">
            <input type="hidden" name="producto" value="<%= producto.get("nombre") %>"/>
            <% if (usuario != null) { %>
              <button type="submit" class="btn btn-agregar w-100">Agregar al carrito</button>
            <% } else { %>
              <button type="button" class="btn btn-secondary w-100" onclick="alert('Debes iniciar sesión para agregar al carrito')">Agregar al carrito</button>
            <% } %>
          </form>

        </div>
      </div>
    <% } %>
  </div>
</div>

</body>
</html>
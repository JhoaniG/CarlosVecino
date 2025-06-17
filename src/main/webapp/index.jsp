<%-- 
    Document   : index
    Created on : 3/06/2025, 10:43:12 a. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Tienda de Créditos - El Vecino Amigo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f0f4f8;
      color: #333;
    }

    .navbar {
      background-color: #1a237e;
    }

    .navbar-brand,
    .nav-link {
      color: white !important;
      font-weight: 500;
    }

    .hero-title {
      text-align: center;
      color: #1a237e;
      margin-top: 30px;
    }

    .carousel-item img {
      object-fit: cover;
      height: 400px;
      border-radius: 10px;
    }

    .product-card {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      padding: 20px;
      border: 2px solid #1a237e;
      transition: transform 0.2s ease;
    }

    .product-card:hover {
      transform: scale(1.02);
    }

    .product-title {
      color: #1a237e;
      font-size: 1.2em;
      font-weight: bold;
    }

    .btn-credit {
      background-color: #1a237e;
      color: white;
      border: none;
      width: 100%;
      margin-top: 10px;
    }

    .btn-credit:hover {
      background-color: #0d1645;
    }

    footer {
      margin-top: 60px;
      padding: 20px;
      background-color: #1a237e;
      color: white;
      text-align: center;
    }
  </style>
</head>
<body>

  <!-- NAVBAR -->
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand" href="#">TiendaCrédito</a>
      <div class="ms-auto">
        <a href="login.jsp" class="nav-link d-inline me-3">Iniciar Sesión</a>
        <a href="register.html" class="nav-link d-inline btn btn-light btn-sm">Registrarse</a>
      </div>
    </div>
  </nav>

  <!-- HERO SECTION -->
  <div class="container">
    <h1 class="hero-title">¡Bienvenido a El Vecino Amigo!</h1>
    <p class="text-center mb-5">Créditos fáciles y productos esenciales para tu hogar</p>
  </div>

  <!-- CARRUSEL DE PRODUCTOS -->
  <div class="container mb-5">
    <div id="carouselProductos" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner rounded-3">
        <div class="carousel-item active">
          <img src="photos/TV.jpg" class="d-block w-100 " alt="TV LG">
        </div>
        <div class="carousel-item">
          <img src="photos/laptop.jpg" class="d-block w-100" alt="Laptop">
        </div>
        <div class="carousel-item">
          <img src="photos/motocierra.jpg" class="d-block w-100" alt="Motocierra">
        </div>
          <div class="carousel-item">
          <img src="photos/motocierra.jpg" class="d-block w-100" alt="Motocierra">
        </div>
          <div class="carousel-item">
          <img src="photos/motocierra.jpg" class="d-block w-100" alt="Motocierra">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselProductos" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselProductos" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </div>

  <!-- SECCIÓN DE PRODUCTOS -->
  <div class="container">
    <h3 class="text-center text-primary mb-4">Productos Destacados</h3>
    <div class="row g-4">

      <div class="col-md-4">
        <div class="product-card">
          <p class="product-title">Smartphone Samsung A24</p>
          <p>Precio: $300</p>
          <p>Crédito disponible hasta 6 cuotas</p>
          <button class="btn btn-credit">Solicitar Crédito</button>
        </div>
      </div>

      <div class="col-md-4">
        <div class="product-card">
          <p class="product-title">Laptop Lenovo i5</p>
          <p>Precio: $650</p>
          <p>Crédito disponible hasta 12 cuotas</p>
          <button class="btn btn-credit">Solicitar Crédito</button>
        </div>
      </div>

      <div class="col-md-4">
        <div class="product-card">
          <p class="product-title">TV LG 50 pulgadas</p>
          <p>Precio: $520</p>
          <p>Crédito disponible hasta 10 cuotas</p>
          <button class="btn btn-credit">Solicitar Crédito</button>
        </div>
      </div>

    </div>
  </div>

  <!-- FOOTER -->
  <footer>
    © 2025 Tienda "El Vecino Amigo" - Todos los derechos reservados
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>



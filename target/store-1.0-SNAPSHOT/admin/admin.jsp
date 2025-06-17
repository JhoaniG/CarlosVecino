<%-- 
    Document   : admin.jsp
    Created on : 9/06/2025, 10:41:42 a. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Productos - ANJOS</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f6f9;
      padding-top: 60px;
    }

    .navbar {
      background-color: #1a237e;
    }

    .navbar-brand, .nav-link, .dropdown-toggle {
      color: white !important;
    }

    .section {
      background: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      margin-top: 30px;
    }

    h3.section-title {
      color: #1a237e;
      margin-bottom: 20px;
    }

    .card {
      border: 2px solid #1a237e;
      border-radius: 10px;
    }

    .card-title {
      color: #1a237e;
    }

    .card img {
      object-fit: cover;
      height: 200px;
    }

    .search-bar {
      max-width: 400px;
      margin: 0 auto 20px auto;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
   <%@include file="/admin/adminNav.jsp" %>

  <!-- Contenido principal -->
  <div class="container section">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h3 class="section-title">Catálogo de Productos</h3>
      <a href="AñadirP.html" class="btn btn-success"><i class="fas fa-plus"></i> Añadir Producto</a>
    </div>

    <!-- Barra de búsqueda -->
    <div class="search-bar">
      <input type="text" id="searchInput" class="form-control" placeholder="Buscar producto...">
    </div>

    <!-- Tarjetas -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4" id="productContainer">
      <!-- Producto 1 -->
      <div class="col product-card">
        <div class="card h-100">
          <img src="photos/samsung.jpg" class="card-img-top" alt="Samsung S25">
          <div class="card-body">
            <h5 class="card-title">Samsung S25</h5>
            <p class="card-text">Precio: $250.000</p>
          </div>
          <div class="card-footer d-flex justify-content-between">
            <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
            <button class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Eliminar</button>
          </div>
        </div>
      </div>

      <!-- Producto 2 -->
      <div class="col product-card">
        <div class="card h-100">
          <img src="photos/iphone.jpg" class="card-img-top" alt="iPhone 15">
          <div class="card-body">
            <h5 class="card-title">iPhone 15</h5>
            <p class="card-text">Precio: $400.000</p>
          </div>
          <div class="card-footer d-flex justify-content-between">
            <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
            <button class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Eliminar</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Enlace a ventas -->
  <div class="container section text-center">
    <h3 class="section-title">Ir a Ventas</h3>
    <a href="ventaAd.html" class="btn btn-primary btn-lg">
      <i class="fas fa-chart-line"></i> Ventas
    </a>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- JS para filtrar productos -->
  <script>
    document.getElementById('searchInput').addEventListener('input', function() {
      const query = this.value.toLowerCase();
      const cards = document.querySelectorAll('.product-card');

      cards.forEach(card => {
        const title = card.querySelector('.card-title').textContent.toLowerCase();
        card.style.display = title.includes(query) ? 'block' : 'none';
      });
    });
  </script>

</body>
</html>

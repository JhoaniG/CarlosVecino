<%-- 
    Document   : vendedor
    Created on : 9/06/2025, 12:05:13 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Panel del Empleado</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f4f8;
      color: #333;
      margin: 0;
    }

    .navbar {
      background-color: #1a237e;
    }

    .navbar-brand,
    .nav-link,
    .dropdown-toggle {
      color: white !important;
      font-weight: 500;
    }

    .dropdown-menu {
      background-color: #1a237e;
      border: none;
    }

    .dropdown-item {
      color: white;
    }

    .dropdown-item:hover {
      background-color: #0d1645;
    }

    h2 {
      text-align: center;
      color: #1a237e;
      margin-top: 30px;
    }

    .btn-primary {
      background-color: #1a237e;
      border: none;
    }

    .btn-primary:hover {
      background-color: #0d1645;
    }

    .card {
      border: 2px solid #1a237e;
      border-radius: 10px;
    }

    .card-title {
      color: #1a237e;
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

  
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand" href="#">Panel Empleado</a>
      <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarEmpleado">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarEmpleado">
        <ul class="navbar-nav">
          <li class="nav-item"><a class="nav-link" href="Principal.html">Inicio</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
              Menú Empleado
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item" href="Gestion de Pagos.html">Gestión de Pagos</a></li>
              <li><a class="dropdown-item" href="Gestion de Creditos.html">Gestión de Créditos</a></li>
              <li><a class="dropdown-item" href="inicioSesion.html">Cerrar Sesión</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  
  <div class="container">
    <h2>Gestión de Productos</h2>
    <div class="text-end mb-3">
      <a href="AñadirProducto.html" class="btn btn-primary">
        <i class="fas fa-plus"></i> Añadir Producto
      </a>
    </div>

  
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <!-- Producto 1 -->
      <div class="col">
        <div class="card h-100">
          <img src="Celular.png" class="card-img-top" alt="Celular Samsung">
          <div class="card-body">
            <h5 class="card-title">Samsung S25</h5>
            <p class="card-text">Precio: $250.000</p>
          </div>
          <div class="card-footer d-flex justify-content-between">
            <a href="AñadirP.html" class="btn btn-success btn-sm"><i class="fas fa-cart-plus"></i> Añadir</a>
            <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
            <button class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Eliminar</button>
          </div>
        </div>
      </div>

     

    </div>
  </div>

 
  <footer>
    © 2025 Tienda "El Vecino Amigo" - Panel de Empleados
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

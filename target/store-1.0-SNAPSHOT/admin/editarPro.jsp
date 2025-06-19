<%-- 
    Document   : editarPro
    Created on : 17/06/2025, 7:04:20 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Editar Producto</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      background-color: #f4f6f9;
      padding-top: 50px;
      font-family: 'Segoe UI', sans-serif;
    }
    .form-container {
      background: white;
      border-radius: 12px;
      padding: 30px;
      max-width: 700px;
      margin: auto;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    h3 {
      color: #1a237e;
    }
    .btn-volver {
      margin-top: 20px;
    }
  </style>
</head>
<body>

  <%@ include file="/admin/adminNav.jsp" %>

  <div class="container form-container">
    <h3 class="mb-4">Editar Producto</h3>

    <form action="ProductoController" method="POST">
      <input type="hidden" name="menu" value="Productos">
      <input type="hidden" name="accion" value="Actualizar">
      <input type="hidden" name="id" value="${producto.id}">

      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" id="nombre" name="nombre" value="${producto.nombre}" class="form-control" required>
      </div>

      <div class="mb-3">
        <label for="descripcion" class="form-label">Descripción</label>
        <input type="text" id="descripcion" name="descripcion" value="${producto.descripcion}" class="form-control" required>
      </div>

      <div class="mb-3">
        <label for="precio" class="form-label">Precio</label>
        <input type="number" id="precio" name="precio" value="${producto.precio}" step="0.01" class="form-control" required>
      </div>

      <div class="mb-3">
        <label for="stock" class="form-label">Stock</label>
        <input type="number" id="stock" name="stock" value="${producto.stock}" class="form-control" required>
      </div>

      <button type="submit" class="btn btn-primary">
        <i class="fas fa-save"></i> Actualizar
      </button>
      <a href="ProductoController?menu=Productos&accion=Listar" class="btn btn-secondary btn-volver">
        <i class="fas fa-arrow-left"></i> Volver
      </a>
    </form>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


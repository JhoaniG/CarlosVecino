<%-- 
    Document   : creditos
    Created on : 15/06/2025, 2:59:10 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Créditos - ANJOS</title>
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

    .section-title {
      color: #1a237e;
      margin-bottom: 20px;
    }

    th {
      background-color: #1a237e;
      color: white;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
   <%@include file="/admin/adminNav.jsp" %>

  <!-- Contenido principal -->
  <div class="container section">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h3 class="section-title">Lista de Créditos</h3>
      <a href="registrar_credito.html" class="btn btn-success"><i class="fas fa-plus"></i> Registrar Crédito</a>
    </div>

    <!-- Barra de búsqueda -->
    <div class="input-group mb-3">
      <input type="text" id="buscarCredito" class="form-control" placeholder="Buscar crédito..." onkeyup="filtrarCreditos()">
      <span class="input-group-text"><i class="fas fa-search"></i></span>
    </div>

    <div class="table-responsive">
      <table class="table table-bordered align-middle" id="tablaCreditos">
        <thead>
          <tr>
            <th>ID</th>
            <th>Cliente ID</th>
            <th>Monto</th>
            <th>Fecha Admisión</th>
            <th>Fecha Vencimiento</th>
            <th>Estado</th>
            <th>Producto ID</th>
            <th>Cliente</th>
            <th>Producto</th>
            <th>Actividad</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="u" items="${lista_Creditos}">
            <tr>
              <td>${u.getId()}</td>
              <td>${u.getCliente_id()}</td>
              <td>${u.getMonto()}</td>
              <td>${u.getFecha_emision()}</td>
              <td>${u.getFecha_vencimiento()}</td>
              <td>${u.getEstado()}</td>
              <td>${u.getProducto_id()}</td>
              <td>${u.getNomcli()}</td>
              <td>${u.getNompro()}</td>
              <td>
                <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
                <button class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Eliminar</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Script búsqueda en vivo -->
  <script>
    function filtrarCreditos() {
      const input = document.getElementById("buscarCredito").value.toLowerCase();
      const filas = document.querySelectorAll("#tablaCreditos tbody tr");

      filas.forEach(fila => {
        const textoFila = fila.innerText.toLowerCase();
        fila.style.display = textoFila.includes(input) ? "" : "none";
      });
    }
  </script>

</body>
</html>

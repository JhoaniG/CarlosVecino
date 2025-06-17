<%-- 
    Document   : clientes
    Created on : 15/06/2025, 12:38:54 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Clientes - ANJOS</title>
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

    #noResults {
      display: none;
      text-align: center;
      padding: 20px;
      color: #777;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
   <%@include file="/admin/adminNav.jsp" %>

  <!-- Contenido principal -->
  <div class="container section">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h3 class="section-title">Lista de Clientes</h3>
      <a href="registrar_cliente.html" class="btn btn-success"><i class="fas fa-plus"></i> Registrar Cliente</a>
    </div>

    <!-- Barra de búsqueda -->
    <div class="input-group mb-3">
      <input type="text" id="buscarCliente" class="form-control" placeholder="Buscar cliente..." onkeyup="filtrarClientes()">
      <span class="input-group-text"><i class="fas fa-search"></i></span>
    </div>

    <div class="table-responsive">
      <table class="table table-bordered align-middle" id="tablaClientes">
        <thead>
          <tr>
            <th>Documento</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Categoría Crediticia</th>
            <th>Límite de Crédito</th>
            <th>Fecha de Registro</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="u" items="${lista_clientes}">
            <tr>
              <td>${u.getDocumento()}</td>
              <td>${u.getNombre()}</td>
              <td>${u.getApellido()}</td>
              <td>${u.getCorreo()}</td>
              <td>${u.getCategoria_crediticia()}</td>
              <td>${u.getLimite_credito()}</td>
              <td>${u.getFecha_registro()}</td>
              <td>
                <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
                <button class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Eliminar</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <!-- Mensaje si no hay resultados -->
      <div id="noResults">No se encontraron clientes.</div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Script de búsqueda -->
  <script>
    function filtrarClientes() {
      const input = document.getElementById("buscarCliente").value.toLowerCase();
      const filas = document.querySelectorAll("#tablaClientes tbody tr");
      let hayResultados = false;

      filas.forEach(fila => {
        const textoFila = fila.innerText.toLowerCase();
        const visible = textoFila.includes(input);
        fila.style.display = visible ? "" : "none";
        if (visible) hayResultados = true;
      });

      document.getElementById("noResults").style.display = hayResultados ? "none" : "block";
    }
  </script>

</body>
</html>


<%-- 
    Document   : usuarios
    Created on : 11/06/2025, 9:45:49 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Usuarios - ANJOS</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome para íconos -->
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
      margin-top: 30px;
      background: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h3.section-title {
      color: #1a237e;
      margin-bottom: 20px;
    }

    table th {
      background-color: #1a237e;
      color: white;
    }
  </style>
</head>
<body>

 <%@include file="/admin/adminNav.jsp" %>

  <!-- Contenido principal -->
  <div class="container">
    <div class="section">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="section-title">Gestión de Usuarios</h3>
        <a href="admin/register.jsp" class="btn btn-success"><i class="fas fa-user-plus"></i> Registrar Usuario</a>
      </div>

      <!-- Barra de búsqueda -->
      <div class="input-group mb-3">
        <input type="text" id="buscarUsuario" class="form-control" placeholder="Buscar usuario..." onkeyup="filtrarUsuarios()">
        <span class="input-group-text"><i class="fas fa-search"></i></span>
      </div>

      <div class="table-responsive">
        <table class="table table-bordered table-hover" id="tablaUsuarios">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Correo</th>
              <th>Teléfono</th>
              <th>Documento</th>
              <th>Rol ID</th>
              <th>Rol</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="u" items="${lista_usuarios}">
              <tr>
                <td>${u.getId()}</td>
                <td>${u.getNombre()}</td>
                <td>${u.getApellido()}</td>
                <td>${u.getCorreo()}</td>
                <td>${u.getTelefono()}</td>
                <td>${u.getDocumento()}</td>
                <td>${u.getRol_id()}</td>
                <td>${u.getRolNombre()}</td>
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
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Script de filtro -->
  <script>
    function filtrarUsuarios() {
      const input = document.getElementById("buscarUsuario").value.toLowerCase();
      const filas = document.querySelectorAll("#tablaUsuarios tbody tr");

      filas.forEach(fila => {
        const textoFila = fila.innerText.toLowerCase();
        fila.style.display = textoFila.includes(input) ? "" : "none";
      });
    }
  </script>

</body>
</html>

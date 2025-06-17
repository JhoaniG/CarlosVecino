<%-- 
    Document   : register
    Created on : 15/06/2025, 4:10:31 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registrar Usuario - ANJOS</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap y Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f6f9;
      padding-top: 60px;
    }

    .form-container {
      background-color: #fff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      margin-top: 40px;
    }

    .form-title {
      color: #1a237e;
      margin-bottom: 25px;
      font-weight: bold;
    }

    .btn-primary {
      background-color: #1a237e;
      border: none;
    }

    .btn-primary:hover {
      background-color: #3949ab;
    }

    label {
      font-weight: 500;
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8 form-container">
        <h3 class="form-title"><i class="fas fa-user-plus"></i> Registrar Usuario</h3>

        <form action="${pageContext.request.contextPath}/UsuarioController" method="POST">
          <input type="hidden" name="accion" value="insertar">

          <div class="row mb-3">
            <div class="col-md-6">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" name="nombre" required>
            </div>
            <div class="col-md-6">
              <label for="apellido">Apellido</label>
              <input type="text" class="form-control" name="apellido" required>
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-6">
              <label for="correo">Correo</label>
              <input type="email" class="form-control" name="correo" required>
            </div>
            <div class="col-md-6">
              <label for="telefono">Teléfono</label>
              <input type="text" class="form-control" name="telefono">
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-6">
              <label for="documento">Documento</label>
              <input type="text" class="form-control" name="documento" required>
            </div>
            <div class="col-md-6">
              <label for="contrasena">Contraseña</label>
              <input type="password" class="form-control" name="contrasena" required>
            </div>
          </div>

          <div class="mb-3">
            <label for="rol_id">Rol ID</label>
            <input type="number" class="form-control" name="rol_id" required>
          </div>

          <div class="d-grid">
            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Guardar Usuario</button>
          </div>
        </form>
      </div>
    </div>
  </div>

</body>
</html>





<%-- 
    Document   : login
    Created on : 9/06/2025, 6:54:33 a. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login - ANJOS</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      background-color: #f4f6f9;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      font-family: 'Segoe UI', sans-serif;
    }

    .login-card {
      background: white;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 400px;
    }

    .login-title {
      text-align: center;
      margin-bottom: 25px;
      color: #1a237e;
    }

    .btn-primary {
      background-color: #1a237e;
      border: none;
    }

    .btn-primary:hover {
      background-color: #3949ab;
    }

    .register-text {
      text-align: center;
      margin-top: 20px;
    }

    .register-text a {
      color: #1a237e;
      text-decoration: none;
      font-weight: 500;
    }

    .register-text a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="login-card">
    <h3 class="login-title">Iniciar Sesión</h3>
    <form class="form sign" action="ValidarUsuario" method="POST">
      <div class="mb-3">
        <label for="correo" class="form-label" >Correo electrónico</label>
        <input type="email" class="form-control"  name="correo" placeholder="usuario@gmail.com" required>
      </div>
      <div class="mb-3">
        <label for="contrasena" class="form-label"  >Contraseña</label>
        <input type="password" class="form-control" name="contrasena" placeholder="••••••••" required>
      </div>
      <input type="hidden" name="accion" value="ingresar">
    
    <div class="d-grid">
      <button type="submit">Ingresar</button>
    </div>
    </form>

    <div class="register-text">
      ¿No tienes una cuenta? <a href="registrar_usuario.html">Regístrate</a>
    </div>
  </div>

</body>
</html>



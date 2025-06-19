<%-- 
    Document   : registerPro
    Created on : 18/06/2025, 6:35:26 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Producto - ANJOS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
        rel="stylesheet">
    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            border-radius: 1rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-weight: bold;
            color: #1a237e;
        }

        .btn-primary {
            background-color: #1a237e;
            border: none;
        }

        .btn-primary:hover {
            background-color: #3949ab;
        }
    </style>
</head>
<body>

<div class="container mt-5 d-flex justify-content-center">
    <div class="card p-4" style="width: 100%; max-width: 600px;">
        <h2 class="text-center mb-4">Registrar Producto</h2>

        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <div class="alert alert-danger">
                Error al registrar el producto. Verifica los datos.
            </div>
        <% } %>

        <form action="ProductoController" method="POST">
            <input type="hidden" name="menu" value="Productos">
<input type="hidden" name="accion" value="Registrar">
            
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre del Producto</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea name="descripcion" class="form-control" rows="3" required></textarea>
            </div>

            <div class="mb-3">
                <label for="precio" class="form-label">Precio</label>
                <input type="number" step="0.01" name="precio" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="stock" class="form-label">Stock</label>
                <input type="number" name="stock" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Registrar Producto</button>
        </form>
    </div>
</div>

</body>
</html>

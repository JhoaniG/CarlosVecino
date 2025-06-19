<%-- 
    Document   : registerCl
    Created on : 17/06/2025, 2:44:31 p. m.
    Author     : jhoan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Cliente - ANJOS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
        rel="stylesheet">
    <style>
        body {
            background: #f2f4f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card {
            border-radius: 1rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 600;
        }

        .btn-primary {
            background-color: #4e73df;
            border: none;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
        }

        .form-control, .form-select {
            border-radius: 0.5rem;
        }

        h2 {
            font-weight: 700;
            color: #4e73df;
        }
    </style>
</head>
<body>
<div class="container mt-5 d-flex justify-content-center">
    <div class="card p-4" style="width: 100%; max-width: 600px;">
        <h2 class="text-center mb-4">Registrar Cliente</h2>

        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <div class="alert alert-danger">
                Error al registrar el cliente. Verifica los datos.
            </div>
        <% } %>

        <form action="ClienteController" method="POST">
            <input type="hidden" name="accion" value="registrar">

            <div class="mb-3">
                <label for="documento" class="form-label">Documento</label>
                <input type="text" class="form-control" name="documento" required>
            </div>

            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="nombre" required>
            </div>

            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" class="form-control" name="apellido" required>
            </div>

            <div class="mb-3">
                <label for="correo" class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" name="correo" required>
            </div>

            <div class="mb-3">
                <label for="categoria_crediticia" class="form-label">Categoría Crediticia</label>
                <select name="categoria_crediticia" class="form-select" required>
                    <option value="">Seleccione...</option>
                    <option value="excelente">Excelente</option>
                    <option value="buena">Buena</option>
                    <option value="regular">Regular</option>
                    <option value="mala">Mala</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="limite_credito" class="form-label">Límite de Crédito</label>
                <input type="number" step="0.01" class="form-control" name="limite_credito" required>
            </div>

            <div class="mb-3">
                <label for="fecha_registro" class="form-label">Fecha de Registro</label>
                <input type="date" class="form-control" name="fecha_registro" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Registrar Cliente</button>
        </form>
    </div>
</div>
</body>
</html>



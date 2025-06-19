<%-- 
    Document   : registrarCre
    Created on : 18/06/2025, 7:51:59 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Crédito - ANJOS</title>
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
        <h2 class="text-center mb-4">Registrar Crédito</h2>

        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <div class="alert alert-danger">Error al registrar el crédito. Verifica los datos.</div>
        <% } %>

        <form action="CreditoController" method="POST">
            <input type="hidden" name="menu" value="Creditos">
            <input type="hidden" name="accion" value="Registrar">

            <div class="mb-3">
                <label for="cliente_id" class="form-label">Documento del Cliente</label>
                <input type="text" name="cliente_id" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="monto" class="form-label">Monto</label>
                <input type="number" step="0.01" name="monto" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="fecha_emision" class="form-label">Fecha de Emisión</label>
                <input type="date" name="fecha_emision" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="fecha_vencimiento" class="form-label">Fecha de Vencimiento</label>
                <input type="date" name="fecha_vencimiento" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="estado" class="form-label">Estado</label>
                <select name="estado" class="form-control" required>
                    <option value="vigente">Vigente</option>
                    <option value="pagado">Pagado</option>
                    <option value="vencido">Vencido</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="producto_id" class="form-label">Producto (ID)</label>
                <input type="number" name="producto_id" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Registrar Crédito</button>
        </form>
    </div>
</div>

</body>
</html>


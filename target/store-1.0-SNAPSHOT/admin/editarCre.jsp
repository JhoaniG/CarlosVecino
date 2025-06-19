<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Crédito</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e4e9f7;
            font-family: 'Segoe UI', sans-serif;
        }
        .container-box {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        .btn-warning, .btn-secondary {
            width: 48%;
        }
        h4 {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container-box">
    <h4 class="mb-4 text-center">Editar Crédito</h4>
    <form action="CreditoController?menu=Creditos&accion=Actualizar" method="post">

        <input type="hidden" name="id" value="${credito.id}">

        <div class="form-group">
            <label for="cliente_id">Cliente</label>
            <input type="text" class="form-control" id="cliente_id" name="cliente_id" value="${credito.cliente_id}" required>
        </div>

        <div class="form-group">
            <label for="monto">Monto</label>
            <input type="number" step="0.01" class="form-control" id="monto" name="monto" value="${credito.monto}" required>
        </div>

        <div class="form-group">
            <label for="fecha_emision">Fecha de Emisión</label>
            <input type="date" class="form-control" id="fecha_emision" name="fecha_emision" value="${credito.fecha_emision}" required>
        </div>

        <div class="form-group">
            <label for="fecha_vencimiento">Fecha de Vencimiento</label>
            <input type="date" class="form-control" id="fecha_vencimiento" name="fecha_vencimiento" value="${credito.fecha_vencimiento}" required>
        </div>

        <div class="form-group">
            <label for="estado">Estado</label>
            <select class="form-control" id="estado" name="estado" required>
                <option ${credito.estado == 'Activo' ? 'selected' : ''}>Activo</option>
                <option ${credito.estado == 'Inactivo' ? 'selected' : ''}>Inactivo</option>
                <option ${credito.estado == 'Vencido' ? 'selected' : ''}>Vencido</option>
            </select>
        </div>

        <div class="form-group">
            <label for="producto_id">Producto</label>
            <input type="number" class="form-control" id="producto_id" name="producto_id" value="${credito.producto_id}" required>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <button type="submit" class="btn btn-warning">
                <i class="fas fa-save"></i> Actualizar
            </button>
            <a href="CreditoController?menu=Creditos&accion=Listar" class="btn btn-secondary">
                Cancelar
            </a>
        </div>

    </form>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>



<%-- 
    Document   : registrarPago
    Created on : 18/06/2025, 8:21:29 p. m.
    Author     : jhoan
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Pago</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body>
<div class="container mt-5">
    <h3 class="text-center mb-4">Registrar Pago</h3>
    <form action="PagoController?menu=Pagos&accion=Registrar" method="post" class="border p-4 rounded shadow-sm bg-light">
        <div class="row mb-3">
            <div class="col">
                <label for="credito_id" class="form-label">ID Crédito</label>
                <input type="number" class="form-control" name="credito_id" id="credito_id" required>
            </div>
            <div class="col">
                <label for="monto" class="form-label">Monto</label>
                <input type="number" step="0.01" class="form-control" name="monto" id="monto" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label for="fecha" class="form-label">Fecha</label>
                <input type="date" class="form-control" name="fecha" id="fecha" required>
            </div>
            <div class="col">
                <label for="tipo_pago" class="form-label">Tipo de Pago</label>
                <input type="text" class="form-control" name="tipo_pago" id="tipo_pago" required>
            </div>
        </div>

        <div class="d-flex justify-content-end">
            <a href="PagoController?menu=Pagos&accion=Listar" class="btn btn-secondary me-2">Cancelar</a>
            <button type="submit" class="btn btn-primary">Registrar</button>
        </div>
    </form>
</div>
</body>
</html>

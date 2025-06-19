<%-- 
    Document   : editarPago
    Created on : 18/06/2025, 8:21:10 p. m.
    Author     : jhoan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Editar Pago</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <div class="card">
      <div class="card-header bg-warning text-white">
        <h4 class="mb-0">Editar Pago</h4>
      </div>
      <div class="card-body">
        <form action="PagoController?menu=Pagos" method="post">
          <input type="hidden" name="accion" value="Actualizar">
          <input type="hidden" name="id" value="${pago.id}" />

          <div class="form-group">
            <label for="credito_id">Crédito ID</label>
            <input type="number" class="form-control" name="credito_id" id="credito_id" value="${pago.credito_id}" required />
          </div>

          <div class="form-group">
            <label for="monto">Monto</label>
            <input type="number" step="0.01" class="form-control" name="monto" id="monto" value="${pago.monto}" required />
          </div>

          <div class="form-group">
            <label for="fecha">Fecha</label>
            <input type="date" class="form-control" name="fecha" id="fecha" value="${pago.fecha}" required />
          </div>

          <div class="form-group">
            <label for="tipo_pago">Tipo de Pago</label>
            <input type="text" class="form-control" name="tipo_pago" id="tipo_pago" value="${pago.tipo_pago}" required />
          </div>

          <button type="submit" class="btn btn-success">Actualizar</button>
          <a href="PagoController?menu=Pagos&accion=Listar" class="btn btn-secondary">Cancelar</a>
        </form>
      </div>
    </div>
  </div>
</body>
</html>


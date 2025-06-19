<%-- 
    Document   : editarCl
    Created on : 17/06/2025, 6:04:48 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente - ANJOS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
            padding-top: 60px;
        }
        .container {
            max-width: 700px;
        }
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #1a237e;
            color: white;
            border-radius: 12px 12px 0 0;
        }
        .form-label {
            color: #1a237e;
            font-weight: 600;
        }
        .btn-primary {
            background-color: #1a237e;
            border-color: #1a237e;
        }
    </style>
</head>
<body>

    <%@include file="/admin/adminNav.jsp" %>

    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h4><i class="fas fa-user-edit"></i> Editar Cliente</h4>
            </div>
            <div class="card-body">
                <form action="ClienteController" method="post">
                    <input type="hidden" name="accion" value="actualizar">

                    <div class="mb-3">
                        <label for="documento" class="form-label">Documento</label>
                        <input type="text" id="documento" name="documento" class="form-control" 
                               value="${cliente.documento}" readonly>
                    </div>

                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" id="nombre" name="nombre" class="form-control" 
                               value="${cliente.nombre}" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" id="apellido" name="apellido" class="form-control" 
                               value="${cliente.apellido}" required>
                    </div>

                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo</label>
                        <input type="email" id="correo" name="correo" class="form-control" 
                               value="${cliente.correo}" required>
                    </div>

                    <div class="mb-3">
                        <label for="categoria" class="form-label">Categoría Crediticia</label>
                        <input type="text" id="categoria" name="categoria_crediticia" class="form-control" 
                               value="${cliente.categoria_crediticia}" required>
                    </div>

                    <div class="mb-3">
                        <label for="limite" class="form-label">Límite de Crédito</label>
                        <input type="number" id="limite" name="limite_credito" class="form-control" 
                               value="${cliente.limite_credito}" step="0.01" required>
                    </div>

                    <div class="mb-3">
                        <label for="fecha" class="form-label">Fecha de Registro</label>
                        <input type="date" id="fecha" name="fecha_registro" class="form-control" 
                               value="${cliente.fecha_registro}" required>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="ClienteController?menu=Clientes&accion=Listar" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Cancelar
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Guardar Cambios
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

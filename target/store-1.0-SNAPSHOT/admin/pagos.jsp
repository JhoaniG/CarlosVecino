<%-- 
    Document   : pagos
    Created on : 15/06/2025, 3:44:41 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Pagos - ANJOS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
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
                background: white;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                margin-top: 30px;
            }

            .section-title {
                color: #1a237e;
                margin-bottom: 20px;
            }

            th {
                background-color: #1a237e;
                color: white;
            }

            #noResults {
                display: none;
                text-align: center;
                padding: 20px;
                color: #777;
            }
        </style>
    </head>
    <body>

        <!-- Navbar -->
        <%@include file="/admin/adminNav.jsp" %>
        <!-- Contenido principal -->
        <div class="container section">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="section-title">Lista de Pagos</h3>
                <a href="PagoController?menu=Pagos&accion=Agregar" class="btn btn-success"><i class="fas fa-plus"></i> Registrar Pago</a>
            </div>

            <!-- Búsqueda -->
            <div class="input-group mb-3">
                <input type="text" id="buscarPago" class="form-control" placeholder="Buscar pago..." onkeyup="filtrarPagos()">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered align-middle" id="tablaPagos">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>ID Crédito</th>
                            <th>Monto</th>
                            <th>Fecha</th>
                            <th>Tipo de Pago</th>

                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${lista_Pagos}">
                            <tr>
                                <td>${u.getId()}</td>
                                <td>${u.getCredito_id()}</td>
                                <td>${u.getMonto()}</td>
                                <td>${u.getFecha()}</td>
                                <td>${u.getTipo_pago()}</td>

                                <td>
                                    <a href="PagoController?menu=Pagos&accion=Editar&id=${u.getId()}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                    <a href="PagoController?menu=Pagos&accion=Eliminar&id=${u.getId()}" class="btn btn-danger btn-sm" onclick="return confirm('¿Seguro que deseas eliminar este pago?');">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </a>
                                </td>
                            </c:forEach>
                    </tbody>
                </table>

                <!-- Mensaje si no hay resultados -->
                <div id="noResults">No se encontraron pagos.</div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script de búsqueda -->
        <script>
            function filtrarPagos() {
                const input = document.getElementById("buscarPago").value.toLowerCase();
                const filas = document.querySelectorAll("#tablaPagos tbody tr");
                let hayResultados = false;

                filas.forEach(fila => {
                    const textoFila = fila.innerText.toLowerCase();
                    const visible = textoFila.includes(input);
                    fila.style.display = visible ? "" : "none";
                    if (visible)
                        hayResultados = true;
                });

                document.getElementById("noResults").style.display = hayResultados ? "none" : "block";
            }
        </script>

    </body>
</html>


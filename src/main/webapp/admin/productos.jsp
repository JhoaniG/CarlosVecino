<%-- 
    Document   : productos
    Created on : 15/06/2025, 2:18:26 p. m.
    Author     : jhoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Productos - ANJOS</title>
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
        </style>
    </head>
    <body>

        <!-- Navbar -->
        <%@include file="/admin/adminNav.jsp" %>

        <!-- Contenido principal -->
        <div class="container section">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="section-title">Lista de Productos</h3>
                <a href="ProductoController?menu=Productos&accion=Agregar" class="btn btn-success"><i class="fas fa-plus"></i> Registrar Producto</a>
            </div>

            <!-- Barra de búsqueda -->
            <div class="input-group mb-3">
                <input type="text" id="buscarInput" class="form-control" placeholder="Buscar producto...">
                <button class="btn btn-outline-secondary" type="button" onclick="buscarPorId()">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered align-middle" id="tablaProductos">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${lista_Productos}">
                            <tr>
                                <td>${u.getId()}</td>
                                <td>${u.getNombre()}</td>
                                <td>${u.getDescripcion()}</td>
                                <td>${u.getPrecio()}</td>
                                <td>${u.getStock()}</td>
                                <td>
                                    <a href="ProductoController?menu=Productos&accion=Editar&id=${u.getId()}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>

                                    <a href="ProductoController?menu=Productos&accion=Eliminar&id=${u.getId()}" 
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?');">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script para filtrar productos -->
        <script>
               function buscarProducto() {
                   const input = document.getElementById("buscarInput").value.toLowerCase();
                   const filas = document.querySelectorAll("#tablaProductos tbody tr");

                   filas.forEach(fila => {
                       const texto = fila.innerText.toLowerCase();
                       fila.style.display = texto.includes(input) ? "" : "none";
                   });
               }
        </script>

    </body>
</html>

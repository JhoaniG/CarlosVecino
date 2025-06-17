<%-- 
    Document   : adminNav
    Created on : 17/06/2025, 6:30:52 a. m.
    Author     : adminsena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="UsuarioController?menu=admin">Dashboard ANJOS</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle"  data-bs-toggle="dropdown" >
              Menú
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item" href="UsuarioController?menu=Usuarios&accion=Listar">Usuarios</a></li>
              <li><a class="dropdown-item" href="ClienteController?menu=Clientes&accion=Listar">Clientes</a></li>
              <li><a class="dropdown-item" href="ProductoController?menu=Productos&accion=Listar">Productos</a></li>
              <li><a class="dropdown-item" href="CreditoController?menu=Creditos&accion=Listar">Créditos</a></li>
              <li><a class="dropdown-item" href="PagoController?menu=Pagos&accion=Listar">Pagos</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Cerrar sesión</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>

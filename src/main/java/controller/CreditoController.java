package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Credito;
import modelo.CreditoDao;

@WebServlet("/CreditoController")
public class CreditoController extends HttpServlet {

    CreditoDao dao = new CreditoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("Creditos")) {
            switch (accion) {
                case "Listar":
                    List<Credito> lista_Cred = null;
                    try {
                        lista_Cred = dao.listar();
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(CreditoController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("lista_Creditos", lista_Cred);
                    break;

                case "Agregar":
                    request.getRequestDispatcher("admin/registrarCre.jsp").forward(request, response);
                    return;

                case "Editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    try {
                        Credito creditoEditar = dao.buscarPorId(idEditar);
                        request.setAttribute("credito", creditoEditar);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(CreditoController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.getRequestDispatcher("admin/editarCre.jsp").forward(request, response);
                    return;

                case "Eliminar":
                    int idEliminar = Integer.parseInt(request.getParameter("id"));
                    try {
                        dao.eliminar(idEliminar);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(CreditoController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
            }

            try {
                List<Credito> lista_Cred = dao.listar();
                request.setAttribute("lista_Creditos", lista_Cred);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CreditoController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("admin/creditos.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("Registrar".equals(accion)) {
            Credito c = new Credito();
            c.setCliente_id(request.getParameter("cliente_id"));
            c.setMonto(Double.parseDouble(request.getParameter("monto")));
            c.setFecha_emision(Date.valueOf(request.getParameter("fecha_emision")));
            c.setFecha_vencimiento(Date.valueOf(request.getParameter("fecha_vencimiento")));
            c.setEstado(request.getParameter("estado"));
            c.setProducto_id(Integer.parseInt(request.getParameter("producto_id")));

            try {
                dao.insertar(c);
                response.sendRedirect("CreditoController?menu=Creditos&accion=Listar");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CreditoController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("admin/registerCre.jsp?error=1");
            }
        }

        if ("Actualizar".equals(accion)) {
            Credito c = new Credito();
            c.setId(Integer.parseInt(request.getParameter("id")));
            c.setCliente_id(request.getParameter("cliente_id"));
            c.setMonto(Double.parseDouble(request.getParameter("monto")));
            c.setFecha_emision(Date.valueOf(request.getParameter("fecha_emision")));
            c.setFecha_vencimiento(Date.valueOf(request.getParameter("fecha_vencimiento")));
            c.setEstado(request.getParameter("estado"));
            c.setProducto_id(Integer.parseInt(request.getParameter("producto_id")));

            try {
                dao.actualizar(c);
                response.sendRedirect("CreditoController?menu=Creditos&accion=Listar");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CreditoController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("admin/editarCre.jsp?error=1&id=" + c.getId());
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Créditos";
    }
}



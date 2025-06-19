/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Cliente;
import modelo.ClienteDao;

/**
 *
 * @author jhoan
 */
@WebServlet("/ClienteController")
public class ClienteController extends HttpServlet {

    ClienteDao dao = new ClienteDao();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClienteController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClienteController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("admin")) {
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
        }

        if (menu.equals("Clientes")) {
            switch (accion) {
                case "Listar":
                    List<Cliente> lista_Cli = null;
                    try {
                        lista_Cli = dao.listar();
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("lista_clientes", lista_Cli);
                    break;

                case "Agregar":

                    request.getRequestDispatcher("admin/registerCl.jsp").forward(request, response);

                    break;
                case "Editar":
                    String documentoEditar = request.getParameter("documento");
                    Cliente clienteEditar = null;
                    try {
                        clienteEditar = dao.buscarPorId(documentoEditar);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("cliente", clienteEditar);
                    request.getRequestDispatcher("admin/editarCl.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    String documentoEliminar = request.getParameter("documento");

                    if (!dao.tieneCreditos(documentoEliminar)) {
                        dao.eliminar(documentoEliminar);
                        response.sendRedirect("ClienteController?menu=Clientes&accion=Listar");
                        return; // 👈 MUY IMPORTANTE: evitar seguir ejecutando después del redirect
                    } else {
                        response.sendRedirect("ClienteController?menu=Clientes&accion=Listar&error=con_creditos");
                        return; // 👈 También aquí
                    }

                default:
                    break;

            }
            request.getRequestDispatcher("admin/clientes.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("registrar".equals(accion)) {
            Cliente u = new Cliente();
            u.setDocumento(request.getParameter("documento"));
            u.setNombre(request.getParameter("nombre"));
            u.setApellido(request.getParameter("apellido"));
            u.setCorreo(request.getParameter("correo"));
            u.setCategoria_crediticia(request.getParameter("categoria_crediticia"));
            u.setLimite_credito(Double.parseDouble(request.getParameter("limite_credito")));
            u.setFecha_registro(java.sql.Date.valueOf(request.getParameter("fecha_registro")));

            boolean exito = dao.registrar(u);

            if (exito) {
                response.sendRedirect("ClienteController?menu=Clientes&accion=Listar"); // Redirige a la lista de usuarios
            } else {
                response.sendRedirect("admin/registerCl.jsp?error=1");
            }
        }
        if ("actualizar".equals(accion)) {
            Cliente cl = new Cliente();
            cl.setDocumento(request.getParameter("documento"));
            cl.setNombre(request.getParameter("nombre"));
            cl.setApellido(request.getParameter("apellido"));
            cl.setCorreo(request.getParameter("correo"));
            cl.setCategoria_crediticia(request.getParameter("categoria_crediticia"));
            cl.setLimite_credito(Double.parseDouble(request.getParameter("limite_credito")));
            String fecha = request.getParameter("fecha_registro");
            if (fecha != null && !fecha.isEmpty()) {
                cl.setFecha_registro(Date.valueOf(fecha));
            } else {
                cl.setFecha_registro(null); // o manejarlo según tu lógica
            }

            boolean exito = dao.actualizar(cl);

            if (exito) {
                response.sendRedirect("ClienteController?menu=Clientes&accion=Listar");
            } else {
                response.sendRedirect("admin/editarCl.jsp?error=1&documento=" + cl.getDocumento());
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

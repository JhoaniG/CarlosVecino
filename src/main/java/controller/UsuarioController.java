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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Usuario;
import modelo.UsuarioDao;

/**
 *
 * @author adminsena
 */
@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {

    UsuarioDao usu_dao = new UsuarioDao();
    Usuario usu = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {

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
        if (menu.equals("Usuarios")) {
            switch (accion) {
                case "Listar":
                    List<Usuario> lista_usu = null;
                    try {
                        lista_usu = usu_dao.listar();
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("lista_usuarios", lista_usu);

                    break;

                case "Agregar":
                    request.getRequestDispatcher("admin/register.jsp").forward(request, response);
                    break;
                case "Editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    Usuario usuarioEdit = null;
                    try {
                        usuarioEdit = usu_dao.buscarPorId(idEditar);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("usuarioEditar", usuarioEdit);
                    request.getRequestDispatcher("admin/editar.jsp").forward(request, response);
                    break;

                case "Eliminar":
                    int idEliminar = Integer.parseInt(request.getParameter("id"));
                    usu_dao.eliminar(idEliminar);
                    response.sendRedirect("UsuarioController?menu=Usuarios&accion=Listar");
                    return;

            }
            request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
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
            Usuario u = new Usuario();
            u.setNombre(request.getParameter("nombre"));
            u.setApellido(request.getParameter("apellido"));
            u.setCorreo(request.getParameter("correo"));
            u.setContrasena(request.getParameter("contrasena"));
            u.setTelefono(request.getParameter("telefono"));
            u.setDocumento(request.getParameter("documento"));
            u.setRol_id(Integer.parseInt(request.getParameter("rol_id")));

            boolean exito = usu_dao.registrar(u);

            if (exito) {
                response.sendRedirect("UsuarioController?menu=Usuarios&accion=Listar"); // Redirige a la lista de usuarios
            } else {
                response.sendRedirect("admin/register.jsp?error=1");
            }
        }
        if ("actualizar".equals(accion)) {
            Usuario u = new Usuario();
            u.setId(Integer.parseInt(request.getParameter("id")));
            u.setNombre(request.getParameter("nombre"));
            u.setApellido(request.getParameter("apellido"));
            u.setCorreo(request.getParameter("correo"));
            u.setContrasena(request.getParameter("contrasena"));
            u.setTelefono(request.getParameter("telefono"));
            u.setDocumento(request.getParameter("documento"));
            u.setRol_id(Integer.parseInt(request.getParameter("rol_id")));

            boolean actualizado = usu_dao.actualizar(u);

            if (actualizado) {
                response.sendRedirect("UsuarioController?menu=Usuarios&accion=Listar");
            } else {
                response.sendRedirect("admin/register.jsp?error=2");
            }
        }

    }

}

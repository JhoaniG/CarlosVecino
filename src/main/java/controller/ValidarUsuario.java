/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Usuario;
import modelo.UsuarioDao;

/**
 *
 * @author jhoan
 * 
 */
@WebServlet("/ValidarUsuario")
public class ValidarUsuario extends HttpServlet {
     UsuarioDao UsuarioDao = new UsuarioDao();
     Usuario usu=new Usuario();

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
            out.println("<title>Servlet ValidarUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ValidarUsuario at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
        
        String accion= request.getParameter("accion");
        if (accion.equalsIgnoreCase("ingresar")) {
            String correo=request.getParameter("correo");
            String contrasena=request.getParameter("contrasena");
            try{
                usu=UsuarioDao.Validar(correo, contrasena);
                
            
            
            }catch(ClassNotFoundException ex){
            Logger.getLogger(ValidarUsuario.class.getName()).log(Level.SEVERE, null, ex);          
            }
            if (usu.getCorreo()!=null && usu.getContrasena()!=null ) {
                if (usu.getRol_id()==1) {
                   request.setAttribute("usuario", usu);
                   request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
                    
                }else{
                request.setAttribute("usuario", usu);
                request.getRequestDispatcher("vendedor/vendedor.jsp").forward(request, response);   
                }
                
            }else{
                request.setAttribute("fail", usu);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
            
        }else{
        request.setAttribute("fail", "Ingrese Usuario y Contraseña");
                request.getRequestDispatcher("index.jsp").forward(request, response);
  
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


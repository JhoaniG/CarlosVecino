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
import modelo.Producto;
import modelo.ProductoDao;

/**
 *
 * @author jhoan
 */
@WebServlet("/ProductoController")
public class ProductoController extends HttpServlet {

    ProductoDao dao = new ProductoDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductoController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if ("admin".equals(menu)) {
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
            return;
        }

        if ("Productos".equals(menu)) {
            try {
                switch (accion) {
                    case "Listar":
                        List<Producto> lista_pro = dao.listar();
                        request.setAttribute("lista_Productos", lista_pro);
                        break;

                    case "Agregar":
                        request.getRequestDispatcher("admin/registerPro.jsp").forward(request, response);
                        return;

                    case "Editar":
                        int id = Integer.parseInt(request.getParameter("id"));
                        Producto producto = dao.buscarPorId(id);
                        request.setAttribute("producto", producto);
                        request.getRequestDispatcher("admin/editarPro.jsp").forward(request, response);
                        return;

                    case "Eliminar":
                        int idEliminar = Integer.parseInt(request.getParameter("id"));
                        dao.eliminar(idEliminar);
                        break;
                }
                List<Producto> lista_pro = dao.listar();
                request.setAttribute("lista_Productos", lista_pro);
                request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("admin/productos.jsp?error=1");
            }
        } else {
            response.sendRedirect("admin/admin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if ("Productos".equals(menu)) {
            try {
                if ("Registrar".equals(accion)) {
                    Producto p = new Producto();
                    p.setNombre(request.getParameter("nombre"));
                    p.setDescripcion(request.getParameter("descripcion"));
                    p.setPrecio(Double.parseDouble(request.getParameter("precio")));
                    p.setStock(Integer.parseInt(request.getParameter("stock")));

                    boolean exito = dao.insertar(p);
                    if (exito) {
                        response.sendRedirect("ProductoController?menu=Productos&accion=Listar&success=1");
                    } else {
                        response.sendRedirect("admin/registerPro.jsp?error=1");
                    }
                    return;
                }

                if ("Actualizar".equals(accion)) {
                    Producto p = new Producto();
                    p.setId(Integer.parseInt(request.getParameter("id")));
                    p.setNombre(request.getParameter("nombre"));
                    p.setDescripcion(request.getParameter("descripcion"));
                    p.setPrecio(Double.parseDouble(request.getParameter("precio")));
                    p.setStock(Integer.parseInt(request.getParameter("stock")));
                    dao.actualizar(p);
                }

                List<Producto> lista_pro = dao.listar();
                request.setAttribute("lista_Productos", lista_pro);
                request.getRequestDispatcher("admin/productos.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("admin/productos.jsp?error=1");
            }
        } else {
            response.sendRedirect("admin/admin.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}


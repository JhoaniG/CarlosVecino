package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import modelo.Pago;
import modelo.PagoDao;

@WebServlet("/PagoController")
public class PagoController extends HttpServlet {

    PagoDao dao = new PagoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("admin")) {
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
        }

        if (menu.equals("Pagos")) {
            switch (accion) {
                case "Listar":
                    try {
                        List<Pago> lista = dao.listar();
                        request.setAttribute("lista_Pagos", lista);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;

                case "Agregar":
                    request.getRequestDispatcher("admin/registrarPago.jsp").forward(request, response);
                    return;

                case "Editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    try {
                        Pago pago = dao.buscarPorId(idEditar);
                        request.setAttribute("pago", pago);
                        request.getRequestDispatcher("admin/editarPago.jsp").forward(request, response);
                        return;
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;

                case "Eliminar":
                    int idEliminar = Integer.parseInt(request.getParameter("id"));
                    try {
                        dao.eliminar(idEliminar);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
            }

            try {
                List<Pago> lista = dao.listar();
                request.setAttribute("lista_Pagos", lista);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.getRequestDispatcher("admin/pagos.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("Pagos")) {
            Pago p = new Pago();

            try {
                if (accion.equals("Registrar")) {
                    p.setCredito_id(Integer.parseInt(request.getParameter("credito_id")));
                    p.setMonto(Double.parseDouble(request.getParameter("monto")));
                    p.setTipo_pago(request.getParameter("tipo_pago"));

                    String fecha = request.getParameter("fecha");
                    if (fecha != null && !fecha.isEmpty()) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Date fechaUtil = sdf.parse(fecha);
                        p.setFecha(new java.sql.Date(fechaUtil.getTime()));
                    }

                    dao.insertar(p);
                }

                if (accion.equals("Actualizar")) {
                    p.setId(Integer.parseInt(request.getParameter("id")));
                    p.setCredito_id(Integer.parseInt(request.getParameter("credito_id")));
                    p.setMonto(Double.parseDouble(request.getParameter("monto")));
                    p.setTipo_pago(request.getParameter("tipo_pago"));

                    String fecha = request.getParameter("fecha");
                    if (fecha != null && !fecha.isEmpty()) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Date fechaUtil = sdf.parse(fecha);
                        p.setFecha(new java.sql.Date(fechaUtil.getTime()));
                    }

                    dao.actualizar(p);
                }

            } catch (Exception e) {
                Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, e);
            }

            response.sendRedirect("PagoController?menu=Pagos&accion=Listar");
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Pagos";
    }
}

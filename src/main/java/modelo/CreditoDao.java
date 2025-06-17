/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import conf.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jhoan
 */
public class CreditoDao {
    Conexion cn = new Conexion(); // Tu clase que conecta a la BD
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    
     public List<Credito> listar() throws ClassNotFoundException {
       String sql = "SELECT c.id, c.cliente_id, c.monto, " +
                 "c.fecha_emision, c.fecha_vencimiento, c.estado, c.producto_id, " +
                 "cl.nombre, p.nombre  " +
                 "FROM creditos c " +
                 "JOIN cliente cl ON c.cliente_id = cl.documento " +
                 "JOIN productos p ON c.producto_id = p.id";
        List<Credito> lista = new ArrayList<>();

        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Credito p = new Credito();
               p.setId(rs.getInt(1));
               p.setCliente_id(rs.getString(2));
               p.setMonto(rs.getDouble(3));
               p.setFecha_emision(rs.getDate(4));
               p.setFecha_vencimiento(rs.getDate(5));
               p.setEstado(rs.getString(6));
               p.setProducto_id(rs.getInt(7));
               p.setNomcli(rs.getString(8));
               p.setNompro(rs.getString(9));
                lista.add(p);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }

        return lista;
    }
    
}

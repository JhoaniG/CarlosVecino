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
public class PagoDao {
    Conexion cn = new Conexion(); // Tu clase que conecta a la BD
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    public List<Pago> listar() throws ClassNotFoundException {
    String sql = "SELECT*FROM PAGOS";

    List<Pago> Lista = new ArrayList<>();

    try {
        conn = (Connection) cn.conexion();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Pago p = new Pago();
             p.setId(rs.getInt(1));
             p.setCredito_id(rs.getInt(2));
             p.setMonto(rs.getDouble(3));
             p.setFecha(rs.getDate(4));
             p.setTipo_pago(rs.getString(5));
            
            Lista.add(p);
        }
    } catch (SQLException e) {
        System.out.println("ERROR: " + e.getMessage());
    }

    return Lista;
}
    
}

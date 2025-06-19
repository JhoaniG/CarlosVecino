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
      public boolean insertar(Pago p) throws ClassNotFoundException {
        String sql = "INSERT INTO pagos (credito_id, monto, fecha, tipo_pago) VALUES (?, ?, ?, ?)";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, p.getCredito_id());
            ps.setDouble(2, p.getMonto());
            ps.setDate(3, new java.sql.Date(p.getFecha().getTime()));
            ps.setString(4, p.getTipo_pago());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR al insertar pago: " + e.getMessage());
            return false;
        }
    }

    public boolean actualizar(Pago p) throws ClassNotFoundException {
        String sql = "UPDATE pagos SET credito_id = ?, monto = ?, fecha = ?, tipo_pago = ? WHERE id = ?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, p.getCredito_id());
            ps.setDouble(2, p.getMonto());
            ps.setDate(3, new java.sql.Date(p.getFecha().getTime()));
            ps.setString(4, p.getTipo_pago());
            ps.setInt(5, p.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR al actualizar pago: " + e.getMessage());
            return false;
        }
    }

    public boolean eliminar(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM pagos WHERE id = ?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR al eliminar pago: " + e.getMessage());
            return false;
        }
    }

    public Pago buscarPorId(int id) throws ClassNotFoundException {
        String sql = "SELECT * FROM pagos WHERE id = ?";
        Pago p = new Pago();
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setCredito_id(rs.getInt("credito_id"));
                p.setMonto(rs.getDouble("monto"));
                p.setFecha(rs.getDate("fecha"));
                p.setTipo_pago(rs.getString("tipo_pago"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR al buscar pago: " + e.getMessage());
        }
        return p;
    }
    
}

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
      public boolean insertar(Credito c) throws ClassNotFoundException {
        String sql = "INSERT INTO creditos (cliente_id, monto, fecha_emision, fecha_vencimiento, estado, producto_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getCliente_id());
            ps.setDouble(2, c.getMonto());
            ps.setDate(3, new java.sql.Date(c.getFecha_emision().getTime()));
            ps.setDate(4, new java.sql.Date(c.getFecha_vencimiento().getTime()));
            ps.setString(5, c.getEstado());
            ps.setInt(6, c.getProducto_id());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al insertar credito: " + e.getMessage());
            return false;
        }
    }

    public boolean actualizar(Credito c) throws ClassNotFoundException {
        String sql = "UPDATE creditos SET cliente_id=?, monto=?, fecha_emision=?, fecha_vencimiento=?, estado=?, producto_id=? WHERE id=?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getCliente_id());
            ps.setDouble(2, c.getMonto());
            ps.setDate(3, new java.sql.Date(c.getFecha_emision().getTime()));
            ps.setDate(4, new java.sql.Date(c.getFecha_vencimiento().getTime()));
            ps.setString(5, c.getEstado());
            ps.setInt(6, c.getProducto_id());
            ps.setInt(7, c.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al actualizar credito: " + e.getMessage());
            return false;
        }
    }

    public boolean eliminar(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM creditos WHERE id=?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al eliminar credito: " + e.getMessage());
            return false;
        }
    }

    public Credito buscarPorId(int id) throws ClassNotFoundException {
        String sql = "SELECT * FROM creditos WHERE id=?";
        Credito c = new Credito();
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                c.setId(rs.getInt("id"));
                c.setCliente_id(rs.getString("cliente_id"));
                c.setMonto(rs.getDouble("monto"));
                c.setFecha_emision(rs.getDate("fecha_emision"));
                c.setFecha_vencimiento(rs.getDate("fecha_vencimiento"));
                c.setEstado(rs.getString("estado"));
                c.setProducto_id(rs.getInt("producto_id"));
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar credito: " + e.getMessage());
        }
        return c;
    }
}

    


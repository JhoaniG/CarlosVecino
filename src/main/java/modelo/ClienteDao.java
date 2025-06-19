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
public class ClienteDao {
      Conexion cn = new Conexion(); // Tu clase que conecta a la BD
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<Cliente> listar() throws ClassNotFoundException {
        String sql = "SELECT documento, nombre, apellido, correo, categoria_crediticia, limite_credito, fecha_registro FROM cliente";
        List<Cliente> lista = new ArrayList<>();

        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setDocumento(rs.getString("documento"));
                cli.setNombre(rs.getString("nombre"));
                cli.setApellido(rs.getString("apellido"));
                cli.setCorreo(rs.getString("correo"));
                cli.setCategoria_crediticia(rs.getString("categoria_crediticia"));
                cli.setLimite_credito(rs.getDouble("limite_credito"));
                cli.setFecha_registro(rs.getDate("fecha_registro")); // ← puede usar java.sql.Date o java.util.Date
                lista.add(cli);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar clientes: " + e.getMessage());
        }

        return lista;
    }
    public boolean registrar(Cliente u) {
        String sql = "INSERT INTO cliente (documento, nombre, apellido, correo, categoria_crediticia, limite_credito, fecha_registro) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getDocumento());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getApellido());
            ps.setString(4, u.getCorreo());
            ps.setString(5, u.getCategoria_crediticia());
            ps.setDouble(6, u.getLimite_credito());
            ps.setDate(7, new java.sql.Date(u.getFecha_registro().getTime()));
            

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public Cliente buscarPorId(String documento) throws ClassNotFoundException {
        Cliente u = new Cliente();
        String sql = "SELECT * FROM cliente WHERE documento = ?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, documento);
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setDocumento(rs.getString("documento"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setCorreo(rs.getString("correo"));
                u.setCategoria_crediticia(rs.getString("categoria_crediticia"));
                u.setLimite_credito(rs.getDouble("limite_credito"));
                u.setFecha_registro(rs.getDate("fecha_registro"));
               
               
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean eliminar(String documento) {
        String sql = "DELETE FROM cliente WHERE documento = ?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, documento);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean actualizar(Cliente u) {
    String sql = "UPDATE cliente SET nombre=?, apellido=?, correo=?, categoria_crediticia=?, limite_credito=?, fecha_registro=? WHERE documento=?";
    try {
        conn = cn.conexion();
        ps = conn.prepareStatement(sql);
        
        ps.setString(1, u.getNombre());
        ps.setString(2, u.getApellido());
        ps.setString(3, u.getCorreo());
        ps.setString(4, u.getCategoria_crediticia());
        ps.setDouble(5, u.getLimite_credito());

        if (u.getFecha_registro() != null) {
            ps.setDate(6, new java.sql.Date(u.getFecha_registro().getTime()));
        } else {
            ps.setDate(6, null);
        }

        ps.setString(7, u.getDocumento()); // WHERE documento = ?

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

     
     public boolean tieneCreditos(String documento) {
    String sql = "SELECT COUNT(*) FROM creditos WHERE cliente_id = ?";
    try {
        conn = cn.conexion();
        ps = conn.prepareStatement(sql);
        ps.setString(1, documento);
        rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0; // true si hay créditos
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}


}

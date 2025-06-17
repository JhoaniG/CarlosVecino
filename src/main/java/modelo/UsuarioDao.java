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
public class UsuarioDao {

    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Usuario Validar(String email, String contrasena) throws ClassNotFoundException {
        Usuario obj_usu = new Usuario();
        String sql = "SELECT*FROM usuarios Where correo=? AND contrasena=?;";
        try {
            conn = (Connection) cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();
            while (rs.next()) {
                obj_usu.setId(rs.getInt("id"));
                obj_usu.setNombre(rs.getString("nombre"));
                obj_usu.setApellido(rs.getString("apellido"));
                obj_usu.setTelefono(rs.getString("telefono"));
                obj_usu.setCorreo(rs.getString("correo"));
                obj_usu.setDocumento(rs.getString("documento"));
                obj_usu.setContrasena(rs.getString("contrasena"));
                obj_usu.setRol_id(rs.getInt("rol_id"));

            }

        } catch (SQLException e) {
            System.out.println("ERROR");
        }
        return obj_usu;

    }

    public List<Usuario> listar() throws ClassNotFoundException {
        String sql = "SELECT u.id, u.nombre, u.apellido, u.correo, u.telefono, u.documento, u.rol_id, r.nombre "
                + "FROM usuarios u "
                + "JOIN roles r ON u.rol_id = r.id";

        List<Usuario> Lista = new ArrayList<>();

        try {
            conn = (Connection) cn.conexion();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setId(rs.getInt(1));
                usu.setNombre(rs.getString(2));
                usu.setApellido(rs.getString(3));
                usu.setCorreo(rs.getString(4));
                usu.setTelefono(rs.getString(5));
                usu.setDocumento(rs.getString(6));
                usu.setRol_id(rs.getInt(7));
                usu.setRolNombre(rs.getString(8)); // ← nombre del rol desde tabla "roles"
                Lista.add(usu);
            }
        } catch (SQLException e) {
            System.out.println("ERROR: " + e.getMessage());
        }

        return Lista;
    }

    public boolean registrar(Usuario u) {
        String sql = "INSERT INTO usuarios (nombre, apellido, correo, contrasena, telefono, documento, rol_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getContrasena());
            ps.setString(5, u.getTelefono());
            ps.setString(6, u.getDocumento());
            ps.setInt(7, u.getRol_id());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Usuario buscarPorId(int id) throws ClassNotFoundException {
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getString("telefono"));
                u.setDocumento(rs.getString("documento"));
                u.setContrasena(rs.getString("contrasena"));
                u.setRol_id(rs.getInt("rol_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Usuario u) {
        String sql = "UPDATE usuarios SET nombre=?, apellido=?, correo=?, contrasena=?, telefono=?, documento=?, rol_id=? WHERE id=?";
        try {
            conn = cn.conexion();
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getContrasena());
            ps.setString(5, u.getTelefono());
            ps.setString(6, u.getDocumento());
            ps.setInt(7, u.getRol_id());
            ps.setInt(8, u.getId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}

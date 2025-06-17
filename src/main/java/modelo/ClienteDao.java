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

}

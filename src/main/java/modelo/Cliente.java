/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.util.Date;
/**
 *
 * @author jhoan
 */

   



public class Cliente {
    private String documento;
    private String nombre;
    private String apellido;
    private String correo;
    private String categoria_crediticia;
    private double limite_credito;
    private Date fecha_registro;

    public Cliente() {
        // Constructor vacío
    }

    public Cliente(String documento, String nombre, String apellido, String correo, String categoria_crediticia, double limite_credito, Date fecha_registro) {
        this.documento = documento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.categoria_crediticia = categoria_crediticia;
        this.limite_credito = limite_credito;
        this.fecha_registro = fecha_registro;
    }

    // Getters
    public String getDocumento() {
        return documento;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public String getCategoria_crediticia() {
        return categoria_crediticia;
    }

    public double getLimite_credito() {
        return limite_credito;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    // Setters
    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setCategoria_crediticia(String categoria_crediticia) {
        this.categoria_crediticia = categoria_crediticia;
    }

    public void setLimite_credito(double limite_credito) {
        this.limite_credito = limite_credito;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
}



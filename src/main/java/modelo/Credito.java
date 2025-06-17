/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author jhoan
 */
public class Credito {
    public int id;
    public String cliente_id;
    public double monto;
    public Date fecha_emision;
    public Date fecha_vencimiento;
    public String estado;
    public int producto_id;
    public String nomcli;
    public String nompro;

    public Credito() {
    }

    public Credito(int id, String cliente_id, double monto, Date fecha_emision, Date fecha_vencimiento, String estado, String nomcli) {
        this.id = id;
        this.cliente_id = cliente_id;
        this.monto = monto;
        this.fecha_emision = fecha_emision;
        this.fecha_vencimiento = fecha_vencimiento;
        this.estado = estado;
        this.nomcli = nomcli;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public String getNompro() {
        return nompro;
    }
    

    public int getId() {
        return id;
    }

    public String getCliente_id() {
        return cliente_id;
    }

    public double getMonto() {
        return monto;
    }

    public Date getFecha_emision() {
        return fecha_emision;
    }

    public Date getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public String getEstado() {
        return estado;
    }

    public String getNomcli() {
        return nomcli;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCliente_id(String cliente_id) {
        this.cliente_id = cliente_id;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public void setFecha_emision(Date fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    public void setFecha_vencimiento(Date fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setNomcli(String nomcli) {
        this.nomcli = nomcli;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public void setNompro(String nompro) {
        this.nompro = nompro;
    }
    
    
    
}

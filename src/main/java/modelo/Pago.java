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
public class Pago {
    public int id;
    public int credito_id;
    public double monto;
    public Date fecha;
    public  String tipo_pago;
   

    public Pago() {
    }

    public Pago(int id, int credito_id, double monto, Date fecha, String tipo_pago) {
        this.id = id;
        this.credito_id = credito_id;
        this.monto = monto;
        this.fecha = fecha;
        this.tipo_pago = tipo_pago;
    }

    

    public int getId() {
        return id;
    }

    public int getCredito_id() {
        return credito_id;
    }

    public double getMonto() {
        return monto;
    }

    public Date getFecha() {
        return fecha;
    }

    public String getTipo_pago() {
        return tipo_pago;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCredito_id(int credito_id) {
        this.credito_id = credito_id;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setTipo_pago(String tipo_pago) {
        this.tipo_pago = tipo_pago;
    }

   
    
    
}

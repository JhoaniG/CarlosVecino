/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author jhoan
 */
public class Usuario {
    public int id;
    public String nombre;
    public String apellido;
    public String correo;
    public String telefono;
    public int rol_id;
    public String contrasena;
    public String documento;
    private String rolNombre;
     public Usuario(){
} 

    public Usuario(int id, String nombre, String apellido, String telefono, String correo, int rol_id, String contrasena, String documento) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.correo = correo;
        this.rol_id = rol_id;
        this.contrasena = contrasena;
        this.documento=documento;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public int getRol_id() {
        return rol_id;
    }

    public String getContrasena() {
        return contrasena;
    }

    public String getDocumento() {
        return documento;
    }
    

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setRol_id(int rol) {
        this.rol_id = rol;
    }

    public void setContrasena(String contraseña) {
        this.contrasena = contraseña;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }
    
    public String getRolNombre() {
    return rolNombre;
}

public void setRolNombre(String rolNombre) {
    this.rolNombre = rolNombre;
}

    

   
     
     
    
    
}


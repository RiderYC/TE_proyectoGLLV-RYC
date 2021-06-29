
package com.emergentes.modelo;

import java.sql.Date;

public class Salida {
    private int id;
    private int cliente_id;
    private int producto_id;
    private String destino;
    private String nombre;
    private String tipo;
    private Date fecha;
    private String cliente;
    private String producto;

    public Salida() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(int cliente_id) {
        this.cliente_id = cliente_id;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }
    
   @Override
    public String toString() {
        return "Salida{" + "id=" + id + ", cliente_id=" + cliente_id + ", producto_id=" + producto_id + ", " + "destino=" + destino + "," +"nombre=" + nombre + "," + "tipo=" + tipo + ", fecha=" + fecha + ", cliente=" + cliente + ", producto=" + producto + '}';
    }   
}

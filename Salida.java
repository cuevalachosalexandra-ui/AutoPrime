/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.model;

/**
 *
 * @author ALEXANDRA
 */
import java.sql.Timestamp;

public class Salida {

    private int id;
    private int repuestoId;
    private int cantidad;
    private int idUsuario;
    private Timestamp fecha;

    public Salida() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRepuestoId() {
        return repuestoId;
    }

    public void setRepuestoId(int repuestoId) {
        this.repuestoId = repuestoId;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public int getIdUsuario(){
    return idUsuario;
}

public void setIdUsuario(int idUsuario){
    this.idUsuario = idUsuario;
}

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
}
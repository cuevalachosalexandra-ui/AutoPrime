/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.model;

/**
 *
 * @author ALEXANDRA
 */
public class ReporteMovimiento {

    private String fecha;
    private String tipo;
    private String repuesto;
    private int cantidad;
    private String usuario;


    public ReporteMovimiento() {
    }


    public ReporteMovimiento(String fecha, String tipo, String repuesto, int cantidad, String usuario) {
        this.fecha = fecha;
        this.tipo = tipo;
        this.repuesto = repuesto;
        this.cantidad = cantidad;
        this.usuario = usuario;
    }


    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }


    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }


    public String getRepuesto() {
        return repuesto;
    }

    public void setRepuesto(String repuesto) {
        this.repuesto = repuesto;
    }


    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }


    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

}
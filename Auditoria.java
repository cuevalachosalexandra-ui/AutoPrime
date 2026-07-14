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

public class Auditoria {

    private int idAuditoria;
    private int idUsuario;
    private String nombreUsuario;
    private String modulo;
    private String accion;
    private String descripcion;
    private Timestamp fecha;

    public Auditoria() {
    }

    public Auditoria(int idAuditoria, int idUsuario, String nombreUsuario,
            String modulo, String accion, String descripcion, Timestamp fecha) {
        this.idAuditoria = idAuditoria;
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.modulo = modulo;
        this.accion = accion;
        this.descripcion = descripcion;
        this.fecha = fecha;
    }

    public int getIdAuditoria() {
        return idAuditoria;
    }

    public void setIdAuditoria(int idAuditoria) {
        this.idAuditoria = idAuditoria;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

}
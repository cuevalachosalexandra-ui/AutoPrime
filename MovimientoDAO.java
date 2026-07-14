/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

/**
 *
 * @author ALEXANDRA
 */
import com.autoprime.util.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class MovimientoDAO {

    public void registrarMovimiento(
            int idRepuesto,
            String tipo,
            int cantidad){

        try{

            Connection cn =
            ConexionBD.getConexion();

            String sql =
            "INSERT INTO movimientos(id_repuesto,tipo,cantidad) VALUES(?,?,?)";

            PreparedStatement ps =
            cn.prepareStatement(sql);

            ps.setInt(1,idRepuesto);
            ps.setString(2,tipo);
            ps.setInt(3,cantidad);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
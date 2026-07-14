/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

/**
 *
 * @author ALEXANDRA
 */

import com.autoprime.model.Entrada;
import com.autoprime.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EntradaDAO {


    // GUARDAR ENTRADA
    public boolean guardar(Entrada e) {

        Connection cn = null;

        try {

            cn = ConexionBD.getConexion();

            cn.setAutoCommit(false);


            String sql =
            "INSERT INTO entradas(id_repuesto, cantidad, proveedor, fecha, id_usuario) VALUES(?,?,?,?,?)";


            PreparedStatement ps =
            cn.prepareStatement(sql);


            ps.setInt(1, e.getIdRepuesto());
            ps.setInt(2, e.getCantidad());
            ps.setString(3, e.getProveedor());
            ps.setString(4, e.getFecha());
            ps.setInt(5, e.getIdUsuario());


            int filas =
            ps.executeUpdate();



            // ACTUALIZAR STOCK DEL REPUESTO

            String sqlStock =
            "UPDATE repuestos SET stock = stock + ? WHERE id=?";


            PreparedStatement ps2 =
            cn.prepareStatement(sqlStock);


            ps2.setInt(1, e.getCantidad());
            ps2.setInt(2, e.getIdRepuesto());


            ps2.executeUpdate();



            cn.commit();


            ps.close();
            ps2.close();
            cn.close();


            return filas > 0;



        } catch(Exception ex){


            try {

                if(cn != null){
                    cn.rollback();
                }

            } catch(Exception rollback){

                rollback.printStackTrace();

            }


            ex.printStackTrace();

        }


        return false;

    }





    // TOTAL DE ENTRADAS
    public int totalEntradas() {


        int total = 0;


        try {


            Connection cn = ConexionBD.getConexion();


            String sql =
            "SELECT COUNT(*) AS total FROM entradas";


            PreparedStatement ps =
            cn.prepareStatement(sql);


            ResultSet rs =
            ps.executeQuery();



            if(rs.next()){

                total = rs.getInt("total");

            }



            rs.close();

            ps.close();

            cn.close();



        } catch(Exception e){

            e.printStackTrace();

        }



        return total;

    }


}
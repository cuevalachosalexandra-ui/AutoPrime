/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;
/**
 *
 * @author ALEXANDRA
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.autoprime.util.ConexionBD;
import com.autoprime.model.Salida;


public class SalidaDAO {


    // CONTAR SALIDAS
    public int totalSalidas() {

        int total = 0;

        String sql = "SELECT COUNT(*) AS total FROM salidas";


        try(
            Connection con = ConexionBD.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ){

            if(rs.next()){

                total = rs.getInt("total");

            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return total;

    }





    // REGISTRAR SALIDA
    public boolean registrar(Salida s){


        Connection con = null;


        try{


            con = ConexionBD.getConexion();

            con.setAutoCommit(false);



            // VERIFICAR STOCK ACTUAL

            String verificarStock =
            "SELECT stock FROM repuestos WHERE id=?";


            PreparedStatement psStock =
            con.prepareStatement(verificarStock);


            psStock.setInt(1, s.getRepuestoId());


            ResultSet rs =
            psStock.executeQuery();



            if(!rs.next()){

                con.rollback();

                return false;

            }



            int stockActual =
            rs.getInt("stock");



            // EVITAR STOCK NEGATIVO

            if(stockActual <= 0 || s.getCantidad() > stockActual){


                con.rollback();

                return false;

            }




            // REGISTRAR SALIDA


            String sql =
            "INSERT INTO salidas(repuesto_id,cantidad,fecha,id_usuario)"
            + " VALUES(?,?,?,?)";



            PreparedStatement ps =
            con.prepareStatement(sql);



            ps.setInt(1, s.getRepuestoId());

            ps.setInt(2, s.getCantidad());

            ps.setTimestamp(3, s.getFecha());

            ps.setInt(4, s.getIdUsuario());



            int filas =
            ps.executeUpdate();




            // DESCONTAR STOCK


            String sqlStock =
            "UPDATE repuestos "
            + "SET stock = stock - ? "
            + "WHERE id=? AND stock >= ?";



            PreparedStatement ps2 =
            con.prepareStatement(sqlStock);



            ps2.setInt(1, s.getCantidad());

            ps2.setInt(2, s.getRepuestoId());

            ps2.setInt(3, s.getCantidad());



            int actualizado =
            ps2.executeUpdate();




            if(actualizado == 0){


                con.rollback();

                return false;

            }




            con.commit();



            ps.close();

            ps2.close();

            psStock.close();

            con.close();



            return filas > 0;



        }catch(Exception e){


            try{

                if(con != null){

                    con.rollback();

                }

            }catch(Exception ex){

                ex.printStackTrace();

            }


            e.printStackTrace();

        }



        return false;

    }





    // DESCONTAR STOCK MANUAL

    public boolean descontarStock(int repuestoId,int cantidad){



        Connection con = null;



        try{


            con = ConexionBD.getConexion();



            String verificar =
            "SELECT stock FROM repuestos WHERE id=?";



            PreparedStatement ps =
            con.prepareStatement(verificar);



            ps.setInt(1,repuestoId);



            ResultSet rs =
            ps.executeQuery();




            if(rs.next()){



                int stock =
                rs.getInt("stock");




                if(stock <= 0 || cantidad > stock){


                    return false;

                }





                String sql =
                "UPDATE repuestos "
                + "SET stock = stock - ? "
                + "WHERE id=? AND stock >= ?";



                PreparedStatement ps2 =
                con.prepareStatement(sql);



                ps2.setInt(1,cantidad);

                ps2.setInt(2,repuestoId);

                ps2.setInt(3,cantidad);



                int filas =
                ps2.executeUpdate();



                ps2.close();



                return filas > 0;



            }



        }catch(Exception e){

            e.printStackTrace();

        }



        return false;

    }


}
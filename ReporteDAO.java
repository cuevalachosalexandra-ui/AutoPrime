/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

/**
 *
 * @author ALEXANDRA
 */

import com.autoprime.model.ReporteMovimiento;
import com.autoprime.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ReporteDAO {


    // =====================================================
    // LISTAR TODOS LOS MOVIMIENTOS (CARGA AUTOMÁTICA)
    // =====================================================

    public List<ReporteMovimiento> listarTodosMovimientos(){

        List<ReporteMovimiento> lista = new ArrayList<>();


        String sql = """

        SELECT 
            e.fecha,
            'Entrada' AS tipo,
            r.nombre AS repuesto,
            e.cantidad,
            u.nombre AS usuario,
            e.proveedor

        FROM entradas e

        INNER JOIN repuestos r
        ON e.id_repuesto = r.id

        LEFT JOIN usuarios u
        ON e.id_usuario = u.id



        UNION ALL



        SELECT 
            s.fecha,
            'Salida' AS tipo,
            r.nombre AS repuesto,
            s.cantidad,
            u.nombre AS usuario,
            '' AS proveedor

        FROM salidas s

        INNER JOIN repuestos r
        ON s.repuesto_id = r.id

        LEFT JOIN usuarios u
        ON s.id_usuario = u.id



        ORDER BY fecha DESC

        """;


        try(
            Connection cn = ConexionBD.getConexion();

            PreparedStatement ps =
            cn.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery()
        ){


            while(rs.next()){


                ReporteMovimiento rm =
                new ReporteMovimiento();


                rm.setFecha(
                    rs.getString("fecha")
                );


                rm.setTipo(
                    rs.getString("tipo")
                );


                rm.setRepuesto(
                    rs.getString("repuesto")
                );


                rm.setCantidad(
                    rs.getInt("cantidad")
                );


                rm.setUsuario(
                    rs.getString("usuario")
                );


                // Si tu modelo todavía no tiene proveedor,
                // este campo se agregará después.

                lista.add(rm);

            }


        }catch(Exception e){

            e.printStackTrace();

        }


        return lista;

    }





    // =====================================================
    // BUSCAR MOVIMIENTOS POR FECHA
    // =====================================================

    public List<ReporteMovimiento> listarMovimientos(
            String fechaInicio,
            String fechaFin) {


        List<ReporteMovimiento> lista =
        new ArrayList<>();


        String sql = """

        SELECT 
            e.fecha,
            'Entrada' AS tipo,
            r.nombre AS repuesto,
            e.cantidad,
            u.nombre AS usuario

        FROM entradas e

        INNER JOIN repuestos r
        ON e.id_repuesto = r.id

        LEFT JOIN usuarios u
        ON e.id_usuario = u.id

        WHERE e.fecha BETWEEN ? AND ?



        UNION ALL



        SELECT 
            s.fecha,
            'Salida' AS tipo,
            r.nombre AS repuesto,
            s.cantidad,
            u.nombre AS usuario

        FROM salidas s

        INNER JOIN repuestos r
        ON s.repuesto_id = r.id

        LEFT JOIN usuarios u
        ON s.id_usuario = u.id

        WHERE DATE(s.fecha) BETWEEN ? AND ?



        ORDER BY fecha DESC

        """;



        try(
            Connection cn = ConexionBD.getConexion();

            PreparedStatement ps =
            cn.prepareStatement(sql)

        ){


            ps.setString(1, fechaInicio);
            ps.setString(2, fechaFin);

            ps.setString(3, fechaInicio);
            ps.setString(4, fechaFin);



            ResultSet rs =
            ps.executeQuery();



            while(rs.next()){


                ReporteMovimiento rm =
                new ReporteMovimiento();


                rm.setFecha(
                    rs.getString("fecha")
                );


                rm.setTipo(
                    rs.getString("tipo")
                );


                rm.setRepuesto(
                    rs.getString("repuesto")
                );


                rm.setCantidad(
                    rs.getInt("cantidad")
                );


                rm.setUsuario(
                    rs.getString("usuario")
                );


                lista.add(rm);

            }


        }catch(Exception e){

            e.printStackTrace();

        }



        return lista;

    }




    // =====================================================
    // TOTAL DE MOVIMIENTOS
    // =====================================================

    public int totalMovimientos(){

        int total = 0;


        try{

            Connection cn =
            ConexionBD.getConexion();


            String sql =
            """
            SELECT 
            (SELECT COUNT(*) FROM entradas)
            +
            (SELECT COUNT(*) FROM salidas)
            AS total
            """;


            PreparedStatement ps =
            cn.prepareStatement(sql);


            ResultSet rs =
            ps.executeQuery();



            if(rs.next()){

                total =
                rs.getInt("total");

            }


            rs.close();
            ps.close();
            cn.close();


        }catch(Exception e){

            e.printStackTrace();

        }


        return total;

    }



}
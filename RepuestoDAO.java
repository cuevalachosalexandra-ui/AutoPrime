/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

import com.autoprime.model.Repuesto;
import com.autoprime.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class RepuestoDAO {


    // LISTAR
    public List<Repuesto> listar() {

        List<Repuesto> lista = new ArrayList<>();

        try {

            Connection cn = ConexionBD.getConexion();

            String sql = "SELECT * FROM repuestos";

            PreparedStatement ps = cn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();


            while(rs.next()) {

                Repuesto r = new Repuesto();

                r.setId(rs.getInt("id"));
                r.setNombre(rs.getString("nombre"));
                r.setMarca(rs.getString("marca"));
                r.setPrecio(rs.getDouble("precio"));
                r.setStock(rs.getInt("stock"));


                lista.add(r);

            }


            rs.close();
            ps.close();
            cn.close();


        } catch(Exception e) {

            e.printStackTrace();

        }


        return lista;

    }


    // BUSCAR POR ID
    public Repuesto buscarPorId(int id) {


        Repuesto r = null;


        try {


            Connection cn = ConexionBD.getConexion();


            String sql =
            "SELECT * FROM repuestos WHERE id=?";


            PreparedStatement ps =
            cn.prepareStatement(sql);


            ps.setInt(1,id);


            ResultSet rs =
            ps.executeQuery();



            if(rs.next()) {


                r = new Repuesto();


                r.setId(rs.getInt("id"));
                r.setNombre(rs.getString("nombre"));
                r.setMarca(rs.getString("marca"));
                r.setPrecio(rs.getDouble("precio"));
                r.setStock(rs.getInt("stock"));


            }


            rs.close();
            ps.close();
            cn.close();



        } catch(Exception e){

            e.printStackTrace();

        }


        return r;

    }

    // GUARDAR
    public boolean guardar(Repuesto r) {


        try {


            Connection cn =
            ConexionBD.getConexion();



            String sql =
            "INSERT INTO repuestos(nombre,marca,precio,stock) VALUES(?,?,?,?)";



            PreparedStatement ps =
            cn.prepareStatement(sql);



            ps.setString(1,r.getNombre());

            ps.setString(2,r.getMarca());

            ps.setDouble(3,r.getPrecio());

            ps.setInt(4,r.getStock());



            int filas =
            ps.executeUpdate();



            ps.close();

            cn.close();



            return filas > 0;



        } catch(Exception e){


            e.printStackTrace();


        }


        return false;


    }


    // ACTUALIZAR
    public boolean actualizar(Repuesto r) {


        try {


            Connection cn =
            ConexionBD.getConexion();



            String sql =
            "UPDATE repuestos SET nombre=?, marca=?, precio=?, stock=? WHERE id=?";



            PreparedStatement ps =
            cn.prepareStatement(sql);



            ps.setString(1,r.getNombre());

            ps.setString(2,r.getMarca());

            ps.setDouble(3,r.getPrecio());

            ps.setInt(4,r.getStock());

            ps.setInt(5,r.getId());



            int filas =
            ps.executeUpdate();



            ps.close();

            cn.close();



            return filas > 0;



        } catch(Exception e){


            e.printStackTrace();


        }


        return false;

    }



    // ELIMINAR
    public boolean eliminar(int id) {


        try {


            Connection cn =
            ConexionBD.getConexion();



            String sql =
            "DELETE FROM repuestos WHERE id=?";



            PreparedStatement ps =
            cn.prepareStatement(sql);



            ps.setInt(1,id);



            int filas =
            ps.executeUpdate();



            ps.close();

            cn.close();



            return filas > 0;



        } catch(Exception e){


            e.printStackTrace();


        }


        return false;

    }


    // TOTAL REPUESTOS
    public int totalRepuestos() {


        int total = 0;



        try {

            Connection cn =
            ConexionBD.getConexion();

            String sql =
            "SELECT COUNT(*) AS total FROM repuestos";

            PreparedStatement ps =
            cn.prepareStatement(sql);


            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                total =
                rs.getInt("total");

            }

            rs.close();

            ps.close();

            cn.close();


        } catch(Exception e){


            e.printStackTrace();

        }

        return total;

    }



    // STOCK BAJO
public int stockBajo() {

    int total = 0;

    try {

        Connection cn = ConexionBD.getConexion();

        String sql = "SELECT COUNT(*) AS total "
                   + "FROM repuestos "
                   + "WHERE stock <= stock_minimo";

        PreparedStatement ps = cn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            total = rs.getInt("total");
        }

        rs.close();
        ps.close();
        cn.close();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return total;
}

    
    // BUSCAR POR NOMBRE O MARCA
    public List<Repuesto> buscar(String texto) {


        List<Repuesto> lista =
        new ArrayList<>();

        try {


            Connection cn =
            ConexionBD.getConexion();

            String sql =
            "SELECT * FROM repuestos "
            + "WHERE nombre LIKE ? OR marca LIKE ?";


            PreparedStatement ps =
            cn.prepareStatement(sql);


            ps.setString(1,"%"+texto+"%");

            ps.setString(2,"%"+texto+"%");


            ResultSet rs =
            ps.executeQuery();



            while(rs.next()) {

                Repuesto r =
                new Repuesto();

                r.setId(rs.getInt("id"));

                r.setNombre(rs.getString("nombre"));

                r.setMarca(rs.getString("marca"));

                r.setPrecio(rs.getDouble("precio"));

                r.setStock(rs.getInt("stock"));

                lista.add(r);

            }

            rs.close();

            ps.close();

            cn.close();



        } catch(Exception e){


            e.printStackTrace();


        }

        return lista;
    }
    
    public List<Repuesto> listarStockBajo() {

    List<Repuesto> lista = new ArrayList<>();

    String sql = "SELECT * FROM repuestos WHERE stock <= stock_minimo ORDER BY stock ASC";

    try (Connection con = ConexionBD.getConexion();
       
            PreparedStatement ps = con.prepareStatement(sql);
         
            ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {

            Repuesto r = new Repuesto();

            r.setId(rs.getInt("id"));
            
            r.setNombre(rs.getString("nombre"));
            
            r.setMarca(rs.getString("marca"));
            
            r.setPrecio(rs.getDouble("precio"));
            
            r.setStock(rs.getInt("stock"));
            
            r.setStockMinimo(rs.getInt("stock_minimo"));
            
            r.setPrecio(rs.getDouble("id_proveedor"));

            lista.add(r);
        }

    } catch (Exception e) {

        e.printStackTrace();

    }

    return lista;

}

}
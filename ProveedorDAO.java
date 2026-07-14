/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

/**
 *
 * @author ALEXANDRA
 */

import com.autoprime.model.Proveedor;
import com.autoprime.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO {

    // LISTAR
    public List<Proveedor> listar() {

        List<Proveedor> lista = new ArrayList<>();

        try {

            Connection cn = ConexionBD.getConexion();

            String sql = "SELECT * FROM proveedores";

            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Proveedor p = new Proveedor();

                p.setId(rs.getInt("id"));
                p.setRuc(rs.getString("ruc"));
                p.setRazonSocial(rs.getString("razon_social"));
                p.setContacto(rs.getString("contacto"));
                p.setCargoContacto(rs.getString("cargo_contacto"));
                p.setTelefono(rs.getString("telefono"));
                p.setCorreo(rs.getString("correo"));
                p.setDireccion(rs.getString("direccion"));
                p.setEstado(rs.getString("estado"));

                lista.add(p);
            }

            rs.close();
            ps.close();
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }


    // BUSCAR POR ID
    public Proveedor buscarPorId(int id) {

        Proveedor p = null;

        try {

            Connection cn = ConexionBD.getConexion();

            String sql = "SELECT * FROM proveedores WHERE id=?";

            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                p = new Proveedor();

                p.setId(rs.getInt("id"));
                p.setRuc(rs.getString("ruc"));
                p.setRazonSocial(rs.getString("razon_social"));
                p.setContacto(rs.getString("contacto"));
                p.setCargoContacto(rs.getString("cargo_contacto"));
                p.setTelefono(rs.getString("telefono"));
                p.setCorreo(rs.getString("correo"));
                p.setDireccion(rs.getString("direccion"));
                p.setEstado(rs.getString("estado"));
            }

            rs.close();
            ps.close();
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }


    // GUARDAR
    public boolean guardar(Proveedor p) {

        try {

            Connection cn = ConexionBD.getConexion();

            String sql =
            "INSERT INTO proveedores(ruc, razon_social, contacto, cargo_contacto, telefono, correo, direccion, estado) VALUES(?,?,?,?,?,?,?,?)";


            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setString(1, p.getRuc());
            ps.setString(2, p.getRazonSocial());
            ps.setString(3, p.getContacto());
            ps.setString(4, p.getCargoContacto());
            ps.setString(5, p.getTelefono());
            ps.setString(6, p.getCorreo());
            ps.setString(7, p.getDireccion());
            ps.setString(8, p.getEstado());


            int filas = ps.executeUpdate();

            ps.close();
            cn.close();

            return filas > 0;


        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }



    // ACTUALIZAR
    public boolean actualizar(Proveedor p) {

        try {

            Connection cn = ConexionBD.getConexion();


            String sql =
            "UPDATE proveedores SET ruc=?, razon_social=?, contacto=?, cargo_contacto=?, telefono=?, correo=?, direccion=?, estado=? WHERE id=?";


            PreparedStatement ps = cn.prepareStatement(sql);


            ps.setString(1, p.getRuc());
            ps.setString(2, p.getRazonSocial());
            ps.setString(3, p.getContacto());
            ps.setString(4, p.getCargoContacto());
            ps.setString(5, p.getTelefono());
            ps.setString(6, p.getCorreo());
            ps.setString(7, p.getDireccion());
            ps.setString(8, p.getEstado());
            ps.setInt(9, p.getId());


            int filas = ps.executeUpdate();


            ps.close();
            cn.close();


            return filas > 0;


        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }



    // ELIMINAR
    public boolean eliminar(int id) {

        try {

            Connection cn = ConexionBD.getConexion();

            String sql = "DELETE FROM proveedores WHERE id=?";


            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1, id);


            int filas = ps.executeUpdate();


            ps.close();
            cn.close();


            return filas > 0;


        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }



    // BUSCAR
    public List<Proveedor> buscar(String texto) {

        List<Proveedor> lista = new ArrayList<>();

        try {

            Connection cn = ConexionBD.getConexion();


            String sql =
            "SELECT * FROM proveedores WHERE ruc LIKE ? OR razon_social LIKE ? OR contacto LIKE ?";


            PreparedStatement ps = cn.prepareStatement(sql);


            ps.setString(1, "%" + texto + "%");
            ps.setString(2, "%" + texto + "%");
            ps.setString(3, "%" + texto + "%");


            ResultSet rs = ps.executeQuery();


            while (rs.next()) {

                Proveedor p = new Proveedor();


                p.setId(rs.getInt("id"));
                p.setRuc(rs.getString("ruc"));
                p.setRazonSocial(rs.getString("razon_social"));
                p.setContacto(rs.getString("contacto"));
                p.setCargoContacto(rs.getString("cargo_contacto"));
                p.setTelefono(rs.getString("telefono"));
                p.setCorreo(rs.getString("correo"));
                p.setDireccion(rs.getString("direccion"));
                p.setEstado(rs.getString("estado"));


                lista.add(p);
            }


            rs.close();
            ps.close();
            cn.close();


        } catch (Exception e) {
            e.printStackTrace();
        }


        return lista;
    }

}
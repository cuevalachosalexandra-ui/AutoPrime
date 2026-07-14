/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

/**
 *
 * @author ALEXANDRA
 */
import com.autoprime.model.Usuario;
import com.autoprime.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public List<Usuario> listar() {
        List<Usuario> lista = new ArrayList<>();

        try {
            Connection cn = ConexionBD.getConexion();
            String sql = "SELECT * FROM usuarios";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }

            rs.close();
            ps.close();
            cn.close();

        } catch (Exception e) {
    System.out.println("ERROR AL GUARDAR USUARIO");
    e.printStackTrace();
}

        return lista;
    }

    public Usuario buscarPorId(int id) {
        Usuario u = null;

        try {
            Connection cn = ConexionBD.getConexion();
            String sql = "SELECT * FROM usuarios WHERE id=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setRol(rs.getString("rol"));
            }

            rs.close();
            ps.close();
            cn.close();

        } catch (Exception e) {
    System.out.println("ERROR AL GUARDAR USUARIO");
    e.printStackTrace();
        }

        return u;
    }

    public boolean guardar(Usuario u) {
        try {
            Connection cn = ConexionBD.getConexion();

            String sql = "INSERT INTO usuarios(nombre,usuario,clave,rol) VALUES(?,?,?,?)";

            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getUsuario());
            ps.setString(3, u.getClave());
            ps.setString(4, u.getRol());

            int filas = ps.executeUpdate();

            ps.close();
            cn.close();

            return filas > 0;

        } catch (Exception e) {
    System.out.println("ERROR AL GUARDAR USUARIO");
    e.printStackTrace();
        }

        return false;
    }

    public boolean actualizar(Usuario u) {
        try {
            Connection cn = ConexionBD.getConexion();

            String sql = "UPDATE usuarios SET nombre=?, usuario=?, clave=?, rol=? WHERE id=?";

            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getUsuario());
            ps.setString(3, u.getClave());
            ps.setString(4, u.getRol());
            ps.setInt(5, u.getId());

            int filas = ps.executeUpdate();

            ps.close();
            cn.close();

            return filas > 0;

        } catch (Exception e) {
    System.out.println("ERROR AL GUARDAR USUARIO");
    e.printStackTrace();
        }

        return false;
    }

    public boolean eliminar(int id) {
        try {
            Connection cn = ConexionBD.getConexion();

            String sql = "DELETE FROM usuarios WHERE id=?";

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

    // LOGIN
    public Usuario login(String usuario, String clave) {
        Usuario u = null;

        try {
            Connection cn = ConexionBD.getConexion();

            String sql = "SELECT * FROM usuarios WHERE usuario=? AND clave=?";

            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, clave);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setRol(rs.getString("rol"));
            }

            rs.close();
            ps.close();
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
}
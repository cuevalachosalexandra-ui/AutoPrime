/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

/**
 *
 * @author ALEXANDRA
 */
import com.autoprime.model.Auditoria;
import com.autoprime.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AuditoriaDAO {

    // Registrar auditoría
    public boolean registrar(Auditoria a) {

        try {

            Connection cn = ConexionBD.getConexion();

            String sql = "INSERT INTO auditoria(id_usuario, modulo, accion, descripcion) VALUES(?,?,?,?)";

            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1, a.getIdUsuario());
            ps.setString(2, a.getModulo());
            ps.setString(3, a.getAccion());
            ps.setString(4, a.getDescripcion());

            int filas = ps.executeUpdate();

            ps.close();
            cn.close();

            return filas > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Listar auditorías
    public List<Auditoria> listar() {

        List<Auditoria> lista = new ArrayList<>();

        try {

            Connection cn = ConexionBD.getConexion();

            String sql = "SELECT a.id_auditoria, "
                    + "u.nombre, "
                    + "a.modulo, "
                    + "a.accion, "
                    + "a.descripcion, "
                    + "a.fecha "
                    + "FROM auditoria a "
                    + "INNER JOIN usuarios u ON a.id_usuario = u.id "
                    + "ORDER BY a.fecha DESC";

            PreparedStatement ps = cn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Auditoria a = new Auditoria();

                a.setIdAuditoria(rs.getInt("id_auditoria"));
                a.setNombreUsuario(rs.getString("nombre"));
                a.setModulo(rs.getString("modulo"));
                a.setAccion(rs.getString("accion"));
                a.setDescripcion(rs.getString("descripcion"));
                a.setFecha(rs.getTimestamp("fecha"));

                lista.add(a);
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
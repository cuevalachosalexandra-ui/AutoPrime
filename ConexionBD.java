/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.util;

/**
 *
 * @author ALEXANDRA
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {

    private static final String URL =
            "jdbc:mysql://localhost:3306/autoprime?useSSL=false&serverTimezone=UTC";

    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConexion() {

        Connection cn = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            cn = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD);

            System.out.println("Conexion exitosa");

        } catch (Exception e) {

            System.out.println("Error conexion");

            e.printStackTrace();
        }

        return cn;
    }
}
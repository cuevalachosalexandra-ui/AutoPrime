/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.controller;

/**
 *
 * @author ALEXANDRA/**
 
 */
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.autoprime.dao.UsuarioDAO;
import com.autoprime.model.Usuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String usuario =
                request.getParameter("usuario");

        String clave =
                request.getParameter("clave");

        UsuarioDAO dao = new UsuarioDAO();

        Usuario u = dao.login(usuario, clave);

        if (u != null) {

            HttpSession sesion =
                    request.getSession();

            sesion.setAttribute(
                    "usuario",
                    u);

            response.sendRedirect(
                    "dashboard.jsp");

        } else {

            response.sendRedirect(
                    "login.jsp?error=1");
        }
    }
}

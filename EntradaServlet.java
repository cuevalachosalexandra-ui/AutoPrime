/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.controller;

/**
 *
 * @author ALEXANDRA
 */

import com.autoprime.dao.EntradaDAO;
import com.autoprime.model.Entrada;
import com.autoprime.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;


@WebServlet("/EntradaServlet")
public class EntradaServlet extends HttpServlet {


    EntradaDAO dao = new EntradaDAO();



    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {



        HttpSession session = request.getSession();


        Usuario usuario =
        (Usuario) session.getAttribute("usuario");



        if(usuario == null){

            response.sendRedirect("login.jsp");
            return;

        }



        Entrada e = new Entrada();



        e.setIdRepuesto(
            Integer.parseInt(
            request.getParameter("idRepuesto"))
        );



        e.setCantidad(
            Integer.parseInt(
            request.getParameter("cantidad"))
        );



        e.setProveedor(
            request.getParameter("proveedor")
        );



        e.setFecha(
            request.getParameter("fecha")
        );



        // GUARDAR USUARIO QUE REALIZÓ LA ENTRADA

        e.setIdUsuario(
            usuario.getId()
        );



        boolean resultado =
        dao.guardar(e);



        if(resultado){

    response.sendRedirect(
        request.getContextPath()
        + "/reportes/reportes.jsp?msg=entrada_ok"
    );

}else{

    response.sendRedirect(
        request.getContextPath()
        + "/movimientos/entrada.jsp?msg=error"
    );

}

    }

}
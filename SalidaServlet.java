/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.controller;

import com.autoprime.dao.SalidaDAO;
import com.autoprime.model.Salida;
import com.autoprime.model.Usuario;

import java.io.IOException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/SalidaServlet")
public class SalidaServlet extends HttpServlet {


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        try {

            HttpSession session = request.getSession();

            Usuario usuario =
            (Usuario) session.getAttribute("usuario");

            if(usuario == null){

                response.sendRedirect("login.jsp");
                return;

            }

            int repuestoId =
            Integer.parseInt(
            request.getParameter("repuestoId"));

            int cantidad =
            Integer.parseInt(
            request.getParameter("cantidad"));
            
              if(cantidad <= 0){

                response.sendRedirect(
                request.getContextPath()
                + "/movimientos/salida.jsp?msg=cantidad_invalida"
                );

                return;
            }



            Salida s = new Salida();

            s.setRepuestoId(repuestoId);
            s.setCantidad(cantidad);
            s.setFecha(
            new Timestamp(
            System.currentTimeMillis())
            );


            // USUARIO QUE REALIZA LA SALIDA

            s.setIdUsuario(
            usuario.getId()
            );

            SalidaDAO dao =
            new SalidaDAO();

            boolean resultado =
            dao.registrar(s);

            if(resultado){

    response.sendRedirect(
    request.getContextPath()
    + "/reportes/reportes.jsp?msg=salida_correcta"
    );

}
            
            else{
                response.sendRedirect(
                request.getContextPath()
                + "/movimientos/salida.jsp?msg=stock_insuficiente"
                );
            }


        } catch(Exception e){

            e.printStackTrace();

            response.sendRedirect(
            request.getContextPath()
            + "/movimientos/salida.jsp?msg=error_salida"
            );
        }

    }

}
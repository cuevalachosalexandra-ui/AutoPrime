/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.controller;

/**
 *
 * @author ALEXANDRA
 */
import com.autoprime.dao.ChatbotDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ChatbotServlet")
public class ChatbotServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String mensaje = request.getParameter("mensaje");

        ChatbotDAO dao = new ChatbotDAO();

        String respuesta = dao.responder(mensaje);

        response.getWriter().print(respuesta);
    }
}
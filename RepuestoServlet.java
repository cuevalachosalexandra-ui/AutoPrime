/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.controller;

import com.autoprime.dao.RepuestoDAO;
import com.autoprime.model.Repuesto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/RepuestoServlet")
public class RepuestoServlet extends HttpServlet {

    private final RepuestoDAO dao = new RepuestoDAO();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null || accion.trim().isEmpty()) {
            accion = "listar";
        }

        switch (accion) {

            case "listar":

                request.setAttribute("lista", dao.listar());

                request.getRequestDispatcher("/repuestos/listar.jsp")
                        .forward(request, response);

                break;


            case "buscar":

                String texto = request.getParameter("texto");

                if (texto == null || texto.trim().isEmpty()) {

                    request.setAttribute("lista", dao.listar());

                } else {

                    request.setAttribute("lista", dao.buscar(texto));

                }

                request.getRequestDispatcher("/repuestos/listar.jsp")
                        .forward(request, response);

                break;


            case "eliminar":

                int idEliminar = Integer.parseInt(
                        request.getParameter("id")
                );

                dao.eliminar(idEliminar);

                response.sendRedirect(
        request.getContextPath()
        + "/repuestos/listar.jsp?msg=eliminado"
);

                break;


            default:

                response.sendRedirect(
                        request.getContextPath()
                        + "/RepuestoServlet?accion=listar"
                );

                break;
        }

    }


    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        String accion = request.getParameter("accion");


        if (accion == null || accion.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/RepuestoServlet?accion=listar"
            );

            return;
        }


        switch (accion) {


            case "guardar":


                Repuesto nuevo = new Repuesto();


                nuevo.setNombre(
                        request.getParameter("nombre")
                );

                nuevo.setMarca(
                        request.getParameter("marca")
                );

                nuevo.setPrecio(
                        Double.parseDouble(
                                request.getParameter("precio")
                        )
                );

                nuevo.setStock(
                        Integer.parseInt(
                                request.getParameter("stock")
                        )
                );


                dao.guardar(nuevo);


                response.sendRedirect(
        request.getContextPath()
        + "/repuestos/listar.jsp?msg=registrado correctamente"
);


                break;



            case "actualizar":


                Repuesto r = new Repuesto();


                r.setId(
                        Integer.parseInt(
                                request.getParameter("id")
                        )
                );


                r.setNombre(
                        request.getParameter("nombre")
                );


                r.setMarca(
                        request.getParameter("marca")
                );


                r.setPrecio(
                        Double.parseDouble(
                                request.getParameter("precio")
                        )
                );


                r.setStock(
                        Integer.parseInt(
                                request.getParameter("stock")
                        )
                );


                dao.actualizar(r);


                response.sendRedirect(
        request.getContextPath()
        + "/repuestos/listar.jsp?msg=actualizado"
);

                break;



            default:


                response.sendRedirect(
                        request.getContextPath()
                        + "/RepuestoServlet?accion=listar"
                );


                break;

        }

    }

}

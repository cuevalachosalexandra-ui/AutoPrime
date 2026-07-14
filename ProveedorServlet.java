/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.controller;

import com.autoprime.dao.ProveedorDAO;
import com.autoprime.model.Proveedor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/ProveedorServlet")
public class ProveedorServlet extends HttpServlet {


    ProveedorDAO dao = new ProveedorDAO();



    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {


        String accion = request.getParameter("accion");


        // GUARDAR PROVEEDOR
       

        if ("guardar".equals(accion)) {


            Proveedor p = new Proveedor();


            p.setRuc(request.getParameter("ruc"));
            p.setRazonSocial(request.getParameter("razonSocial"));
            p.setContacto(request.getParameter("contacto"));
            p.setCargoContacto(request.getParameter("cargoContacto"));
            p.setTelefono(request.getParameter("telefono"));
            p.setCorreo(request.getParameter("correo"));
            p.setDireccion(request.getParameter("direccion"));
            p.setEstado(request.getParameter("estado"));



            dao.guardar(p);



            response.sendRedirect(
                    request.getContextPath()
                    + "/proveedores/listar.jsp"
            );


            return;

        }


        // ACTUALIZAR PROVEEDOR
        

        if ("actualizar".equals(accion)) {


            Proveedor p = new Proveedor();



            p.setId(
                Integer.parseInt(
                    request.getParameter("id")
                )
            );


            p.setRuc(request.getParameter("ruc"));

            p.setRazonSocial(
                    request.getParameter("razonSocial")
            );


            p.setContacto(
                    request.getParameter("contacto")
            );


            p.setCargoContacto(
                    request.getParameter("cargoContacto")
            );


            p.setTelefono(
                    request.getParameter("telefono")
            );


            p.setCorreo(
                    request.getParameter("correo")
            );


            p.setDireccion(
                    request.getParameter("direccion")
            );


            p.setEstado(
                    request.getParameter("estado")
            );



            dao.actualizar(p);




            response.sendRedirect(
                    request.getContextPath()
                    + "/proveedores/listar.jsp?msg=Actualizado"
            );

            return;

        }


    }


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {



        String accion = request.getParameter("accion");


        // BUSCAR
      


        if ("buscar".equals(accion)) {


            String texto =
                    request.getParameter("texto");



            request.setAttribute(
                    "lista",
                    dao.buscar(texto)
            );



            request.getRequestDispatcher(
                    "/proveedores/listar.jsp"
            )
            .forward(request,response);



            return;

        }


        // LISTAR
        

        if ("listar".equals(accion)) {


            request.setAttribute(
                    "lista",
                    dao.listar()
            );



            request.getRequestDispatcher(
                    "/proveedores/listar.jsp"
            )
            .forward(request,response);



            return;

        }


        // EDITAR
       

        if ("editar".equals(accion)) {



            int id =
            Integer.parseInt(
                    request.getParameter("id")
            );



            Proveedor p =
                    dao.buscarPorId(id);



            request.setAttribute(
                    "proveedor",
                    p
            );



            request.getRequestDispatcher(
                    "/proveedores/editar.jsp"
            )
            .forward(request,response);



            return;

        }

        // ELIMINAR
        


        if ("eliminar".equals(accion)) {

    int id = Integer.parseInt(request.getParameter("id"));

    // Obtener datos antes de eliminar
    Proveedor proveedor = dao.buscarPorId(id);

    String nombre = proveedor.getRazonSocial();

    dao.eliminar(id);

    response.sendRedirect(
        request.getContextPath()
        + "/ProveedorServlet?accion=listar&msg=Se eliminó el proveedor "
        + java.net.URLEncoder.encode(nombre, "UTF-8")
        + " correctamente."
    );

    return;
}


    }



}
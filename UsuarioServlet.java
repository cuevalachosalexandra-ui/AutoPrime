/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.controller;


import com.autoprime.dao.UsuarioDAO;
import com.autoprime.dao.AuditoriaDAO;
import com.autoprime.model.Usuario;
import com.autoprime.model.Auditoria;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;



@WebServlet("/UsuarioServlet")

public class UsuarioServlet extends HttpServlet {


    UsuarioDAO dao = new UsuarioDAO();

    AuditoriaDAO auditoriaDAO = new AuditoriaDAO();



    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {



        String accion = request.getParameter("accion");


        Usuario usuarioSesion =
        (Usuario) request.getSession().getAttribute("usuario");




        // ==========================
        // REGISTRAR USUARIO
        // ==========================

        if("guardar".equals(accion)){


            Usuario u = new Usuario();


            u.setNombre(
                request.getParameter("nombre")
            );


            u.setUsuario(
                request.getParameter("usuario")
            );


            u.setClave(
                request.getParameter("clave")
            );


            u.setRol(
                request.getParameter("rol")
            );



            boolean resultado =
            dao.guardar(u);



            if(resultado && usuarioSesion != null){


                Auditoria a = new Auditoria();


                a.setIdUsuario(
                    usuarioSesion.getId()
                );


                a.setModulo("Usuarios");


                a.setAccion("INSERTAR");


                a.setDescripcion(
                    "Registró usuario: "
                    + u.getNombre()
                );


                auditoriaDAO.registrar(a);

            }



            response.sendRedirect(
                "usuarios/listar.jsp"
            );


        }





        // ==========================
        // ACTUALIZAR USUARIO
        // ==========================


        if("actualizar".equals(accion)){



            Usuario u = new Usuario();



            u.setId(
                Integer.parseInt(
                request.getParameter("id"))
            );



            u.setNombre(
                request.getParameter("nombre")
            );



            u.setUsuario(
                request.getParameter("usuario")
            );



            u.setClave(
                request.getParameter("clave")
            );



            u.setRol(
                request.getParameter("rol")
            );



            boolean resultado =
            dao.actualizar(u);




            if(resultado && usuarioSesion != null){


                Auditoria a =
                new Auditoria();



                a.setIdUsuario(
                    usuarioSesion.getId()
                );


                a.setModulo("Usuarios");


                a.setAccion("ACTUALIZAR");


                a.setDescripcion(
                    "Actualizó usuario: "
                    + u.getNombre()
                );


                auditoriaDAO.registrar(a);


            }



            response.sendRedirect(
                "usuarios/listar.jsp"
            );


        }


    }

    @Override
protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


    String accion = request.getParameter("accion");


    Usuario usuarioSesion =
    (Usuario)request.getSession()
    .getAttribute("usuario");



    // EDITAR

    if ("editar".equals(accion)) {

    int id = Integer.parseInt(request.getParameter("id"));

    Usuario usuario = dao.buscarPorId(id);

    request.setAttribute("usuarioEditar", usuario);

    request.getRequestDispatcher("/usuarios/editar.jsp")
           .forward(request, response);

    return;
}


    // ELIMINAR

    if("eliminar".equals(accion)){


        int id=Integer.parseInt(
            request.getParameter("id")
        );


        boolean eliminado =
        dao.eliminar(id);



        response.sendRedirect(
            "usuarios/listar.jsp"
        );


    }

}





    

}
<%-- 
    Document   : login
    Created on : 2 jun. 2026, 6:34:32 p. m.
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<title>Acceso al Inventario</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"href="assets/css/autoprime.css">

</head>

<body class="login-body">

<div class="login-overlay">

    <div class="login-container">

        <div class="login-logo">
            AutoPrime Perú
        </div>

        <h2>Acceso al Inventario</h2>

        <p class="login-subtitle">
            Sistema de gestión de repuestos automotrices
        </p>
        
        <%
String error = request.getParameter("error");

if(error != null){
%>

<div class="alert alert-danger text-center">
    Usuario o contraseña incorrectos
</div>

<%
}
%>
        <div class="text-center mb-4">
          <img src="assets/img/autoprime_logo.jpeg"
           width="90">
        </div>

        <form action="LoginServlet" method="post">

            <div class="mb-3">

                <label>Usuario</label>

                <input type="text"
                       name="usuario"
                       class="form-control">

            </div>

            <div class="mb-4">

                <label>Contraseña</label>

                <input type="password"
                       name="clave"
                       class="form-control">

            </div>

            <button class="btn btn-login">
                Ingresar al Sistema
            </button>

        </form>

        <div class="mt-4 text-center">

            <a href="index.jsp"
               class="volver">
                ← Volver al sitio web
            </a>

        </div>

    </div>

</div>

</body>

</html>
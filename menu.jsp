<%-- 
    Document   : menu
    Created on : 2 jun. 2026, 9:14:00 p. m.
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark navbar-autoprime">

    <div class="container">

        <a class="navbar-brand fw-bold"
           href="index.jsp">
            AutoPrime Perú
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarAutoPrime">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbarAutoPrime">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link"
                       href="index.jsp">
                        Inicio
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="nosotros.jsp">
                        Nosotros
                    </a>
                </li>

                <li class="nav-item">
                    <a class="btn btn-inventario ms-lg-3"
                       href="login.jsp">
                        Inventario
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
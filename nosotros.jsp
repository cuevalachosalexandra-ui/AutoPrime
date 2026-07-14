<%-- 
    Document   : nosotros
    Created on : 2 jun. 2026, 6:34:04 p. m.
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <title>Nosotros - AutoPrime Perú</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/autoprime.css">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>

        .banner-nosotros{
            background:linear-gradient(rgba(0,0,0,.65),rgba(0,0,0,.65)),
            url("https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&w=1600&q=80");
            background-size:cover;
            background-position:center;
            color:white;
            padding:90px 0;
        }

        .card-hover{
            transition:.3s;
            border:none;
            border-radius:15px;
        }

        .card-hover:hover{
            transform:translateY(-8px);
            box-shadow:0 .7rem 1.4rem rgba(0,0,0,.18);
        }

        .icono{
            font-size:45px;
            color:#0d6efd;
        }

        .cta{
            background:#0d6efd;
            color:black;
            border-radius:20px;
        }
        
        .whatsapp-float{
            position:fixed;
            bottom:25px;
            right:25px;
            z-index:9999;
            transition:.3s;
        }

        .whatsapp-float:hover{
            transform:scale(1.1);
        }

        .whatsapp-float img{
            width:65px;
            height:65px;
        }

    </style>

</head>

<body>

<jsp:include page="menu.jsp"/>

<section class="banner-nosotros">

    <div class="container text-center">

        <h1 class="display-4 fw-bold">Nosotros</h1>

        <p class="lead">
            Más que repuestos, ofrecemos confianza, calidad y soluciones para tu vehículo.
        </p>

    </div>

</section>

<div class="container py-5">

    <div class="row align-items-center">

        <div class="col-lg-6 mb-4">

            <img src="https://images.unsplash.com/photo-1555215695-3004980ad54e?auto=format&fit=crop&w=900&q=80"
                 class="img-fluid rounded shadow">

        </div>

        <div class="col-lg-6">

            <h2 class="fw-bold mb-4">
                ¿Quiénes Somos?
            </h2>

            <p class="text-secondary">
                AutoPrime Perú es una empresa especializada en la comercialización
                de repuestos automotrices para vehículos nacionales e importados.
                Nos enfocamos en ofrecer productos de calidad, atención personalizada
                y un servicio eficiente que satisfaga las necesidades de nuestros clientes.
            </p>

            <p class="text-secondary">
                Nuestro sistema de gestión permite administrar el inventario,
                controlar entradas y salidas de productos, registrar proveedores
                y optimizar los procesos de almacenamiento, garantizando un servicio
                rápido y confiable.
            </p>

        </div>

    </div>

</div>

<div class="container pb-5">

    <div class="row g-4">

        <div class="col-md-6">

            <div class="card card-hover shadow h-100">

                <div class="card-body text-center">

                    <i class="bi bi-bullseye icono"></i>

                    <h3 class="mt-3">Misión</h3>

                    <p>
                        Brindar repuestos automotrices de alta calidad mediante
                        una gestión eficiente del inventario, ofreciendo soluciones
                        rápidas y confiables para nuestros clientes.
                    </p>

                </div>

            </div>

        </div>

        <div class="col-md-6">

            <div class="card card-hover shadow h-100">

                <div class="card-body text-center">

                    <i class="bi bi-eye icono"></i>

                    <h3 class="mt-3">Visión</h3>

                    <p>
                        Ser una empresa referente en la distribución de repuestos
                        automotrices en el Perú, reconocida por la calidad,
                        innovación y excelencia en el servicio.
                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

<section class="bg-light py-5">

    <div class="container">

        <h2 class="text-center fw-bold mb-5 text-dark">
            Nuestros Valores
        </h2>

        <div class="row text-center g-4">

            <div class="col-md-3">

                <div class="card card-hover h-100">

                    <div class="card-body">

                        <i class="bi bi-award icono"></i>

                        <h5 class="mt-3">Calidad</h5>

                        <p>Productos certificados y de alto rendimiento.</p>

                    </div>

                </div>

            </div>

            <div class="col-md-3">

                <div class="card card-hover h-100">

                    <div class="card-body">

                        <i class="bi bi-shield-check icono"></i>

                        <h5 class="mt-3">Confianza</h5>

                        <p>Compromiso y transparencia con cada cliente.</p>

                    </div>

                </div>

            </div>

            <div class="col-md-3">

                <div class="card card-hover h-100">

                    <div class="card-body">

                        <i class="bi bi-people icono"></i>

                        <h5 class="mt-3">Trabajo en Equipo</h5>

                        <p>Colaboración para brindar un mejor servicio.</p>

                    </div>

                </div>

            </div>

            <div class="col-md-3">

                <div class="card card-hover h-100">

                    <div class="card-body">

                        <i class="bi bi-lightning-charge icono"></i>

                        <h5 class="mt-3">Innovación</h5>

                        <p>Mejora continua en nuestros procesos.</p>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

<section class="container py-5">

    <h2 class="text-center fw-bold mb-5">
        ¿Por qué elegir AutoPrime?
    </h2>

    <div class="row text-center g-4">

        <div class="col-md-4">

            <i class="bi bi-box-seam icono"></i>

            <h5 class="mt-3">Amplio Stock</h5>

            <p>Disponibilidad de repuestos para diversas marcas.</p>

        </div>

        <div class="col-md-4">

            <i class="bi bi-truck icono"></i>

            <h5 class="mt-3">Entrega Oportuna</h5>

            <p>Procesos organizados para una atención rápida.</p>

        </div>

        <div class="col-md-4">

            <i class="bi bi-person-check icono"></i>

            <h5 class="mt-3">Atención Personalizada</h5>

            <p>Asesoramiento para ayudarte a encontrar el repuesto ideal.</p>

        </div>

    </div>

</section>

<section class="container pb-5">

    <div class="cta p-5 text-center shadow">

        <h2 class="fw-bold">
            Tu vehículo merece lo mejor
        </h2>

    </div>
    

</section>

<!--BOTÓN DE WHATSAPP-->

<a href="https://wa.me/51903060991?text=Hola,%20AutoPrime%20Perú,%20quisiera%20obtener%20más%20información."
   class="whatsapp-float"
   target="_blank">

    <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg"
         alt="WhatsApp">

</a>

<!--FOOTER-->

<footer class="footer-autoprime mt-5">

    <div class="container">

        <div class="row text-center text-md-start">

            <div class="col-md-4 mb-4">

                <h4 class="fw-bold">
                    AutoPrime Perú
                </h4>

                <p>
                    Soluciones para la gestión y distribución de repuestos
                    automotrices con tecnología, organización y calidad.
                </p>

            </div>

            <div class="col-md-4 mb-4">

                <h5 class="fw-bold">
                    Accesos rápidos
                </h5>

                <p class="mb-1">
                    <a href="index.jsp" class="text-white text-decoration-none">
                        Inicio
                    </a>
                </p>

                <p class="mb-1">
                    <a href="nosotros.jsp" class="text-white text-decoration-none">
                        Nosotros
                    </a>
                </p>

                <p class="mb-1">
                    <a href="login.jsp" class="text-white text-decoration-none">
                        Inventario
                    </a>
                </p>

            </div>

            <div class="col-md-4 mb-4">

                <h5 class="fw-bold">
                    Contacto
                </h5>

                <p class="mb-1">
                    <i class="bi bi-geo-alt-fill"></i>
                    Lima - Perú
                </p>

                <p class="mb-1">
                    <i class="bi bi-envelope-fill"></i>
                    contacto@autoprimeperu.com
                </p>

                <p class="mb-1">
                    <i class="bi bi-telephone-fill"></i>
                    +51 903 060 991
                </p>

            </div>

        </div>

        <hr class="border-light">

        <div class="text-center">

            © 2026 AutoPrime Perú | Todos los derechos reservados.

        </div>

    </div>

</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="chatbot/chatbot.jsp"/>

<link rel="stylesheet" href="chatbot/chatbot.css">

<script src="chatbot/chatbot.js"></script>
</body>
</html>
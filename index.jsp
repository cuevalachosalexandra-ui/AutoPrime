<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>AutoPrime Perú</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link rel="stylesheet" href="assets/css/autoprime.css">
    <link rel="stylesheet" href="chatbot/chatbot.css">
    <style>

        /* WHATSAPP*/

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

        /*TARJETAS*/

        .feature-card{

            border:none;
            border-radius:15px;
            transition:.35s;
            overflow:hidden;
            height:100%;

        }

        .feature-card:hover{

            transform:translateY(-8px);
            box-shadow:0 15px 30px rgba(0,0,0,.15);

        }

        .feature-icon{

            font-size:55px;
            color:#0d6efd;

        }

        /* CTA*/

        .cta-section{

            background:linear-gradient(135deg,#0d6efd,#003f88);
            color:white;
            border-radius:20px;
            padding:55px;

        }

        .btn-cta{

            border-radius:30px;
            padding:12px 30px;
            font-weight:bold;

        }

    </style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-autoprime">

    <div class="container">

        <a class="navbar-brand fw-bold" href="index.jsp">
            AutoPrime Perú
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#menu">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="menu">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">
                        Inicio
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="nosotros.jsp">
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

<!-- HERO -->

<section class="hero">

    <div class="container">

        <h1 class="display-4 fw-bold">
            AutoPrime Perú
        </h1>

        <p class="lead mt-3">

            Soluciones integrales para la gestión y distribución
            de repuestos automotrices, optimizando el control del
            inventario y ofreciendo un servicio rápido, seguro y confiable.

        </p>

        <div class="mt-4">

            <a href="login.jsp"
               class="btn btn-principal btn-lg">

                Ingresar al Inventario

            </a>

        </div>

    </div>

</section>

<!-- PRESENTACIÓN -->

<section class="container py-5">

    <div class="row align-items-center g-5">

        <div class="col-lg-6">

            <img src="https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=900&q=80"
                 class="img-fluid rounded shadow">

        </div>

        <div class="col-lg-6">

            <h2 class="fw-bold mb-4">
                Bienvenido a AutoPrime Perú
            </h2>

            <p class="text-secondary">

                AutoPrime Perú es una empresa especializada en la
                comercialización y gestión de repuestos automotrices,
                ofreciendo soluciones modernas para el control del
                inventario, proveedores y movimientos de productos.

            </p>

            <p class="text-secondary">

                Nuestro compromiso es brindar una atención eficiente,
                productos de calidad y una gestión organizada que
                permita satisfacer las necesidades de nuestros clientes.

            </p>

            <a href="nosotros.jsp"
               class="btn btn-outline-primary">

                Conoce más

            </a>

        </div>

    </div>

</section>

<!--PRODUCTOS DESTACADOS-->

<section class="py-5 bg-light">

    <div class="container">

        <div class="text-center mb-5 text-dark" >

            <h2 class="fw-bold">
                Productos Destacados
            </h2>

            <p class="text-muted">
                Encuentra una amplia variedad de repuestos para mantener tu vehículo en óptimas condiciones.
            </p>

        </div>

        <div class="row g-4">

            <div class="col-md-6 col-lg-3">

                <div class="card feature-card shadow-sm">

                    <div class="card-body text-center">

                        <i class="bi bi-gear-fill feature-icon"></i>

                        <h5 class="mt-4">
                            Motor
                        </h5>

                        <p class="text-muted">
                            Filtros, bombas de agua, correas, bujías y otros componentes esenciales.
                        </p>

                    </div>

                </div>

            </div>

            <div class="col-md-6 col-lg-3">

                <div class="card feature-card shadow-sm">

                    <div class="card-body text-center">

                        <i class="bi bi-disc feature-icon"></i>

                        <h5 class="mt-4">
                            Sistema de Frenos
                        </h5>

                        <p class="text-muted">
                            Pastillas, discos, tambores y accesorios para una conducción segura.
                        </p>

                    </div>

                </div>

            </div>

            <div class="col-md-6 col-lg-3">

                <div class="card feature-card shadow-sm">

                    <div class="card-body text-center">

                        <i class="bi bi-lightning-charge-fill feature-icon"></i>

                        <h5 class="mt-4">
                            Sistema Eléctrico
                        </h5>

                        <p class="text-muted">
                            Baterías, alternadores, fusibles y componentes eléctricos.
                        </p>

                    </div>

                </div>

            </div>

            <div class="col-md-6 col-lg-3">

                <div class="card feature-card shadow-sm">

                    <div class="card-body text-center">

                        <i class="bi bi-car-front-fill feature-icon"></i>

                        <h5 class="mt-4">
                            Accesorios
                        </h5>

                        <p class="text-muted">
                            Espejos, faros, limpiaparabrisas y accesorios para diversas marcas.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

<!--¿POR QUÉ ELEGIRNOS?-->

<section class="container py-5">

    <div class="text-center mb-5">

        <h2 class="fw-bold">
            ¿Por qué elegir AutoPrime?
        </h2>

        <p class="text-muted">
            Nos enfocamos en brindar un servicio confiable, rápido y de calidad.
        </p>

    </div>

    <div class="row g-4">

        <div class="col-lg-4">

            <div class="card feature-card shadow-sm">

                <div class="card-body text-center">

                    <i class="bi bi-box-seam-fill feature-icon"></i>

                    <h4 class="mt-4">
                        Amplio Inventario
                    </h4>

                    <p class="text-muted">
                        Disponemos de una gran variedad de repuestos para diferentes marcas y modelos de vehículos.
                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-4">

            <div class="card feature-card shadow-sm">

                <div class="card-body text-center">

                    <i class="bi bi-shield-check feature-icon"></i>

                    <h4 class="mt-4">
                        Calidad Garantizada
                    </h4>

                    <p class="text-muted">
                        Trabajamos con productos confiables que cumplen con altos estándares de calidad.
                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-4">

            <div class="card feature-card shadow-sm">

                <div class="card-body text-center">

                    <i class="bi bi-headset feature-icon"></i>

                    <h4 class="mt-4">
                        Atención Personalizada
                    </h4>

                    <p class="text-muted">
                        Nuestro equipo está preparado para ayudarte a encontrar el repuesto que necesitas.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>

<!--ESTADÍSTICAS-->

<section class="py-5" style="background:#0d6efd; color:white;">

    <div class="container">

        <div class="row text-center">

            <div class="col-md-3 mb-4">

                <i class="bi bi-box-seam-fill display-4"></i>

                <h2 class="fw-bold mt-3">+200</h2>

                <p>Repuestos disponibles</p>

            </div>

            <div class="col-md-3 mb-4">

                <i class="bi bi-people-fill display-4"></i>

                <h2 class="fw-bold mt-3">+300</h2>

                <p>Clientes satisfechos</p>

            </div>

            <div class="col-md-3 mb-4">

                <i class="bi bi-truck display-4"></i>

                <h2 class="fw-bold mt-3">+50</h2>

                <p>Proveedores</p>

            </div>

            <div class="col-md-3 mb-4">

                <i class="bi bi-award-fill display-4"></i>

                <h2 class="fw-bold mt-3">100%</h2>

                <p>Compromiso</p>

            </div>

        </div>

    </div>

</section>


<!--MARCAS-->

<section class="container py-5">

    <div class="text-center mb-5">

        <h2 class="fw-bold">
            Marcas con las que trabajamos
        </h2>

        <p class="text-muted">
            Repuestos compatibles con las principales marcas automotrices.
        </p>

    </div>

    <div class="row text-center g-4">

        <div class="col-6 col-md-2">
            <div class="card shadow-sm border-0 py-4 feature-card">
                <h5 class="mb-0">Toyota</h5>
            </div>
        </div>
        
        <div class="col-6 col-md-2">
            <div class="card shadow-sm border-0 py-4 feature-card">
                <h5 class="mb-0">Ford</h5>
            </div>
        </div>


        <div class="col-6 col-md-2">
            <div class="card shadow-sm border-0 py-4 feature-card">
                <h5 class="mb-0">Audi</h5>
            </div>
        </div>

        <div class="col-6 col-md-2">
            <div class="card shadow-sm border-0 py-4 feature-card">
                <h5 class="mb-0">Mercedes-Benz</h5>
            </div>
        </div>

        <div class="col-6 col-md-2">
            <div class="card shadow-sm border-0 py-4 feature-card">
                <h5 class="mb-0">BMW</h5>
            </div>
        </div>

        <div class="col-6 col-md-2">
            <div class="card shadow-sm border-0 py-4 feature-card">
                <h5 class="mb-0">Ferrari</h5>
            </div>
        </div>

        <div class="col-6 col-md-2">
            <div class="card shadow-sm border-0 py-4 feature-card">
                <h5 class="mb-0">Mazda</h5>
            </div>
        </div>

    </div>

</section>

<!--BOTÓN DE WHATSAPP-->

<a href="https://wa.me/51903060991?text=Hola,%20AutoPrime%20Perú,%20quisiera%20obtener%20más%20información."
   class="whatsapp-float"
   target="_blank">

    <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg"
         alt="WhatsApp">

</a>


<!-- FOOTER-->

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
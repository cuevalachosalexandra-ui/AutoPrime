<%-- 
    Document   : reporte
    Created on : 2 jun. 2026, 12:42:39 p. m.
    Author     : ALEXANDRA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>

<%@page import="com.autoprime.dao.RepuestoDAO"%>
<%@page import="com.autoprime.dao.EntradaDAO"%>
<%@page import="com.autoprime.dao.SalidaDAO"%>
<%@page import="com.autoprime.dao.ReporteDAO"%>

<%@page import="com.autoprime.model.ReporteMovimiento"%>
<%@page import="com.autoprime.model.Usuario"%>


<%

Usuario u = (Usuario) session.getAttribute("usuario");


if(u == null){

    response.sendRedirect("../login.jsp");
    return;

}


RepuestoDAO repuestoDAO = new RepuestoDAO();

EntradaDAO entradaDAO = new EntradaDAO();

SalidaDAO salidaDAO = new SalidaDAO();


int totalRepuestos = repuestoDAO.totalRepuestos();

int totalEntradas = entradaDAO.totalEntradas();

int totalSalidas = salidaDAO.totalSalidas();



ReporteDAO reporteDAO = new ReporteDAO();



String inicio = request.getParameter("inicio");

String fin = request.getParameter("fin");

String msg = request.getParameter("msg");



List<ReporteMovimiento> movimientos;



if(inicio != null && 
   !inicio.isEmpty() &&
   fin != null &&
   !fin.isEmpty()){


    movimientos = reporteDAO.listarMovimientos(inicio, fin);


}else{


    movimientos = reporteDAO.listarTodosMovimientos();


}



%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Reportes</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<link rel="stylesheet" href="../assets/css/autoprime.css">

<style>

    html,
body{
    height:100%;
    overflow-y:auto;
}

body{
    overflow-x:hidden;
}

/* Encabezado fijo de la tabla */
.table-responsive thead th,
.tabla-scroll thead th{

    position:sticky;
    top:0;
    z-index:10;
    background:#fff;

}
    
    
    /* TARJETAS DE REPORTES */

.card-reporte{

    border-radius:15px;
    border:none;
    padding:15px;
    height:auto;

}

/* NUMEROS DEL REPORTE */

.card-reporte h1{

    font-size:32px;
    font-weight:bold;
    margin-bottom:5px;

}

/* TITULOS */

.titulo-reporte{

    color:white;
    font-weight:bold;
    font-size:32px;

}

/* BADGES */

.badge-entrada{

    background:#198754;
    color:white;
    padding:6px 10px;
    border-radius:10px;
    font-size:14px;

}

.badge-salida{

    background:#dc3545;
    color:white;
    padding:6px 10px;
    border-radius:10px;
    font-size:14px;

}

/* CONTENEDOR DE REPORTES */

.reportes-container{

    width:100%;
    height:calc(100vh - 120px);
    overflow-y:visible;
    padding-right:10px;

}


/* TABLA */
.tabla-reporte{

    background:white;
    border-radius:15px;
    overflow:hidden;
    width:100%;

}

.tabla-reporte .table-responsive{

    max-height:250px;
    overflow-y:auto;
    overflow-x:auto;

}

.tabla-reporte table{

    width:100%;
    margin-bottom:0;

}

.tabla-reporte th,
.tabla-reporte td{

    text-align:center;
    vertical-align:middle;
    padding:12px;
    white-space:nowrap;

}

/* ENCABEZADO FIJO */

.tabla-reporte thead th{

    position:sticky;
    top:0;
    z-index:5;

}

/* TABLA CON SCROLL INTERNO */
.table-responsive{
    height:350px;
    overflow:auto;
}

.table{
    width:100%;
    margin-bottom:0;
}

.table-responsive table{
    width:100%;
}

.table th,
.table td{
    text-align:center;
    vertical-align:middle;
    padding:12px;
    white-space:nowrap;
}

.table-responsive td:last-child{
    min-width:180px;
}

.card{
    border-radius:15px;
}

/* CONTENIDO DE REPORTES */

.reporte-contenido{

    width:100%;

}


/* TARJETAS RESUMEN */

.card-reporte{

    border-radius:15px;

    padding:15px !important;

    min-height:120px;

}


.card-reporte h5{

    font-size:16px;

}


.card-reporte h1{

    font-size:32px;

    margin:5px 0;

}



/* TABLA */

.tabla-reporte{

    width:100%;

    overflow:hidden;

}


.tabla-scroll{

    width:100%;

    max-height:350px;

    overflow-y:auto;

    overflow-x:auto;

}



.tabla-scroll table{

    min-width:700px;

}



.tabla-scroll th{

    position:sticky;

    top:0;

    z-index:5;

}



/* FORMULARIO FILTRO */

.filtro-reporte .form-control{

    width:100%;

}


/* TABLET*/

@media(max-width:992px){


    .card-reporte h1{

        font-size:28px;

    }


    .titulo-reporte{

        font-size:26px;

    }


    .tabla-scroll{

        max-height:350px;

    }


}

/* CELULAR */

@media(max-width:768px){


    .row > [class*="col-"]{

        margin-bottom:15px;

    }

    .card-reporte{

        text-align:center;

    }

    .titulo-reporte{

        font-size:22px;

    }

    .card-body{

        padding:15px;

    }

    .tabla-scroll{

        max-height:300px;

        overflow-x:auto;

    }

    .tabla-scroll table{

        min-width:650px;

    }

    .btn{

        width:100%;

    }
}

/* PANTALLAS PEQUEÑAS*/

@media(max-width:480px){


    .card-reporte h1{

        font-size:24px;

    }

    h4{

        font-size:18px;
    }

    .badge-entrada,
    .badge-salida{

        font-size:12px;

        padding:5px 8px;
    }
}

.card-body{
    height:auto !important;
}

.card{
    height:auto !important;
}

</style>


</head>


<body>

<div class="container-fluid">

<div class="row">

<!-- MENU LATERAL -->

<div class="col-md-2 sidebar">

<h4>AutoPrime</h4>


<a href="../dashboard.jsp" class="menu-item">
🏠 Dashboard
</a>


<a href="../repuestos/listar.jsp" class="menu-item">
🔧 Repuestos
</a>



<%
if("ADMIN".equalsIgnoreCase(u.getRol())){
%>


<a href="../proveedores/listar.jsp" class="menu-item">
🏢 Proveedores
</a>


<%
}
%>



<a href="../movimientos/entrada.jsp" class="menu-item">
📥 Entradas
</a>



<a href="../movimientos/salida.jsp" class="menu-item">
📤 Salidas
</a>



<a href="reportes.jsp" class="menu-item active">
📊 Reportes
</a>



<%
if("ADMIN".equalsIgnoreCase(u.getRol())){
%>


<a href="../usuarios/listar.jsp" class="menu-item">
👥 Usuarios
</a>


<a href="../auditoria/listar.jsp" class="menu-item">
📋 Auditoría
</a>


<%
}
%>



<a href="../LogoutServlet" class="menu-item logout">
🚪 Cerrar Sesión
</a>



</div>

<!-- CONTENIDO -->

<div class="col-md-10 p-4">

<h2 class="titulo-reporte mb-4">

📊 Reportes de Inventario

</h2>

<!-- MENSAJE ENTRADA -->

<%

if("entrada_ok".equals(msg)){

%>


<div class="alert alert-success">

✅ Ingreso de repuesto registrado correctamente.

</div>

<%

}else if("error_entrada".equals(msg)){

%>


<div class="alert alert-danger">

❌ No se pudo registrar la entrada del repuesto.

Verifique el stock disponible.

</div>

<%

}

%>

<!-- MENSAJE SALIDA -->

<%

if("salida_ok".equals(msg)){

%>


<div class="alert alert-success">

✅ Salida de repuesto registrada correctamente.

</div>


<%

}else if("error_salida".equals(msg)){

%>


<div class="alert alert-danger">

❌ No se pudo registrar la salida del repuesto.

Verifique el stock disponible.

</div>


<%
}
%>

<!-- TARJETAS -->

<div class="row">
<div class="col-md-4">

<div class="card shadow card-reporte text-center p-4">


<h5>
📦 Total Repuestos
</h5>


<h1>

<%=totalRepuestos%>

</h1>


</div>

</div>


<div class="col-md-4">

<div class="card shadow card-reporte text-center p-4">


<h5>
📥 Total Entradas
</h5>


<h1>

<%=totalEntradas%>

</h1>


</div>

</div>

<div class="col-md-4">

<div class="card shadow card-reporte text-center p-4">

<h5>
📤 Total Salidas
</h5>


<h1>

<%=totalSalidas%>

</h1>


</div>

</div>



</div>


<!-- FILTRO -->


<div class="card shadow mt-4">


<div class="card-body">


<h4>
🔎 Filtrar movimientos
</h4>


<form method="get" class="row mt-3">

<div class="col-md-5">

<label class="form-label">

Fecha inicio

</label>

<input type="date"
name="inicio"
class="form-control"
value="<%=inicio != null ? inicio : ""%>"
required>


</div>


<div class="col-md-5">


<label class="form-label">

Fecha fin

</label>

<input type="date"
name="fin"
class="form-control"
value="<%=fin != null ? fin : ""%>"
required>


</div>


<div class="col-md-2 d-flex align-items-end">


<button class="btn btn-warning w-100">

🔍 Buscar

</button>

</div>

</form>


</div>

</div>


<!-- TABLA -->

<div class="card shadow mt-4">

<div class="card-body">

<h4>

📋 Detalle de Movimientos

</h4>
    
<div class="table-responsive tabla-scroll">

    <table class="table table-bordered table-hover align-middle">
<thead>

<tr>

<th>Fecha</th>

<th>Tipo</th>

<th>Repuesto</th>

<th>Cantidad</th>

<th>Usuario</th>


</tr>


</thead>

<tbody>


<%
if(movimientos != null && !movimientos.isEmpty()){
for(ReporteMovimiento r : movimientos){
%>


<tr>

<td>

<%=r.getFecha()%>

</td>


<td>

<%
if("Entrada".equals(r.getTipo())){
%>

<span class="badge-entrada">

📥 Entrada

</span>

<%
}else{
%>


<span class="badge-salida">

📤 Salida

</span>

<%
}
%>


</td>


<td>

<%=r.getRepuesto()%>

</td>


<td>

<%=r.getCantidad()%>

</td>

<td>

👤 <%=r.getUsuario()%>

</td>

</tr>

<%
}

}else{

%>


<tr>

<td colspan="5" class="text-center">

No existen movimientos para mostrar

</td>

</tr>


<%
}
%>


</tbody>


</table>

</div>




</div>


</div>


</div>


</body>


</html>
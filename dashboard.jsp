<%-- 
    Document   : dashboard
    Created on : 2 jun. 2026, 12:40:57 p. m.
    Author     : ALEXANDRA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.autoprime.model.Usuario"%>
<%@page import="com.autoprime.dao.RepuestoDAO"%>
<%@page import="com.autoprime.dao.EntradaDAO"%>
<%@page import="com.autoprime.dao.SalidaDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="com.autoprime.model.Repuesto"%>

<%

Usuario u = (Usuario) session.getAttribute("usuario");

if(u == null){
    response.sendRedirect("login.jsp");
    return;
}


RepuestoDAO repuestoDAO = new RepuestoDAO();
EntradaDAO entradaDAO = new EntradaDAO();
SalidaDAO salidaDAO = new SalidaDAO();


List<Repuesto> productosStockBajo = repuestoDAO.listarStockBajo();


int totalRepuestos = repuestoDAO.totalRepuestos();
int totalEntradas = entradaDAO.totalEntradas();
int totalSalidas = salidaDAO.totalSalidas();
int stockBajo = repuestoDAO.stockBajo();


int totalMovimientos = totalEntradas + totalSalidas;


String mensaje = request.getParameter("msg");

%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Dashboard - AutoPrime</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<link rel="stylesheet" href="assets/css/autoprime.css">


<style>


body{

    margin:0;
    background:#07111f;
    color:white;
    overflow:hidden;

}



/* CONTENEDOR */

.dashboard-conten{

    padding:25px;
    height:100vh;
    overflow:hidden;

}




/* BOTONES */

.quick-btn{

    width:180px;
    margin-right:10px;
    margin-bottom:10px;

}




/* TARJETAS */


.cards-container{

    display:flex;
    gap:12px;
    width:100%;
    margin-bottom:15px;

}


.dashboard-card{

    flex:1;
    background:white;
    color:#111;
    height:90px;
    border-radius:12px;

    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

}


.dashboard-card h3{

    font-size:14px;
    margin:0 0 5px 0;

}



.dashboard-card span{

    font-size:25px;
    font-weight:bold;

}



.stock-card{

    border:2px solid #dc3545;

}


.stock-card span{

    color:#dc3545;

}




/* TABLA */


.table-container{

    max-height:260px;
    overflow-y:auto;

}



.table-container thead th{

    position:sticky;
    top:0;
    background:#0d6efd;
    color:white;
    z-index:5;

}



@media(max-width:900px){

.cards-container{

    flex-wrap:wrap;

}


.dashboard-card{

    min-width:150px;

}

}



</style>


</head>



<body>


<div class="container-fluid">


<div class="row">



<!-- SIDEBAR -->

<div class="col-md-2 sidebar">


<h4>
AutoPrime
</h4>



<a href="dashboard.jsp" class="menu-item active">
🏠 Dashboard
</a>



<a href="repuestos/listar.jsp" class="menu-item">
🔧 Repuestos
</a>




<%

if("ADMIN".equalsIgnoreCase(u.getRol())){

%>


<a href="proveedores/listar.jsp" class="menu-item">
🏢 Proveedores
</a>


<%

}

%>



<a href="movimientos/entrada.jsp" class="menu-item">
📥 Entradas
</a>



<a href="movimientos/salida.jsp" class="menu-item">
📤 Salidas
</a>



<a href="reportes/reportes.jsp" class="menu-item">
📊 Reportes
</a>




<%

if("ADMIN".equalsIgnoreCase(u.getRol())){

%>



<a href="usuarios/listar.jsp" class="menu-item">
👥 Usuarios
</a>


<a href="auditoria/listar.jsp" class="menu-item">
📋 Auditoría
</a>


<%

}

%>



<a href="LogoutServlet" class="menu-item logout">
🚪 Cerrar Sesión
</a>



</div>





<!-- CONTENIDO -->


<div class="col-md-10 dashboard-conten">


<h2>
Bienvenido, <%=u.getNombre()%>
</h2>


<p>

Rol:
<b><%=u.getRol()%></b>

|

Fecha:
<%=LocalDate.now()%>

</p>



<%

if("entrada_ok".equals(mensaje)){

%>


<div class="alert alert-success">
Entrada registrada correctamente.
</div>


<%

}else if("salida_ok".equals(mensaje)){

%>


<div class="alert alert-warning">
Salida registrada correctamente.
</div>


<%

}

%>





<div class="mb-3">


<a href="repuestos/registrar.jsp"
class="btn btn-success quick-btn">

➕ Repuesto

</a>



<%
if("ADMIN".equalsIgnoreCase(u.getRol())){
%>


<a href="proveedores/registrar.jsp"
class="btn btn-info quick-btn">

🏢 Proveedor

</a>


<%
}
%>



<a href="movimientos/entrada.jsp"
class="btn btn-primary quick-btn">

📥 Entrada

</a>



<a href="movimientos/salida.jsp"
class="btn btn-warning quick-btn">

📤 Salida

</a>


</div>




<!-- TARJETAS -->

<div class="cards-container">


<div class="dashboard-card">

<h3>
🔧 Repuestos
</h3>

<span>
<%= totalRepuestos %>
</span>

</div>



<div class="dashboard-card">

<h3>
📥 Entradas
</h3>

<span>
<%= totalEntradas %>
</span>

</div>




<div class="dashboard-card">

<h3>
📤 Salidas
</h3>

<span>
<%= totalSalidas %>
</span>

</div>




<div class="dashboard-card">

<h3>
📊 Movimientos
</h3>

<span>
<%= totalMovimientos %>
</span>

</div>




<div class="dashboard-card stock-card">

<h3>
⚠ Stock Bajo
</h3>

<span>
<%= stockBajo %>
</span>

</div>



</div>




<!-- TABLA STOCK BAJO -->


<div class="card shadow mt-2">


<div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">


<h5 class="mb-0">

📦 Productos con Stock Bajo

</h5>


<span class="badge bg-danger">

<%= productosStockBajo.size() %> Productos

</span>


</div>





<div class="card-body">


<p class="text-muted">

Los siguientes productos han alcanzado o están por debajo de su stock mínimo y requieren reposición.

</p>





<div class="table-container">


<div class="table-responsive">


<table class="table table-striped table-hover">


<thead>


<tr>

<th>
Producto
</th>


<th>
Marca
</th>


<th>
Stock
</th>


<th>
Stock Mínimo
</th>


<th>
Estado
</th>


</tr>


</thead>




<tbody>



<%

if(productosStockBajo.isEmpty()){


%>



<tr>


<td colspan="5" class="text-center text-success">


✅ No existen productos con stock bajo.


</td>


</tr>



<%

}else{


for(Repuesto r : productosStockBajo){


%>



<tr>



<td>

<%= r.getNombre() %>

</td>




<td>

<%= r.getMarca() %>

</td>




<td>


<span class="badge bg-danger">

<%= r.getStock() %>

</span>


</td>




<td>

<%= r.getStockMinimo() %>

</td>




<td>


<%


if(r.getStock()==0){


%>


<span class="badge bg-dark">

Agotado

</span>


<%


}else if(r.getStock()<=2){


%>


<span class="badge bg-danger">

Crítico

</span>


<%


}else{


%>


<span class="badge bg-warning text-dark">

Bajo

</span>


<%


}


%>



</td>



</tr>



<%

}

}


%>



</tbody>



</table>



</div>


</div>


</div>


</div>



<!-- CIERRES IMPORTANTES -->


</div> 
<!-- dashboard-conten -->


</div>
<!-- row -->


</div>
<!-- container-fluid -->



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>


</html>
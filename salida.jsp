<%-- 
    Document   : salida
    Created on : 2 jun. 2026, 12:42:30 p. m.
    Author     : ALEXANDRA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.autoprime.dao.RepuestoDAO"%>
<%@page import="com.autoprime.model.Repuesto"%>
<%@page import="com.autoprime.model.Usuario"%>


<%

Usuario usuarioSesion = 
(Usuario) session.getAttribute("usuario");


if(usuarioSesion == null){

    response.sendRedirect("../login.jsp");
    return;

}



RepuestoDAO dao = new RepuestoDAO();

List<Repuesto> lista = dao.listar();


String msg = request.getParameter("msg");


%>


<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">

<title>Registrar Salida</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<link rel="stylesheet" href="../assets/css/autoprime.css">



<style>


.titulo-pagina{

    color:white;
    font-weight:bold;

}



.form-card{

    border-radius:15px;
    border:none;

}



.card-header-custom{

    background:#082D26;
    color:white;
    padding:20px;
    border-radius:15px 15px 0 0;

}



.form-label{

    font-weight:600;

}



.form-control,
.form-select{

    border-radius:10px;
    padding:10px;

}



.btn-salida{

    background:#FFD700;
    color:#000;
    font-weight:bold;
    border-radius:10px;
    padding:10px 25px;

}


.btn-salida:hover{

    background:#e6c200;

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

if("ADMIN".equalsIgnoreCase(usuarioSesion.getRol())){

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


<a href="../movimientos/salida.jsp" class="menu-item active">
📤 Salidas
</a>


<a href="../reportes/reportes.jsp" class="menu-item">
📊 Reportes
</a>


<%

if("ADMIN".equalsIgnoreCase(usuarioSesion.getRol())){

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

<h2 class="titulo-pagina mb-4">

📤 Registrar Salida de Repuesto

</h2>

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

❌ No se pudo registrar la salida.

Verifique el stock disponible.

</div>


<%
}
%>



<div class="card shadow form-card">

<div class="card-header-custom">


<h4 class="mb-0">

📦 Nueva Salida de Inventario

</h4>

</div>


<div class="card-body p-4">

<form action="../SalidaServlet" method="post">

<div class="row">





<!-- REPUESTO -->


<div class="col-md-6 mb-3">


<label class="form-label">

🔧 Repuesto

</label>




<select name="repuestoId"
class="form-select"
required>


<option value="">

Seleccione un repuesto

</option>



<%

for(Repuesto r : lista){

%>


<option value="<%=r.getId()%>">

<%=r.getNombre()%>

(Stock: <%=r.getStock()%>)

</option>



<%

}

%>



</select>


</div>







<!-- CANTIDAD -->


<div class="col-md-6 mb-3">


<label class="form-label">

📦 Cantidad a retirar

</label>




<input type="number"

name="cantidad"

class="form-control"

min="1"

placeholder="Ingrese cantidad"

required>



</div>




</div>







<div class="alert alert-warning mt-3">

⚠️ Verifique que la cantidad no supere el stock disponible antes de registrar la salida.

</div>







<div class="text-end mt-4">





<button type="submit"
class="btn btn-salida">


📤 Registrar Salida


</button>





<a href="../dashboard.jsp"
class="btn btn-secondary ms-2">

Cancelar

</a>





</div>





</form>





</div>



</div>





</div>


</div>


</div>



</body>


</html>
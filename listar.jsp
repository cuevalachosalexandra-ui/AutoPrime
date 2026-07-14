<%-- 
    Document   : listar.jsp
    Created on : 21 jun. 2026, 7:17:25 p. m.
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.autoprime.dao.UsuarioDAO"%>
<%@page import="com.autoprime.model.Usuario"%>


<%
Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");

if(usuarioSesion == null){
    response.sendRedirect("../login.jsp");
    return;
}

Usuario u = (Usuario) session.getAttribute("usuario");

if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}

UsuarioDAO dao = new UsuarioDAO();

List<Usuario> lista = dao.listar();

%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Usuarios</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<link rel="stylesheet" href="../assets/css/autoprime.css">

<style>

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



<!-- SIDEBAR -->

<div class="col-md-2 sidebar">


<h4>AutoPrime</h4>



<a href="../dashboard.jsp" class="menu-item">
🏠 Dashboard
</a>


<a href="../repuestos/listar.jsp" class="menu-item">
🔧 Repuestos
</a>



<%
if ("ADMIN".equalsIgnoreCase(u.getRol())) {
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


<a href="../reportes/reportes.jsp" class="menu-item">
📊 Reportes
</a>



<%
if ("ADMIN".equalsIgnoreCase(u.getRol())) {
%>


<a href="listar.jsp" class="menu-item active">
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


<div class="d-flex justify-content-between mb-4">


<h2>
Gestión de Usuarios
</h2>



<a href="registrar.jsp" class="btn btn-success">

➕ Nuevo Usuario

</a>


</div>





<div class="card shadow">


<div class="card-body">



<table class="table table-bordered table-hover">


<thead class="table-dark">


<tr>

<th>ID</th>

<th>Nombre</th>

<th>Usuario</th>

<th>Rol</th>

<th>Acciones</th>


</tr>


</thead>



<tbody>


<%

for(Usuario usuario : lista){

%>



<tr>


<td>
<%=usuario.getId()%>
</td>


<td>
<%=usuario.getNombre()%>
</td>


<td>
<%=usuario.getUsuario()%>
</td>


<td>
<%=usuario.getRol()%>
</td>



<td>


<a href="../UsuarioServlet?accion=editar&id=<%=usuario.getId()%>"
   class="btn btn-warning btn-sm">
    ✏️ Editar
</a>



<a href="../UsuarioServlet?accion=eliminar&id=<%=usuario.getId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('¿Eliminar usuario?')">

Eliminar

</a>



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


</div>

<script>

function filtrarTabla(){

    let texto = document.getElementById("buscar").value.toLowerCase();

    let filas = document.querySelectorAll("tbody tr");


    filas.forEach(function(fila){

        let contenido = fila.textContent.toLowerCase();


        if(contenido.includes(texto)){

            fila.style.display = "";

        }else{

            fila.style.display = "none";

        }

    });

}

</script>

</body>

</html>
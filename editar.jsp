<%-- 
    Document   : editar
    Created on : 21 jun. 2026, 7:18:29 p. m.
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.autoprime.model.Usuario"%>

<%
Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");

if(usuarioSesion == null){
    response.sendRedirect("../login.jsp");
    return;
}

Usuario u = (Usuario) request.getAttribute("usuarioEditar");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Editar Usuario</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/autoprime.css">

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

.btn-actualizar{
    background:#FFD700;
    color:#000;
    font-weight:bold;
    border-radius:10px;
    padding:10px 25px;
}

.btn-actualizar:hover{
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

<a href="<%=request.getContextPath()%>/dashboard.jsp" class="menu-item">
🏠 Dashboard
</a>

<a href="<%=request.getContextPath()%>/repuestos/listar.jsp" class="menu-item">
🔧 Repuestos
</a>

<%
if("ADMIN".equalsIgnoreCase(usuarioSesion.getRol())){
%>

<a href="<%=request.getContextPath()%>/proveedores/listar.jsp" class="menu-item">
🏢 Proveedores
</a>

<%
}
%>

<a href="<%=request.getContextPath()%>/movimientos/entrada.jsp" class="menu-item">
📥 Entradas
</a>

<a href="<%=request.getContextPath()%>/movimientos/salida.jsp" class="menu-item">
📤 Salidas
</a>

<a href="<%=request.getContextPath()%>/reportes/reportes.jsp" class="menu-item">
📊 Reportes
</a>

<%
if("ADMIN".equalsIgnoreCase(usuarioSesion.getRol())){
%>

<a href="<%=request.getContextPath()%>/usuarios/listar.jsp" class="menu-item active">
👥 Usuarios
</a>

<a href="<%=request.getContextPath()%>/auditoria/listar.jsp" class="menu-item">
📋 Auditoría
</a>

<%
}
%>

<a href="<%=request.getContextPath()%>/LogoutServlet" class="menu-item logout">
🚪 Cerrar Sesión
</a>

</div>

<!-- CONTENIDO -->

<div class="col-md-10 p-4">

<div class="card shadow form-card">

<div class="card-header-custom">

<h4 class="mb-0">
👤 Editar Usuario
</h4>

</div>

<div class="card-body p-4">

<form action="<%=request.getContextPath()%>/UsuarioServlet"
method="post">

<input type="hidden"
name="accion"
value="actualizar">

<input type="hidden"
name="id"
value="<%=u.getId()%>">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Nombre
</label>

<input type="text"
name="nombre"
class="form-control"
value="<%=u.getNombre()%>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Usuario
</label>

<input type="text"
name="usuario"
class="form-control"
value="<%=u.getUsuario()%>"
required>

</div>

</div>

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Clave
</label>

<input type="text"
name="clave"
class="form-control"
value="<%=u.getClave()%>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Rol
</label>

<select name="rol"
class="form-select">

<option value="ADMIN"
<%= "ADMIN".equalsIgnoreCase(u.getRol()) ? "selected" : "" %>>
Administrador
</option>

<option value="EMPLEADO"
<%= "EMPLEADO".equalsIgnoreCase(u.getRol()) ? "selected" : "" %>>
Empleado
</option>

</select>

</div>

</div>

<div class="text-end mt-4">

<button class="btn btn-actualizar">
💾 Actualizar Usuario
</button>

<a href="listar.jsp"
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
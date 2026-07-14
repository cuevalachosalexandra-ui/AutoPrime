<%-- 
    Document   : registrar
    Created on : 21 jun. 2026, 7:18:09 p. m.
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Registrar Usuario</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<link rel="stylesheet" href="../assets/css/autoprime.css">


</head>


<body>


<div class="container mt-4">


<div class="card shadow">


<div class="card-header bg-dark text-white">

<h3>
Registrar Usuario
</h3>

</div>



<div class="card-body">


<form action="../UsuarioServlet" method="post">


<input type="hidden" 
name="accion" 
value="guardar">



<div class="mb-3">

<label>
Nombre
</label>

<input type="text"
name="nombre"
class="form-control"
required>

</div>




<div class="mb-3">

<label>
Usuario
</label>

<input type="text"
name="usuario"
class="form-control"
required>

</div>




<div class="mb-3">

<label>
Clave
</label>

<input type="password"
name="clave"
class="form-control"
required>

</div>





<div class="mb-3">

<label>
Rol
</label>


<select name="rol" class="form-control">


<option value="ADMIN">
Administrador
</option>


<option value="EMPLEADO">
Empleado
</option>


</select>


</div>





<button class="btn btn-success">

Guardar

</button>



<a href="listar.jsp"
class="btn btn-secondary">

Volver

</a>



</form>


</div>


</div>


</div>


</body>

</html>
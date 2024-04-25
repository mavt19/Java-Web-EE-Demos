<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revaidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
    
    %>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Zona del Administrador</title>
</head>

<c:if test="${sessionScope.admin == null }">
<jsp:forward page="/inicio.jsp">
<jsp:param value="Acceso no atorizado" name="errMesage"/>
</jsp:forward>
</c:if>
		

		<%@include file="static/navbar.jsp"%>
	
<body style="margin-top: 3%">

<div class="container">
<div class="row">
<div class="col-md-6">
<div class="card">
<div class="card-body">
	<form  action="admin" method="post" >

<div class="form-group">
<c:if test="${alumno.idAlumno !=null }">
	<input type="hidden" name="metodo" value="actualizar">
	</c:if>
	<input type="hidden" name="metodo" value="registrar">
	
	
						
						<div class="form-group">
							<label for="exampleInputext1">#Id</label> <input
								name="id" value="${alumno.idAlumno }" type="text" class="form-control"
								id="exampleInputext1" placeholder="Codigo" readonly="readonly">
						</div>
						<div class="form-group"> <input
								name="nombre" value="${alumno.nombre }" type="text" class="form-control"
								id="exampleInputext1" placeholder="Ingrese Nombre" required="required">
						</div>
						
						<div class="form-group"> <input
								name="apellido" value="${alumno.apellido }" type="text" class="form-control"
								id="exampleInputext1" placeholder="Ingrese Apellido">
						</div>
						
						<div class="form-group">
							 <input
								name="edad" value="${alumno.edad }" type="text" class="form-control"
								id="exampleInputext1" placeholder="Ingrese Edad">
						</div>
							<button type="submit" class="btn btn-primary btn-block">Insertar</button>
						
						</div>
					</form>

</div>
</div>
</div>
<div class="col-md-6">
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			
			<th>#ID</th>
			<th>nombre</th>
			<th>apellido</th>
			<th>edad</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<c:if test="${lista !=null }">
	<c:forEach var="alu" items="${lista }">
	<tbody>
		<tr>
			<td>${alu.idAlumno }</td>
			<td>${alu.nombre }</td>
			<td>${alu.apellido }</td>
			<td>${alu.edad }</td>
			<td>
			<a  style="margin-top: auto;" class="btn btn-danger" href="admin?metodo=eliminar&id=${alu.idAlumno}"
			 
			onclick="return confirm('Seguro q desea eliminar a ${alu.nombre}');">Eliminar</a>
		<a onclick="" class="btn btn-primary" href="admin?metodo=buscar&id=${alu.idAlumno}">editar</a>
			</td>
		</tr>
	</tbody>
	</c:forEach>
	</c:if>
</table>
</div>
</div>

</div>

<script type="text/javascript">
function noreset(){
	return false;
}

</script>
</body>
	

<div style="margin-top: 5%">
		<%@include file="static/footer.jsp"%>
	</div>
</html>
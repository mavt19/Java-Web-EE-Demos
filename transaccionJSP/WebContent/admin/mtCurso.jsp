
<!DOCTYPE html>

    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<h2 align="center"><a href="curso">Listar</a></h2>
<div class="container" align="center">
<form action="curso" method="post" class="form">
<input type="hidden" name="metodo" value="registra">	
<input type="text" name="nomCurso" value=""><br>
<input type="text" name="desCurso" value=""><br>
<input type="hidden" name="imgCurso" value="http://placehold.it/500x325"><br>
<input type="text" name="capCurso" value=""><br>
<input type="submit"  value="Registrar"/> 
</form>



<table id="table-1" class="table table-dark">
	<thead>
		<tr>
			
			<th>#ID</th>
			<th>nombre</th>
			<th>apellido</th>
			<th>correo</th>
			<th></th>
		</tr>
	</thead>
	<c:if test="${lista !=null }">
	<c:forEach var="alu" items="${lista }">
	<tbody>
		<tr>
			<td>${alu.id }</td>
			<td>${alu.nombre }</td>
			<td>${alu.descripcion }</td>
			<td>${alu.imagen }</td>
			<td>${alu.capacidad }</td>
			<td>
			<a  href="admin?metodo=eliminaruser&id=${alu.id }" onclick="return confirm('Seguro q desea eliminar a ${alu.firstname}');">eliminar</a>
			||<a href="admin?metodo=buscar&id=${alu.id }">editar</a>
			</td>
		</tr>
	</tbody>
	</c:forEach>
	</c:if>
</table>
</div>
</body>
</html>
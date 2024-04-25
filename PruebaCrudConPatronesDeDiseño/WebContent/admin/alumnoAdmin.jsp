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

<%-- <%if (request.getSession(false).getAttribute("admin")==null){ %>
<jsp:forward page="/Login.jsp"></jsp:forward>
<%} %>
 --%>
<c:if test="${sessionScope.admin == null }">
<jsp:forward page="/inicio.jsp">
<jsp:param value="Acceso no atorizado" name="errMesage"/>
</jsp:forward>
</c:if>
<body>
<h1>Bienvenido Admin!!</h1><%-- 
<h2>Welcome = <%=request.getAttribute("userName") %></h2> --%>

<h3>Welcome =  ${admin } </h3>
<br>
<br>

<h2 align="center"><a href="admin?metodo=lista">Listar</a></h2>
<div>
	<form name="miForm" id="form-1" action="admin" method="post">
	<c:if test="${alumno.idAlumno !=null }">
	<input type="hidden" name="metodo" value="actualizar">
	</c:if>
	<input type="hidden" name="metodo" value="registrar">
	<label>ID</label>
	<input type="text" name="id" value="${alumno.idAlumno }" readonly="readonly"><br>
	<label>nombre:</label>
	<input type="text" name="nombre" value="${alumno.nombre }"><br>
	<label>apellido:</label>
	<input type="text" name="apellido" value="${alumno.apellido }"><br>
	<label>edad:</label>
	<input type="text" name="edad" value="${alumno.edad }"><br>
		<input type="submit" value="Submit" id="enviar"/>
	</form>

</div>


 <br><br>
<div class="container" align="center">
<table id="table-1" border="2">
	<thead>
		<tr>
			
			<th>#ID</th>
			<th>nombre</th>
			<th>apellido</th>
			<th>edad</th>
			<th></th>
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
			<a href="javascript: fnEliminarAlumno('${alu.idAlumno}');"
			 
			onclick="return confirm('Seguro q desea eliminar a ${alu.nombre}');">Eliminar</a>
			||<a href="javascript: fnEditarAlumno('${alu.idAlumno}');">editar</a>
			</td>
		</tr>
	</tbody>
	</c:forEach>
	</c:if>
</table>

</body>
</html>
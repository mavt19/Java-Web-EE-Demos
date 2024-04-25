<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
    
<h1>Bienvenido ${user } ${admin }!!</h1>

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
			 <c:if test="${admin != null }">
			<td >
			 <a href="javascript: fnEliminarAlumno('${alu.idAlumno}');"
			 
			onclick="return confirm('Seguro q desea eliminar a ${alu.nombre}');">Eliminar</a>
			</td >
			</c:if>
	
		</tr>
	</tbody>
	</c:forEach>
	</c:if>
</table>
    </div>
    
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page session="true" %>
    
    <%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revaidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div align="center">
			<ul>
				<li><a href="#">Home</a></li>
				<c:choose>
					<c:when test="${admin == null }">
					<c:if test="${user == null }">
						<li><a href="#">Login</a></li>
						<li><a href="#">Sign-up</a></li>
						
						<li><a href="alumno?metodo=lista">zona usuario</a> </li>
						</c:if>
					</c:when>
						
					<%--	<c:when test="${user !=null }">
						
						<li><a href="validar?metodo=logon" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account</a></li>
						<li><a href="alumno?metodo=lista">zona usuario</a> </li>
						</c:when>
					 </c:when>
					<c:when test="${admin != null }">
					<li><a href="admin?metodo=lista">zona admin</a> </li>
					</c:when>
					
					<c:when test="${user != null }">
					<li><a href="alumno?metodo=lista">zona usuario</a> </li>
					</c:when> --%>
				</c:choose>
				
					<c:if test="${admin != null}">
						<li><a href="validar?metodo=logon" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account</a></li>
						<li><a href="admin?metodo=lista">zona admin alumnos</a> </li>
						
						<li><a href="admin?metodo=listauser">zona admin usuarios</a> </li>
						
						<li><a href="alumno?metodo=lista">zona usuario</a> </li>
						</c:if>
						<c:if test="${user != null}">
						<li><a href="validar?metodo=logon" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account</a></li>						
						<li><a href="alumno?metodo=lista">zona usuario</a> </li>
						</c:if>
				<li><a href="#">cart(${user } ${admin })</a></li>
			</ul>
		</div>
<hr><hr>
<div>
	<form name="miForm1" id="form" action=validar method="post">
	<input type="hidden" name="metodo" value="register">
	<label>nombre:</label>
	<input type="text" name="firstname"  ><br>
	<label>apellido:</label>
	<input type="text" name="lastname" ><br>
	<label>correo:</label>
	<input type="text" name="correo" ><br>
	<label>Username:</label>
	<input type="text" name="user_name" ><br>
	<label>password:</label>
	<input type="password" name="pass_name" ><br>
		<input type="submit" value="Submit" id="enviar"/>
	</form>

</div>
<br><br><br>
<div align="center">
	<form name="miForm" id="form-1" action="validar" method="post" >
	
	<input type="hidden" name="metodo" value="login">
	<label>Usuario:</label>
	<input type="text" name="username" ><br>
	<label>Contraseña:</label>
	<input type="password" name="password"><br>

	<c:if test="${errMesage != null }">
	<span style="color: red;">${errMesage}</span>
	</c:if>
	
	
	<c:if test="${vacio != null }">
	<span style="color: red;">${vacio}</span>
	</c:if>
	
	<c:if test="${errBean != null }">
	<span style="color: red;">${errBean}</span>
	</c:if>
		<input type="submit" value="Submit" id="enviar"/>
	</form>

<div>
<c:if test="${user != null || admin !=null}">
${user } ${admin }
</c:if>
</div>
</div>
</body>
</html>
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
		<input type="submit" value="Submit" id="enviar"/>
	</form>
</div>
<div>
<c:if test="${user != null || admin !=null}">
${user } ${admin }
</c:if>
</div>

</body>
</html>
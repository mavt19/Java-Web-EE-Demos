<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center">
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
</body>
</html>
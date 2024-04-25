<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<h1>Error interno del servidor</h1>
<h2>Pongase en contacto con el administrador..</h2>


<h2><a href="alumno?metodo=lista">volver</a></h2>
</body>
</html>
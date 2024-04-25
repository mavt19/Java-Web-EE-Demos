<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Error 404</title>
</head>
<body>
<h1>No se pudo encontrar la pagina </h1>
<h2>Asegurese de escibir bien la ruta..</h2>


<h2><a href="Login.jsp">volver</a></h2>

<c:if test="${user !=null || admin !=null }">
<div style="text-align: right;" ><a href="validar?metodo=logon">Logout</a>
</div>
</c:if>
</body>
</html>
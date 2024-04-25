<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>

<body>
	<div class="container" style="margin-top: 2%;">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light"> <a
			class="navbar-brand" href="inicio.jsp">App</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<c:choose>
					<c:when test="${admin == null }">
					<c:if test="${user == null }">
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li>
				</c:if>
				</c:when>
				</c:choose>
				
				<c:if test="${admin != null }">
				 <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Zona Admin
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="admin?metodo=lista">Mant Alumnos</a>
          <a class="dropdown-item" href="admin?metodo=lista">mant Usuario</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
				</c:if>
				<c:if test="${user != null }">
				 <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Zona Usuario
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
			
				</c:if>	
			</ul>
			
	<%@include file="message.jsp"%>
			<c:choose>
				<c:when test="${admin == null }">
					<c:if test="${user == null }">
						<form class="form-inline my-2 my-lg-0">
							<button class="btn btn-outline-danger my-2 my-sm-0"
								style="margin: 10px" type="button" data-toggle="modal" data-target="#exampleModal">Login</button>
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="button" data-toggle="modal" data-target="#exampleModal">Register</button>
						</form>
					</c:if>
				</c:when>
			</c:choose>
		
					<c:if test="${user != null }">
						<form class="form-inline my-2 my-lg-0">
							<a class="btn btn-danger my-2 my-sm-0"
								style="margin: 10px" href="validar?metodo=logon">Logon</a>
							<a class="btn btn-success my-2 my-sm-0"
								href="#">My Acount (${user })</a>
						</form>
					</c:if>
					
					<c:if test="${admin != null }">
						<form class="form-inline my-2 my-lg-0">
							<a class="btn btn-danger my-2 my-sm-0"
								style="margin: 10px" href="validar?metodo=logon">Logon</a>
							<a class="btn btn-primary my-2 my-sm-0"
								href="#">My Acount (${admin })</a>
						</form>
					</c:if>
		</div>
		</nav>
	</div>
	<br><br><br>
	
	
	<%--
	login
	Modal
	 --%>
	 
	 <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Iniciar Sesion</h5>

				</div>
				<div class="modal-body">
					<form name="miForm" id="form-1" action="validar" method="post"
						>

						<input type="hidden" name="metodo" value="login">

						<div class="form-group">
							<label for="exampleInputext1">User Name</label> <input
								name="username" type="text" class="form-control"
								id="exampleInputext1" placeholder="User name">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								name="password" type="password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary btn-block">LOGIN</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	 
</body>
</html>
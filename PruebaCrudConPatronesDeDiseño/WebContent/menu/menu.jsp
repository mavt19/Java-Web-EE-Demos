<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="menu/menu.css">
<div class="menu">
	<ul>

		<li><a href="Index.jsp" >Home</a></li>

					<c:if test="${admin != null}">
		<li><a href="#">Zona Admin</a>
			<ul>
				<li><a href="javascript: jsCargarPagina('admin/mantAlumnoAdmin.jsp');">Mantenimiento Alumnos</a></li>
				<li><a href="javascript: jsCargarPagina('admin/mantUsuarioAdmin.jsp');">Mantenimiento Usuario</a></li>
				<li><a href="javascript: jsCargarPagina('mantAlumno.jsp');">Usuarios</a></li>
				<li><a href="#">Productos</a></li>
				<li><a href="#">Cancelar cuenta</a></li>
		   </ul>
	  </li>
				</c:if>


						<c:if test="${user != null}">
    <li><a href="#">Zona Usuario</a>
      <ul>
      <li><a href="javascript: jsCargarPagina('mantAlumno');">Usuarios</a></li>
        <li><a href="#">Empleados</a></li>
        <li><a href="#">Sucursales</a></li>
       </ul>
    </li>
</c:if>
    <li><a href="#">Consultas</a>
      <ul>
        <li><a href="javascript: jsCargarPagina('mantAlumno.jsp');">Usuarios</a></li>
        <li><a href="#">Cuentas</a></li>
       </ul>
    </li>


	</ul>
</div>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="_LOGO _CAJA">
  <img alt="" src="img/logo.gif" width="80" height="40"/>
</div>
<div class="_MENU _CAJA">
<jsp:include page="menu/menu.jsp"/>
</div>
<div class="_LOGON _CAJA">
  <br/>
<div align="center">
			<ul style="height: 5px auto;color: gray;">
				<c:choose>
					<c:when test="${admin == null }">
					<c:if test="${user == null }">
						<li style="background-color:yellow ;margin-top: 10px;">
						<a href="javascript: jsCargarPagina('logeo.jsp');">Login</a></li>
						<li style="background-color:yellow ; margin-top: 10%;">
						<a href="javascript: jsCargarPagina('registro.jsp');">Sign-up</a></li>
					</c:if>
					</c:when>
				
				</c:choose>
				
					<c:if test="${admin != null}">
						<li style="background-color:yellow ; margin-top: 10%;">
						<a href="validar?metodo=logon" style="color: #F24638;">Logout</a></li>
						<li style="background-color:yellow ; margin-top: 10%;">
						<a href="#">My Account</a></li>
						
				<li><a href="#">(${user } ${admin })</a></li>
						</c:if>
						<c:if test="${user != null}">
						<li style="background-color:yellow ; margin-top: 10%;">
						<a href="validar?metodo=logon" style="color: #F24638;">Logout</a></li>
						<li style="background-color:yellow ; margin-top: 10%;">
						<a href="#">My Account</a></li>		
						
				<li><a href="#">(${user } ${admin })</a></li>				
						</c:if>
			</ul>
		</div>



</div>

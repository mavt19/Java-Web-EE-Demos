
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page session="true" %>
 

<jsp:include page="head.jsp" />
<jsp:include page="login.jsp" />
    <c:if test="${curso == null }">
<jsp:forward page="/index.jsp">
<jsp:param value="Acceso no atorizado" name="errMesage"/>
</jsp:forward>
</c:if>
   <header class="jumbotron my-4 ">
      <form action="reserva" method="post">
          <input type="hidden" name="metodo" value="registra">
          <input type="hidden" name="idCurso" value="${curso.idCurso }" >	
		  <input type="hidden" name="idUsuario" value="${userId }" >
		  	  <div class="card mb-3">
  <img class="card-img-top" src="${curso.imagen }" alt="Card image cap" width="300px" height="300px">
  <div class="card-body">
    <div class="alert alert-success" >
  ${curso.nombre }
</div>
    <p class="card-text">${curso.descripcion }</p>
    <p class="card-text"><small class="text-muted">Últimas ${curso.capacidad } vacantes</small></p>
 
 <c:if test="${userId == null}">
 	<div class="alert alert-info" role="alert">
  Usted tiene que iniciar sesión para poder inscrivirse en este curso
</div>
 </c:if>
 <c:if test="${userId != null}">
<button onclick="return confirm('Sure?')" type="submit" class="btn btn-success" >
					Inscribirme!
				</button>
			</c:if>	
  </div>
</div>
		 
</form>
    
      
      
      <a href="#cursos" onclick="history.back()" class="btn btn-primary btn-lg">Volver...</a>
    </header>
    
    <jsp:include page="footer.jsp" />
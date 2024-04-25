<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
  <!-- Page Content -->

  <div class="container">
   

    <!-- Page Features -->
    <div class="row text-center mt-3" id="cursos">
	
	<c:if test="${lista!=null }">
	<c:forEach items="${lista }" var="curso">
      <div class="col-lg-3 col-md-6 mt-5 ">
        <div class="card h-100 bg-dark text-white">
          <img class="card-img-top" src="${curso.imagen }" alt="">
          <div class="card-body">
            <h4 class="card-title text-capitalize">${curso.nombre }</h4>
            <c:choose>
				  <c:when test="${curso.capacidad==0 }">
				    <h5  class="badge badge-danger">
					  <span class="badge badge-danger">LLeno :(</span>
					</h5>
				  </c:when>
				  <c:when test="${curso.capacidad<=10 }">
				    <h5  class="badge badge-warning">
					  Cupos <span class="badge badge-light">${curso.capacidad }</span>
					</h5>
				  </c:when>
				  <c:otherwise>
				     <h5  class="badge badge-success">
					  Cupos <span class="badge badge-light">${curso.capacidad }</span>
					</h5>
				  </c:otherwise>
			</c:choose>
           
            
            <p class="card-text text-truncate text-capitalize text-justify text-info">${curso.descripcion }</p>
          </div>
		      
          <div class="card-footer">
        
          <!-- REmoviendo el form -->
		
		<c:choose>
				  <c:when test="${curso.capacidad==0 }">
				  	<div class="alert alert-danger " role="alert">
					  		Curso LLeno
					</div>
				  </c:when>
		
		<c:otherwise>
         <a class="btn btn-primary" href="curso?metodo=busca&idCurso=${curso.idCurso }">Ver mas...</a>
	  </c:otherwise>
		</c:choose>
          
            </div>
            
        </div>
      </div>
      </c:forEach>
     </c:if>

      

    </div>
    
    <!-- /.row -->
    
  </div>
    
 
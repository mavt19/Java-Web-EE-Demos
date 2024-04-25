 <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page session="true" %>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revaidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
    
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
   
      <a class="navbar-brand" href="reserva">Cursos Online</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
          <c:choose>
          <c:when test="${admin !=null}">
           <a class="nav-link" href="curso">Administrar
              <span class="sr-only">(${admin.username })</span>
            </a>
          </c:when>
          <c:when test="${admin ==null}">
           <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </c:when>
          </c:choose>
           
          </li>
          <li class="nav-item ml-3 mr-3">
            <c:if test="${user != null || admin !=null}">
			<p class="text-white mt-1">${user.username } ${admin.username }</p>
			</c:if>
          </li>
          <c:choose>
					<c:when test="${admin == null }">
					<c:if test="${user == null }">
          <li class="nav-item">
            <button class="btn btn-outline-danger mr-3 my-2 my-sm-0 "  data-toggle="modal" data-target="#login" type="submit">Sign Up</button>
          </li>
          <li class="nav-item">
            <button class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#login" type="submit">Sign In</button>
          </li>
          </c:if>
          </c:when>
          </c:choose>
          <c:if test="${user != null || admin !=null}">
          <li class="nav-item">
            <a href="usuario?metodo=logon" onclick="return confirm('Seguro que desea cerrar sesion?')" class="btn btn-outline-danger my-2 my-sm-0"  type="submit">Log Out</a>
          </li>
          </c:if>
        </ul>
      </div>
  
  </nav>
  
  <body>
<c:if test="${mensaje!=null }">
  	<div class="alert alert-success alert-dismissible fade show mt-5" role="alert">
  <strong>Holy ${userName }!</strong> ${mensaje }
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
  </c:if>
  <c:if test="${errMesage != null }">
	<div class="alert alert-danger alert-dismissible fade show mt-5" role="alert">
  <strong> ${errMesage }</strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	</c:if>
	
	<c:if test="${logonMsg != null }">
	<div class="alert alert-danger alert-dismissible fade show mt-5" role="alert">
  <strong> ${logonMsg }</strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	</c:if>
	
	
	

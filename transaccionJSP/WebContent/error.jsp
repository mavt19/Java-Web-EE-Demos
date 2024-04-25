 <%@page session="true" %>
<jsp:include page="head.jsp" />

   <header class="jumbotron my-4 ">
      <img alt="" src="img/error.jpg" width="850px" height="400px" class="mb-4">
       <a href="#cursos" onclick="history.back()" class="btn btn-primary btn-lg">Volver...</a>
      <h1>${error }</h1>
     
    </header>
    
  <jsp:include page="footer.jsp" />
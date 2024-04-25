<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>lista cursos</title>
</head>
<body>

	<div class="container">

		<jsp:include page="head.jsp" />
		<jsp:include page="login.jsp" />
		<jsp:include page="banner.jsp" />
	</div>
		<c:choose>
		
			<c:when test="${lista!=null }">
				<jsp:include page="lista.jsp" />
				<jsp:include page="footer.jsp" />
			</c:when>
			<%-- <c:when test="${error!=null }">
				<jsp:include page="error.jsp" />
				<jsp:include page="footer.jsp" />
			</c:when> --%>
			<c:otherwise>
			
		</c:otherwise> 
		</c:choose>
		






</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

</html>
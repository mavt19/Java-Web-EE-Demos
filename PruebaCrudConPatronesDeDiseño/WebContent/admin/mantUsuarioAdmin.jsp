<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript">

  $("#btnBuscar").click(function(){
	  var data = $("#form1").serialize();
	  var loadImg = "<img alt='' src='img/ajax-loader.gif'/>";	  
	  $("#divResultado").html(loadImg);
	  $.post("alumno?metodo=lista",data,function(html){
		  $("#divResultado").html(html);
	  });
  });
  function fnEliminarAlumno( codigo ){ 
	    var data = "id=" + codigo;
	    $("#divResultado").load("alumno?metodo=eliminar", data);
	} 
</script>
</html>
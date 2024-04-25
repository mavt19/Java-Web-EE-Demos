<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
	  <form id="form1">
	    <h1>MANTENIMIENTO DE ALUMNOS</h1>
	    <input type="button" value="Listar" id="btnBuscar" />
	    
	  </form>
  </div>
  <div id="divResultado">
  </div>
</body>
<script type="text/javascript">

  $("#btnBuscar").click(function(){
	  var data = $("#form1").serialize();
	  var loadImg = "<img alt='' src='img/ajax-loader.gif'/>";	  
	  $("#divResultado").html(loadImg);
	  $.post("admin?metodo=lista",data,function(html){
		  $("#divResultado").html(html);
	  });
  });
  function fnEliminarAlumno( codigo ){ 
	    var data = "id=" + codigo;
	    $("#divResultado").load("admin?metodo=eliminar", data);
	} 


  function fnEditarAlumno( codigo ){ 
	  var data = "id=" + codigo;
	  $("#divResultado").load("admin?metodo=buscar", data);
  }
  $("#btnProcesar").click(function(){
	   var data = $("#formEditar").serialize();
	   $.post("ClienteGrabar",data,function(objJson){
		   alert(objJson.mensaje);
	   });
  });
  
</script>
</html>
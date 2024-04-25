<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<h2 align="center"><a href="curso?metodo=lista">Listar</a></h2>
<div class="container" >
<div class="row mb-5">
<div class="col-lg-10  ml-5">
<form action="curso" method="post" id="form">

<input type="hidden" name="metodo" value="registra">


  <div class="form-group">
    <label for="exampleInputEmail1">#ID</label>
    
	
    <input type="text" readonly="readonly" class="form-control" id="id" aria-describedby="emailHelp" placeholder="">
   </div>
   <div class="form-group">
    <label for="exampleInputEmail1">Nombre</label>
    <input type="text" name="nomCurso" required="required" class="form-control" id="nomCurso" aria-describedby="emailHelp" placeholder="">
   </div>
   <div class="form-group">
    <label for="exampleInputEmail1">Descripcion</label>
    <input type="text" name="desCurso" required="required" class="form-control" id="desCurso" aria-describedby="emailHelp" placeholder="">
   </div>
   <input type="hidden" name="imgCurso" value="" id="imagenU" >
   <div class="row">
    <div class="col md-8">
      <input  type="file"  class="form-control" id="photo" aria-describedby="emailHelp" placeholder="">
    </div>
    
      <img id="image"  src="http://placehold.it/500x325" width="100px" height="50px">
    
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">Capacidad</label>
    <input type="text" name="capCurso" required="required" class="form-control" id="capCurso" aria-describedby="emailHelp" placeholder="">
   </div>
  
  <button  id="btnEnviar" class="btn btn-primary btn-block">Submit</button>
   
</form>
<!-- <button id="subirImg" >Subir Imagen</button> -->
</div>
</div>









<!-- 
<input type="file" name="imgCurso" id="photo" ><br>
<button  onclick="uploadImage()">Agregar</button>
<img id="image"  src="" width="100px" height="50px">
<form action="curso" method="post" class="form">
<input type="hidden" name="metodo" value="registra">	
<input type="text" name="nomCurso" value=""><br>
<input type="text" name="desCurso" value=""><br>
<input type="hidden" name="imgCurso" value="" id="imagenU" ><br>
<input type="text" name="capCurso" value=""><br>
<input type="submit" id="registra"  value="Registrar"/> 
</form>
 -->


<table id="table-1" class="table table-dark mt-5">
	<thead>
		<tr>
			
			<th>#ID</th>
			<th>nombre</th>
			<th>apellido</th>
			<th>correo</th>
			<th></th>
		</tr>
	</thead>
	<c:if test="${lista !=null }">
	<c:forEach var="alu" items="${lista }">
	<tbody>
		<tr>
			<td>${alu.idCurso }</td>
			<td>${alu.nombre }</td>
			<td>${alu.descripcion }</td>
			<td><img alt="" src="${alu.imagen }" width="80px" height="40px"> </td>
			<td>${alu.capacidad }</td>
			<td>
			<a  href="curso?metodo=elimina&idCurso=${alu.idCurso }" onclick="return confirm('Seguro q desea eliminar a ${alu.nombre}');">eliminar</a>
			||<a href="curso?metodo=elimina&idCurso=${alu.idCurso }">editar</a>
			</td>
		</tr>
	</tbody>
	</c:forEach>
	</c:if>
</table>
</div>
</body>
<script src="https://www.gstatic.com/firebasejs/7.12.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.12.0/firebase-storage.js"></script>
<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->

<!-- <script type="text/javascript">

function enviar() {
	

new Promise((resolver, rechazar) => {
    console.log('Inicial');

    resolver();
})
.then(() => {
	let res = uploadImage() ;
        
    console.log(res);
})
.then(() => {
	document.getElementById("btnEnviar").addEventListener("click", function(event) {
		event.preventDefault()
		var form = document.querySelector("#form")
		setTimeout(() => {
			form.submit()
			alert("agregado")
		}, 5000);
	});
})
.catch(() => {
    console.log('Haz eso');
})
}
</script> -->


 <script type="text/javascript">

 const btn = document.querySelector("#btnEnviar")
 const form = document.querySelector("#form")
 btn.addEventListener("click",(event)=>{
	 event.preventDefault()
	 uploadImage()
	 
		setTimeout(() => {
			form.submit()
			alert("agregado")
		}, 6000);
 })
 
 
 
/* document.getElementById("btnEnviar").addEventListener("click", function(event) {
	uploadImage()
	event.preventDefault()
	var form = document.querySelector("#form")
	setTimeout(() => {
		form.submit()
		alert("agregado")
	}, 5000);
}); */





document.getElementById("subirImg").addEventListener("click", function(event) {
	event.preventDefault()
	
});
</script>


<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyDGJVqBPZechwRHnR4ZAvpIHKCnISQmQdA",
    authDomain: "transactionsubidadeimagenes.firebaseapp.com",
    databaseURL: "https://transactionsubidadeimagenes.firebaseio.com",
    projectId: "transactionsubidadeimagenes",
    storageBucket: "transactionsubidadeimagenes.appspot.com",
    messagingSenderId: "710497427938",
    appId: "1:710497427938:web:e0c6e2bf80256aaec619bb"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  console.log(firebase);
  

  function uploadImage() {
      const ref = firebase.storage().ref();
      const file = document.querySelector("#photo").files[0];
      const name = +new Date() + "-" + file.name;
      const metadata = {
        contentType: file.type
      };
      
     
      const task = ref.child(name).put(file, metadata);
      task
        .then(snapshot => snapshot.ref.getDownloadURL())
        .then(url => {
          console.log(url);
          const img =document.querySelector('#image')
          const imgU =document.querySelector('#imagenU')
          img.src=url
          imgU.value=url
          console.log(imgU)
          
        //   document.querySelector("#image").src = url;
        })
        .catch(console.error);
    };


</script>
</html>
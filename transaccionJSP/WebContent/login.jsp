 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="login" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content " style="background-color: #e3f2fd;">
      <div class="modal-header ">
        <h5 class="modal-title" >INICIAR SESION</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="container">
        <form action="usuario" method="post">
        <input type="hidden" name="metodo" value="login">
  <div class="form-group">
    <input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="Ingrese Usuario">
    </div>
  <div class="form-group">
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  <button type="submit" id="btnLogin" class="btn btn-primary btn-block" >Iniciar Sesión</button>
</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-block " data-dismiss="modal">Cerrar</button>
      </div>
      
      </div>
    </div>
  </div>
  
  <script type="text/javascript">

  /* const btnLogin = document.querySelector("#btnLogin")
  
  btnLogin.addEventListener("click",(event)=>{
	  event.preventDefault()
  }) */
</script>

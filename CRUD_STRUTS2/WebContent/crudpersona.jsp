<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />

<link rel="stylesheet" href="css/bootstrapValidator.css" />
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<title>Empleado</title>
<style>
.modal-header, h4, .close {
	background-color: #286090;
	color: white !important;
	text-align: center;
	font-size: 20px;
}
</style>

</head>
<body>
	<h3 align="center">
		<a href="listar">Lista personas</a>
	</h3>
	<br>
	<h2 align="center">
		<button type="button" data-toggle='modal' onclick="modalRegistrar()"
			class='btn btn-primary'>Nuevo Empleado</button>
	</h2>
	<br>
	<br>
	<div class="container">
		<table id="mitabla" class="table table-striped table-bordered">
			<thead align="center">
				<tr>
					<th>codigo</th>
					<th>nombre</th>
					<th>sueldo</th>
					<th>cargo</th>
					<th>Acciones</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="listapersona">
					<tr>
						<td><s:property value="codper" /></td>
						<td><s:property value="nomper" /></td>
						<td><s:property value="sueldo" /></td>
						<td><s:property value="nomcargo" /></td>
						<td align="center"><a
							href="javascript:actualizarDatos('<s:property value="codper" />',
						'<s:property value="nomper" />','<s:property value="sueldo" />',
						'<s:property value="idcargo" />')"
							title="Editar"> <span class="glyphicon glyphicon-pencil"
								aria-hidden="true"></span>
						</a> || || <a
							href="eliminapersona?codigo=<s:property value="codper"/>"
							title="Eliminar"
							onclick="return confirm('Seguro q desea eliminar a <s:property value="nomper" />');">
								<span class="glyphicon glyphicon-trash" aria-hidden="true">
							</span>
						</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>

	</div>

	<!-- 
	modal para registrar

	 -->

	<div class="modal fade" id="idModalRegistra">
		<div class="modal-dialog" style="width: 50%">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>Registro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="idRegistrar" accept-charset="UTF-8"
						action="registrapersona" class="form-horizontal" method="post"
						data-toggle="validator" role="form">
						<div class="panel-group" id="steps">
							<!-- Step 1 -->
							<div class="panel panel-default">
								<div class="panel-heading"
									style="text-align: center; font-size: 14px"></div>
								<div class="panel-body">
									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
										<div class="col-lg-5">
											<input class="form-control" id="idNombre"
												name="persona.nomper" placeholder="Ingrese el Nombre" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_reg_nombre">Sueldo</label>
										<div class="col-lg-5">
											<input class="form-control" id="idSueldo"
												name="persona.sueldo" placeholder="Ingrese Sueldo"
												type="number" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_reg_nombre">Cargo</label>
										<div class="col-lg-5">
											<select id="idCargo" name="persona.idcargo"
												class='form-control'>
												<option value=" ">[SELECCIONE]</option>
											</select>
										</div>
									</div>

								</div>

								<div class="modal-footer"
									style="padding: 5px 20px; text-align: center">
									<button type="submit" class="btn btn-primary">REGISTRAR
										PERSONA</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- fin modal registrar -->



	<!-- ----------------------------------------------------------------------------------------------------------------- -->

	<!-- 
	modal para Actualizar

	 -->

	<div class="modal fade" id="idModalActualiza">
		<div class="modal-dialog" style="width: 50%">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>Actualizar</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="idActualizar" accept-charset="UTF-8"
						action="actualizapersona" class="form-horizontal" method="post"
						data-toggle="validator" role="form">
						<div class="panel-group" id="steps">
							<!-- Step 1 -->
							<div class="panel panel-default">
								<div class="panel-heading"
									style="text-align: center; font-size: 14px"></div>
								<div class="panel-body">
									<div class="form-group">
										<div class="col-lg-5">
											<input class="form-control" id="idCodigo1"
												name="persona.codper" type="hidden" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
										<div class="col-lg-5">
											<input class="form-control" id="idNombre1"
												name="persona.nomper" placeholder="Ingrese el Nombre" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_reg_nombre">Sueldo</label>
										<div class="col-lg-5">
											<input class="form-control" id="idSueldo1"

												name="persona.sueldo" placeholder="Ingrese Sueldo"
												type="number" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_reg_nombre">Cargo</label>
										<div class="col-lg-5">
											<select id="idCargo1" name="persona.idcargo"
												class='form-control'>
												<option value=" ">[SELECCIONE]</option>
											</select>
										</div>
									</div>

								</div>

								<div class="modal-footer"
									style="padding: 5px 20px; text-align: center">
									<button type="submit" class="btn btn-primary">Actualizar
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- fin modal registrar -->


</body>

<script type="text/javascript">
	//función para leer el JSON de distrito "allDistritos"
	function cargos() {
		/*usar la clase $.getJSON del JQuery
		Tiene 3 parametros:
			1-Nombre de la acción a invocar	
			2-Parametros que debe manejar la acción
			3-Valor de retorno de la acción
		 */
		$.getJSON("allcargo", {}, function(data) {
			$.each(data.listacargo, function(index, item) {
				$("#idCargo").append(
						"<option value='"+item.idcargo+"'>" + item.nomcargo
								+ "</option>");
				$("#idCargo1").append(
						"<option value='"+item.idcargo+"'>" + item.nomcargo
								+ "</option>");
			})
		})
	}
	function modalRegistrar() {
		$("#idModalRegistra").modal("show");
	}
	function actualizarDatos(cod, nom, sue, cargo) {
		$("#idCodigo1").val(cod);
		$("#idNombre1").val(nom);
		$("#idSueldo1").val(sue);
		$("#idCargo1").val(cargo);

		$("#idModalActualiza").modal("show");
	}

	$(document).ready(function() {
		cargos();
		$('#mitabla').DataTable();

	});
</script>

</html>
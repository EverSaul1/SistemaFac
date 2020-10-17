/*=============================================
EDITAR CATEGORIA
=============================================*/
$(".tablas").on("click", ".btnEditarProveedor", function(){

	var idProveedor = $(this).attr("idProveedor");

	var datos = new FormData();
	datos.append("idProveedor", idProveedor);

	$.ajax({
		url: "ajax/proveedores.ajax.php",
		method: "POST",
      	data: datos,
      	cache: false,
     	contentType: false,
     	processData: false,
     	dataType:"json",
     	success: function(respuesta){

     		$("#editarProveedor").val(respuesta["nombres"]);
			$("#idProveedor").val(respuesta["id"]);
			$("#editarDireccion").val(respuesta["direccion"]);
			$("#editarCelular").val(respuesta["celular"]);
			$("#editarCorreo").val(respuesta["correo"]);

     	}

	})


})

/*=============================================
ELIMINAR CATEGORIA
=============================================*/
$(".tablas").on("click", ".btnEliminarProveedor", function(){

	 var idProveedor = $(this).attr("idProveedor");

	 swal({
	 	title: '¿Está seguro de borrar el proveedor?',
	 	text: "¡Si no lo está puede cancelar la acción!",
	 	type: 'warning',
	 	showCancelButton: true,
	 	confirmButtonColor: '#3085d6',
	 	cancelButtonColor: '#d33',
	 	cancelButtonText: 'Cancelar',
	 	confirmButtonText: 'Si, borrar proveedor!'
	 }).then(function(result){

	 	if(result.value){

	 		window.location = "index.php?ruta=proveedores&idProveedor="+idProveedor;

	 	}

	 })

})
<?php

class ControladorProveedores{

	/*=============================================
	CREAR CATEGORIAS
	=============================================*/

	static public function ctrCrearproveedor(){

		if(isset($_POST["nuevaProveedor"])){

			if(	preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaProveedor"])&&
				preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaDireccion"])
				
			
			){

				$tabla = "proveedores";

				$datos = array("nombres"=>$_POST["nuevaProveedor"],
					           "direccion"=>$_POST["nuevaDireccion"],
					           "celular"=>$_POST["nuevaCelular"],
					           "correo"=>$_POST["nuevaCorreo"]);

				

				$respuesta = ModeloProveedores::mdlIngresarProveedor($tabla, $datos);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "La proveedor ha sido guardada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "proveedores";

									}
								})

					</script>';

				}


			}else{

				echo'<script>

					swal({
						  type: "error",
						  title: "¡La categoría no puede ir vacía o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "proveedores";

							}
						})

			  	</script>';

			}

		}

	}

	/*=============================================
	MOSTRAR CATEGORIAS
	=============================================*/

	static public function ctrMostrarProveedores($item, $valor){

		$tabla = "proveedores";

		$respuesta = ModeloProveedores::mdlMostrarProveedores($tabla, $item, $valor);

		return $respuesta;
	
	}

	/*=============================================
	EDITAR CATEGORIA
	=============================================*/

	static public function ctrEditarProveedor(){

		if(isset($_POST["editarProveedor"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarProveedor"])&&
			preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarDireccion"])
			){

				$tabla = "proveedores";

				$datos = array("nombres"=>$_POST["editarProveedor"],
							   "id"=>$_POST["idProveedor"],
							   "direccion"=>$_POST["editarDireccion"],
							   "celular"=>$_POST["editarCelular"],
							   "correo"=>$_POST["editarCorreo"],);

				$respuesta = ModeloProveedores::mdlEditarProveedor($tabla, $datos);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El proveedor ha sido cambiada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "proveedores";

									}
								})

					</script>';

				}


			}else{

				echo'<script>

					swal({
						  type: "error",
						  title: "¡>El proveedor no puede ir vacía o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "proveedores";

							}
						})

			  	</script>';

			}

		}

	}

	/*=============================================
	BORRAR CATEGORIA
	=============================================*/

	static public function ctrBorrarProveedor(){

		if(isset($_GET["idProveedor"])){

			$tabla ="Proveedores";
			$datos = $_GET["idProveedor"];

			$respuesta = ModeloProveedores::mdlBorrarProveedor($tabla, $datos);

			if($respuesta == "ok"){

				echo'<script>

					swal({
						  type: "success",
						  title: "El proveedor ha sido borrada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "proveedores";

									}
								})

					</script>';
			}
		}
		
	}
}

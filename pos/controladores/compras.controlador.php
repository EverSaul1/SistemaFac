<?php


class ControladorCompras{

    static public function ctrMonstrarCompras($item, $valor){
        $tabla = "ingresos";
        $respuesta = modeloCompras::mlMostrarCompras($tabla,$valor,$item);
        return $respuesta;

    }

    static public function crtGuardarStock(){

        
        if(isset($_POST["nuevaCompra"])){

            if($_POST["listaProductos"] == ""){

                echo'<script>
            swal({
                  type: "error",
                  title: "El stock no se ha ejecuta si no hay productos",
                  showConfirmButton: true,
                  confirmButtonText: "Cerrar"
                  }).then(function(result){
                            if (result.value) {
                            window.location = "crear-compras";
                            }
                        })
            </script>';
    
            return;
        }
    
            $listaProductos = json_decode($_POST["listaProductos"],true);

            foreach($listaProductos as $key => $value){

                $tablaProductos = "productos";
                $item = "id";
                $valor = $value["id"];
                $orden = "id";
                $traerProducto= ModeloProductos::mdlMostrarProductos($tablaProductos, $item, $valor, $orden);
                
                $itema1a = "stock";
                $valora1a = $value["stock"];
                $nuevoStocks = ModeloProductos::mdlActualizarProducto($tablaProductos, $itema1a, $valora1a, $valor);

                
            }
            $tabla = "ingresos";

            $datos = array("codigo"=>$_POST["nuevaCompra"],
                            "id_especial"=>$_POST["idVendedor"],
                            "productos"=>$_POST["listaProductos"]);
                                            
              
            $respuesta = modeloCompras::mdlIngresarStock($tabla, $datos);
            
			if($respuesta == "ok"){

				echo'<script>
				localStorage.removeItem("rango");
				swal({
					  type: "success",
					  title: "El stock ha sido guardado correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then((result) => {
								if (result.value) {
								window.location = "stocks";
								}
							})
				</script>';
          
            }
            
            

        }

    }

}


?>
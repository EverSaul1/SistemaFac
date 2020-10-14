<?php


class ControladorCompras{

    static public function ctrMonstrarCompras($item, $valor){
        $tabla = "compras";
        $respuesta = modeloCompras::mlMostrarCompras($tabla,$valor,$item);
        return $respuesta;

    }

    static public function crtGuardarStock(){

        if(isset($_POST["nuevaCompra"])){

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
        }

    }

}


?>
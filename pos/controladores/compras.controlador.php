<?php


class ControladorCompras{

    static public function ctrMonstrarCompras($item, $valor){
        $tabla = "compras";
        $respuesta = modeloCompras::mlMostrarCompras($tabla,$valor,$item);
        return $respuesta;

    }

}
?>
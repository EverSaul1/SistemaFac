<?php
    class modeloCompras{
        static public function mlMostrarCompras($tabla,$valor,$item){

            if($item != null){
                $stmt = conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY fecha DESC" );

                $stmt = bindParam(":".$item, $valor, PDO::PARAM_STR);

                $stmt -> execute();

                return $stmt -> fetch();

            }else{
                $stmt = conexion::conectar()->prepare("SELECT * FROM $tabla  ORDER BY fecha DESC" );

                $stmt -> execute();

                return $stmt -> fetchAll();
            }
            $stmt = close();

            $stmt =  null;
        }
    }
?>
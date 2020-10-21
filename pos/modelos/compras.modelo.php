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
        static public function mdlIngresarStock($tabla, $datos){

            $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(codigo, id_especial, productos) VALUES (:codigo, :id_especial, :productos)");

            $stmt->bindParam(":codigo", $datos["codigo"], PDO::PARAM_INT);
            $stmt->bindParam(":productos", $datos["productos"], PDO::PARAM_STR);
            $stmt->bindParam(":id_especial", $datos["id_especial"], PDO::PARAM_INT);
            
           
                if($stmt->execute()){

                    return "ok";

                }else{

                    return "error";
                
                }

                $stmt->close();
                $stmt = null;

            }
            
        
        
    }

?>
<?php

if($_SESSION["perfil"] == "Especial"){

  echo '<script>

    window.location = "inicio";

  </script>';

  return;

}

?>
<div class="content-wrapper">

<section class="content-header">
  
  <h1>
    
    Administrar Stock
  
  </h1>

  <ol class="breadcrumb">
    
    <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
    
    <li class="active">Administrar Stock</li>
  
  </ol>

</section>

<section class="content">

  <div class="box">

    <div class="box-header with-border">

      <a href="crear-compras">

        <button class="btn btn-primary">
          
          Agregar Stock

        </button>

      </a>

       <button type="button" class="btn btn-default pull-right" id="daterange-btn">
         
          <span>
            <i class="fa fa-calendar"></i> Rango de fecha
          </span>

          <i class="fa fa-caret-down"></i>

       </button>

    </div>

    <div class="box-body">
      
     <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Código</th>
         <th>Usuario</th>
        <th>Cantidad - Producto</th>
         <th>Fecha</th> 
        
         <th>Acciones</th>

       </tr> 

      </thead>

      <tbody>
      <?php
        $item = null;
        $valor = null;
        $respuesta = ControladorCompras::ctrMonstrarCompras($item, $valor);
        foreach($respuesta as $key => $value){

            echo '<tr>

            <td>'.($key+1).'</td>
  
            <td>'.$value["codigo"].'</td>';
                  
            $itemUsuario = "id";
            $valorUsuario = $value["id_especial"];

            $respuestaUsuario = ControladorUsuarios::ctrMostrarUsuarios($itemUsuario, $valorUsuario);

            echo '<td>'.$respuestaUsuario["nombre"].'</td><td>';
  
            $productos = json_decode($value["productos"], true);
            foreach($productos as $key2 => $value2){
                echo $value2["cantidad"].' - '. $value2["descripcion"].'<br>';
            }
  
            echo '</td><td>'.$value["fecha"].'</td>
  
           
  
            <td>
  
              <div class="btn-group">
                  
                
  
                <button class="btn btn-danger"><i class="fa fa-times"></i></button>
  
              </div>  
  
            </td>
  
          </tr>';
        }

      ?>
        
        
        
      </tbody>

     </table>

    </div>

  </div>

</section>

</div>
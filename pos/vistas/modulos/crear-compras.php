<div class="content-wrapper">

  <section class="content-header">
    
    <h1>
      
      Nueva Compra
    
    </h1>

    <ol class="breadcrumb">
      
      <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
      
      <li class="active">Crear venta</li>
    
    </ol>

  </section>

  <section class="content">

    <div class="row">

      <!--=====================================
      EL FORMULARIO
      ======================================-->
      
      <div class="col-lg-5 col-xs-12">
        
        <div class="box box-success">
          
          <div class="box-header with-border"></div>

          <form role="form" method="post" class="formularioCompras">

            <div class="box-body">
  
              <div class="box">

                <!--=====================================
                ENTRADA DEL VENDEDOR
                ======================================-->
            
                <div class="form-group">
                
                  <div class="input-group">
                    
                    <span class="input-group-addon"><i class="fa fa-user"></i></span> 

                    <input type="text" class="form-control" id="nuevoVendedor" name="nuevoVendedor" value="<?php echo $_SESSION["nombre"];?>" readonly>
                    <input type="hidden" name="idVendedor" value="<?php echo $_SESSION["id"];?>">

                  </div>

                </div> 

                <!--=====================================
                ENTRADA DEL VENDEDOR
                ======================================--> 

                <div class="form-group">
                  
                  <div class="input-group">
                    
                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                    <?php
                    $item = null;
                    $valor = null;

                    $compras = ControladorCompras::ctrMonstrarCompras($item, $valor);
                    if(!$compras){

                        echo '<input type="text" class="form-control" id="nuevaCompra" name="nuevaCompra" value="00001" readonly>';
                    }else{
                        foreach ($compras as $key => $value){

                        }
                    
                        $codigo = $value["codigo"] +1;

                        echo '<input type="text" class="form-control" id="nuevaCompra" name="nuevaCompra" value="'.$codigo.'" readonly>';
                    }
                    ?>
                    
                    
                  
                  </div>
                
                </div>

               

                <!--=====================================
                ENTRADA PARA AGREGAR PRODUCTO
                ======================================--> 

                <div class="form-group row nuevoProducto">

                  

                </div>

                <!--=====================================
                BOTÓN PARA AGREGAR PRODUCTO
                ======================================-->

                <button type="button" class="btn btn-default hidden-lg agregarProducto">Agregar</button>

                <hr>

                <div class="row">

                  <!--=====================================
                  ENTRADA IMPUESTOS Y TOTAL
                  ======================================-->
                  
                  <div class="col-xs-6 pull-right">
                    
                    <table class="table">

                      <thead>

                        <tr>
                         
                          <th>Total</th>      
                        </tr>

                      </thead>

                      <tbody>
                      
                        <tr>
                                              
                                                                        

                           <td style="width: 55%">
                            
                            <div class="input-group">
                           
                              <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>

                              <input type="number" min="1" class="form-control" id="nuevoTotalCompra" name="nuevoTotalCompra" placeholder="00000" readonly required>
                              
                        
                            </div>

                          </td>

                        </tr>

                      </tbody>

                    </table>

                  </div>

                </div>

                <hr>

                <!--=====================================
                ENTRADA MÉTODO DE PAGO
                ======================================-->

                <div class="form-group row">
                  
                  <div class="col-xs-4" style="padding-right:0px">
                    
                     <div class="input-group">
                             
                        
      
                        <button class="form-control" value="efectivo">Efectivo</button>
                                       
                     
                    </div>

                  </div>

                  <div class="col-xs-6" style="padding-left:0px">
                        
                    <div class="input-group">
                         
                      <input type="text" class="form-control" id="nuevoCodigoTransaccion" name="nuevoCodigoTransaccion" placeholder="Monto"  required>
                           
                      <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                      
                    </div>

                  </div>

                </div>

                <br>
      
              </div>

          </div>

          <div class="box-footer">

            <button type="submit" class="btn btn-primary pull-right">Guardar venta</button>

          </div>

        </form>

        </div>
            
      </div>

      <!--=====================================
      LA TABLA DE PRODUCTOS
      ======================================-->

      <div class="col-lg-7 hidden-md hidden-sm hidden-xs">
        
        <div class="box box-warning">

          <div class="box-header with-border"></div>

          <div class="box-body">
            
            <table class="table table-bordered table-striped dt-responsive tablaCompras">
              
               <thead>

                 <tr>
                  <th style="width: 10px">#</th>
                  <th>Imagen</th>
                  <th>Código</th>
                  <th>Descripcion</th>
                  <th>Stock</th>
                  <th>Acciones</th>
                </tr>

              </thead>

             

            </table>

          </div>

        </div>


      </div>

    </div>
   
  </section>

</div>

      <?php

        $crearCliente = new ControladorClientes();
        $crearCliente -> ctrCrearCliente();

      ?>

    </div>

  </div>

</div>

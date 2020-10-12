/*=============================================
CARGAR LA TABLA DINÁMICA DE compras
=============================================*/

$.ajax({

 	url: "ajax/datatable-compras.ajax.php",
	success:function(respuesta){
		
	}

})
$('.tablaCompras').DataTable( {
    "ajax": "ajax/datatable-compras.ajax.php",
    "deferRender": true,
	"retrieve": true,
	"processing": true,
	 "language": {

			"sProcessing":     "Procesando...",
			"sLengthMenu":     "Mostrar _MENU_ registros",
			"sZeroRecords":    "No se encontraron resultados",
			"sEmptyTable":     "Ningún dato disponible en esta tabla",
			"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
			"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0",
			"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
			"sInfoPostFix":    "",
			"sSearch":         "Buscar:",
			"sUrl":            "",
			"sInfoThousands":  ",",
			"sLoadingRecords": "Cargando...",
			"oPaginate": {
			"sFirst":    "Primero",
			"sLast":     "Último",
			"sNext":     "Siguiente",
			"sPrevious": "Anterior"
			},
			"oAria": {
				"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
				"sSortDescending": ": Activar para ordenar la columna de manera descendente"
			}

	}

} );

$(".tablaCompras tbody").on("click", "button.agregarProducto", function(){
	var idProducto = $(this).attr("idProducto");
	
	$(this).removeClass("btn-primary agregarProducto");
	$(this).addClass("btn-default");
	 var datos = new FormData();
	 datos.append("idProducto", idProducto);

	 $.ajax({
		 url:"ajax/productos.ajax.php",
		 method: "POST",
		 data: datos,
		 cache: false,
		 contentType: false,
		 processData: false,
		 dataType:"json",
		 success:function(respuesta){
			console.log(respuesta);
			var descripcion = respuesta["descripcion"];
			var stock = respuesta["stock"];
			var precio_compra = respuesta["precio_compra"];
			//var cant = null;
			//var valor =  Number(cant*precio_compra);
					
			$(".nuevoProducto").append(
				'<div class="row" style="padding:5px 15px">'+
			'<!-- Descripción del producto -->'+
                  
               '<div class="col-xs-6" style="padding-right:0px">'+
                  
                    '<div class="input-group">'+
                      
                     ' <span class="input-group-addon"><button type="button" class="btn btn-danger btn-xs quitarProducto" idProducto= "'+idProducto+'"><i class="fa fa-times"></i></button></span>'+

                      '<input type="text" class="form-control" id="agregarProducto" name="agregarProducto" value="'+descripcion+'" readonly required>'+

                    '</div>'+

                  '</div>'+

                 '<!-- Cantidad del producto -->'+

                	'<div class="col-xs-3" >'+
                    
                     '<input type="number" class="form-control nuevaCantidadProducto " id="nuevaCantidadProducto" name="nuevaCantidadProducto" min="1" value= "1" stock="'+stock+'" required>'+

                  	'</div>' +
                  '<!-- Precio del producto -->'+

                 	'<div class="col-xs-3 ingresoPrecio" style="padding-left:0px">'+

                    	'<div class="input-group">'+

                      		'<span class="input-group-addon"><i class="ion ion-social-usd"></i></span>'+
                         
                      		'<input type="number" min="1" class="form-control nuevoPrecioProducto" precioReal="'+precio_compra+'" id="nuevoPrecioProducto" name="nuevoPrecioProducto" value="'+precio_compra+'" readonly required>'+
         
                   		 '</div>'+
                     
				  '	</div>' +
				  
                  

				'</div>'
				
			)
			sumarTotalPrecios2();	  
		}

	 })

});

$('.tablaCompras').on("draw.dt", function(){
	if(localStorage.getItem("quitarProducto")!=null){

		var listaIdProductos = JSON.parse(localStorage.getItem("quitarProducto"));

		for ( var i = 0; i < listaIdProductos.length; i++){

			$("button.recuperarBoton[idProducto='"+listaIdProductos[i]["idProducto"]+"']").removeClass('btn-default');

			$("button.recuperarBoton[idProducto='"+listaIdProductos[i]["idProducto"]+"']").addClass('btn-primary agregarProducto');
			sumarTotalPrecios2();
		}
	}
});

	var idQuitarProducto = [];
$(".formularioCompras").on("click", "button.quitarProducto", function(){

	$(this).parent().parent().parent().parent().remove();

	var idProducto = $(this).attr("idProducto");

	if(localStorage.getItem("quitarProducto")==null){
		idQuitarProducto = [];

	}else{
		idQuitarProducto.concat(localStorage.getItem("quitarProducto"));
	}
	idQuitarProducto.push({"idProducto":idProducto});
	localStorage.setItem("quitarProducto" , JSON.stringify(idQuitarProducto));

	$("button.recuperarBoton[idProducto='"+idProducto+"']").removeClass('btn-default');

	$("button.recuperarBoton[idProducto='"+idProducto+"']").addClass('btn-primary agregarProducto');	

});

$(".formularioCompras").on("change", "input.nuevaCantidadProducto", function(){
	
	var precio = $(this).parent().parent().children(".ingresoPrecio").children().children(".nuevoPrecioProducto");


	var precioFinal = $(this).val() * precio.attr("precioReal");
	
	precio.val(precioFinal);

	//if(Number($(this).val() > Number($(this).attr("stock")))
	sumarTotalPrecios2();
})
function sumarTotalPrecios2(){

	var precioItem = $(".nuevoPrecioProducto");
	var arraySuma= [];
	for(var i=0; i < precioItem.length;i ++){
		arraySuma.push(Number($(precioItem[i]).val()));

	}
	function SumarArrayPrecios2(total, numero){

		return total + numero;

	}

	var sumarTotalPrecio = arraySuma.reduce(SumarArrayPrecios2);

	$("#nuevoTotalCompra").val(sumarTotalPrecio);
	
}
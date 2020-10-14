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
		
			var descripcion = respuesta["descripcion"];
			var stock = respuesta["stock"];
			var precio_compra = respuesta["precio_compra"];
			//var cantidads = 1;
			//var cant = null;
			//var valor =  Number(cant*precio_compra);
					
			$(".nuevoProducto").append(
				'<div class="row" style="padding:5px 15px">'+
			'<!-- Descripción del producto -->'+
                  
               '<div class="col-xs-6" style="padding-right:0px">'+
                  
                    '<div class="input-group">'+
                      
                     ' <span class="input-group-addon"><button type="button" class="btn btn-danger btn-xs quitarProducto" idProducto= "'+idProducto+'"><i class="fa fa-times"></i></button></span>'+

                      '<input type="text" class="form-control agregarProducto nuevaDescripcionProducto" id="agregarProducto" idProducto="'+idProducto+'" name="agregarProducto" value="'+descripcion+'" readonly required>'+

                    '</div>'+

                  '</div>'+

                 '<!-- Cantidad del producto -->'+

                	'<div class="col-xs-3" >'+
                    
                     '<input type="number" class="form-control nuevaCantidadProducto " name="nuevaCantidadProducto" min="1" value= "1" stock="'+stock+'" nuevoStocks="'+Number(stock/1+1)+'" required>'+

                  	'</div>' +
                 
					  
                  

				'</div>'

				
			)
			listariDProductos()  
		}

	 })

});

$('.tablaCompras').on("draw.dt", function(){
	if(localStorage.getItem("quitarProducto")!=null){

		var listaIdProductos = JSON.parse(localStorage.getItem("quitarProducto"));

		for ( var i = 0; i < listaIdProductos.length; i++){

			$("button.recuperarBoton[idProducto='"+listaIdProductos[i]["idProducto"]+"']").removeClass('btn-default');

			$("button.recuperarBoton[idProducto='"+listaIdProductos[i]["idProducto"]+"']").addClass('btn-primary agregarProducto');
		
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

	var nuevoStocks = Number($(this).attr("stock")) + Number($(this).val());

	$(this).attr("nuevoStocks",nuevoStocks);

	//if(Number($(this).val() > Number($(this).attr("stock")))
	listariDProductos()  
})

function listariDProductos(){

	var listaProductos = [];

	var descripcion = $(".nuevaDescripcionProducto");

	var cantidad = $(".nuevaCantidadProducto");

	for(var i = 0; i < descripcion.length; i++){

		listaProductos.push({"id": $(descripcion[i]).attr("idProducto"),
								"descripcion": $(descripcion[i]).val(),
								"cantidad": $(cantidad[i]).val(),
								"stock": $(cantidad[i]).attr("nuevoStocks")})
	
	}
	console.log("listaProductos", listaProductos);

	$("#listaProductos").val(JSON.stringify(listaProductos));
	
}
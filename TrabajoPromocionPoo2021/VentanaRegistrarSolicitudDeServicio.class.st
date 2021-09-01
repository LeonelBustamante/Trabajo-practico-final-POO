Class {
	#name : #VentanaRegistrarSolicitudDeServicio,
	#superclass : #VentanaRegistrarSolicitud,
	#instVars : [
		'tituloDuracion',
		'inputDuracionDias',
		'inputDuracionMeses',
		'inputDuracionAnio',
		'duracionProlongada',
		'tituloProductos',
		'checkboxProducto1',
		'checkboxProducto2',
		'checkboxProducto3',
		'checkboxProducto4',
		'checkboxProducto5',
		'checkboxProducto6',
		'tituloTipoPago',
		'checkboxTipo1',
		'checkboxTipo2',
		'checkboxTipo3'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeServicio >> actualizarTabla [

	tabla setText: MiGestor colSolicitudesPendientesToString
]

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeServicio >> agregarBoton [

	| botonRegistro |
	botonRegistro := Boton nombre: 'Registrar' tamanio: 200 @ 30.
	botonRegistro
		center: self center;
		bottom: self bottom - 10;
		color: (Color r: 0.0 g: 0.5 b: 0.8);
		borderStyle: (RoundedBorder new
				 cornerRadius: 5;
				 width: 5;
				 color: (Color r: 0.0 g: 0.5 b: 0.8)).
	self addMorph: botonRegistro.

	botonRegistro mouseAction: [ 
		|  x controlRubro rubro controlTP tipoPago controlEmpresa |
		x := inputDuracionDias isEmpty
			     ifTrue: [ 0 ]
			     ifFalse: [ inputDuracionDias input ].
		checkboxRubro1 estado
			ifTrue: [ 
				rubro := checkboxRubro1 label.
				controlRubro := true ]
			ifFalse: [ 
				checkboxRubro2 estado
					ifTrue: [ 
						rubro := checkboxRubro2 label.
						controlRubro := true ]
					ifFalse: [ 
						checkboxRubro3 estado
							ifTrue: [ 
								rubro := checkboxRubro3 label.
								controlRubro := true ]
							ifFalse: [ controlRubro := false ] ] ].

		checkboxTipo1 estado
			ifTrue: [ 
				tipoPago := checkboxTipo1 label.
				controlTP := true ]
			ifFalse: [ 
				checkboxTipo2 estado
					ifTrue: [ 
						tipoPago := checkboxTipo2 label.
						controlTP := true ]
					ifFalse: [ 
						checkboxTipo3 estado
							ifTrue: [ 
								tipoPago := checkboxTipo3 label.
								controlTP := true ]
							ifFalse: [ controlTP := false ] ] ].
		controlEmpresa := MiGestor colEmpresasSolicitantes anySatisfy: [ :y | 
			                  y getNombre = inputNombre input ].


		controlEmpresa & inputNombre isEmpty not & controlRubro & controlTP
		& inputValor isEmpty not & inputNombre isEmpty not ifTrue: [ 
			checkboxProducto1 estado | checkboxProducto2 estado
			| checkboxProducto3 estado | checkboxProducto4 estado
			| checkboxProducto5 estado | checkboxProducto6 estado
				ifFalse: [ 
					| unaSolicitud |
					unaSolicitud := DeServicio
						                descripcion: rubro
						                duracion: x
						                valor: inputValor input
						                tipoPago: tipoPago.
					MiGestor
						registrarSolicitud: unaSolicitud
						postulante: inputNombre input.
					tabla setText: MiGestor colSolicitudesPendientesToString ]
				ifTrue: [ 
					| unaColCestaProductos unaSolicitud |
					unaColCestaProductos := OrderedCollection new.

					checkboxProducto1 estado ifTrue: [ 
						unaColCestaProductos add: checkboxProducto1 label ].
					checkboxProducto2 estado ifTrue: [ 
						unaColCestaProductos add: checkboxProducto2 label ].
					checkboxProducto3 estado ifTrue: [ 
						unaColCestaProductos add: checkboxProducto3 label ].
					checkboxProducto4 estado ifTrue: [ 
						unaColCestaProductos add: checkboxProducto4 label ].
					checkboxProducto5 estado ifTrue: [ 
						unaColCestaProductos add: checkboxProducto5 label ].
					checkboxProducto6 estado ifTrue: [ 
						unaColCestaProductos add: checkboxProducto6 label ].

					unaSolicitud := ConProductos
						                descripcion: rubro
						                duracion: x
						                valor: inputValor input
						                tipoPago: tipoPago
						                colCestaProductos: unaColCestaProductos.
					MiGestor
						registrarSolicitud: unaSolicitud
						postulante: inputNombre input.
					tabla setText: MiGestor colSolicitudesPendientesToString ] ] ]
]

{ #category : #accessing }
VentanaRegistrarSolicitudDeServicio >> agregarCampos [

	| advertencia |
	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox
		               nombre: 'Ingrese aqui el nombre'
		               tamanio: 450 @ 90.

	tituloDuracion := Texto titulo: 'Ingrese una duracion' tamanio: 20.
	advertencia := Texto
		               titulo: 'Si es puntual dejar en blanco'
		               tamanio: 10.
 inputDuracionDias := TextBox nombre: 'Ingrese aqui el valor' tamanio: 450 @ 90.

	tituloValor := Texto titulo: 'Ingrese el valor' tamanio: 20.
	inputValor := TextBox
		              nombre: 'Ingrese aqui el valor'
		              tamanio: 450 @ 90.
	tituloTipoPago := Texto titulo: 'Ingrese tipo de pago' tamanio: 20.
	checkboxTipo1 := Checkbox nombre: 'Diario' tamanio: 100 @ 20.
	checkboxTipo2 := Checkbox nombre: 'Semanal' tamanio: 100 @ 20.
	checkboxTipo3 := Checkbox nombre: 'Mensual' tamanio: 100 @ 20.
	self
		agregarRubros;
		agregarProductos;
		addMorph: tituloNombre;
		addMorph: inputNombre;
		addMorph: tituloDuracion;
		addMorph: advertencia;
		addMorph: inputDuracionDias;
		addMorph: tituloValor;
		addMorph: inputValor;
		addMorph: tituloTipoPago;
		addMorph: checkboxTipo1;
		addMorph: checkboxTipo2;
		addMorph: checkboxTipo3.

	tituloNombre
		left: 10;
		top: 150.
	inputNombre
		left: 10;
		top: tituloNombre bottom + 20.
	tituloDescripcion
		left: 10;
		top: inputNombre bottom + 20.
	checkboxRubro1
		left: 10;
		top: tituloDescripcion bottom + 20.
	checkboxRubro2
		left: 130;
		top: tituloDescripcion bottom + 20.
	checkboxRubro3
		left: 250;
		top: tituloDescripcion bottom + 20.
	tituloDuracion
		left: 10;
		top: checkboxRubro1 bottom + 20.
	advertencia
		left: 10;
		top: tituloDuracion bottom + 10.
	inputDuracionDias
		left: 10;
		top: advertencia bottom + 10.

	tituloValor
		left: 10;
		top: inputDuracionDias bottom + 20.
	inputValor
		left: 10;
		top: tituloValor bottom + 20.
	tituloTipoPago
		left: 10;
		top: inputValor bottom + 20.
	checkboxTipo1
		left: 10;
		top: tituloTipoPago bottom + 20.
	checkboxTipo2
		left: 130;
		top: tituloTipoPago bottom + 20.
	checkboxTipo3
		left: 250;
		top: tituloTipoPago bottom + 20.

	tituloProductos
		left: self left + 10;
		top: checkboxTipo1 bottom + 20.
	checkboxProducto1
		left: self left + 10;
		top: tituloProductos bottom + 20.
	checkboxProducto2
		left: self left + 130;
		top: tituloProductos bottom + 20.
	checkboxProducto3
		left: self left + 250;
		top: tituloProductos bottom + 20.
	checkboxProducto4
		left: self left + 10;
		top: checkboxProducto1 bottom + 20.
	checkboxProducto5
		left: self left + 130;
		top: checkboxProducto1 bottom + 20.
	checkboxProducto6
		left: self left + 250;
		top: checkboxProducto1 bottom + 20
]

{ #category : #accessing }
VentanaRegistrarSolicitudDeServicio >> agregarLista: aString [

	"Agrego titulo y lista"

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := RubScrolledTextMorph new.
	tabla
		extent: 500 @ 500;
		beReadOnly.

	self addMorph: titulo.
	self addMorph: tabla.


	"Posiciono"
	titulo
		left: self right - 700;
		top: 150.
	tabla
		left: self right - 700;
		top: 200
]

{ #category : #adding }
VentanaRegistrarSolicitudDeServicio >> agregarProductos [

	tituloProductos := Texto
		                   titulo: 'Marque si tiene productos'
		                   tamanio: 20.

	checkboxProducto1 := Checkbox nombre: 'Pintura' tamanio: 100 @ 20.
	checkboxProducto2 := Checkbox nombre: 'Pincel' tamanio: 100 @ 20.
	checkboxProducto3 := Checkbox nombre: 'Colchon' tamanio: 100 @ 20.
	checkboxProducto4 := Checkbox nombre: 'Almohada' tamanio: 100 @ 20.
	checkboxProducto5 := Checkbox nombre: 'Monitor' tamanio: 100 @ 20.
	checkboxProducto6 := Checkbox nombre: 'Teclado' tamanio: 100 @ 20.

	self
		addMorph: tituloProductos;
		addMorph: checkboxProducto1;
		addMorph: checkboxProducto2;
		addMorph: checkboxProducto3;
		addMorph: checkboxProducto4;
		addMorph: checkboxProducto5;
		addMorph: checkboxProducto6
]

{ #category : #accessing }
VentanaRegistrarSolicitudDeServicio >> agregarRubros [

	tituloDescripcion := Texto
		                     titulo: 'Marque su categoria(descripcion)'
		                     tamanio: 20.
	checkboxRubro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	checkboxRubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	checkboxRubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.

	self
		addMorph: tituloDescripcion;
		addMorph: checkboxRubro1;
		addMorph: checkboxRubro2;
		addMorph: checkboxRubro3
]

{ #category : #initialization }
VentanaRegistrarSolicitudDeServicio >> initialize [

	super initialize.
	self
		agregarLista: 'Solicitudes';
		agregarCampos;
		agregarBoton;
		actualizarTabla
]

Class {
	#name : #VentanaRegistrarSolicitudDeServicio,
	#superclass : #VentanaRegistrarSolicitud,
	#instVars : [
		'tituloDuracion',
		'inputDuracionMeses',
		'inputDuracionAnio',
		'duracionProlongada',
		'tituloProductos',
		'tituloTipoPago',
		'producto1',
		'producto2',
		'producto3',
		'producto4',
		'producto5',
		'producto6',
		'inputDias',
		'tipoPago1',
		'tipoPago2',
		'tipoPago3'
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
		modalBotonConfirmar;
		bottom: self bottom - 10.
	self addMorphCentered: botonRegistro.

	MiGestor addDependent: self.

	botonRegistro mouseAction: [ 
		| x controlRubro rubro controlTP tipoPago controlEmpresa unaSolicitud |
		x := inputDias isEmpty
			     ifTrue: [ 0 ]
			     ifFalse: [ inputDias input ].


		rurbro1 estado
			ifTrue: [ 
				rubro := rurbro1 label.
				controlRubro := true ]
			ifFalse: [ 
				rubro2 estado
					ifTrue: [ 
						rubro := rubro2 label.
						controlRubro := true ]
					ifFalse: [ 
						rubro3 estado
							ifTrue: [ 
								rubro := rubro3 label.
								controlRubro := true ]
							ifFalse: [ controlRubro := false ] ] ].


		tipoPago1 estado
			ifTrue: [ 
				tipoPago := tipoPago1 label.
				controlTP := true ]
			ifFalse: [ 
				tipoPago2 estado
					ifTrue: [ 
						tipoPago := tipoPago2 label.
						controlTP := true ]
					ifFalse: [ 
						tipoPago3 estado
							ifTrue: [ 
								tipoPago := tipoPago3 label.
								controlTP := true ]
							ifFalse: [ controlTP := false ] ] ].


		controlEmpresa := MiGestor colEmpresasSolicitantes anySatisfy: [ :y | 
			                  y getNombre = inputNombre input ].


		controlEmpresa & controlRubro & controlTP & inputNombre isNotEmpty
		& inputValor isNotEmpty & inputNombre isNotEmpty ifTrue: [ 
			| unaColCestaProductos |
			unaColCestaProductos := self cargaProductos.
			unaColCestaProductos
				ifNil: [ 
					unaSolicitud := DeServicio
						                descripcion: rubro
						                duracion: x
						                valor: inputValor input
						                tipoPago: tipoPago ]
				ifNotNil: [ 
					unaSolicitud := ConProductos
						                descripcion: rubro
						                duracion: x
						                valor: inputValor input
						                tipoPago: tipoPago
						                colCestaProductos: unaColCestaProductos ].
			MiGestor
				registrarSolicitud: unaSolicitud
				postulante: inputNombre input ] ]
]

{ #category : #accessing }
VentanaRegistrarSolicitudDeServicio >> agregarCampos [

	| advertencia |
	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox nombre: 'Ingrese aqui el nombre' tamanio: 450 @ 90.

	tituloDuracion := Texto titulo: 'Ingrese una duracion' tamanio: 20.
	advertencia := Texto titulo: 'Si es puntual dejar en blanco' tamanio: 10.
	inputDias := TextBox nombre: 'Ingrese aqui el valor' tamanio: 450 @ 90.

	tituloValor := Texto titulo: 'Ingrese el valor' tamanio: 20.
	inputValor := TextBox nombre: 'Ingrese aqui el valor' tamanio: 450 @ 90.
	
	tituloTipoPago := Texto titulo: 'Ingrese tipo de pago' tamanio: 20.
	tipoPago1 := Checkbox nombre: 'Diario' tamanio: 100 @ 20.
	tipoPago2 := Checkbox nombre: 'Semanal' tamanio: 100 @ 20.
	tipoPago3 := Checkbox nombre: 'Mensual' tamanio: 100 @ 20.
	

	tituloRubro := Texto titulo: 'Marque su categoria(descripcion)' tamanio: 20.
	rurbro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	rubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	rubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.


	tituloProductos := Texto titulo: 'Marque si tiene productos' tamanio: 20.
	producto1 := Checkbox nombre: 'Pintura' tamanio: 100 @ 20.
	producto2 := Checkbox nombre: 'Pincel' tamanio: 100 @ 20.
	producto3 := Checkbox nombre: 'Colchon' tamanio: 100 @ 20.
	producto4 := Checkbox nombre: 'Almohada' tamanio: 100 @ 20.
	producto5 := Checkbox nombre: 'Monitor' tamanio: 100 @ 20.
	producto6 := Checkbox nombre: 'Teclado' tamanio: 100 @ 20.

	self
		addMorph: tituloNombre;
		addMorph: inputNombre;

		addMorph: tituloRubro;
		addMorph: rurbro1;
		addMorph: rubro2;
		addMorph: rubro3;

		addMorph: tituloDuracion;
		addMorph: advertencia;
		addMorph: inputDias;
			
		addMorph: tituloValor;
		addMorph: inputValor;

		addMorph: tituloTipoPago;
		addMorph: tipoPago1;
		addMorph: tipoPago2;
		addMorph: tipoPago3;
		
		addMorph: tituloProductos;
		addMorph: producto1;
		addMorph: producto2;
		addMorph: producto3;
		addMorph: producto4;
		addMorph: producto5;
		addMorph: producto6.


	tituloNombre
		left: 10;
		top: 150.
	inputNombre
		left: 10;
		top: tituloNombre bottom + 20.
	tituloRubro
		left: 10;
		top: inputNombre bottom + 20.
	rurbro1
		left: 10;
		top: tituloRubro bottom + 20.
	rubro2
		left: 130;
		top: tituloRubro bottom + 20.
	rubro3
		left: 250;
		top: tituloRubro bottom + 20.
	tituloDuracion
		left: 10;
		top: rurbro1 bottom + 20.
	advertencia
		left: 10;
		top: tituloDuracion bottom + 10.
	inputDias
		left: 10;
		top: advertencia bottom + 10.

	tituloValor
		left: 10;
		top: inputDias bottom + 20.
	inputValor
		left: 10;
		top: tituloValor bottom + 20.
	tituloTipoPago
		left: 10;
		top: inputValor bottom + 20.
	tipoPago1
		left: 10;
		top: tituloTipoPago bottom + 20.
	tipoPago2
		left: 130;
		top: tituloTipoPago bottom + 20.
	tipoPago3
		left: 250;
		top: tituloTipoPago bottom + 20.

	tituloProductos
		left: self left + 10;
		top: tipoPago1 bottom + 20.
	producto1
		left: self left + 10;
		top: tituloProductos bottom + 20.
	producto2
		left: self left + 130;
		top: tituloProductos bottom + 20.
	producto3
		left: self left + 250;
		top: tituloProductos bottom + 20.
	producto4
		left: self left + 10;
		top: producto1 bottom + 20.
	producto5
		left: self left + 130;
		top: producto1 bottom + 20.
	producto6
		left: self left + 250;
		top: producto1 bottom + 20
]

{ #category : #accessing }
VentanaRegistrarSolicitudDeServicio >> agregarLista: aString [

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := Tabla tamanio: 500 @ 500.

	self addMorph: titulo.
	self addMorph: tabla.

	titulo
		left: self right - 700;
		top: 150.
	tabla
		left: self right - 700;
		top: 200
]

{ #category : #private }
VentanaRegistrarSolicitudDeServicio >> cargaProductos [

	| unaColProductos |
	producto1 estado | producto2 estado | producto3 estado
	| producto4 estado | producto5 estado | producto6 estado ifTrue: [ 
		unaColProductos := OrderedCollection new.
		producto1 estado ifTrue: [ unaColProductos add: producto1 label ].
		producto2 estado ifTrue: [ unaColProductos add: producto2 label ].
		producto3 estado ifTrue: [ unaColProductos add: producto3 label ].
		producto4 estado ifTrue: [ unaColProductos add: producto4 label ].
		producto5 estado ifTrue: [ unaColProductos add: producto5 label ].
		producto6 estado ifTrue: [ unaColProductos add: producto6 label ] ].
	^ unaColProductos
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

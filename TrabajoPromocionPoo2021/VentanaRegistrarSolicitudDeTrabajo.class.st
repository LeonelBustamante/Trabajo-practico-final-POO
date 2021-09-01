Class {
	#name : #VentanaRegistrarSolicitudDeTrabajo,
	#superclass : #VentanaRegistrarSolicitud,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeTrabajo >> agregarBoton [

	| botonRegistro |
	botonRegistro := Boton nombre: 'Registrar' tamanio: 200 @ 30.
	self addMorphCentered: botonRegistro.
	botonRegistro
		modalBotonConfirmar;
		bottom: self bottom - 10.
		
	MiGestor addDependent: self.

	botonRegistro mouseAction: [ 
		| rubro controlRubro controlEmpresa |
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


		controlEmpresa := MiGestor colEmpresasSolicitantes anySatisfy: [ :x | 
			                  x getNombre = inputNombre input ].

		inputNombre isNotEmpty & controlRubro & inputValor isNotEmpty
		& controlEmpresa ifTrue: [ 
			| unaSolicitud |
			unaSolicitud := DeTrabajo
				                descripcion: rubro
				                valor: inputValor input.
			MiGestor
				registrarSolicitud: unaSolicitud
				postulante: inputNombre input ] ]
]

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeTrabajo >> agregarCampos [

	| tituloNombre tituloRubro tituloValor |
	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox
		               nombre: 'Ingrese aqui el nombre'
		               tamanio: 450 @ 90.
 
	tituloRubro := Texto
		               titulo: 'Marque su categoria(descripcion)'
		               tamanio: 20.
	rurbro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	rubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	rubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.


	tituloValor := Texto titulo: 'Ingrese el valor' tamanio: 20.
	inputValor := TextBox
		              nombre: 'Ingrese aqui el valor'
		              tamanio: 450 @ 90.

	self
		addMorph: tituloNombre;
		addMorph: inputNombre;
		addMorph: tituloRubro;
		addMorph: rurbro1;
		addMorph: rubro2;
		addMorph: rubro3;
		addMorph: tituloValor;
		addMorph: inputValor.

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
	tituloValor
		left: 10;
		top: rurbro1 bottom + 20.
	inputValor
		left: 10;
		top: tituloValor bottom + 20
]

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeTrabajo >> agregarLista: aString [

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

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeTrabajo >> initialize [

	super initialize.
	self
		agregarLista: 'Solicitudes';
		agregarCampos;
		agregarBoton;
				update: MiGestor colSolicitudesPendientes
]

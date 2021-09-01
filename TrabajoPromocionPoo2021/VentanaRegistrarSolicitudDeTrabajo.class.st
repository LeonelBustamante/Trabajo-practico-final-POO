Class {
	#name : #VentanaRegistrarSolicitudDeTrabajo,
	#superclass : #VentanaRegistrarSolicitud,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeTrabajo >> actualizarTabla [

	tabla setText: MiGestor colSolicitudesPendientesToString
]

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitudDeTrabajo >> agregarBoton [

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

		inputNombre input isEmpty not & controlRubro
		& inputValor isEmpty not & controlEmpresa ifTrue: [ 
			| unaSolicitud |
			unaSolicitud := DeTrabajo
				                descripcion: rubro
				                valor: inputValor input.
			MiGestor
				registrarSolicitud: unaSolicitud
				postulante: inputNombre input.
			tabla setText: MiGestor colSolicitudesPendientesToString ] ]
]

{ #category : #accessing }
VentanaRegistrarSolicitudDeTrabajo >> agregarCampos [
	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox
		               nombre: 'Ingrese aqui el nombre'
		               tamanio: 450 @ 90.


	tituloValor := Texto titulo: 'Ingrese el valor' tamanio: 20.
	inputValor := TextBox
		              nombre: 'Ingrese aqui el valor'
		              tamanio: 450 @ 90.

	self
		agregarRubros;
				addMorph: tituloNombre;
		addMorph: inputNombre;
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

{ #category : #accessing }
VentanaRegistrarSolicitudDeTrabajo >> agregarLista: aString [

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

{ #category : #accessing }
VentanaRegistrarSolicitudDeTrabajo >> agregarRubros [

	tituloRubro := Texto
		                     titulo: 'Marque su categoria(descripcion)'
		                     tamanio: 20.
	rurbro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	rubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	rubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.

	self
		addMorph: tituloRubro;
		addMorph: rurbro1;
		addMorph: rubro2;
		addMorph: rubro3
]

{ #category : #initialization }
VentanaRegistrarSolicitudDeTrabajo >> initialize [

	super initialize.
	self
		agregarLista: 'Solicitudes';
		agregarCampos;
		agregarBoton;
		actualizarTabla
]

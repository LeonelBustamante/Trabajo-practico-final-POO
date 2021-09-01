Class {
	#name : #VentanaRegistrarPostulantePersona,
	#superclass : #VentanaRegistrarPostulante,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulantePersona >> agregarBoton [

	| botonRegistro |
	botonRegistro := Boton nombre: 'Registrar' tamanio: 200 @ 30.
	self addMorph: botonRegistro.
	botonRegistro
		modalBotonConfirmar;
		center: self center;
		bottom: self bottom - 10.

	MiGestor addDependent: self.


	botonRegistro mouseAction: [ 
		|  controlRubro |

		controlRubro := rubro1 estado | rubro2 estado | rubro3 estado.

		inputNombre isNotEmpty & controlRubro ifTrue: [ 
			| unaPersona unaColAptitudes |
					unaColAptitudes := OrderedCollection new.
			rubro1 estado ifTrue: [  unaColAptitudes add: rubro1 label ].
			rubro2 estado ifTrue: [  unaColAptitudes add: rubro2 label ].
			rubro3 estado ifTrue: [  unaColAptitudes add: rubro3 label ].

			unaPersona := Persona
				              nombre: inputNombre input
				              aptitudes: unaColAptitudes.
			MiGestor registrarPostulante: unaPersona ] ]
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulantePersona >> agregarCampos [

	| tituloNombre tituloRubro |
	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox nombre: 'Ingrese aqui el nombre' tamanio: 450 @ 90.

	tituloRubro := Texto titulo: 'Marque su categoria(aptitud)' tamanio: 20.
	rubro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	rubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	rubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.

	self
		addMorph: tituloRubro;
		addMorph: rubro1;
		addMorph: rubro2;
		addMorph: rubro3
;
		addMorph: tituloNombre;
		addMorph: inputNombre.

	tituloNombre
		left: 10;
		top: 150.
	inputNombre
		left: 10;
		top: tituloNombre bottom + 20.
	tituloRubro
		left: 10;
		top: inputNombre bottom + 20.
	rubro1
		left: 10;
		top: tituloRubro bottom + 20.
	rubro2
		left: 130;
		top: tituloRubro bottom + 20.
	rubro3
		left: 250;
		top: tituloRubro bottom + 20
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulantePersona >> agregarLista: aString [

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
VentanaRegistrarPostulantePersona >> initialize [

	super initialize.
	self
		agregarLista: 'Postulantes';
		agregarCampos;
		agregarBoton;
		
		update: MiGestor colPostulantes
]

Class {
	#name : #VentanaRegistrarPostulantePersona,
	#superclass : #VentanaRegistrarPostulante,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulantePersona >> actualizarTabla [

	tabla setText: MiGestor colPostulantesToString
]

{ #category : #accessing }
VentanaRegistrarPostulantePersona >> agregarBoton [

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
		| unaColAptitudes controlRubro |
		unaColAptitudes := OrderedCollection new.
		controlRubro := checkboxRubro1 estado | checkboxRubro2 estado 	|	checkboxRubro3 estado.

		inputNombre isEmpty not & controlRubro ifTrue: [ 
			| unaPersona |
			checkboxRubro1 estado ifTrue: [  unaColAptitudes add: checkboxRubro1 label ].
			checkboxRubro2 estado ifTrue: [  unaColAptitudes add: checkboxRubro2 label ].
			checkboxRubro3 estado ifTrue: [  unaColAptitudes add: checkboxRubro3 label ].

			unaPersona := Persona nombre: inputNombre input aptitudes: unaColAptitudes.
			MiGestor registrarPostulante: unaPersona.
			tabla setText: MiGestor colPostulantesToString ] ]
]

{ #category : #accessing }
VentanaRegistrarPostulantePersona >> agregarCampos [

	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox
		               nombre: 'Ingrese aqui el nombre'
		               tamanio: 450 @ 90.

	self
		agregarRubro;
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
	checkboxRubro1
		left: 10;
		top: tituloRubro bottom + 20.
	checkboxRubro2
		left: 130;
		top: tituloRubro bottom + 20.
	checkboxRubro3
		left: 250;
		top: tituloRubro bottom + 20
]

{ #category : #accessing }
VentanaRegistrarPostulantePersona >> agregarLista: aString [

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

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulantePersona >> agregarRubro [

	tituloRubro := Texto
	
		               titulo: 'Marque su categoria(aptitud)'
		               tamanio: 20.
	checkboxRubro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	checkboxRubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	checkboxRubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.

	self
		addMorph: tituloRubro;
		addMorph: checkboxRubro1;
		addMorph: checkboxRubro2;
		addMorph: checkboxRubro3
]

{ #category : #initialization }
VentanaRegistrarPostulantePersona >> initialize [

	super initialize.
	self
		agregarLista: 'Postulantes';
		agregarCampos;
		agregarBoton;
		actualizarTabla
]

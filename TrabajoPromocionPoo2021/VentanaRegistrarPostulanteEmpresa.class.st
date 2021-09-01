Class {
	#name : #VentanaRegistrarPostulanteEmpresa,
	#superclass : #VentanaRegistrarPostulante,
	#instVars : [
		'tituloPuntos',
		'inputPuntos',
		'tituloProductos',
		'checkbox1',
		'checkbox2',
		'checkbox3',
		'checkbox4',
		'checkbox5',
		'checkbox6',
		'botonRegistro'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulanteEmpresa >> actualizarTabla [

	tabla setText: MiGestor colPostulantesToString
]

{ #category : #accessing }
VentanaRegistrarPostulanteEmpresa >> agregarBoton [

	botonRegistro := Boton nombre: 'Registrar' tamanio: 200 @ 30.
	botonRegistro modalBotonConfirmar.
	self addMorph: botonRegistro.
	botonRegistro
		center: self center;
		bottom: self bottom - 10.


	botonRegistro mouseAction: [ 
		| controlRubro rubro |
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
						checkboxRubro3 buttonMorph selected
							ifTrue: [ 
								rubro := checkboxRubro3 label.
								controlRubro := true ]
							ifFalse: [ controlRubro := false ] ] ].

		inputNombre isEmpty not & inputPuntos isEmpty not & controlRubro 
			ifTrue: [ 
				checkbox1 estado | checkbox2 estado | checkbox3 estado
				| checkbox4 estado | checkbox5 estado | checkbox6 estado
					ifTrue: [ 
						| unaEmpresa unaColProductos |
						unaColProductos := OrderedCollection new.

						checkbox1 estado ifTrue: [ unaColProductos add: checkbox1 label ].
						checkbox2 estado ifTrue: [ unaColProductos add: checkbox2 label ].
						checkbox3 estado ifTrue: [ unaColProductos add: checkbox3 label ].
						checkbox4 estado ifTrue: [ unaColProductos add: checkbox4 label ].
						checkbox5 estado ifTrue: [ unaColProductos add: checkbox5 label ].
						checkbox6 estado ifTrue: [ unaColProductos add: checkbox6 label ].

						unaEmpresa := Combinada
							              nombre: inputNombre input
							              rubro: rubro
							              puntos: inputPuntos input
							              colProductos: unaColProductos.

						MiGestor registrarPostulante: unaEmpresa.
						tabla setText: MiGestor colPostulantesToString ]
					ifFalse: [ "Datos basicos controlados, ahora productos"
						| unaEmpresa |
						unaEmpresa := Empresa
							              nombre: inputNombre input
							              rubro: rubro
							              puntos: inputPuntos input.

						MiGestor registrarPostulante: unaEmpresa.
						tabla setText: MiGestor colPostulantesToString ]
 ] ]
]

{ #category : #accessing }
VentanaRegistrarPostulanteEmpresa >> agregarCampos [

	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox
		               nombre: 'Ingrese aqui el nombre'
		               tamanio: 450 @ 90.
	tituloPuntos := Texto titulo: 'Ingrese los puntos' tamanio: 20.
	inputPuntos := TextBox nombre: 'Ingrese puntos' tamanio: 450 @ 90.


	self
		agregarRubro;
		agregarProductos;
		addMorph: tituloNombre;
		addMorph: inputNombre;
		addMorph: tituloPuntos;
		addMorph: inputPuntos.

	tituloNombre
		left: 10;
		top: 150.
	inputNombre
		left: 10;
		top: tituloNombre bottom + 20.
	tituloPuntos
		left: 10;
		top: inputNombre bottom + 20.
	inputPuntos
		left: 10;
		top: tituloPuntos bottom + 20.
	tituloRubro
		left: 10;
		top: inputPuntos  bottom + 20.
	checkboxRubro1
		left: 10;
		top: tituloRubro bottom + 20.
	checkboxRubro2
		left: 130;
		top: tituloRubro bottom + 20.
	checkboxRubro3
		left: 250;
		top: tituloRubro bottom + 20.

	tituloProductos
		top: checkboxRubro1 bottom + 20;
		left: 10.
	checkbox1
		top: tituloProductos bottom + 20;
		left: 10.
	checkbox2
		top: tituloProductos bottom + 20;
		left: 130.
	checkbox3
		top: tituloProductos bottom + 20;
		left: 250.
	checkbox4
		top: checkbox1 bottom + 20;
		left: 10.
	checkbox5
		top: checkbox1 bottom + 20;
		left: 130.
	checkbox6
		top: checkbox1 bottom + 20;
		left: 250
]

{ #category : #accessing }
VentanaRegistrarPostulanteEmpresa >> agregarLista: aString [

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
VentanaRegistrarPostulanteEmpresa >> agregarProductos [

	tituloProductos := Texto
		                   titulo: 'Marque si tiene productos'
		                   tamanio: 20.

	checkbox1 := Checkbox nombre: 'Pintura' tamanio: 100 @ 20.
	checkbox2 := Checkbox nombre: 'Pincel' tamanio: 100 @ 20.
	checkbox3 := Checkbox nombre: 'Colchon' tamanio: 100 @ 20.
	checkbox4 := Checkbox nombre: 'Almohada' tamanio: 100 @ 20.
	checkbox5 := Checkbox nombre: 'Monitor' tamanio: 100 @ 20.
	checkbox6 := Checkbox nombre: 'Teclado' tamanio: 100 @ 20.

	self
		addMorph: tituloProductos;
		addMorph: checkbox1;
		addMorph: checkbox2;
		addMorph: checkbox3;
		addMorph: checkbox4;
		addMorph: checkbox5;
		addMorph: checkbox6
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulanteEmpresa >> agregarRubro [

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
VentanaRegistrarPostulanteEmpresa >> initialize [

	super initialize.
	self
		agregarLista: 'Postulantes';
		agregarCampos;
		agregarBoton;
		actualizarTabla
]

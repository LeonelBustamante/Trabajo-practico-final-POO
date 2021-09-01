Class {
	#name : #VentanaRegistrarEmpresaSolicitante,
	#superclass : #Ventana,
	#instVars : [
		'tituloNombre',
		'inputNombre',
		'tituloRubro',
		'inputRubro',
		'tituloPuntos',
		'inputPuntos',
		'tituloProductos',
		'checkbox1',
		'checkbox2',
		'checkbox3',
		'checkbox4',
		'checkbox5',
		'checkbox6',
		'checkbox7',
		'checkbox8',
		'checkbox9'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #accessing }
VentanaRegistrarEmpresaSolicitante >> actualizarTabla [

	tabla setText: MiGestor colEmpresasSolicitantesToString 
]

{ #category : #accessing }
VentanaRegistrarEmpresaSolicitante >> agregarBoton [

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
	tabla setText: MiGestor colPropuestasToString.
	"Logica"
	botonRegistro mouseAction: [
		| controlRubro rubro |
		checkbox7 buttonMorph selected ifTrue: [ 
				rubro := checkbox7 label.
				controlRubro := true ]
			ifFalse: [  checkbox8 buttonMorph selected
					ifTrue: [ 
						rubro := checkbox8 label.
						controlRubro := true ]
					ifFalse: [ 
						checkbox9 buttonMorph selected
							ifTrue: [ 
								rubro := checkbox9 label.
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

						MiGestor registrarEmpresaSolicitante: unaEmpresa.
						tabla setText: MiGestor colEmpresasSolicitantesToString ]
					ifFalse: [ "Datos basicos controlados, ahora productos"
						| unaEmpresa |
						unaEmpresa := Empresa
							              nombre: inputNombre input
							              rubro: rubro
							              puntos: inputPuntos input.

						MiGestor registrarEmpresaSolicitante: unaEmpresa.
						tabla setText: MiGestor colEmpresasSolicitantesToString ] ] ]
]

{ #category : #accessing }
VentanaRegistrarEmpresaSolicitante >> agregarCampos [

	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox nombre: 'Ingrese el nombre' tamanio: 450 @ 90.

	tituloPuntos := Texto titulo: 'Ingrese los puntos' tamanio: 20.
	inputPuntos := TextBox nombre: 'Ingrese puntos' tamanio: 450 @ 90.

	self
		agregarRubros;
		agregarProductos;
		addMorph: tituloNombre;
		addMorph: inputNombre;
		addMorph: tituloPuntos;
		addMorph: inputPuntos;
		addMorph: tituloProductos.

	tituloNombre
		top: 150;
		left: 10.
	inputNombre
		top: tituloNombre bottom + 20;
		left: 10.

	tituloRubro
		top: inputNombre bottom + 20;
		left: 10.
	checkbox7
		top: tituloRubro bottom + 20;
		left: 10.
	checkbox8
		top: tituloRubro bottom + 20;
		left: 130.
	checkbox9
		top: tituloRubro bottom + 20;
		left: 250.

	tituloPuntos
		top: checkbox7 bottom + 20;
		left: 10.
	inputPuntos
		top: tituloPuntos bottom + 20;
		left: 10.

	tituloProductos
		top: inputPuntos bottom + 20;
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
VentanaRegistrarEmpresaSolicitante >> agregarLista: aString [

	"Agrego titulo y lista"

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
tabla:= Tabla tamanio: 600 @ 500.

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
VentanaRegistrarEmpresaSolicitante >> agregarProductos [

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
VentanaRegistrarEmpresaSolicitante >> agregarRubros [

	tituloRubro := Texto titulo: 'Marque su categoria' tamanio: 20.
	checkbox7 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	checkbox8 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	checkbox9 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.

	self
		addMorph: tituloRubro;
		addMorph: checkbox7;
		addMorph: checkbox8;
		addMorph: checkbox9
]

{ #category : #initialization }
VentanaRegistrarEmpresaSolicitante >> initialize [

	super initialize.
	self
		agregarLista: 'Empresas registradas';
		agregarCampos;
		agregarBoton; actualizarTabla 
]

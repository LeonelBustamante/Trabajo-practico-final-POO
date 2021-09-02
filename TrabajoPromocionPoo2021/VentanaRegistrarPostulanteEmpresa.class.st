Class {
	#name : #VentanaRegistrarPostulanteEmpresa,
	#superclass : #VentanaRegistrarPostulante,
	#instVars : [
		'inputPuntos',
		'producto1',
		'producto2',
		'producto3',
		'producto4',
		'producto5',
		'producto6',
		'tipoEmpresa'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulanteEmpresa >> agregarBoton [

	| botonRegistro |
	botonRegistro := Boton nombre: 'Registrar' tamanio: 200 @ 30.
	self addMorphCentered: botonRegistro.
	botonRegistro
		modalBotonConfirmar;
		top: self bottom - 20.

	MiGestor addDependent: self.

	botonRegistro mouseAction: [ 
		| unaEmpresa controlRubro rubro |
		rubro1 estado
			ifTrue: [ 
				rubro := rubro1 label.
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

		"VERIFICACION DE CAMPOS"
		inputNombre isNotEmpty & inputPuntos isNotEmpty & controlRubro 
			ifTrue: [ 
				| unaColProductos |
				unaColProductos := self cargaProductos.
				unaColProductos
					ifNotNil: [ 
						unaEmpresa := Combinada
							              nombre: inputNombre input
							              rubro: rubro
							              puntos: inputPuntos input
							              tipo: tipoEmpresa selectedItem
							              colProductos: unaColProductos.
						MiGestor registrarPostulante: unaEmpresa ]
					ifNil: [ 
						unaEmpresa := Empresa
							              nombre: inputNombre input
							              rubro: rubro
							              puntos: inputPuntos input
							              tipo: tipoEmpresa selectedItem.
						MiGestor registrarPostulante: unaEmpresa ] ] ]
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulanteEmpresa >> agregarCampos [

	"Variables"

	| tituloNombre tituloPuntos tituloRubro tituloProductos tituloTipo |
	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox nombre: 'Ingrese el nombre' tamanio: 450 @ 90.

	tituloPuntos := Texto titulo: 'Ingrese los puntos' tamanio: 20.
	inputPuntos := TextBox nombre: 'Ingrese puntos' tamanio: 450 @ 90.

	tituloRubro := Texto titulo: 'Marque su categoria' tamanio: 20.
	rubro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	rubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	rubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.

	tituloProductos := Texto
		                   titulo: 'Marque si tiene productos'
		                   tamanio: 20.
	producto1 := Checkbox nombre: 'Pintura' tamanio: 100 @ 20.
	producto2 := Checkbox nombre: 'Pincel' tamanio: 100 @ 20.
	producto3 := Checkbox nombre: 'Colchon' tamanio: 100 @ 20.
	producto4 := Checkbox nombre: 'Almohada' tamanio: 100 @ 20.
	producto5 := Checkbox nombre: 'Monitor' tamanio: 100 @ 20.
	producto6 := Checkbox nombre: 'Teclado' tamanio: 100 @ 20.

	tituloTipo := Texto titulo: 'Ingrese el tipo' tamanio: 20.
	tipoEmpresa := SearchMorph new.
	tipoEmpresa
		extent: 450 @ 50;
		searchList: #( 'EMPRESA UNIFORME' 'EMPRESA PUNTUAL' ).

	"Agregar Morph"
	self
		addMorph: tituloTipo;
		addMorph: tipoEmpresa;
		addMorph: tituloNombre;
		addMorph: inputNombre;
		addMorph: tituloRubro;
		addMorph: rubro1;
		addMorph: rubro2;
		addMorph: rubro3;
		addMorph: tituloPuntos;
		addMorph: inputPuntos;
		addMorph: tituloProductos;
		addMorph: producto1;
		addMorph: producto2;
		addMorph: producto3;
		addMorph: producto4;
		addMorph: producto5;
		addMorph: producto6.

	"estilo"
	tituloNombre
		top: 150;
		left: 10.
	inputNombre
		top: tituloNombre bottom + 20;
		left: 10.

	tituloRubro
		top: inputNombre bottom + 20;
		left: 10.
	rubro1
		top: tituloRubro bottom + 20;
		left: 10.
	rubro2
		top: tituloRubro bottom + 20;
		left: 130.
	rubro3
		top: tituloRubro bottom + 20;
		left: 250.

	tituloPuntos
		top: rubro1 bottom + 20;
		left: 10.
	inputPuntos
		top: tituloPuntos bottom + 20;
		left: 10.

	tituloProductos
		top: inputPuntos bottom + 20;
		left: 10.
	producto1
		left: self left + 10;
		top: tituloProductos bottom + 20.
	producto2
		left: self left + 10;
		top: producto1 bottom + 20.
	producto3
		left: self left + 130;
		top: tituloProductos bottom + 20.
	producto4
		left: self left + 130;
		top: producto1 bottom + 20.
	producto5
		left: self left + 250;
		top: tituloProductos bottom + 20.
	producto6
		left: self left + 250;
		top: producto1 bottom + 20.
	tituloTipo
		left: self left + 10;
		top: producto2 bottom + 20.
	tipoEmpresa
		left: self left + 10;
		top: tituloTipo bottom + 20
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulanteEmpresa >> agregarLista: aString [

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := Tabla tamanio: 500@500.

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
VentanaRegistrarPostulanteEmpresa >> cargaProductos [

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

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulanteEmpresa >> initialize [

	super initialize.
	self
		agregarLista: 'Postulantes';
		agregarCampos;
		agregarBoton;
		update: MiGestor colPostulantes 
]

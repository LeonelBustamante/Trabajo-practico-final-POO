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
		'rubro1',
		'rubro2',
		'rubro3',
		'producto1',
		'producto2',
		'producto3',
		'producto4',
		'producto5',
		'producto6'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #accessing }
VentanaRegistrarEmpresaSolicitante >> agregarBoton [

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
				unaColProductos ifNotNil: [ 
					unaEmpresa := Combinada
						              nombre: inputNombre input
						              rubro: rubro
						              puntos: inputPuntos input
						              colProductos: unaColProductos ] 
			ifNil: [ 
				unaEmpresa := Empresa
					              nombre: inputNombre input
					              rubro: rubro
					              puntos: inputPuntos input ].
		MiGestor registrarEmpresaSolicitante: unaEmpresa ]]
]

{ #category : #accessing }
VentanaRegistrarEmpresaSolicitante >> agregarCampos [
	"Variables"
	tituloNombre := Texto titulo: 'Ingrese el nombre' tamanio: 20.
	inputNombre := TextBox nombre: 'Ingrese el nombre' tamanio: 450 @ 90.
	
	tituloPuntos := Texto titulo: 'Ingrese los puntos' tamanio: 20.
	inputPuntos := TextBox nombre: 'Ingrese puntos' tamanio: 450 @ 90.
	
	tituloRubro := Texto titulo: 'Marque su categoria' tamanio: 20.
	rubro1 := Checkbox nombre: 'Pintureria' tamanio: 100 @ 20.
	rubro2 := Checkbox nombre: 'Colchoneria' tamanio: 100 @ 20.
	rubro3 := Checkbox nombre: 'Electro' tamanio: 100 @ 20.
	
	tituloProductos := Texto titulo: 'Marque si tiene productos' tamanio: 20.
	producto1 := Checkbox nombre: 'Pintura' tamanio: 100 @ 20.
	producto2 := Checkbox nombre: 'Pincel' tamanio: 100 @ 20.
	producto3 := Checkbox nombre: 'Colchon' tamanio: 100 @ 20.
	producto4 := Checkbox nombre: 'Almohada' tamanio: 100 @ 20.
	producto5 := Checkbox nombre: 'Monitor' tamanio: 100 @ 20.
	producto6 := Checkbox nombre: 'Teclado' tamanio: 100 @ 20.

	"Agregar Morph"
	self
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
	tituloNombre top: 150; left: 10.
	inputNombre top: tituloNombre bottom + 20; left: 10.
	
 	tituloRubro top: inputNombre bottom + 20; left: 10.
	rubro1 top: tituloRubro bottom + 20; left: 10.
	rubro2 top: tituloRubro bottom + 20; left: 130.
	rubro3 top: tituloRubro bottom + 20; left: 250.
	
 	tituloPuntos top: rubro1 bottom + 20; left: 10.
	inputPuntos top: tituloPuntos bottom + 20; left: 10.
	
	tituloProductos top: inputPuntos bottom + 20; left: 10.
	producto1 top: tituloProductos bottom + 20; left: 10.
	producto2 top: tituloProductos bottom + 20; left: 130.
	producto3 top: tituloProductos bottom + 20; left: 250.
	producto4 top: producto1 bottom + 20; left: 10.
	producto5 top: producto1 bottom + 20; left: 130.
	producto6 top: producto1 bottom + 20; left: 250
]

{ #category : #accessing }
VentanaRegistrarEmpresaSolicitante >> agregarLista: aString [

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := Tabla tamanio: 600 @ 500.
	self addMorph: titulo; addMorph: tabla.
	titulo left: self right - 700; top: 150.
	tabla left: self right - 700; top: 200.

]

{ #category : #private }
VentanaRegistrarEmpresaSolicitante >> cargaProductos [

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
VentanaRegistrarEmpresaSolicitante >> initialize [

	super initialize.

	self
		agregarLista: 'Empresas registradas';
		agregarCampos;
		agregarBoton;
		update: MiGestor colEmpresasSolicitantes  
]

{ #category : #updating }
VentanaRegistrarEmpresaSolicitante >> update: unaCol [

	unaCol isEmpty
		ifTrue: [ tabla setText: 'Coleccion de Empresas Solicitantes vacia' ]
		ifFalse: [ tabla setText: (MiGestor colToString: unaCol) ]
]

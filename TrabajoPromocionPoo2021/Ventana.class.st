Class {
	#name : #Ventana,
	#superclass : #BorderedMorph,
	#instVars : [
		'tabla',
		'exit'
	],
	#classVars : [
		'MiGestor'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #constructor }
Ventana class >> titulo: unTitulo gestor: unGestor [

	| temp |
	temp := self new.
	MiGestor := unGestor.
	temp agregarTitulo: unTitulo; openCenteredInWorld; left: 550
]

{ #category : #'as yet unclassified' }
Ventana >> agregarAPantalla [ 

	exit mouseAction: [ self cerrar ].
	self addMorph: exit.

]

{ #category : #accessing }
Ventana >> agregarBoton [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Ventana >> agregarEstiloBotones [ 

	exit left: self right - 100; top: 30.
]

{ #category : #accessing }
Ventana >> agregarLista: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Ventana >> agregarTitulo: aString [

	| titulo |
	titulo := Texto titulo: aString.
	self addMorph: titulo
]

{ #category : #'as yet unclassified' }
Ventana >> botonCerrar [

	exit := Boton nombre: 'X' tamanio: 30 @ 30.

	self
		agregarEstiloBotones;
		agregarAPantalla
]

{ #category : #'as yet unclassified' }
Ventana >> cerrar [

	self delete
]

{ #category : #'as yet unclassified' }
Ventana >> estilo [

	self extent: 1400 @ 800; color: Color transparent; borderColor: Color transparent
]

{ #category : #'as yet unclassified' }
Ventana >> initialize [

	super initialize.
	self beSticky; estilo; botonCerrar
]

{ #category : #'as yet unclassified' }
Ventana >> update: unaCol [

	unaCol isEmpty
		ifTrue: [ tabla setText: 'Esperando Ingreso' ]
		ifFalse: [ tabla setText: (MiGestor colToString: unaCol) ]
]

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

{ #category : #addMorph }
Ventana >> agregarAPantalla [ 

	exit mouseAction: [ self cerrar ].
	self addMorph: exit.

]

{ #category : #'Agregando componentes' }
Ventana >> agregarBoton [

	^ self subclassResponsibility
]

{ #category : #'Agregando componentes' }
Ventana >> agregarEstiloBotones [ 

	exit left: self right - 100; top: 30.
]

{ #category : #'Agregando componentes' }
Ventana >> agregarLista: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #'Agregando componentes' }
Ventana >> agregarTitulo: aString [

	| titulo |
	titulo := Texto titulo: aString.
	self addMorph: titulo
]

{ #category : #'Agregando componentes' }
Ventana >> botonCerrar [

	exit := Boton nombre: 'X' tamanio: 30 @ 30.

	self
		agregarEstiloBotones;
		agregarAPantalla
]

{ #category : #acciones }
Ventana >> cerrar [

	self delete
]

{ #category : #estilos }
Ventana >> estilo [

	self extent: 1400 @ 800; color: Color transparent; borderColor: Color transparent
]

{ #category : #initialization }
Ventana >> initialize [

	super initialize.
	self beSticky; estilo; botonCerrar
]

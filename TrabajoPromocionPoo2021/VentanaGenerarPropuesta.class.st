Class {
	#name : #VentanaGenerarPropuesta,
	#superclass : #Ventana,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaGenerarPropuesta >> agregarBoton [

	| botonRegistro |
	botonRegistro := Boton nombre: 'Generar Propuestas' tamanio: 700 @ 30.
	self addMorphCentered: botonRegistro.
	botonRegistro modalBotonConfirmar.

	MiGestor addDependent: self.

	botonRegistro mouseAction: [ 
		self
			removeMorph: botonRegistro;
			agregarLista: 'Propuestas generadas'.		MiGestor generarPropuestas. ]
]

{ #category : #'as yet unclassified' }
VentanaGenerarPropuesta >> agregarLista: aString [

	"Agrego titulo y lista"

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := Tabla tamanio: 1000 @ 500.
	self addMorphCentered: titulo.
	self addMorphCentered: tabla.
	titulo top: tabla top - 50
]

{ #category : #'as yet unclassified' }
VentanaGenerarPropuesta >> initialize [

	super initialize.
	self agregarBoton
]

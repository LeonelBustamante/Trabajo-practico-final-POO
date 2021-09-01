Class {
	#name : #VentanaGenerarPropuesta,
	#superclass : #Ventana,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #accessing }
VentanaGenerarPropuesta >> actualizarTabla [

	tabla setText: MiGestor colPropuestasToString 
]

{ #category : #accessing }
VentanaGenerarPropuesta >> actualizarTabla: unParametro [

	tabla setText: unParametro
]

{ #category : #accessing }
VentanaGenerarPropuesta >> agregarBoton [

	| boton |
	boton := Boton nombre: 'Generar Propuestas' tamanio: 700 @ 30.
	boton modalBotonConfirmar.
	self addMorphCentered: boton.

	boton mouseAction: [ 

		MiGestor generarPropuestas.
		self
			removeMorph: boton;
			agregarLista: 'Propuestas generadas';
			actualizarTabla:		MiGestor colPropuestasToString. ]
]

{ #category : #accessing }
VentanaGenerarPropuesta >> agregarLista: aString [

	"Agrego titulo y lista"

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := RubScrolledTextMorph new.
	tabla
		extent: 1000 @ 500;
		beReadOnly.
	self addMorphCentered: titulo.
	self addMorphCentered: tabla.
	titulo top: tabla top - 50
]

{ #category : #initialization }
VentanaGenerarPropuesta >> initialize [

	super initialize.
	self agregarBoton
]

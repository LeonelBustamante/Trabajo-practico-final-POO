Class {
	#name : #VentanaAceptarPropuesta,
	#superclass : #Ventana,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaAceptarPropuesta >> agregarBoton [

	| botonRegistro |
	botonRegistro := Boton nombre: 'Aceptar Propuestas' tamanio: 700 @ 30.
	self addMorphCentered: botonRegistro.
	botonRegistro modalBotonConfirmar.

	MiGestor addDependent: self.

	botonRegistro mouseAction: [ 
		self
			removeMorph: botonRegistro;
			agregarLista: 'Coleccion Solicitudes Resueltas'.
		MiGestor aceptarPropuestas ]
]

{ #category : #'as yet unclassified' }
VentanaAceptarPropuesta >> agregarLista: aString [

	"Agrego titulo y lista"

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := Tabla tamanio: 1000 @ 500.
	self addMorphCentered: titulo.
	self addMorphCentered: tabla.
	titulo top: tabla top - 50
]

{ #category : #'as yet unclassified' }
VentanaAceptarPropuesta >> agregarLista: aString lista2: aString2 lista3: aString3 [

	"Agrego titulo y lista"

	| titulo1 titulo2 titulo3 |
	titulo1 := Texto titulo: aString tamanio: 20.
	titulo2 := Texto titulo: aString2 tamanio: 20.
	titulo3 := Texto titulo: aString3 tamanio: 20.
	tabla1 := Tabla tamanio: 400 @ 500.
	tabla2 := Tabla tamanio: 400 @ 500.
	tabla3 := Tabla tamanio: 400 @ 500.

	self
		addMorphCentered: titulo1;
		addMorphCentered: titulo2;
		addMorphCentered: titulo3;
		addMorphCentered: tabla1;
		addMorphCentered: tabla2;
		addMorphCentered: tabla3.

	titulo1
		top: tabla1 top - 50;
		left: 0.
	titulo2
		top: tabla2 top - 50;
		left: 450.
	titulo3
		top: tabla3 top - 50;
		left: 900.
	tabla1 left: 0.
	tabla2 left: tabla1 right + 50.
	tabla3 left: tabla2 right + 50
]

{ #category : #'as yet unclassified' }
VentanaAceptarPropuesta >> initialize [

	super initialize.
	self agregarBoton
]

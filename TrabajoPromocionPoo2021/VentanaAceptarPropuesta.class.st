Class {
	#name : #VentanaAceptarPropuesta,
	#superclass : #Ventana,
	#instVars : [
		'tabla1',
		'tabla2',
		'tabla3'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #accessing }
VentanaAceptarPropuesta >> actualizarTabla:unaTabla parametro: unParametro [

	unaTabla  setText: unParametro
]

{ #category : #'as yet unclassified' }
VentanaAceptarPropuesta >> actualizarTablas [ 
self
			actualizarTabla: tabla1
			parametro: MiGestor colPropuestasToString.
		self
			actualizarTabla: tabla2
			parametro: MiGestor colSolicitudesPendientesToString.
		self
			actualizarTabla: tabla3
			parametro: MiGestor colSolicitudesResueltasToString
]

{ #category : #'Agregando componentes' }
VentanaAceptarPropuesta >> agregarBoton [

	| boton |
	boton := Boton nombre: 'Aceptar Propuesta' tamanio: 700 @ 30.
	boton modalBotonConfirmar.
	self addMorphCentered: boton.
	boton top: tabla1 bottom + 30.
	boton mouseAction: [ 
		MiGestor aceptarPropuestas.
		self
			actualizarTabla: tabla1
			parametro: MiGestor colPropuestasToString.
		self
			actualizarTabla: tabla2
			parametro: MiGestor colSolicitudesPendientesToString.
		self
			actualizarTabla: tabla3
			parametro: MiGestor colSolicitudesResueltasToString ]
]

{ #category : #accessing }
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

{ #category : #initialization }
VentanaAceptarPropuesta >> initialize [

	super initialize.
	self
		agregarLista: 'Propuestas'
		lista2: 'Solicitudes pendientes'
		lista3: 'Solicitudes resueltas';
		agregarBoton;
		actualizarTablas.
]

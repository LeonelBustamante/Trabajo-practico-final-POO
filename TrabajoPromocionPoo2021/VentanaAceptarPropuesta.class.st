Class {
	#name : #VentanaAceptarPropuesta,
	#superclass : #Ventana,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaAceptarPropuesta >> accionListadoEmpresa [

	MiGestor colPropuestasToString.
	self		agregarLista: 'Listado Propuestas';		actualizarTabla
]

{ #category : #accessing }
VentanaAceptarPropuesta >> actualizarTabla:unParametro [

	tabla setText: unParametro . 
]

{ #category : #accessing }
VentanaAceptarPropuesta >> agregarBoton [

	| boton |
	boton := Boton nombre: 'Aceptar Propuesta' tamanio: 700 @ 30.
	boton modalBotonConfirmar.
	self addMorphCentered: boton.
boton top: tabla bottom + 30.
	boton mouseAction: [ 
		 self actualizarTabla:MiGestor colPropuestasToString.
 ]
]

{ #category : #accessing }
VentanaAceptarPropuesta >> agregarLista: aString [

	"Agrego titulo y lista"

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := Tabla tamanio: 1000 @ 500.

	self
		addMorphCentered: titulo;
		addMorphCentered: tabla.

	titulo top: tabla top - 50
]

{ #category : #initialization }
VentanaAceptarPropuesta >> initialize [

	super initialize.
	self agregarLista: 'Propuestas validas';
		agregarBoton;
		actualizarTabla: MiGestor colPropuestasToString
]

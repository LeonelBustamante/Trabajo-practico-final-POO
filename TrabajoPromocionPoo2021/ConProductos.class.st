Class {
	#name : #ConProductos,
	#superclass : #DeServicio,
	#instVars : [
		'colCestaProductos'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
ConProductos class >> descripcion: unaDescripcion duracion: unaDuracion valor: unValor tipoPago: unTipoPago colCestaProductos: unaColeccion [

	| nuevaSol |
	nuevaSol := self new.
	nuevaSol
		iniciarSolicituDescripcion: unaDescripcion
		duracion: unaDuracion
		valor: unValor
		tipoPago: unTipoPago
		colCestaProductos: unaColeccion.

	^ nuevaSol
]

{ #category : #getters }
ConProductos >> colToString: unaColeccion [

	| txt |
	txt := ' '.
	unaColeccion do: [ :each | txt := txt , each , ' - ' ].
	^ txt
]

{ #category : #'as yet unclassified' }
ConProductos >> conProductos [
	^ true
]

{ #category : #accessing }
ConProductos >> getColCestaProductos [

	^ colCestaProductos
]

{ #category : #'as yet unclassified' }
ConProductos >> iniciarSolicituDescripcion: unaDescripcion duracion: unaDuracion valor: unValor tipoPago: unTipoPago colCestaProductos: unaColeccion [ 

	self
		iniciarSolicituDescripcion: unaDescripcion
		duracion: unaDuracion
		valor: unValor
		tipoPago: unTipoPago.
	colCestaProductos := unaColeccion
]

{ #category : #accessing }
ConProductos >> toString [

	| col |
	col := self colToString: colCestaProductos.


	^ 'Solicitud con productos ID: ' , id asString , String cr
	  , 'Descripcion: ' , descripcion , String cr , 'Tipo de pago: '
	  , tipoPago , String cr , 'ValorTotal: ' , valor asString
	  , String cr , 'Duracion servicio: ' , duracionServicio asString
	  , String cr , 'Productos: ' , col , String cr
]

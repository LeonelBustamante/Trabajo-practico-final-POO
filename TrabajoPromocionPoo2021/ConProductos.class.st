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

{ #category : #'as yet unclassified' }
ConProductos >> colToString: unaColeccion [
	^String streamContents: [:s | 
		unaColeccion do: [:each | s nextPutAll: each asString]]
]

{ #category : #'as yet unclassified' }
ConProductos >> conProductos [
	^ true
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
ConProductos >> toString [

	| col txt |
	txt := super toString.
	col := self colToString: colCestaProductos.
	^ txt , String cr , 'Productos: ' , col , ' (ConProductos) ',String cr
]

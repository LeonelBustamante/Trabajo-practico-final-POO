Class {
	#name : #ConProductos,
	#superclass : #DeServicio,
	#instVars : [
		'colCestaProductos'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #constructor }
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

{ #category : #get }
ConProductos >> colCestaProductos [

	^ colCestaProductos
]

{ #category : #auxiliares }
ConProductos >> colToString: unaColeccion [
	^String streamContents: [:s | 
		unaColeccion do: [:each | s nextPutAll: each asString]]
]

{ #category : #auxiliares }
ConProductos >> conProductos [
	^ true
]

{ #category : #initialization }
ConProductos >> iniciarSolicituDescripcion: unaDescripcion duracion: unaDuracion valor: unValor tipoPago: unTipoPago colCestaProductos: unaColeccion [ 

	self
		iniciarSolicituDescripcion: unaDescripcion
		duracion: unaDuracion
		valor: unValor
		tipoPago: unTipoPago.
	colCestaProductos := unaColeccion
]

{ #category : #toString }
ConProductos >> toString [

	| col txt |
	txt := super toString.
	col := self colToString: colCestaProductos.
	^ txt , String cr , 'Productos: ' , col , ' (ConProductos) ',String cr
]

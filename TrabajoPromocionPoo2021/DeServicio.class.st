Class {
	#name : #DeServicio,
	#superclass : #Solicitud,
	#instVars : [
		'duracionServicio'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
DeServicio class >> descripcion: unaDescripcion duracion: unaDuracion valor: unValor tipoPago: unTipoPago [

	| nuevaSol |
	nuevaSol := self new.
	nuevaSol
		iniciarSolicituDescripcion: unaDescripcion
		duracion: unaDuracion
		valor: unValor
		tipoPago: unTipoPago.
	^ nuevaSol
]

{ #category : #'as yet unclassified' }
DeServicio >> conProductos [
	^ false
]

{ #category : #'as yet unclassified' }
DeServicio >> deServicio [ 

	^ true
	
]

{ #category : #initialization }
DeServicio >> iniciarSolicituDescripcion: unaDescripcion duracion: unaDuracion valor: unValor tipoPago: unTipoPago [

	self iniciarSolicitudDescripcion: unaDescripcion valor: unValor.
	tipoPago := unTipoPago.
	duracionServicio := unaDuracion
]

{ #category : #accessing }
DeServicio >> toString [

	^ 'Solicitud Servicio ID: ' , id asString , String cr
	  , 'Descripcion: ' , descripcion , String cr , 'Tipo de pago: '
	  , tipoPago , String cr , 'Valor Total: ' , valor asString
	  , String cr , 'Duracion servicio: ' , duracionServicio asString
	  , String cr 
]

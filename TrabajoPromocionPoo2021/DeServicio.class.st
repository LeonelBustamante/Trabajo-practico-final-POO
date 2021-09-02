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

{ #category : #accessing }
DeServicio >> duracionServicio [

	^ duracionServicio
]

{ #category : #'as yet unclassified' }
DeServicio >> iniciarSolicituDescripcion: unaDescripcion duracion: unaDuracion valor: unValor tipoPago: unTipoPago [

	self iniciarSolicitudDescripcion: unaDescripcion valor: unValor.
	tipoPago := unTipoPago.
	duracionServicio := unaDuracion
]

{ #category : #'as yet unclassified' }
DeServicio >> toString [

	| txt |
	txt := super toString.
	^ txt , 'Duracion servicio: ' , duracionServicio asString ,' (DeServicio) ', String cr
]

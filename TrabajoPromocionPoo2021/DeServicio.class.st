Class {
	#name : #DeServicio,
	#superclass : #Solicitud,
	#instVars : [
		'duracionServicio'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #constructor }
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

{ #category : #auxiliares }
DeServicio >> conProductos [
	^ false
]

{ #category : #auxiliares }
DeServicio >> deServicio [ 

	^ true
	
]

{ #category : #get }
DeServicio >> duracionServicio [

	^ duracionServicio
]

{ #category : #initialization }
DeServicio >> iniciarSolicituDescripcion: unaDescripcion duracion: unaDuracion valor: unValor tipoPago: unTipoPago [

	self iniciarSolicitudDescripcion: unaDescripcion valor: unValor.
	tipoPago := unTipoPago.
	duracionServicio := unaDuracion
]

{ #category : #toString }
DeServicio >> toString [

	| txt |
	txt := super toString.
	^ txt , 'Duracion servicio: ' , duracionServicio asString ,' (DeServicio) ', String cr
]

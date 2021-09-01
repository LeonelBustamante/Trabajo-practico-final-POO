Class {
	#name : #Propuesta,
	#superclass : #Object,
	#instVars : [
		'solicitud',
		'postulante'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
Propuesta class >> postulante: unPostulante	solicitud: unaSolicitud [
	|nuevaPropuesta |
	nuevaPropuesta := self new.
	nuevaPropuesta iniciarPropuestaPostulante: unPostulante solicitud: unaSolicitud.
	^nuevaPropuesta 
]

{ #category : #initialization }
Propuesta >> iniciarPropuestaPostulante: unPostulante solicitud: unaSolicitud [
postulante := unPostulante .
solicitud := unaSolicitud 
]

{ #category : #printing }
Propuesta >> toString [

	^ 'Postulante: ' , postulante getNombre , String cr , 'Solicitud: '
	  , solicitud getID asString , String cr 
]

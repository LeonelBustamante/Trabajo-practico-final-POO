Class {
	#name : #Propuesta,
	#superclass : #Object,
	#instVars : [
		'solicitud',
		'postulante'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #constructor }
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

{ #category : #get }
Propuesta >> postulante [

	^ postulante
]

{ #category : #get }
Propuesta >> solicitud [

	^ solicitud
]

{ #category : #toString }
Propuesta >> toString [

	^ postulante toString , 'Maximo: ' , postulante maximo asString
	  , String cr , String cr , solicitud toString , String cr, String cr, String cr
]

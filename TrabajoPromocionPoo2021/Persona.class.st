Class {
	#name : #Persona,
	#superclass : #Postulante,
	#instVars : [
		'colAptitudes'
	],
	#classVars : [
		'MAXIMOINDIVIDUAL'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
Persona class >> nombre: unNombre aptitudes: unaColAptitudes [

	| persona |
	persona := self new.
	persona iniciarPostulanteNombre: unNombre aptitudes: unaColAptitudes.
	^ persona
]

{ #category : #initialization }
Persona class >> setMaximoIndividual: unMAXIMOINDIVIDUAL [

MAXIMOINDIVIDUAL := unMAXIMOINDIVIDUAL 
]

{ #category : #printing }
Persona >> colToString: unaColeccion [

	| txt |
	txt := ' '.
	unaColeccion do: [ :each | txt := txt , each , ' - ' ].
	^ txt
]

{ #category : #'as yet unclassified' }
Persona >> esPersona [ 

	^true
]

{ #category : #getters }
Persona >> getColAptitudes [

	^ colAptitudes
]

{ #category : #getters }
Persona >> getMaximoIndividual [ 
^MAXIMOINDIVIDUAL 
]

{ #category : #initialization }
Persona >> iniciarPostulanteNombre: unNombre aptitudes: unaColAptitudes [
self iniciarPostulanteNombre: unNombre.
	colAptitudes := unaColAptitudes.
	self getMaximoIndividual
]

{ #category : #printing }
Persona >> toString [


	| col txt |
	txt := super toString.
	col := self colToString: colAptitudes .
	^ txt,'Aptitudes: ' , col , String cr
]

{ #category : #'as yet unclassified' }
Persona >> verificarAptitud: unaDescripcion [

	^ colAptitudes anySatisfy: [ :cadaAptitud | 
		  unaDescripcion = cadaAptitud ]
]

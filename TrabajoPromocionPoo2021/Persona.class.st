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

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
Persona >> getColAptitudes [

	^ colAptitudes
]

{ #category : #'as yet unclassified' }
Persona >> getMaximo [ 
^MAXIMOINDIVIDUAL 
]

{ #category : #'as yet unclassified' }
Persona >> iniciarPostulanteNombre: unNombre aptitudes: unaColAptitudes [
self iniciarPostulanteNombre: unNombre.
	colAptitudes := unaColAptitudes.
	self getMaximo
]

{ #category : #'as yet unclassified' }
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

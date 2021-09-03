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

{ #category : #set }
Persona class >> setMaximoIndividual: unMAXIMOINDIVIDUAL [

MAXIMOINDIVIDUAL := unMAXIMOINDIVIDUAL 
]

{ #category : #get }
Persona >> colAptitudes [

	^ colAptitudes
]

{ #category : #auxiliares }
Persona >> colToString: unaColeccion [

	| txt |
	txt := ' '.
	unaColeccion do: [ :each | txt := txt , each , ' - ' ].
	^ txt
]

{ #category : #auxiliares }
Persona >> esPersona [ 

	^true
]

{ #category : #initialization }
Persona >> iniciarPostulanteNombre: unNombre aptitudes: unaColAptitudes [
self iniciarPostulanteNombre: unNombre.
	colAptitudes := unaColAptitudes.
	self maximo
]

{ #category : #get }
Persona >> maximo [ 
^MAXIMOINDIVIDUAL 
]

{ #category : #toString }
Persona >> toString [

	| col txt |
	txt := super toString.
	col := self colToString: colAptitudes.
	^ txt , 'Aptitudes: ' , col ,'(PERSONA)', String cr
]

{ #category : #auxiliares }
Persona >> verificarAptitud: unaDescripcion [

	^ colAptitudes anySatisfy: [ :cadaAptitud | 
		  unaDescripcion = cadaAptitud ]
]

Class {
	#name : #Postulante,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #auxiliares }
Postulante >> esPersona [

	^ self subclassResponsibility
]

{ #category : #initialization }
Postulante >> iniciarPostulanteNombre: unNombre [

	nombre := unNombre
]

{ #category : #get }
Postulante >> maximo [
	^ self subclassResponsibility
]

{ #category : #get }
Postulante >> nombre [

	^ nombre
]

{ #category : #toString }
Postulante >> toString [

	^ 'Postulante: ' , nombre , String cr
]

{ #category : #auxiliares }
Postulante >> verificarAptitud: arg1 [ 
	^ self subclassResponsibility
]

Class {
	#name : #Postulante,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
Postulante >> esPersona [

	^ self subclassResponsibility
]

{ #category : #getters }
Postulante >> getNombre [

	^ nombre
]

{ #category : #initialization }
Postulante >> iniciarPostulanteNombre: unNombre [
"Postulante es abstracta"

	nombre := unNombre
]

{ #category : #accessing }
Postulante >> verificarAptitud: arg1 [ 
	^ self subclassResponsibility
]

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

{ #category : #accessing }
Postulante >> getMaximo [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Postulante >> getNombre [

	^ nombre
]

{ #category : #'as yet unclassified' }
Postulante >> iniciarPostulanteNombre: unNombre [
"Postulante es abstracta"

	nombre := unNombre
]

{ #category : #'as yet unclassified' }
Postulante >> toString [

	^ 'Empresa: ' , nombre, String cr.
]

{ #category : #'as yet unclassified' }
Postulante >> verificarAptitud: arg1 [ 
	^ self subclassResponsibility
]

Class {
	#name : #Tabla,
	#superclass : #RubScrolledTextMorph,
	#category : #'TrabajoPromocionPoo2021-Componentes'
}

{ #category : #constructor }
Tabla class >> tamanio: unTamanio [

	| temp |
	temp := self new.
	temp
		extent: unTamanio;
		beReadOnly.
	^ temp
]

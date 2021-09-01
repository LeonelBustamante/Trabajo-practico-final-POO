Class {
	#name : #Checkbox,
	#superclass : #CheckboxMorph,
	#category : #'TrabajoPromocionPoo2021-Componentes'
}

{ #category : #constructor }
Checkbox class >> nombre: unNombre tamanio: unTamanio [

	| temp aux |
	temp := self new.
	aux := StringMorph contents: unNombre.
	
	temp
		label: unNombre;
		extent: 100 @ 20.
	^ temp
]

{ #category : #'as yet unclassified' }
Checkbox >> estado [

	^ self buttonMorph selected
]

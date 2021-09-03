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
		color;
		extent: 100 @ 20.
		
	^ temp
]

{ #category : #auxiliares }
Checkbox >> color [

	labelMorph  color: (Color r: 0.38 g: 0.47 b: 0.58)
]

{ #category : #auxiliares }
Checkbox >> estado [

	^ self buttonMorph selected
]

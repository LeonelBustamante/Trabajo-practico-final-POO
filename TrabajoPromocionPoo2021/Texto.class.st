Class {
	#name : #Texto,
	#superclass : #StringMorph,
	#category : #'TrabajoPromocionPoo2021-Componentes'
}

{ #category : #constructor }
Texto class >> titulo: nombreCampo [

	| temp |
	temp := self new.
	temp contents: nombreCampo; font: (LogicalFont
			 familyName: StandardFonts defaultFont familyName
			 pointSize: 30).
	^ temp
]

{ #category : #constructor }
Texto class >> titulo: nombreCampo tamanio: tamanio [

	| temp |
	temp := self new.
	temp contents: nombreCampo; font: (LogicalFont
			 familyName: StandardFonts defaultFont familyName
			 pointSize: tamanio).
	^ temp
]

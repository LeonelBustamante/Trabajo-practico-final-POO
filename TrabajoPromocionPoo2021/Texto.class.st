Class {
	#name : #Texto,
	#superclass : #StringMorph,
	#category : #'TrabajoPromocionPoo2021-Componentes'
}

{ #category : #constructor }
Texto class >> titulo: nombreCampo [

	| temp |
	temp := self new.
	temp
		contents: nombreCampo;
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 30).
				
	temp color: (Color r: 0.38 g: 0.47 b: 0.58).
	^ temp
]

{ #category : #constructor }
Texto class >> titulo: nombreCampo tamanio: tamanio [

	| temp |
	temp := self new.
	temp
		contents: nombreCampo;
		font: (LogicalFont familyName: StandardFonts defaultFont familyName pointSize: tamanio).
		
	temp color: (Color r: 0.38 g: 0.47 b: 0.58).
	^ temp
]

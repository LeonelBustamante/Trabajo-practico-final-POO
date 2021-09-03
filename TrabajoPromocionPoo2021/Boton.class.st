Class {
	#name : #Boton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'aBlock'
	],
	#category : #'TrabajoPromocionPoo2021-Componentes'
}

{ #category : #constructor }
Boton class >> nombre: unNombre tamanio: unTamanio [

	| temp |
	temp := self new.
	temp initializeButton: unNombre; color: Color gray; extent: unTamanio; textColor: Color white.
	^ temp
]

{ #category : #auxiliares }
Boton >> centerText [

	label center: self center
]

{ #category : #auxiliares }
Boton >> font: aFont [

	label font: aFont.
	
]

{ #category : #initialization }
Boton >> initializeButton: aName [

	self label: aName
]

{ #category : #auxiliares }
Boton >> modalBotonConfirmar [

	self
		color: (Color r: 0.0 g: 0.5 b: 0.8);
		borderStyle: (RoundedBorder new
				 cornerRadius: 5;
				 width: 5;
				 color: (Color r: 0.0 g: 0.5 b: 0.8));
		font: (LogicalFont
			 familyName: StandardFonts defaultFont familyName
			 pointSize: 15);
			centerText 
]

{ #category : #auxiliares }
Boton >> modalBotonMenu [

	label
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15);
		center: self center.
]

{ #category : #mouse }
Boton >> mouseAction: aEvent [

	aBlock := aEvent
]

{ #category : #mouse }
Boton >> mouseUp: aEvent [

	super mouseUp: aEvent.
	aBlock value
]

{ #category : #auxiliares }
Boton >> textColor: aColor [

	label color: aColor
]

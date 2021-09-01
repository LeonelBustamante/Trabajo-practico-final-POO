Class {
	#name : #TextBox,
	#superclass : #RubTextFieldMorph,
	#category : #'TrabajoPromocionPoo2021-Componentes'
}

{ #category : #constructor }
TextBox class >> nombre: aText tamanio: aSize [
	| temp |
	temp := self new.
	temp
		ghostText: aText;
		borderStyle: (BottomBorder new width: 2);
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 20);
		extent: aSize;
		color: Color transparent;
		borderColor: Color black.

	^ temp
]

{ #category : #accessing }
TextBox >> clear [

	self setText: ''
]

{ #category : #deAplicacion }
TextBox >> estilo [

	self
		borderStyle: (BottomBorder new width: 2);
		color: Color transparent;
		borderColor: Color black
]

{ #category : #deAplicacion }
TextBox >> ghostColor: aColor [

	self withRulerNamed: #ghostText.
	self ghostTextRuler textColor: aColor
]

{ #category : #deAplicacion }
TextBox >> input [

	^ self text asString
]

{ #category : #deAplicacion }
TextBox >> isEmpty [

	^ self text asString = ''
]

{ #category : #deAplicacion }
TextBox >> isNotEmpty [

	^ self text asString ~= ''
]

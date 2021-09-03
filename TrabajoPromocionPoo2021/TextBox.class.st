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
		color: (Color r: 0.38 g: 0.47 b: 0.58);
		ghostColor: Color white;
		borderColor: Color black.

	^ temp
]

{ #category : #auxiliares }
TextBox >> clear [

	self setText: ''
]

{ #category : #auxiliares }
TextBox >> estilo [

	self
		borderStyle: (BottomBorder new width: 2);
		color: Color transparent;
		borderColor: Color black
]

{ #category : #auxiliares }
TextBox >> ghostColor: aColor [

	self withRulerNamed: #ghostText.
	self ghostTextRuler textColor: aColor
]

{ #category : #auxiliares }
TextBox >> input [

	^ self text asString
]

{ #category : #auxiliares }
TextBox >> isEmpty [

	^ self text asString = ''
]

{ #category : #auxiliares }
TextBox >> isNotEmpty [

	^ self text asString ~= ''
]

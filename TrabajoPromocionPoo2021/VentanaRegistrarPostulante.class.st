Class {
	#name : #VentanaRegistrarPostulante,
	#superclass : #Ventana,
	#instVars : [
		'inputNombre',
		'rubro1',
		'rubro2',
		'rubro3'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulante >> agregarBoton [

	| empresa persona |
	empresa := Boton
		           nombre: 'Registrar postulante Empresa'
		           tamanio: 700 @ 30.
	persona := Boton
		           nombre: 'Registrar postulante Persona'
		           tamanio: 700 @ 30.

	empresa
		center: self center;
		top: self top + 350;
		color: (Color r: 0.0 g: 0.5 b: 0.8);
		borderStyle: (RoundedBorder new
				 cornerRadius: 5;
				 width: 5;
				 color: (Color r: 0.0 g: 0.5 b: 0.8));
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15);
		centerText.
	persona
		center: self center;
		top: self top + 450;
		color: (Color r: 0.0 g: 0.5 b: 0.8);
		borderStyle: (RoundedBorder new
				 cornerRadius: 5;
				 width: 5;
				 color: (Color r: 0.0 g: 0.5 b: 0.8));
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15);
		centerText.

	self addMorph: empresa.
	self addMorph: persona.

	"Logic"
	empresa mouseAction: [ 
		self cerrar.
		VentanaRegistrarPostulanteEmpresa
			titulo: 'Registrando Postulante Empresa'
			gestor: MiGestor ].

	persona mouseAction: [ 
		self cerrar.
		VentanaRegistrarPostulantePersona
			titulo: 'Registrando Postulante Persona'
			gestor: MiGestor ]
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulante >> agregarCampos [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulante >> agregarLista: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
VentanaRegistrarPostulante >> initialize [

	super initialize.
	self agregarBoton
]

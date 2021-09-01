Class {
	#name : #VentanaRegistrarSolicitud,
	#superclass : #Ventana,
	#instVars : [
		'tituloNombre',
		'inputNombre',
		'checkboxRubro1',
		'inputValor',
		'checkboxRubro2',
		'tituloValor',
		'checkboxRubro3',
		'tituloDescripcion'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #accessing }
VentanaRegistrarSolicitud >> actualizarTabla [
	^ self subclassResponsibility
]

{ #category : #accessing }
VentanaRegistrarSolicitud >> agregarBoton [

	| empresa persona |
	empresa := Boton
		           nombre: 'Registrar solicitud de trabajo'
		           tamanio: 700 @ 30.
	persona := Boton
		           nombre: 'Registrar solicitud de servicio'
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
		VentanaRegistrarSolicitudDeTrabajo
			titulo: 'Registrando Solicitud de trabajo'
			gestor: MiGestor ].

	persona mouseAction: [ 
		self cerrar.
		VentanaRegistrarSolicitudDeServicio
			titulo: 'Registrando Solicitud de servicio'
			gestor: MiGestor ]
]

{ #category : #accessing }
VentanaRegistrarSolicitud >> agregarCampos [
	^ self subclassResponsibility
]

{ #category : #accessing }
VentanaRegistrarSolicitud >> agregarLista: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
VentanaRegistrarSolicitud >> agregarRubros [
	^ self subclassResponsibility
]

{ #category : #initialization }
VentanaRegistrarSolicitud >> initialize [

	super initialize.
	self agregarBoton
]

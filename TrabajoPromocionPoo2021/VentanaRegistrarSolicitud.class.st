Class {
	#name : #VentanaRegistrarSolicitud,
	#superclass : #Ventana,
	#instVars : [
		'tituloNombre',
		'inputNombre',
		'inputValor',
		'tituloValor',
		'rurbro1',
		'rubro2',
		'rubro3',
		'tituloRubro'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #accessing }
VentanaRegistrarSolicitud >> actualizarTabla [
	^ self subclassResponsibility
]

{ #category : #accessing }
VentanaRegistrarSolicitud >> agregarBoton [

	| trabajo servicio |
	trabajo := Boton
		           nombre: 'Registrar solicitud de trabajo'
		           tamanio: 700 @ 30.
	servicio := Boton
		           nombre: 'Registrar solicitud de servicio'
		           tamanio: 700 @ 30.

	trabajo  modalBotonConfirmar;
		top: self top + 350.	
	servicio modalBotonConfirmar;
		top: self top + 450.
		
	self addMorph: trabajo.
	self addMorph: servicio.

	"Logic"
	trabajo mouseAction: [ 
		self cerrar.
		VentanaRegistrarSolicitudDeTrabajo
			titulo: 'Registrando Solicitud de trabajo'
			gestor: MiGestor ].

	servicio mouseAction: [ 
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

Class {
	#name : #VentanaRegistrarSolicitud,
	#superclass : #Ventana,
	#instVars : [
		'inputNombre',
		'inputValor',
		'rurbro1',
		'rubro2',
		'rubro3'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitud >> agregarBoton [

	| trabajo servicio |
	trabajo := Boton
		           nombre: 'Registrar solicitud de trabajo'
		           tamanio: 700 @ 30.
	servicio := Boton
		            nombre: 'Registrar solicitud de servicio'
		            tamanio: 700 @ 30.

	self addMorphCentered: trabajo.
	self addMorphCentered: servicio.


	trabajo
		modalBotonConfirmar;
		top: self top + 350.
	servicio
		modalBotonConfirmar;
		top: self top + 450.


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

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitud >> agregarCampos [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitud >> agregarLista: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
VentanaRegistrarSolicitud >> initialize [

	super initialize.
	self agregarBoton
]

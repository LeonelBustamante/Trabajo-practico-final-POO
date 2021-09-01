Class {
	#name : #GestorEmpleoVisual,
	#superclass : #FullscreenMorph,
	#instVars : [
		'miGestor',
		'botonRegistroEmpresa',
		'botonRegistroSolicitud',
		'botonRegistroPostulante',
		'botonGenerarPropuesta',
		'botonAceptarPropuesta',
		'botonGenerarListado',
		'exit'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
GestorEmpleoVisual class >> crear [ 

	|temp|
	temp:=self new.
	temp openInExternalWindow.
]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> agregarAPantalla [
	
	botonRegistroEmpresa left: 30; top: 250; mouseAction: [  
		VentanaRegistrarEmpresaSolicitante titulo: 'Registrando una empresa solicitante' gestor: miGestor ].
	
	botonRegistroSolicitud left: 30; top: 350; mouseAction: [ 
		VentanaRegistrarSolicitud titulo: 'Elija un tipo de solicitud' gestor: miGestor ].
	
	botonRegistroPostulante left: 30; top: 450; mouseAction: [ 
			VentanaRegistrarPostulante titulo: 'Elija un tipo de postulante' gestor: miGestor ].
	
	botonGenerarPropuesta left: 30; top: 550; mouseAction: [ 
			VentanaGenerarPropuesta titulo: 'Generar Propuestas a Solicitudes Pendientes' gestor: miGestor ].
	
	botonAceptarPropuesta left: 30; top: 650; mouseAction: [ 
			VentanaAceptarPropuesta titulo: 'Aceptar Propuesta a solicitud ' gestor: miGestor ].
		
	botonGenerarListado left: 30; top: 750; mouseAction: [ 
			VentanaGenerarListado titulo: 'Elija tipo de listado' gestor: miGestor ].

	exit left: 30; top: 30; mouseAction: [ self cerrar ].
	
	self
		addMorph: botonRegistroEmpresa;
		addMorph: botonRegistroSolicitud;
		addMorph: botonRegistroPostulante;
		addMorph: botonGenerarPropuesta;
		addMorph: botonAceptarPropuesta;
		addMorph: botonGenerarListado;
		addMorph: exit.

]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> agregarBotones [

	botonRegistroEmpresa := Boton nombre: 'Registrar Empresa Solicitante' tamanio: 405 @ 90.
	botonRegistroSolicitud := Boton nombre: 'Registrar Solicitudes' tamanio: 405 @ 90.
	botonRegistroPostulante := Boton nombre: 'Registrar Postulantes' tamanio: 405 @ 90.
	botonAceptarPropuesta := Boton nombre: 'Aceptar Propuesta' tamanio: 405 @ 90.
	botonGenerarPropuesta := Boton nombre: 'Generar Propuesta' tamanio: 405 @ 90.
	botonGenerarListado := Boton nombre: 'Generar Listado' tamanio: 405 @ 90.
	exit := Boton nombre: 'exit' tamanio: 60 @ 30.

	self agregarEstiloBotones.
	self agregarAPantalla.	

]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> agregarEstiloBotones [
	botonRegistroEmpresa modalBotonMenu.
	botonRegistroSolicitud modalBotonMenu.
	botonRegistroPostulante modalBotonMenu.
	botonAceptarPropuesta modalBotonMenu.
	botonGenerarPropuesta modalBotonMenu.
	botonGenerarListado modalBotonMenu.

]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> agregarFondo [

	| fondo |
	fondo := (Form fromFileNamed: 'C:\Programas Leo\Pharo\Background.jpg') asMorph.
	fondo basicExtent: self extent.
	self addMorphBack: fondo
]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> agregarLogo [

	| logo |
	logo := 'TrabajoAr' asMorph.
	logo font: (LogicalFont familyName: 'Zen Tokyo Zoo' pointSize: 60).
	logo left: 30; top: 150.
	self addMorph: logo.

]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> agregarReloj [

	| morph temp myWindow |
	myWindow := StandardWindow labelled: 'CLOCK'.
	myWindow
		extent: 405 @ 90;
		top: 850;
		left: 30;
		beUnresizeable;
		removeCloseBox;
		removeCollapseBox;
		removeExpandBox;
		removeMenuBox;
		beSticky.
	self addMorph: myWindow.
	morph := StringMorph new.


	morph
		color: Color white;
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 30).


	myWindow addMorph: morph.

	[ 
	[ true ] whileTrue: [ 
		morph
			contents: Time now print24;
			center: myWindow center.
		1 second wait ] ] fork
]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> cerrar [

	self delete
]

{ #category : #'as yet unclassified' }
GestorEmpleoVisual >> initialize [

	super initialize.
	miGestor := GestorEmpleos crear.
	self
		agregarFondo;
		agregarLogo;
		agregarBotones;
		agregarReloj
]

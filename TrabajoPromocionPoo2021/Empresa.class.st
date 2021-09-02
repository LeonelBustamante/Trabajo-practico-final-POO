Class {
	#name : #Empresa,
	#superclass : #Postulante,
	#instVars : [
		'rubro',
		'puntos',
		'colSolicitudesGeneradas'
	],
	#classVars : [
		'MAXIMO'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
Empresa class >> nombre: unNombre rubro: unRubro puntos: unosPuntos [

	| empresa |
	empresa := self new.
	empresa
		iniciarPostulanteNombre: unNombre
		rubro: unRubro
		puntos: unosPuntos.
	^ empresa
]

{ #category : #initialization }
Empresa class >> setMAXIMO: unMAXIMO [
MAXIMO := unMAXIMO.
]

{ #category : #'as yet unclassified' }
Empresa >> agregarSolicitud: unaSolicitud [

colSolicitudesGeneradas add: unaSolicitud 
]

{ #category : #'as yet unclassified' }
Empresa >> colToString: unaColeccion [

	| txt |
	txt := ' '.
	unaColeccion do: [ :each | 
		txt := txt , 'ID:' , each getID asString , '  ' ].
	^ txt
]

{ #category : #'as yet unclassified' }
Empresa >> esPersona [

	^false
]

{ #category : #'as yet unclassified' }
Empresa >> getColSolicitudesGeneradas [



	^ self colToString: colSolicitudesGeneradas 
]

{ #category : #'as yet unclassified' }
Empresa >> getMaximo [

^MAXIMO 
]

{ #category : #'as yet unclassified' }
Empresa >> getPuntos [

	^ puntos
]

{ #category : #'as yet unclassified' }
Empresa >> getRubro [

	^ rubro
]

{ #category : #'as yet unclassified' }
Empresa >> hayFraude: iDVerificar [

	^ colSolicitudesGeneradas anySatisfy: [ :unaSolicitud | 
		  iDVerificar ~= unaSolicitud getID ]
]

{ #category : #'as yet unclassified' }
Empresa >> iniciarPostulanteNombre: unNombre rubro: unRubro puntos: unosPuntos [

	self iniciarPostulanteNombre: unNombre.
	rubro := unRubro.
	puntos := unosPuntos.
	colSolicitudesGeneradas := OrderedCollection new.
	self getMaximo
]

{ #category : #'as yet unclassified' }
Empresa >> sacarSolicitud: unaSolicitud [

colSolicitudesGeneradas remove: unaSolicitud.
]

{ #category : #'as yet unclassified' }
Empresa >> toString [

	| col txt |
	txt := super toString.
	col := self colToString: colSolicitudesGeneradas .
	^ txt, 'Rubro: ' , rubro , String cr , 'Puntos: '
	  , puntos asString , String cr, 'Solicitudes Generadas: '
	  , col asString , String cr.
]

{ #category : #'as yet unclassified' }
Empresa >> vendeProductos [
^false
]

{ #category : #'as yet unclassified' }
Empresa >> verificarAptitud: unaDescripcion [

	^ unaDescripcion = rubro
]

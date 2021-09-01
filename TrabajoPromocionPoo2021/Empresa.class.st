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
Empresa >> esPersona [

	^false
]

{ #category : #accessing }
Empresa >> getColSolicitudesGeneradas [

	^ colSolicitudesGeneradas
]

{ #category : #getters }
Empresa >> getMaximo [

^MAXIMO 
]

{ #category : #getters }
Empresa >> getPuntos [

	^ puntos
]

{ #category : #getters }
Empresa >> getRubro [

	^ rubro
]

{ #category : #'as yet unclassified' }
Empresa >> hayFraude: iDVerificar [

	^ colSolicitudesGeneradas anySatisfy: [ :unaSolicitud | 
		  iDVerificar ~= unaSolicitud getID ]
]

{ #category : #initialization }
Empresa >> iniciarPostulanteNombre: unNombre rubro: unRubro puntos: unosPuntos [

	self iniciarPostulanteNombre: unNombre.
	rubro := unRubro.
	puntos := unosPuntos.
	colSolicitudesGeneradas := OrderedCollection new.
	self getMaximo
]

{ #category : #printing }
Empresa >> toString [

	^ 'Empresa: ' , nombre , String cr , 'Rubro: ' , rubro , String cr
	  , 'Puntos: ' , puntos asString , String cr 
]

{ #category : #'as yet unclassified' }
Empresa >> vendeProductos [
^false
]

{ #category : #'as yet unclassified' }
Empresa >> verificarAptitud: unaDescripcion [

	^ unaDescripcion = rubro
]

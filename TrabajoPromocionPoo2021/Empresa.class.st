Class {
	#name : #Empresa,
	#superclass : #Postulante,
	#instVars : [
		'rubro',
		'puntos',
		'colSolicitudesGeneradas',
		'tipoActividad'
	],
	#classVars : [
		'MAXIMO'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #constructor }
Empresa class >> nombre: unNombre rubro: unRubro puntos: unosPuntos tipo:unTipo [

	| empresa |
	empresa := self new.
	empresa
		iniciarPostulanteNombre: unNombre
		rubro: unRubro
		puntos: unosPuntos
		tipo: unTipo.
	^ empresa
]

{ #category : #set }
Empresa class >> setMAXIMO: unMAXIMO [
MAXIMO := unMAXIMO.
]

{ #category : #auxiliares }
Empresa >> agregarSolicitud: unaSolicitud [

colSolicitudesGeneradas add: unaSolicitud 
]

{ #category : #get }
Empresa >> colSolicitudesGeneradas [

	^ colSolicitudesGeneradas
]

{ #category : #auxiliares }
Empresa >> colToString: unaColeccion [

	| txt |
	txt := ' '.
	unaColeccion do: [ :each | 
		txt := txt , 'ID:' , each id asString , '  ' ].
	^ txt
]

{ #category : #auxiliares }
Empresa >> esPersona [

	^false
]

{ #category : #getToString }
Empresa >> getColSolicitudesGeneradas [



	^ self colToString: colSolicitudesGeneradas 
]

{ #category : #auxiliares }
Empresa >> hayFraude: iDVerificar [

	^ colSolicitudesGeneradas anySatisfy: [ :unaSolicitud | 
		  iDVerificar ~= unaSolicitud id ]
]

{ #category : #initialization }
Empresa >> iniciarPostulanteNombre: unNombre rubro: unRubro puntos: unosPuntos tipo: unTipo [

	self iniciarPostulanteNombre: unNombre.
	rubro := unRubro.
	puntos := unosPuntos.
	colSolicitudesGeneradas := OrderedCollection new.
	tipoActividad := unTipo.
	self maximo
]

{ #category : #get }
Empresa >> maximo [

^MAXIMO 
]

{ #category : #get }
Empresa >> puntos [

	^ puntos
]

{ #category : #get }
Empresa >> rubro [

	^ rubro
]

{ #category : #auxiliares }
Empresa >> sacarSolicitud: unaSolicitud [

colSolicitudesGeneradas remove: unaSolicitud.
]

{ #category : #get }
Empresa >> tipoActividad [

	^ tipoActividad
]

{ #category : #toString }
Empresa >> toString [

	| col txt |
	txt := super toString.
	col := self colToString: colSolicitudesGeneradas.
	^ txt , 'Rubro: ' , rubro , String cr , 'Puntos: ' , puntos asString
	  , String cr , 'Tipo Actividad: ' , tipoActividad , String cr
	  , 'Solicitudes Generadas: ' , col asString ,'(EMPRESA)', String cr
]

{ #category : #auxiliares }
Empresa >> vendeProductos [
^false
]

{ #category : #auxiliares }
Empresa >> verificarAptitud: unaDescripcion [

	^ unaDescripcion = rubro
]

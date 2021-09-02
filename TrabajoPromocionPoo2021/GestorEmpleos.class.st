Class {
	#name : #GestorEmpleos,
	#superclass : #Object,
	#instVars : [
		'colEmpresasSolicitantes',
		'colPostulantes',
		'colPropuestas',
		'colSolicitudesPendientes',
		'colSolicitudesResueltas'
	],
	#classInstVars : [
		'model'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
GestorEmpleos class >> crear [

	| gestor |
	gestor := self new.
	gestor iniciarGestorEmpleo.
	Solicitud setID: 1.

	^ gestor
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> aceptarPropuestas [

	| unaSolicitud |
	colPropuestas do: [ :cadaPropuesta | 
		unaSolicitud := cadaPropuesta getSolicitud.
		(self estaEnColSolicitudesPendientes: unaSolicitud) ifTrue: [ 
			colSolicitudesPendientes remove: unaSolicitud.
			colSolicitudesResueltas add: unaSolicitud.
			cadaPropuesta getPostulante esPersona ifFalse: [ 
				cadaPropuesta getPostulante sacarSolicitud: unaSolicitud ] ] ].
	self
		changed: colPropuestas.
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colEmpresasSolicitantes [

	^ colEmpresasSolicitantes
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colEmpresasSolicitantesToString [
	^self colToString: colEmpresasSolicitantes.
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colPostulantes [

	^ colPostulantes
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colPostulantesToString [

	^ self colToString: colPostulantes
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colPropuestas [

	^ colPropuestas
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colPropuestasToString [

	^ self colToString: colPropuestas 
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colSolicitudesPendientes [

	^ colSolicitudesPendientes
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colSolicitudesPendientesToString [

	^ self colToString: colSolicitudesPendientes 
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colSolicitudesResueltas [

	^ colSolicitudesResueltas
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colSolicitudesResueltasToString [

	^ self changed: colSolicitudesResueltas
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> colToString: unaColeccion [

	| txt |
	txt := ''.
	unaColeccion do: [ :each | txt := txt , each toString , String cr ].
	^ txt
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> estaEnColSolicitudesPendientes:unaSolicitud [

^colSolicitudesPendientes  anySatisfy: [ :x | x getID  = unaSolicitud getID ]
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> generarPropuestas [

	| res propuesta postulanteApto |
	res := false.
	postulanteApto := false.
	colSolicitudesPendientes do: [ :cadaSol | 
		res := false.
		postulanteApto := false.
		colPostulantes do: [ :cadaPostulante | 
			res := false.
			postulanteApto := false.
			res := cadaPostulante verificarAptitud: cadaSol getDescripcion.
			res ifTrue: [ 
				res := cadaPostulante esPersona.
				res
					ifTrue: [ "TERMINARON VERIFICACIONES PARA EMPRESA"
						res := cadaSol deServicio.
						res
							ifTrue: [ 
								res := cadaSol conProductos.
								res ifFalse: [ postulanteApto := true ] ]
							ifFalse: [ postulanteApto := true ] ]
					ifFalse: [ 
						res := cadaSol deServicio.
						res ifTrue: [ 
							res := cadaSol conProductos.
							res ifTrue: [ 
								res := cadaPostulante vendeProductos.
								res ifTrue: [ 
									res := cadaPostulante verificaProductos:
										       cadaSol getColCestaProductos.
									res ifTrue: [ postulanteApto := true ] ] ] ] ].
				postulanteApto ifTrue: [ 
					propuesta := Propuesta
						             postulante: cadaPostulante
						             solicitud: cadaSol.
					colPropuestas add: propuesta ] ] ] ].self changed: colPropuestas 
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> iniciarGestorEmpleo [

	colEmpresasSolicitantes := OrderedCollection new.
	colPostulantes := OrderedCollection new.
	colPropuestas := OrderedCollection new.
	colSolicitudesPendientes := SortedCollection sortUsing: [ :elem1 :elem2 | 
		                            elem1 getFecha isOnOrBefore:  elem2 getFecha ].
	colSolicitudesResueltas := OrderedCollection new
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> listadoSolicitudesPendientesDeEmpresa: unaEmpresa [


	self changed:
		(unaEmpresa colSolicitudesGeneradas select: [ :cadaSolEnGeneradas | 
			 colEmpresasSolicitantes anySatisfy: [ :cadaSolEnPendientes | 
				 cadaSolEnPendientes getID = cadaSolEnGeneradas getID ] ])
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> listadoSolicitudesPendientesEnFecha: unaFecha [

	| col |
	col := colSolicitudesPendientes select: [ :x | 
		       x getFecha equals: unaFecha ].
	col := self colToString: col.
	self changed: col
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> registrarEmpresaSolicitante: unaEmpresa [

	| temp |
	temp := colEmpresasSolicitantes anySatisfy: [ :x | unaEmpresa getNombre = x getNombre ].
	temp ifFalse: [ 
		colEmpresasSolicitantes add: unaEmpresa.
		colPostulantes add: unaEmpresa ].
	
	self changed: colEmpresasSolicitantes
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> registrarPostulante: unPostulante [

	| temp |
	temp := colPostulantes anySatisfy: [ :x | 
		        unPostulante getNombre = x getNombre ].
	temp ifFalse: [ colPostulantes add: unPostulante ].
	self changed: colPostulantes 
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> registrarSolicitud: unaSolicitud postulante: unNombrePostualante [

	| propietariaSolicitud |
	colSolicitudesPendientes add: unaSolicitud.
	propietariaSolicitud := colEmpresasSolicitantes detect: [ :x | 
		                        x getNombre = unNombrePostualante ].
	propietariaSolicitud agregarSolicitud: unaSolicitud.self changed: colSolicitudesPendientes 
]

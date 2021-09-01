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

{ #category : #accessing }
GestorEmpleos >> colEmpresasSolicitantes [

	^ colEmpresasSolicitantes
]

{ #category : #getters }
GestorEmpleos >> colEmpresasSolicitantesToString [
	^self colToString: colEmpresasSolicitantes.
]

{ #category : #accessing }
GestorEmpleos >> colPostulantes [

	^ colPostulantes
]

{ #category : #getters }
GestorEmpleos >> colPostulantesToString [

	^ self colToString: colPostulantes
]

{ #category : #accessing }
GestorEmpleos >> colPropuestas [

	^ colPropuestas
]

{ #category : #getters }
GestorEmpleos >> colPropuestasToString [

	^ self colToString: colPropuestas 
]

{ #category : #accessing }
GestorEmpleos >> colSolicitudesPendientes [

	^ colSolicitudesPendientes
]

{ #category : #getters }
GestorEmpleos >> colSolicitudesPendientesToString [

	^ self colToString: colSolicitudesPendientes 
]

{ #category : #accessing }
GestorEmpleos >> colSolicitudesResueltas [

	^ colSolicitudesResueltas
]

{ #category : #getters }
GestorEmpleos >> colSolicitudesResueltasToString [

	^ self colToString: colSolicitudesResueltas 
]

{ #category : #getters }
GestorEmpleos >> colToString: unaColeccion [

	| txt |
	txt := ''.
	unaColeccion do: [ :each | txt := txt , each toString , String cr ].
	^ txt
]

{ #category : #'generar propuestas' }
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
				postulanteApto
					ifTrue: [ 
						propuesta := Propuesta
							             postulante: cadaPostulante
							             solicitud: cadaSol.
						colPropuestas add: propuesta ]
					ifFalse: [  ] ] ] ]
]

{ #category : #initialization }
GestorEmpleos >> iniciarGestorEmpleo [

	colEmpresasSolicitantes := OrderedCollection new.
	colPostulantes := OrderedCollection new.
	colPropuestas := OrderedCollection new.
	colSolicitudesPendientes := SortedCollection sortUsing: [ :elem1 :elem2 | 
		                            elem1 getFecha isOnOrBefore:  elem2 getFecha ].
	colSolicitudesResueltas := OrderedCollection new
]

{ #category : #'registrar empresa solicitante' }
GestorEmpleos >> registrarEmpresaSolicitante: unaEmpresa [

	"Se recibe desde la interfaz grafica unaEmpresa creada y se carga en la coleccion"

	| temp |
	temp := colEmpresasSolicitantes anySatisfy: [ :x | 
		        unaEmpresa getNombre = x getNombre ].
	temp ifFalse: [ 
		colEmpresasSolicitantes add: unaEmpresa.
		colPostulantes add: unaEmpresa ]
]

{ #category : #accessing }
GestorEmpleos >> registrarPostulante: unPostulante [

	| temp |
	temp := colPostulantes anySatisfy: [ :x | unPostulante getNombre = x getNombre ].
	temp ifFalse: [ colPostulantes add: unPostulante ]
	
]

{ #category : #'registrar solicitud' }
GestorEmpleos >> registrarSolicitud: unaSolicitud postulante: unNombrePostualante [

	
	|propietariaSolicitud|
	colSolicitudesPendientes add: unaSolicitud.
	propietariaSolicitud := colEmpresasSolicitantes detect: [:x|  x getNombre = unNombrePostualante  ].
		propietariaSolicitud  agregarSolicitud:  unaSolicitud 
]

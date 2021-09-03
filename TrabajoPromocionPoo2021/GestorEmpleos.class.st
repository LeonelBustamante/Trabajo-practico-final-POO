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

{ #category : #constructor }
GestorEmpleos class >> crear [

	| gestor |
	gestor := self new.
	gestor iniciarGestorEmpleo.
	Solicitud setID: 1.
	Persona setMaximoIndividual: 20.
	Empresa setMAXIMO: 10.

	^ gestor
]

{ #category : #constructor }
GestorEmpleos class >> crearConMaximoIndividual: unNumero maximo:unNumero2 [

	| gestor |
	gestor := self new.
	gestor iniciarGestorEmpleo.
	Solicitud setID: 1.
	Persona setMaximoIndividual: unNumero.
	Empresa setMAXIMO: unNumero2.

	^ gestor
]

{ #category : #ejercicios }
GestorEmpleos >> aceptarPropuestas [

	| unaSolicitud |
	colPropuestas do: [ :cadaPropuesta | 
		unaSolicitud := cadaPropuesta solicitud.
		(self estaEnColSolicitudesPendientes: unaSolicitud) ifTrue: [ 
			colSolicitudesPendientes remove: unaSolicitud.
			colSolicitudesResueltas add: unaSolicitud.
			cadaPropuesta postulante esPersona ifFalse: [ 
				cadaPropuesta postulante sacarSolicitud: unaSolicitud ] ] ].
	self
		changed: colPropuestas.
]

{ #category : #get }
GestorEmpleos >> colEmpresasSolicitantes [

	^ colEmpresasSolicitantes
]

{ #category : #getToString }
GestorEmpleos >> colEmpresasSolicitantesToString [
	^self colToString: colEmpresasSolicitantes.
]

{ #category : #get }
GestorEmpleos >> colPostulantes [

	^ colPostulantes
]

{ #category : #getToString }
GestorEmpleos >> colPostulantesToString [

	^ self colToString: colPostulantes
]

{ #category : #get }
GestorEmpleos >> colPropuestas [

	^ colPropuestas
]

{ #category : #getToString }
GestorEmpleos >> colPropuestasToString [

	^ self colToString: colPropuestas 
]

{ #category : #get }
GestorEmpleos >> colSolicitudesPendientes [

	^ colSolicitudesPendientes
]

{ #category : #getToString }
GestorEmpleos >> colSolicitudesPendientesToString [

	^ self colToString: colSolicitudesPendientes 
]

{ #category : #get }
GestorEmpleos >> colSolicitudesResueltas [

	^ colSolicitudesResueltas
]

{ #category : #getToString }
GestorEmpleos >> colSolicitudesResueltasToString [

	^ self changed: colSolicitudesResueltas
]

{ #category : #auxiliares }
GestorEmpleos >> colToString: unaColeccion [

	| txt |
	txt := ''.
	unaColeccion do: [ :each | txt := txt , each toString , String cr ].
	^ txt
]

{ #category : #auxiliares }
GestorEmpleos >> estaEnColSolicitudesPendientes: unaSolicitud [

	^ colSolicitudesPendientes anySatisfy: [ :x |  x id = unaSolicitud id ]
]

{ #category : #ejercicios }
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

			res := cadaPostulante verificarAptitud: cadaSol descripcion.
			res ifTrue: [ 
				res := cadaPostulante esPersona.

				res
					ifTrue: [ 
						res := cadaSol deServicio.
						res
							ifTrue: [ 
								res := cadaSol conProductos.
								res ifFalse: [ postulanteApto := true ] ]
							ifFalse: [ postulanteApto := true ] ]
					ifFalse: [ 
						res := cadaSol deServicio.
						res ifTrue: [ 
							res := cadaPostulante tipoActividad = 'EMPRESA PUNTUAL'
							       & (cadaSol duracionServicio = 0)
							       | (cadaPostulante tipoActividad = 'EMPRESA UNIFORME'
								        & (cadaSol duracionServicio > 0)).

							res ifTrue: [ 
								res := cadaPostulante maximo * cadaPostulante puntos
								       >= cadaSol valor.
								res ifTrue: [ 
									res := cadaSol conProductos.
									res ifTrue: [ 
										res := cadaPostulante vendeProductos.
										res ifTrue: [ 
											res := cadaPostulante verificaProductos:
												       cadaSol colCestaProductos.
											res ifTrue: [ postulanteApto := true ] ] ] ] ] ] ] ].
			postulanteApto ifTrue: [ 
				propuesta := Propuesta
					             postulante: cadaPostulante
					             solicitud: cadaSol.
				colPropuestas add: propuesta ] ] ].
	self changed: colPropuestas
]

{ #category : #initialization }
GestorEmpleos >> iniciarGestorEmpleo [

	colEmpresasSolicitantes := OrderedCollection new.
	colPostulantes := OrderedCollection new.
	colPropuestas := OrderedCollection new.
	colSolicitudesPendientes := SortedCollection sortUsing: [ :elem1 :elem2 |  elem1 fecha isOnOrBefore:  elem2 fecha ].
	colSolicitudesResueltas := OrderedCollection new
]

{ #category : #ejercicios }
GestorEmpleos >> listadoSolicitudesPendientesDeEmpresa: unaEmpresa [

	| colGenEmpresa col |
	colGenEmpresa := (colEmpresasSolicitantes detect: [ :cadaEmpresa | 
		                  cadaEmpresa nombre = unaEmpresa ])
		                 colSolicitudesGeneradas.
	col := colGenEmpresa select: [ :cadaSolEnEmpresa | 
		       colSolicitudesPendientes anySatisfy: [ :cadaSolPendiente | 
			       cadaSolEnEmpresa = cadaSolPendiente ] ].
	self changed: col.
	"PARA PRUEBAS POR PLAYGROUND DESCOMENTAR LA SIGUIENTE LINEA"
	"^ col"
]

{ #category : #ejercicios }
GestorEmpleos >> listadoSolicitudesPendientesEnFecha: unaFecha [

	| col |
	col := colSolicitudesPendientes select: [ :x | 
		       x fecha equals: unaFecha ].
	col := self colToString: col.
	self changed: col.
	"PARA PRUEBAS EN PLAYGROUND DESCOMENTAR LA SIGUIENTE LINEA"
	"^ col"
]

{ #category : #ejercicios }
GestorEmpleos >> registrarEmpresaSolicitante: unaEmpresa [

	| temp |
	temp := colEmpresasSolicitantes anySatisfy: [ :cadaEmpresa |  unaEmpresa nombre = cadaEmpresa nombre ].
	temp ifFalse: [  colEmpresasSolicitantes add: unaEmpresa.
		(colPostulantes anySatisfy: [ :cadaPostulante | unaEmpresa nombre = cadaPostulante nombre ]) 
			ifFalse: [ colPostulantes add: unaEmpresa ] ].

	self changed: colEmpresasSolicitantes
]

{ #category : #ejercicios }
GestorEmpleos >> registrarPostulante: unPostulante [

	| temp |
	temp := colPostulantes anySatisfy: [ :x | 
		        unPostulante nombre = x nombre ].
	temp ifFalse: [ colPostulantes add: unPostulante ].
	self changed: colPostulantes 
]

{ #category : #ejercicios }
GestorEmpleos >> registrarSolicitud: unaSolicitud postulante: unNombrePostualante [

	| propietariaSolicitud |

	propietariaSolicitud := colEmpresasSolicitantes detect: [ :x |  x nombre = unNombrePostualante nombre] ifNone: [ nil ].
	propietariaSolicitud ifNotNil: [   colSolicitudesPendientes add: unaSolicitud. propietariaSolicitud agregarSolicitud: unaSolicitud. self changed: colSolicitudesPendientes ].


]

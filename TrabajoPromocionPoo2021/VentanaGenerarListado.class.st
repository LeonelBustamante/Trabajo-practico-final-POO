Class {
	#name : #VentanaGenerarListado,
	#superclass : #Ventana,
	#instVars : [
		'listadoEmpresa',
		'listadoFecha',
		'listadoResueltas'
	],
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> accionListadoEmpresa [

	MiGestor colEmpresasSolicitantesToString.
	self
		removeMorph: listadoEmpresa;
		removeMorph: listadoFecha;
		removeMorph: listadoResueltas;
		agregarLista: 'Listado por Empresa';
		actualizarTabla
]

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> accionListadoFecha [

	| unaFecha |
	MiGestor listadoSolicitudesPendientesEnFecha: unaFecha.
	self
		removeMorph: listadoEmpresa;
		removeMorph: listadoFecha;
		removeMorph: listadoResueltas;
		agregarLista: 'Listado por Fecha';
		actualizarTabla
]

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> accionListadoResueltas [


	self
		removeMorph: listadoEmpresa;
		removeMorph: listadoFecha;
		removeMorph: listadoResueltas;
		agregarLista: 'Solicitudes resueltas';
		actualizarTabla: 	MiGestor colSolicitudesResueltasToString .
]

{ #category : #accessing }
VentanaGenerarListado >> actualizarTabla [

	tabla setText: MiGestor colEmpresasSolicitantesToString 
]

{ #category : #accessing }
VentanaGenerarListado >> actualizarTabla:unParametro [

	tabla setText: unParametro . 
]

{ #category : #accessing }
VentanaGenerarListado >> agregarBoton [

	listadoEmpresa := Boton nombre: 'Generar Listados por empresa' tamanio: 700 @ 30.
	listadoFecha := Boton
		                nombre: 'Generar Listados en fecha'
		                tamanio: 700 @ 30.
	listadoResueltas := Boton
		                    nombre: 'Generar Listados solicitudes resueltas'
		                    tamanio: 700 @ 30.

	listadoEmpresa modalBotonConfirmar.
	listadoFecha modalBotonConfirmar.
	listadoResueltas modalBotonConfirmar.


	self
		agregarMorph;
		agregarLogica
]

{ #category : #accessing }
VentanaGenerarListado >> agregarLista: aString [

	"Agrego titulo y lista"

	| titulo |
	titulo := Texto titulo: aString tamanio: 20.
	tabla := Tabla tamanio: 1000 @ 500.

	self
		addMorphCentered: titulo;
		addMorphCentered: tabla.

	titulo top: tabla top - 50
]

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> agregarLogica [

	listadoEmpresa mouseAction: [ self accionListadoEmpresa  ].
	listadoFecha mouseAction: [ self accionListadoFecha ].
	listadoResueltas mouseAction: [ self accionListadoResueltas  ]
]

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> agregarMorph [
self
		addMorphCentered: listadoEmpresa;
		addMorphCentered: listadoFecha;
		addMorphCentered: listadoResueltas.
		listadoEmpresa top: 300. listadoFecha top: 400  . listadoResueltas top: 500.
]

{ #category : #initialization }
VentanaGenerarListado >> initialize [

	super initialize.
	self agregarBoton
]

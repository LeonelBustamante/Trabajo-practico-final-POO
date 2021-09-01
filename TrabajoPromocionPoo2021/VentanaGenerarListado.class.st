Class {
	#name : #VentanaGenerarListado,
	#superclass : #Ventana,
	#category : #'TrabajoPromocionPoo2021-Visual'
}

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> actualizarTabla:unParametro [

	tabla setText: unParametro . 
]

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> agregarBoton [
 
	| listadoEmpresa listadoFecha listadoResueltas |
	listadoEmpresa := Boton
		                  nombre: 'Generar Listados por empresa'
		                  tamanio: 700 @ 30.
	listadoFecha := Boton
		                nombre: 'Generar Listados en fecha'
		                tamanio: 700 @ 30.
	listadoResueltas := Boton
		                    nombre: 'Generar Listados solicitudes resueltas'
		                    tamanio: 700 @ 30.

	self
		addMorphCentered: listadoEmpresa;
		addMorphCentered: listadoFecha;
		addMorphCentered: listadoResueltas.

	MiGestor addDependent: self.

	listadoEmpresa
		modalBotonConfirmar;
		top: 300;
		mouseAction: [ 
			MiGestor colEmpresasSolicitantesToString.
			self
				removeMorph: listadoEmpresa;
				removeMorph: listadoFecha;
				removeMorph: listadoResueltas;
				agregarLista: 'Listado por Empresa' ].

	listadoFecha
		modalBotonConfirmar;
		top: 400;
		mouseAction: [ 
			| unaFecha |
			self
				removeMorph: listadoEmpresa;
				removeMorph: listadoFecha;
				removeMorph: listadoResueltas;
				agregarLista: 'Listado por Fecha'.
			MiGestor listadoSolicitudesPendientesEnFecha: unaFecha ].

	listadoResueltas
		modalBotonConfirmar;
		top: 500;
		mouseAction: [ 
			self
				removeMorph: listadoEmpresa;
				removeMorph: listadoFecha;
				removeMorph: listadoResueltas;
				agregarLista: 'Solicitudes resueltas';
				update: MiGestor colSolicitudesResueltas ]
]

{ #category : #'as yet unclassified' }
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
VentanaGenerarListado >> initialize [

	super initialize.
	self agregarBoton
]

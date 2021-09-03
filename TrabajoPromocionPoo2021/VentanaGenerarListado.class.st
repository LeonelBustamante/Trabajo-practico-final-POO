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
			self
				removeMorph: listadoEmpresa;
				removeMorph: listadoFecha;
				removeMorph: listadoResueltas;
				porEmpresa ].

	listadoFecha
		modalBotonConfirmar;
		top: 400;
		mouseAction: [ 
			self
				removeMorph: listadoEmpresa;
				removeMorph: listadoFecha;
				removeMorph: listadoResueltas;
				crearFecha ].

	listadoResueltas
		modalBotonConfirmar;
		top: 500;
		mouseAction: [ 
			self
				removeMorph: listadoEmpresa;
				removeMorph: listadoFecha;
				removeMorph: listadoResueltas;
								agregarLista: 'Solicitudes Resueltas '.
			MiGestor colEmpresasSolicitantesToString ]
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
VentanaGenerarListado >> crearFecha [

	| go tituloDuracion advertencia inputDias |
	tituloDuracion := Texto titulo: 'Ingrese una duracion' tamanio: 20.
	advertencia := Texto titulo: 'Formato: YYYY-MM-DD' tamanio: 10.
	inputDias := TextBox
		             nombre: 'Ingrese aqui el valor'
		             tamanio: 450 @ 90.
	go := Boton nombre: 'GO' tamanio: 30 @ 30.
	self
		addMorphCentered: tituloDuracion;
		addMorphCentered: advertencia;
		addMorphCentered: inputDias;
		addMorphCentered: go.

	tituloDuracion
		center: self center;
		left: self left + 500.

	advertencia
		left: tituloDuracion left;
		top: tituloDuracion bottom + 10.

	inputDias
		left: tituloDuracion left;
		top: advertencia bottom + 20.
	go
		top: inputDias top;
		left: inputDias right + 10;
		mouseAction: [ 
			inputDias isNotEmpty ifTrue: [ 
					self agregarLista: 'Listado por Fecha'.
					MiGestor listadoSolicitudesPendientesEnFecha: inputDias input ] ]
]

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> initialize [

	super initialize.
	self agregarBoton
]

{ #category : #'as yet unclassified' }
VentanaGenerarListado >> porEmpresa [

	| selecEmpresa go nombres |
	nombres := OrderedCollection new.
	nombres := MiGestor colEmpresasSolicitantes collect: [ :x | 
		           x nombre ].
	selecEmpresa := SearchMorph new.
	selecEmpresa extent: 500@30 ;searchList: nombres.
	go := Boton nombre: 'GO' tamanio: 30 @ 30.
	self
		addMorph: selecEmpresa;
		addMorphCentered: go.

	selecEmpresa center: self center.

	go
		top: selecEmpresa top;
		left: selecEmpresa right + 20;
		mouseAction: [ 
			self
				agregarLista: 'Solicitudes de ';
				update: MiGestor colSolicitudesResueltas ]
]

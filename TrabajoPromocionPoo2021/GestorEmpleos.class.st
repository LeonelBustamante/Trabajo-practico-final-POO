"
|g pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 sol1 sol2 sol3 sol4 sol5 sol6 sol7 sol8 sol9 col1 col2 col3 col4 col5 col6 col7 col8 pro1 pro2 pro3 pro4 pro5 pro6 rub1 rub2  rub3|
Transcript clear.
rub1:='Pintureria'.rub2:='Electro'.rub3:='Colchoneria'.
pro1:='Colchon'.pro2:='Sabana'.pro3:='Monitor'.pro4:='Teclado'.pro5:='Pincel'.pro6:='Pintura'.

col1 :=OrderedCollection new.col1 add: rub1; add: rub2.
col2 :=OrderedCollection new.col2 add: rub2.
col3 :=OrderedCollection new.col3 add: pro3; add: pro4.
col4 :=OrderedCollection new.col4 add: pro3.
col5 :=OrderedCollection new.col5 add: pro2.
col6 :=OrderedCollection new.col6 add: rub1; add: rub2; add: rub3.
col7 :=OrderedCollection new.col7 add: pro1.
col8 :=OrderedCollection new.col7 add: pro5.

""g:=GestorEmpleos crear.""
g:=GestorEmpleos crearConMaximoIndividual: 1 maximo: 0.

pos1:= Empresa nombre: 'A' rubro: 'Pintureria' puntos: 2 tipo: 'EMPRESA UNIFORME'.
pos2:= Persona nombre: 'B' aptitudes: col6.
pos3:= Combinada nombre: 'C' rubro: 'Electro' puntos: 3 tipo: 'EMPRESA UNIFORME' colProductos: col3.
pos4:= Empresa nombre: 'D' rubro: 'Pintureria' puntos: 15 tipo: 'EMPRESA PUNTUAL'.
pos5:= Combinada nombre: 'E' rubro: 'Colchoneria' puntos: 1 tipo: 'EMPRESA UNIFORME' colProductos:col8.
pos6:= Persona nombre: 'F' aptitudes: col1.
pos7:= Combinada nombre: 'G' rubro: 'Pintureria' puntos: 0 tipo: 'EMPRESA UNIFORME' colProductos:col7.
pos8:= Persona nombre: 'H' aptitudes: col2.
pos9:= Empresa nombre: 'I' rubro: 'Electro' puntos: 5 tipo: 'EMPRESA UNIFORME'.

sol1:= DeServicio descripcion: 'Pintureria' duracion: 7 valor: 150 tipoPago: 'PAGO POR DIA'.
sol2:= ConProductos descripcion: 'Colchoneria' duracion: 16 valor: 70 tipoPago: 'PAGO POR DIA' colCestaProductos: col7.
sol3:= DeTrabajo descripcion: 'Electro' valor: 20.
sol4:= DeServicio descripcion: 'Electro' duracion: 0 valor: 160 tipoPago: 'PAGO POR DIA'.
sol5:= ConProductos descripcion: 'Pintureria' duracion: 0 valor: 10 tipoPago: 'PAGO POR DIA' colCestaProductos: col4.
sol6:= DeTrabajo descripcion: 'Colchoneria' valor: 15.
sol7:= DeServicio descripcion: 'Electro' duracion: 6 valor: 1000 tipoPago: 'PAGO POR DIA'.
sol8:= ConProductos descripcion: 'Pintureria' duracion: 7 valor: 30 tipoPago: 'PAGO POR DIA' colCestaProductos: col5.
sol9:= DeTrabajo descripcion: 'Colchoneria' valor: 100.

g registrarEmpresaSolicitante: pos3;registrarEmpresaSolicitante: pos7;registrarEmpresaSolicitante: pos1;registrarEmpresaSolicitante: pos5.
Transcript show: 'Primera carga EmpresasSolicitantes: ';cr;show: g colEmpresasSolicitantesToString;cr.
Transcript show: '-------------------------FINALIZA COLECCION EMPRESA SOLICITANTE-------------------------';cr;cr.
g registrarPostulante: pos1;registrarPostulante: pos2;registrarPostulante: pos3;registrarPostulante: pos4;registrarPostulante: pos5;registrarPostulante: pos6;registrarPostulante: pos7;registrarPostulante: pos8;registrarPostulante: pos9.
Transcript show: 'Primera carga Postulantes: ';cr;show: g colPostulantesToString ;cr.
Transcript show: '-------------------------FINALIZA COLECCION POSTULANTE-------------------------';cr;cr.
g registrarSolicitud: sol1 postulante: pos3;registrarSolicitud: sol2 postulante: pos1;registrarSolicitud: sol3 postulante: pos5;registrarSolicitud: sol4 postulante: pos1;registrarSolicitud: sol5 postulante: pos5;registrarSolicitud: sol6 postulante: pos3;registrarSolicitud: sol7 postulante: pos7;registrarSolicitud: sol8 postulante: pos1;registrarSolicitud: sol9 postulante: pos3.
Transcript show: 'Primera carga Solicitudes: ';cr;show: g colSolicitudesPendientesToString;cr.
Transcript show: '--------------------------------------FINALIZA COLECCION SOLICITUDES----------------------------------------';cr;cr.
Transcript show: '------------------------------------------------------------------------------------------------------------';cr.
Transcript show: '------------------------------------------------------------------------------------------------------------';cr.
Transcript show: '------------------------------------------------------------------------------------------------------------';cr.
Transcript show: '---------------------------------------------GENERAR PROPUESTAS---------------------------------------------';cr.
g generarPropuestas.
Transcript show: 'Listado de propuestas: ';cr;show: g colPropuestasToString;cr.
"
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
	Persona setMaximoIndividual: 20.
	Empresa setMAXIMO: 10.

	^ gestor
]

{ #category : #'as yet unclassified' }
GestorEmpleos class >> crearConMaximoIndividual: unNumero maximo:unNumero2 [

	| gestor |
	gestor := self new.
	gestor iniciarGestorEmpleo.
	Solicitud setID: 1.
	Persona setMaximoIndividual: unNumero.
	Empresa setMAXIMO: unNumero2.

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
					ifTrue: [ "DESDE ACA EMPRESAS"
						res := cadaSol deServicio.
						res
							ifTrue: [ 
								res := cadaSol conProductos.
								res ifFalse: [ "VERIFICAR QUE EL SERVICIO SEA MENOR QUE MAXIMOINDIVIDUAL" 
									postulanteApto := true ] ]
							ifFalse: [ postulanteApto := true ] ]
					ifFalse: [ 
						res := cadaSol deServicio.
						res ifTrue: [ 
							res := cadaPostulante tipoActividad = 'EMPRESA PUNTUAL'
							       & (cadaSol duracionServicio = 0)
							       | (cadaPostulante tipoActividad = 'EMPRESA UNIFORME'
								        & (cadaSol duracionServicio > 0)).

							res ifTrue: [ 
								res := cadaPostulante getMaximo * cadaPostulante getPuntos
								       >= cadaSol getValor.
								res ifTrue: [ 
									res := cadaSol conProductos.
									res ifTrue: [ 
										res := cadaPostulante vendeProductos.
										res ifTrue: [ 
											res := cadaPostulante verificaProductos:
												       cadaSol getColCestaProductos.
											res ifTrue: [ postulanteApto := true ] ] ] ] ] ] ] ].
			postulanteApto ifTrue: [ 
				propuesta := Propuesta
					             postulante: cadaPostulante
					             solicitud: cadaSol.
				colPropuestas add: propuesta ] ] ].
	self changed: colPropuestas
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
	temp := colEmpresasSolicitantes anySatisfy: [ :x | 
		        unaEmpresa getNombre = x getNombre ].
	temp ifFalse: [ 
		colEmpresasSolicitantes add: unaEmpresa.
		(colPostulantes anySatisfy: [ :x | 
			 unaEmpresa getNombre = x getNombre ]) ifFalse: [ 
			colPostulantes add: unaEmpresa ] ].

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

	propietariaSolicitud := colEmpresasSolicitantes detect: [ :x |  x getNombre = unNombrePostualante getNombre] ifNone: [ nil ].
	propietariaSolicitud ifNotNil: [   colSolicitudesPendientes add: unaSolicitud. propietariaSolicitud agregarSolicitud: unaSolicitud. self changed: colSolicitudesPendientes ].


]

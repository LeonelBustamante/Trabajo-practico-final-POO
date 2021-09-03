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


	self changed:
		(unaEmpresa colSolicitudesGeneradas select: [ :cadaSolEnGeneradas | colEmpresasSolicitantes anySatisfy: [ :cadaSolEnPendientes |  cadaSolEnPendientes id = cadaSolEnGeneradas id ] ])
]

{ #category : #ejercicios }
GestorEmpleos >> listadoSolicitudesPendientesEnFecha: unaFecha [

	| col |
	col := colSolicitudesPendientes select: [ :x | 
		       x fecha equals: unaFecha ].
	col := self colToString: col.
	self changed: col
]

{ #category : #ejercicios }
GestorEmpleos >> registrarEmpresaSolicitante: unaEmpresa [

	| temp |
	temp := colEmpresasSolicitantes anySatisfy: [ :x | 
		        unaEmpresa nombre = x nombre ].
	temp ifFalse: [ 
		colEmpresasSolicitantes add: unaEmpresa.
		(colPostulantes anySatisfy: [ :x | 
			 unaEmpresa nombre = x nombre ]) ifFalse: [ 
			colPostulantes add: unaEmpresa ] ].

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

Class {
	#name : #Solicitud,
	#superclass : #Object,
	#instVars : [
		'id',
		'fecha',
		'tipoPago',
		'valor',
		'descripcion'
	],
	#classVars : [
		'IDContador'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #auxiliares }
Solicitud class >> actualizarID [
IDContador:= IDContador + 1.
]

{ #category : #set }
Solicitud class >> setID: unNumero [

	IDContador := unNumero
]

{ #category : #auxiliares }
Solicitud >> deServicio [

	^ self subclassResponsibility
]

{ #category : #get }
Solicitud >> descripcion [

	^ descripcion
]

{ #category : #get }
Solicitud >> fecha [

	^ fecha
]

{ #category : #get }
Solicitud >> id [

	^ id
]

{ #category : #initialization }
Solicitud >> iniciarSolicitudDescripcion: unaDescripcion valor: unValor [

	id := IDContador.
	descripcion := unaDescripcion.
	fecha:= Date today.
	valor := unValor.
	tipoPago := 'Mensual'.
	IDContador := IDContador + 1
]

{ #category : #get }
Solicitud >> tipoPago [

	^ tipoPago
]

{ #category : #toString }
Solicitud >> toString [

	^ 'Solicitud ID: ' , id asString , String cr
	  , 'Descripcion: ' , descripcion , String cr , 'Tipo de pago: '
	  , tipoPago , String cr , 'Valor Total: ' , valor asString
	  , String cr
]

{ #category : #get }
Solicitud >> valor [

	^ valor
]

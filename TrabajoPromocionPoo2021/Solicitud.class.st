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

{ #category : #'as yet unclassified' }
Solicitud class >> actualizarID [
IDContador:= IDContador + 1.
]

{ #category : #initialization }
Solicitud class >> setID: unNumero [

	IDContador := unNumero
]

{ #category : #'as yet unclassified' }
Solicitud >> deServicio [

	^ self subclassResponsibility
]

{ #category : #getters }
Solicitud >> getDescripcion [

	^ descripcion
]

{ #category : #getters }
Solicitud >> getFecha [

	^ fecha
]

{ #category : #accessing }
Solicitud >> getID [

	^ id
]

{ #category : #getters }
Solicitud >> getTipoPago [

	^ tipoPago
]

{ #category : #getters }
Solicitud >> getValor [

	^ valor
]

{ #category : #'as yet unclassified' }
Solicitud >> iniciarSolicitudDescripcion: unaDescripcion valor: unValor [

	id := IDContador.
	descripcion := unaDescripcion.
	fecha:= Date today.
	valor := unValor.
	tipoPago := 'Mensual'.
	IDContador := IDContador + 1
]

{ #category : #printing }
Solicitud >> toString [
^'Solicitud Servicio ID: ' , id asString , String cr
	  , 'Descripcion: ' , descripcion , String cr , 'Tipo de pago: '
	  , tipoPago , String cr , 'Valor Total: ' , valor asString
	  , String cr.
]

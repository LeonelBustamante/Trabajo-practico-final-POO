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

{ #category : #'as yet unclassified' }
Solicitud >> getDescripcion [

	^ descripcion
]

{ #category : #'as yet unclassified' }
Solicitud >> getFecha [

	^ fecha
]

{ #category : #'as yet unclassified' }
Solicitud >> getID [

	^ id
]

{ #category : #'as yet unclassified' }
Solicitud >> getTipoPago [

	^ tipoPago
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
Solicitud >> toString [

	^ 'Solicitud ID: ' , id asString , String cr
	  , 'Descripcion: ' , descripcion , String cr , 'Tipo de pago: '
	  , tipoPago , String cr , 'Valor Total: ' , valor asString
	  , String cr
]

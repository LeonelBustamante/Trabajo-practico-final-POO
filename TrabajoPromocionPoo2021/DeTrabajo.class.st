Class {
	#name : #DeTrabajo,
	#superclass : #Solicitud,
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
DeTrabajo class >> descripcion: unaDescripcion valor: unValor [

	| nuevaSol |
	nuevaSol := self new.
	nuevaSol iniciarSolicitudDescripcion: unaDescripcion valor: unValor.
	^ nuevaSol
]

{ #category : #'as yet unclassified' }
DeTrabajo >> deServicio [ 

	^false
]

{ #category : #accessing }
DeTrabajo >> toString [

	^ 'Solicitud trabajo ID: ' , id asString , String cr
	  , 'Descripcion: ' , descripcion , String cr , 'Tipo de pago: '
	  , tipoPago , String cr , 'Valor Total: ' , valor , String cr

]

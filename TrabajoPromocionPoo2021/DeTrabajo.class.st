Class {
	#name : #DeTrabajo,
	#superclass : #Solicitud,
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #constructor }
DeTrabajo class >> descripcion: unaDescripcion valor: unValor [

	| nuevaSol |
	nuevaSol := self new.
	nuevaSol iniciarSolicitudDescripcion: unaDescripcion valor: unValor.
	^ nuevaSol
]

{ #category : #auxiliares }
DeTrabajo >> deServicio [ 

	^false
]

{ #category : #toString }
DeTrabajo >> toString [

	| txt |
	txt := super toString.
	^ txt , '(DeTrabajo) ' , String cr
]

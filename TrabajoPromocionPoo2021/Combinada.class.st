Class {
	#name : #Combinada,
	#superclass : #Empresa,
	#instVars : [
		'colProductos'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #'as yet unclassified' }
Combinada class >> nombre: unNombre rubro: unRubro puntos: unosPuntos colProductos: unaColProductos [

	| empresa |
	empresa := self new.
	empresa
		iniciarPostulanteNombre: unNombre rubro: unRubro puntos: unosPuntos colProductos: unaColProductos.
	^ empresa
]

{ #category : #getters }
Combinada >> colToString: unaColeccion [

	| txt |
	txt := ' '.
	unaColeccion do: [ :each | 
		txt := txt , each  , '  ' ].
	^ txt
]

{ #category : #getters }
Combinada >> getColProductos [

	^ colProductos
]

{ #category : #initialization }
Combinada >> iniciarPostulanteNombre: unNombre  rubro: unRubro  puntos: unosPuntos colProductos: unaColProductos [

self iniciarPostulanteNombre: unNombre rubro:  unRubro puntos: unosPuntos .
colProductos := unaColProductos.
]

{ #category : #printing }
Combinada >> toString [

	| col txt |
	txt := super toString.
	col := self colToString: colProductos .
	^ txt , 'Productos: ' , col , String cr
]

{ #category : #'as yet unclassified' }
Combinada >> vendeProductos [
^true
]

{ #category : #'as yet unclassified' }
Combinada >> verificaProductos: unaColeccionCesta [

	^unaColeccionCesta allSatisfy: [ :productoCesta |  colProductos anySatisfy: [ :productoEmpresa | 
			productoCesta = productoEmpresa ] ]
]

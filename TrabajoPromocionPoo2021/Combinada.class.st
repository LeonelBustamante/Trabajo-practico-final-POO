Class {
	#name : #Combinada,
	#superclass : #Empresa,
	#instVars : [
		'colProductos'
	],
	#category : #'TrabajoPromocionPoo2021-Logica'
}

{ #category : #constructor }
Combinada class >> nombre: unNombre rubro: unRubro puntos: unosPuntos tipo:unTipo colProductos: unaColProductos [ 

	| empresa |
	empresa := self new.
	empresa
		iniciarPostulanteNombre: unNombre rubro: unRubro puntos: unosPuntos tipo:unTipo colProductos: unaColProductos.
	^ empresa
]

{ #category : #get }
Combinada >> colProductos [

	^ colProductos
]

{ #category : #auxiliares }
Combinada >> colToString: unaColeccion [

	| txt |
	txt := ' '.
	unaColeccion do: [ :each | txt := txt , each asString , '  ' ].
	^ txt
]

{ #category : #initialization }
Combinada >> iniciarPostulanteNombre: unNombre rubro: unRubro puntos: unosPuntos tipo:unTipo colProductos: unaColProductos [

self iniciarPostulanteNombre: unNombre rubro:  unRubro puntos: unosPuntos tipo: unTipo .
colProductos := unaColProductos.
]

{ #category : #toString }
Combinada >> toString [

	| col txt |
	txt := super toString.
	col := self colToString: colProductos.
	^ txt , 'Productos: ' , col ,'(EMPRESA COMBINADA)', String cr
]

{ #category : #auxiliares }
Combinada >> vendeProductos [
^true
]

{ #category : #auxiliares }
Combinada >> verificaProductos: unaColeccionCesta [

	^unaColeccionCesta allSatisfy: [ :productoCesta |  colProductos anySatisfy: [ :productoEmpresa | 
			productoCesta = productoEmpresa ] ]
]

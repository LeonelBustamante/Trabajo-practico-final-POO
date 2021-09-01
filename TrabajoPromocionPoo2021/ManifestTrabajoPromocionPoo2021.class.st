"
EJEMPLO PARA DEBUGG POR PLAYGROUND

|prop sol1 sol2 sol3 sol4 sol5 pos1 pos2 pos3 col1 col2 col3 colEmpSolicitante gest|
Transcript clear.
gest:= GestorEmpleos crear.
col1 := OrderedCollection new.
col2 := OrderedCollection new.
col3 := OrderedCollection new.
col1 add: 'Pintura'.

col2 add: 'Pintureria'.
col2 add: 'Electro'.

col3 add: 'Pintura'.col3 add: 'Pincel'.

""Solicitudes""
sol1:= DeTrabajo descripcion: 'Pintureria' valor: '1500'.
sol2:= DeServicio descripcion: 'Colchoneria' duracion: 15  valor: 15000 tipoPago: 'Diario'.
sol3:= ConProductos descripcion: 'Pintureria' duracion: 15  valor: 15000 tipoPago: 'Diario'colCestaProductos: col3.
sol4:= DeTrabajo descripcion: 'Electro' valor: '1500'.
sol5:= DeServicio descripcion: 'Colchoneria' duracion: 15  valor: 15000 tipoPago: 'Diario'.

""Postulantes""
pos1 := Empresa nombre: 'CocaCola' rubro: 'Pintureria' puntos: 17000.
pos2 := Persona nombre: 'Leonel' aptitudes: col2.
pos3 := Combinada nombre: 'Rappi' rubro: 'Colchoneria' puntos: 17000    colProductos:  col1 .

prop:= Propuesta postulante: pos1  solicitud: sol1.

gest registrarEmpresaSolicitante: pos3.
gest registrarEmpresaSolicitante: pos1.

gest registrarPostulante: pos3. ""NO SE PODRIA""
gest registrarPostulante: pos2.


gest registrarSolicitud: sol1 postulante: pos1.
gest registrarSolicitud: sol2 postulante: pos2.
gest registrarSolicitud: sol3 postulante: pos3.
gest registrarSolicitud: sol4 postulante: pos1.
gest registrarSolicitud: sol5 postulante: pos2.
gest generarPropuestas.
Transcript show: '********************************LISTADOS***************';cr.
Transcript show: 'colecccion Solicitudes Resueltas';cr; show: gest getColSolicitudesResueltas;cr.
Transcript show: 'colecccion Solicitudes Pendientes';cr;show: gest getColSolicitudesPendientes;cr.
Transcript show: 'colecccion Empresas Solicitantes';cr;show: gest getColEmpresasSolicitantes;cr.
Transcript show: 'coleccion Postulantes';cr;show: gest getColPostulantes;cr.
Transcript show: 'coleccion Propuestas';cr;show: gest getColPropuestas ;cr.
Transcript show: '---Finalizo ejecucion---'.

"
Class {
	#name : #ManifestTrabajoPromocionPoo2021,
	#superclass : #PackageManifest,
	#category : #'TrabajoPromocionPoo2021-Manifest'
}

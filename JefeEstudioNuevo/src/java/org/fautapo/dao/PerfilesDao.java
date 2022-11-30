package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Perfiles;
import org.fautapo.domain.Planes;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario bladimir
 * @fec_modificacion 2016/04/11
*/

public interface PerfilesDao {

  Perfiles getPrfBuscarPerfil(Perfiles perfil) throws DataAccessException;
  List getPstListarPerfiles(Perfiles perfil) throws DataAccessException;
  List getPstListarPerfilesEntidad(Perfiles perfil) throws DataAccessException;
  List getPrfListarConceptos(Perfiles perfil) throws DataAccessException;
  List getPstListarConceptos(Perfiles perfil) throws DataAccessException;
  List getEstListarConceptos(Perfiles perfil) throws DataAccessException;
  List getDctListarConceptos(Perfiles perfil) throws DataAccessException;
  List getUsrListarConceptos(Perfiles perfil) throws DataAccessException;
  int setPstRegistrarTransaccion(Perfiles perfil) throws DataAccessException;
  List getTrnListarTiposPerfiles() throws DataAccessException;
  List getTrnMiListarPerfilesProceso(Perfiles perfil) throws DataAccessException;
  Perfiles getTrnBuscarPerfilProceso(Perfiles perfil) throws DataAccessException;
  Perfiles getPrcBuscarPerfil(Perfiles perfil) throws DataAccessException;
  List getTrnPrcListarPerfiles(Perfiles perfil) throws DataAccessException;
  int setRegistrarTrnDetalle(Perfiles perfil) throws DataAccessException;
  int getTrnPerfilTieneDescuento(Perfiles perfil) throws DataAccessException;
  List getTrnListarPerfilesMaterias(Planes plan) throws DataAccessException;
  Perfiles getTrnBuscarPerfilMateria(Perfiles perfil) throws DataAccessException;
  List getTrnListarPerfiles() throws DataAccessException;
  Perfiles getTrnBuscarPerfil(Perfiles perfil) throws DataAccessException;
  int setTrnRegistrarPerfilMateria(Planes plan) throws DataAccessException;
  Perfiles getTrnBuscarTransaccion(Perfiles perfil) throws DataAccessException;
  Perfiles getTrnBuscarTransaccionRecibo(Perfiles perfil) throws DataAccessException;
  Perfiles getTrnBuscarTransaccionReciboSede(Perfiles perfil) throws DataAccessException;
  List getTrnListarTrnDetalles(Perfiles perfil) throws DataAccessException;
  public List getPrsListarConceptos(Perfiles perfil) throws DataAccessException;
  public int setPrsRegistrarTransaccion(Perfiles perfil) throws DataAccessException;
  List getTrnListarTiposDescuentos() throws DataAccessException;
  Perfiles getTrnBuscarTipoDescuento(Perfiles perfil) throws DataAccessException;  
  Perfiles getBuscarPerfilConcepto(Perfiles perfil) throws DataAccessException;
  List getTrnListarCajeros(Perfiles perfil) throws DataAccessException;
    List getTrnListarCajerosProv(Perfiles perfil) throws DataAccessException;
  List getTrnListarTransacciones(Perfiles perfil) throws DataAccessException;
  /*aqui */
  List getRepCajasTransaccionesDiarias(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDiariasGlobal(Perfiles perfil) throws DataAccessException;
  /*inicio provincia*/
  List getRepCajasTransaccionesDiariasGlobalProv(Perfiles perfil) throws DataAccessException;
   List getRepCajasTransaccionesDiariasGlobalxcajero(Perfiles perfil) throws DataAccessException;
    List getRepCajasTransaccionesDiariasGlobalxcajeroProv(Perfiles perfil) throws DataAccessException;
  /*fin provincia*/
  List getRepCajasTransaccionesDiariasEntidades(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenTesoroEntidades(Perfiles perfil) throws DataAccessException;
  
  List getRepCajasResumenInstitucionalEntidades(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenInstitucionalEntidadesConcepto(Perfiles perfil) throws DataAccessException;
  
  List getRepCajasResumenEstudiantilEntidades(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenEstudiantilEntidadesConcepto(Perfiles perfil) throws DataAccessException;
  
  List getRepCajasResumenProfactulativoEntidades(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenProfactulativoCarrera(Perfiles perfil) throws DataAccessException; 
  List getRepCajasDetalladoEntidades(Perfiles perfil) throws DataAccessException;
 
  List getRepCajasDetalladoCarrera(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDetalleGlobal(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDetalleGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDetalleGlobalAnuladas(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDetalleGlobalAnuladasProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDetalleEntidad(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDetalle(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesDetalleAnuladas(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenMatriculas(Perfiles perfil) throws DataAccessException;
  
  List getRepCajasResumenTesoroCarrera(Perfiles perfil) throws DataAccessException;
  
  List getRepCajasResumenMatriculasGlobal(Perfiles perfil) throws DataAccessException;
  //Nro_2
  List getRepCajasResumenMatriculasGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenInstitucional(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenInstitucionalGlobal(Perfiles perfil) throws DataAccessException;
  //Nro_3
  List getRepCajasResumenInstitucionalGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenEstudiantil(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenEstudiantilGlobal(Perfiles perfil) throws DataAccessException;
  //Nro_4
  List getRepCajasResumenEstudiantilGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenProfacultativo(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenProfacultativoGlobal(Perfiles perfil) throws DataAccessException;
  //Nro_5
  List getRepCajasResumenProfacultativoGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoMatriculas(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoMatriculasGlobal(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoMatriculasGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoEstudiantil(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoEstudiantilGlobal(Perfiles perfil) throws DataAccessException;
   List getRepCajasResumenDetalladoEstudiantilGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoInstitucional(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoInstitucionalGlobal(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoInstitucionalGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetallado(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoGlobal(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoGlobalMatricula(Perfiles perfil) throws DataAccessException;
  List getRepCajasResumenDetalladoGlobalProv(Perfiles perfil) throws DataAccessException;
  List getRepCajasTransaccionesPorPrograma(Perfiles perfil) throws DataAccessException;
  
  List getRepCajasResumenDetalladoEntidades(Perfiles perfil) throws DataAccessException;
//  List getRepCajasGlobalGeneral(Perfiles perfil) throws DataAccessException;

  /*hast aqui*/
  
  List getTrnListarTransaccionesRecibo(Perfiles perfil) throws DataAccessException;
  List getTrnListarTransaccionesReciboSede(Perfiles perfil) throws DataAccessException;
  List getTrnListarTrnDetalles2(Perfiles perfil) throws DataAccessException;

  List getTrnBuscarPorNroRecibo(Perfiles perfil) throws DataAccessException;
  List getTrnBuscarPorNroReciboSede(Perfiles perfil) throws DataAccessException;
  void setTrnBorrarDetalle(Perfiles perfil) throws DataAccessException;
  void setTrnBorrarTransaccion(Perfiles perfil) throws DataAccessException;
  
  int getTrnBuscarSiguienteNroRecibo(Perfiles perfil) throws DataAccessException;
  void setTrnActualizarNroRecibo(Perfiles perfil) throws DataAccessException;

}
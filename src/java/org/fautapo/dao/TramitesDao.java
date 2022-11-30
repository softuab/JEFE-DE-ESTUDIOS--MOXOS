package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-22
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-29
*/

public interface TramitesDao {

  List getListarFormularioNuevo(Tramites tramite) throws DataAccessException;
  int setInsertarTramite(Tramites tramite) throws DataAccessException;
  int getBuscarActividadMinima(Tramites tramite) throws DataAccessException;
  int setInsertarFrLog(Tramites tramite) throws DataAccessException;
  int setRegistrarValor(Tramites tramite) throws DataAccessException;
  Tramites getBuscarTramite(Tramites tramite) throws DataAccessException;
  int setRecibirTramite(Tramites tramite) throws DataAccessException;
  Tramites getBuscarFrLog(Tramites tramite) throws DataAccessException;
  int setAvanzarTramite(Tramites tramite) throws DataAccessException;
  int setConcluirTramite(Tramites tramite) throws DataAccessException;
  int setEliminarFrLog(Tramites tramite) throws DataAccessException;
  List getListarTramitesMios(Tramites tramite) throws DataAccessException;
  List getListarTramitesMiosFiltrado(Tramites tramite) throws DataAccessException;
  List getListarTramitesMiosDespachados(Tramites tramite) throws DataAccessException;
  List getListarTramitesMiosDespachadosFiltrado(Tramites tramite) throws DataAccessException;
  List getListarUsuariosActividadSiguiente(Tramites tramite) throws DataAccessException;
  List getListarCamposReferencia(Tramites tramite) throws DataAccessException;
  int setRetrocederTramite(Tramites tramite) throws DataAccessException;
  List getListarFormulario(Tramites tramite) throws DataAccessException;
  
  //Administrar mis pendientes agrupados
  List getListarTramitesMiosAgrupados(Tramites tramite) throws DataAccessException;
  List getListarTramitesMiosAgrupados2(Tramites tramite) throws DataAccessException;
  List getListarTramitesMiosAgrupadosDespachados(Tramites tramite) throws DataAccessException;
  List getListarTramitesMiosAgrupadosDespachados2(Tramites tramite) throws DataAccessException;
  Tramites getContarTramitesPorFechaEstado(Tramites tramite) throws DataAccessException;
  Tramites getContarTramitesPorFechaEstado2(Tramites tramite) throws DataAccessException;
  Tramites getContarTramitesPorFecha(Tramites tramite) throws DataAccessException;
  Tramites getContarTramitesPorFecha2(Tramites tramite) throws DataAccessException;
  Tramites getContarTramitesPorFecha3(Tramites tramite) throws DataAccessException;
  //Fin Administrar mis pendientes agrupados
  
  //Busqueda de tramites
  List getListarTramitesPorCampos(Tramites tramite) throws DataAccessException;
  int getBuscarTramiteExisteUbicacionOrganica(Tramites tramite) throws DataAccessException;
  Tramites getBuscarTramiteUbicacionOrganica(Tramites tramite) throws DataAccessException;
  List getListarTramiteLog(Tramites tramite) throws DataAccessException;
  List getListarTramitesFechaUbicacionOrganica(Tramites tramite) throws DataAccessException;
  List getListarTramitesIniciados(Tramites tramite) throws DataAccessException;
  List getListarTramitesMovidos(Tramites tramite) throws DataAccessException;
  List getListarTramitesConcluidos(Tramites tramite) throws DataAccessException;
  List getListarTramitesIniciadosDetalle(Tramites tramite) throws DataAccessException;
  List getListarTramitesMovidosDetalle(Tramites tramite) throws DataAccessException;
  List getListarTramitesConcluidosDetalle(Tramites tramite) throws DataAccessException;
  //Fin Busqueda de tramites
  
  //Busqueda ejecutiva
  List getListarDatosTramite(Tramites tramite) throws DataAccessException;
  //Fin Busqueda ejecutiva

  //Bloquear Tramites
  int setBloquearTramite(Tramites tramite) throws DataAccessException;
  //Fin Bloquear Tramites

  //Desbloquear Tramites
  int setDesbloquearTramite(Tramites tramite) throws DataAccessException;
  //Fin Desbloquear Tramites

  //Anular tramites
  List getListarTramitesAnulados() throws DataAccessException;
  int setAnularTramite(Tramites tramite) throws DataAccessException;
  //Fin Anular tramites

  //Imprimir tramites
  List getListarTramitesImpresion(Tramites tramite) throws DataAccessException;
  //Imprimir tramites

  //Redireccionar tramites
  List getListarTramites(Tramites tramite) throws DataAccessException;
  int setRedireccionarTramite(Tramites tramite) throws DataAccessException;
  //Fin Redireccionar tramites

  //Reingresar tramites
  Tramites getBuscarTramite2(Tramites tramite) throws DataAccessException;
  int setReingresarTramite(Tramites tramite) throws DataAccessException;
  //Fin Reingresar tramites

  //Administrar correspondencias
  Tramites getBuscarTipoProceso2(Tramites tramite) throws DataAccessException;  
  List getListarTramitesMiosCorrespondenciaDe(Tramites tramite) throws DataAccessException;   
  List getListarTramitesMiosCorrespondenciaPara(Tramites tramite) throws DataAccessException;    
  int setAvanzarCorrespondencia(Tramites tramite) throws DataAccessException;
  int setInsertarTramiteCopia(Tramites tramite) throws DataAccessException;   
  //Fin Administrar correspondencias

  //Busqueda por Fecha y Estados
  List getListarEstadosTramites() throws DataAccessException;
  List getListarTramitesEstadoFechaUbicacionOrganica(Tramites tramite) throws DataAccessException;
  //Fin Busqueda por Fecha y Estados

  //Habilitar tramite
  int setHabilitarTramite(Tramites tramite) throws DataAccessException;
  //FIN Habilitar tramite

  List getListarTramitesPorEstadoFecha(Tramites tramite) throws DataAccessException;
  
  //Administrar Kardex
  List getListarTramitesMiosKardex(Tramites tramite) throws DataAccessException;
  List getListarTramitesMiosKardexPorProceso(Tramites tramite) throws DataAccessException;
  
  //Para ver siguiente
  List getListarTramitesMiosKardexPorProcesoAtendidos(Tramites tramite) throws DataAccessException;
  Tramites getBuscarMinMaxTramitesMiosKardexPorProceso(Tramites tramite) throws DataAccessException;
  
  //Reporte de tramites por funcionarios
  List getListarTramitesFuncionarios(Tramites tramite) throws DataAccessException;
  List getListarTramitesFuncionarioProceso(Tramites tramite) throws DataAccessException;
  List getListarTramitesAtendidos(Tramites tramite) throws DataAccessException;
  Tramites getContarTramitesAtendidos(Tramites tramite) throws DataAccessException;
  //Fin - Reporte de tramites por funcionarios

  String getContarPaginas(Tramites tramite) throws DataAccessException;
  String getContarPaginasDespachados(Tramites tramite) throws DataAccessException;
  List getListarTramitesCorrelativo(Tramites tramite) throws DataAccessException;

  //Administrar tramites concluidos
  List getListarTramitesConcluidosPorProceso(Tramites tramite) throws DataAccessException;
  List getListarTramitesConcluidosPorProcesoFiltrado(Tramites tramite) throws DataAccessException;
  String getContarPaginasConcluidos(Tramites tramite) throws DataAccessException;
  String getContarPaginasTramitesGestionProceso(Tramites tramite) throws DataAccessException;
  //Fin - Administrar tramites concluidos
  
  //SILVIA
  //BUSQUEDA DE CORRESPONDENCIA DESPACHADAS
  List getListarCorrespondenciaDes(Tramites tramite) throws DataAccessException;   
  
    // Busqueda de Correspodencia por referencia
  List getListarCorrespReference(Tramites tramite) throws DataAccessException;   
  
    // Busqueda de Correspodencia por Remitente
  List getListarCorrespRemitente(Tramites tramite) throws DataAccessException;   

  //Correspodencia Despachadas por fecha
  List getListarCorrespDesFecha(Tramites tramite) throws DataAccessException;   
  // fin SILVIA
  
  //Cambiar Estado Tramites
  int setCambiarEstadoTramite(Tramites tramite) throws DataAccessException;
  //Fin /Cambiar Estado Tramites

//INICIO - METODOS ADICIONADOS POR LA UAP
  // TRAMITES ATENDIDOS
  List getTrListarProcesos() throws DataAccessException;
//FIN - METODOS ADICIONADOS POR LA UAP

}
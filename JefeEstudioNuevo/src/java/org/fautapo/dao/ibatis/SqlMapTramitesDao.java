package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.TramitesDao;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-22
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-29
*/

public class SqlMapTramitesDao extends SqlSessionDaoSupport implements TramitesDao {

  public List getListarFormularioNuevo(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarFormularioNuevo", tramite);
  }

  public int setInsertarTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setInsertarTramite", tramite);
    return i.intValue();
  }
  
  public int getBuscarActividadMinima(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getBuscarActividadMinima", tramite);
    return i.intValue();
  }
  
  public int setInsertarFrLog(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setInsertarFrLog", tramite);
    return i.intValue();
  }
  
  public int setRegistrarValor(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarValor", tramite);
    return i.intValue();
  }
  
  public Tramites getBuscarTramite(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getBuscarTramite", tramite);
  }

  public int setRecibirTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRecibirTramite", tramite);
    return i.intValue();
  }
  
  public Tramites getBuscarFrLog(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getBuscarFrLog", tramite);
  }

  public int setAvanzarTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setAvanzarTramite", tramite);
    return i.intValue();
  }
  
  public int setConcluirTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setConcluirTramite", tramite);
    return i.intValue();
  }
  
  public int setEliminarFrLog(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarFrLog", tramite);
    return i.intValue();
  }
  
  public List getListarTramitesMios(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMios", tramite);
  }
  
  public List getListarTramitesMiosFiltrado(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosFiltrado", tramite);
  }
  
  public List getListarTramitesMiosDespachados(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosDespachados", tramite);
  }
  
  public List getListarTramitesMiosDespachadosFiltrado(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosDespachadosFiltrado", tramite);
  }
  
  public List getListarUsuariosActividadSiguiente(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarUsuariosActividadSiguiente", tramite);
  }
  
  public List getListarCamposReferencia(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposReferencia", tramite);
  }

  public int setRetrocederTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRetrocederTramite", tramite);
    return i.intValue();
  }

  public List getListarFormulario(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarFormulario", tramite);
  }

  //Administrar mis pendientes agrupados
  public List getListarTramitesMiosAgrupados(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosAgrupados", tramite);
  }
  
  public List getListarTramitesMiosAgrupados2(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosAgrupados2", tramite);
  }
  
  public List getListarTramitesMiosAgrupadosDespachados(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosAgrupadosDespachados", tramite);
  }
  
  public List getListarTramitesMiosAgrupadosDespachados2(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosAgrupadosDespachados2", tramite);
  }
  
  public Tramites getContarTramitesPorFechaEstado(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getContarTramitesPorFechaEstado", tramite);
  }
  
  public Tramites getContarTramitesPorFechaEstado2(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getContarTramitesPorFechaEstado2", tramite);
  }
  
  public Tramites getContarTramitesPorFecha(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getContarTramitesPorFecha", tramite);
  }

  public Tramites getContarTramitesPorFecha2(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getContarTramitesPorFecha2", tramite);
  }

  public Tramites getContarTramitesPorFecha3(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getContarTramitesPorFecha3", tramite);
  }
  //Fin Administrar mis pendientes agrupados

  //Busquedas de tramites
  public List getListarTramitesPorCampos(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesPorCampos", tramite);
  }

  public int getBuscarTramiteExisteUbicacionOrganica(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getBuscarTramiteExisteUbicacionOrganica", tramite);
    return i.intValue();
  }
  
  public Tramites getBuscarTramiteUbicacionOrganica(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getBuscarTramiteUbicacionOrganica", tramite);
  }

  public List getListarTramiteLog(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramiteLog", tramite);
  }

  public List getListarTramitesFechaUbicacionOrganica(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesFechaUbicacionOrganica", tramite);
  }

  public List getListarTramitesIniciados(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesIniciados", tramite);
  }

  public List getListarTramitesMovidos(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMovidos", tramite);
  }

  public List getListarTramitesConcluidos(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesConcluidos", tramite);
  }

  public List getListarTramitesIniciadosDetalle(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesIniciadosDetalle", tramite);
  }

  public List getListarTramitesMovidosDetalle(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMovidosDetalle", tramite);
  }

  public List getListarTramitesConcluidosDetalle(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesConcluidosDetalle", tramite);
  }
  //Fin Busquedas de tramites

  //Busqueda ejecutiva
  public List getListarDatosTramite(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarDatosTramite", tramite);
  }
  //Fin Busqueda ejecutiva

  //Bloquear Tramites
  public int setBloquearTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setBloquearTramite", tramite);
    return i.intValue();
  }
  //Fin Bloquear Tramites

  //Desbloquear Tramites
  public int setDesbloquearTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setDesbloquearTramite", tramite);
    return i.intValue();
  }
  //Fin Desbloquear Tramites

  //Anular tramites
  public List getListarTramitesAnulados() throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesAnulados", null);
  }
  
  public int setAnularTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setAnularTramite", tramite);
    return i.intValue();
  }
  //Fin Anular tramites

  //Imprimir tramites
  public List getListarTramitesImpresion(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesImpresion", tramite);
  }
  //Fin Imprimir tramites
  
  //Redireccionar tramites
  public List getListarTramites(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramites", tramite);
  }

  public int setRedireccionarTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRedireccionarTramite", tramite);
    return i.intValue();
  }
  //Fin Redireccionar tramites
  
  //Reingresar tramites
  public Tramites getBuscarTramite2(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getBuscarTramite2", tramite);
  }
  
  public int setReingresarTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setReingresarTramite", tramite);
    return i.intValue();
  }
  //Fin Reingresar tramites

  //Administrar correspondencias
  public Tramites getBuscarTipoProceso2(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getBuscarTipoProceso2", tramite);
  }    
  
  public List getListarTramitesMiosCorrespondenciaDe(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosCorrespondenciaDe", tramite);
  }

  public List getListarTramitesMiosCorrespondenciaPara(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosCorrespondenciaPara", tramite);
  }  

  public int setAvanzarCorrespondencia(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setAvanzarCorrespondencia", tramite);
    return i.intValue();
  }  

  public int setInsertarTramiteCopia(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setInsertarTramiteCopia", tramite);
    return i.intValue();
  }
  //Fin Administrar correspondencias

  //Busqueda por Fecha y Estados
  public List getListarEstadosTramites() throws DataAccessException {
    return getSqlSession().selectList("getListarEstadosTramites", null);
  }
  
  public List getListarTramitesEstadoFechaUbicacionOrganica(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesEstadoFechaUbicacionOrganica", tramite);
  }
  //Fin Busqueda por Fecha y Estados  
  
  //Habilitar Tramites
  public int setHabilitarTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setHabilitarTramite", tramite);
    return i.intValue();
  }
  //Fin Habilitar Tramites  

  public List getListarTramitesPorEstadoFecha(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesPorEstadoFecha", tramite);
  }
  
  //Administrar Kardex
  public List getListarTramitesMiosKardex(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosKardex", tramite);
  }
  
  public List getListarTramitesMiosKardexPorProceso(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosKardexPorProceso", tramite);
  }
  
   //Para ver los siguientes kardexs
  public List getListarTramitesMiosKardexPorProcesoAtendidos(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosKardexPorProcesoAtendidos", tramite);
  }
  
  public Tramites getBuscarMinMaxTramitesMiosKardexPorProceso(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getBuscarMinMaxTramitesMiosKardexPorProceso", tramite);
  }
  
  //Reporte de tramites por funcionarios
  public List getListarTramitesFuncionarios(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesFuncionarios", tramite);
  }
 
  public List getListarTramitesFuncionarioProceso(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesFuncionarioProceso", tramite);
  }

  public List getListarTramitesAtendidos(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesAtendidos", tramite);
  }
  
  public Tramites getContarTramitesAtendidos(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getContarTramitesAtendidos", tramite);
  }
  //Fin - Reporte de tramites por funcionarios

  public String getContarPaginas(Tramites tramite) throws DataAccessException {
    return (String) getSqlSession().selectOne("getContarPaginas", tramite);
  }

  public String getContarPaginasDespachados(Tramites tramite) throws DataAccessException {
    return (String) getSqlSession().selectOne("getContarPaginasDespachados", tramite);
  }

  public List getListarTramitesCorrelativo(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesCorrelativo", tramite);
  }

  //Administrar tramites concluidos
  public List getListarTramitesConcluidosPorProceso(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesConcluidosPorProceso", tramite);
  }

  public List getListarTramitesConcluidosPorProcesoFiltrado(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesConcluidosPorProcesoFiltrado", tramite);
  }

  public String getContarPaginasConcluidos(Tramites tramite) throws DataAccessException {
    return (String) getSqlSession().selectOne("getContarPaginasConcluidos", tramite);
  }

  public String getContarPaginasTramitesGestionProceso(Tramites tramite) throws DataAccessException {
    return (String) getSqlSession().selectOne("getContarPaginasTramitesGestionProceso", tramite);
  }
  //Fin - Administrar tramites concluidos
  //  SILVIA
  public List getListarCorrespondenciaDes(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarCorrespondenciaDes", tramite);
  }

 // Busqueda de Correspondencia
  public List getListarCorrespReference(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarCorrespReference", tramite);
  }
  
   // Busqueda de Correspondencia por Remitente
  public List getListarCorrespRemitente(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarCorrespRemitente", tramite);
  }

 //  Correspondencia despachadas por fecha
  public List getListarCorrespDesFecha(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarCorrespDesFecha", tramite);
  }
  //  FIN SILVIA
  
  //Cambiar Estado Tramites
  public int setCambiarEstadoTramite(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setCambiarEstadoTramite", tramite);
    return i.intValue();
  }
  //Fin Cambiar Estado Tramites

//INICIO - METODOS ADICIONADOS POR LA UAP
  // TRAMITES ATENDIDOS
  public List getTrListarProcesos() throws DataAccessException {
    return getSqlSession().selectList("getTrListarProcesos", null);
  }
//FIN - METODOS ADICIONADOS POR LA UAP

}
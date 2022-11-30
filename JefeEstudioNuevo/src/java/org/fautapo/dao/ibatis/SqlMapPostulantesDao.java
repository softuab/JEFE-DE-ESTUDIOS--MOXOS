package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.PostulantesDao;
import org.fautapo.domain.Postulantes;

public class SqlMapPostulantesDao extends SqlSessionDaoSupport implements PostulantesDao {
  
  public Postulantes getPstBuscarPostulante(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getPstBuscarPostulante", postulante);
  }
  
  public Postulantes getPstBuscarPostulantePrograma(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getPstBuscarPostulantePrograma", postulante);
  } 
  
  public List getPstListarPostulantesNombres(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getPstListarPostulantesNombres", postulante);
  }  
  
  public List getPstListarPostulantesDip(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getPstListarPostulantesDip", postulante);
  }
  
  //Mi segunda parte
  //Registra Postulante
    // Listar - Jojo
  public List getMiListarPostulantesDip(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPostulantesDip", postulante);
  }

  public List getMiListarPostulantesNombre(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPostulantesNombre", postulante);
  }
  // Listar - Jojo
  //CRCB
  public int setMiRegistrarPstPersona(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setMiRegistrarPstPersona", postulante);
    return i.intValue();
  }
  
  public int setMiRegistrarPostulante(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setMiRegistrarPostulante", postulante);
    return i.intValue();
  }
  
  // aqui
  public int setMiRegistrarPostulanteC(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setMiRegistrarPostulanteC", postulante);
    return i.intValue();
  }
//
  public int setPstRegistrarDocumentos(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setPstRegistrarDocumentos", postulante);
    return i.intValue();
  }
  
  
  public Postulantes getPstBuscarPersona(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getPstBuscarPersona", postulante);
  }
  
  public List getListarTiposDocumentos() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposDocumentos", null);
  }
  
  public List getListarTiposDocumentosClasificacionVigente(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getListarTiposDocumentosClasificacionVigente", postulante);
  }
  
  public List getListarTiposClasificaciones() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposClasificaciones", null);
  }  
  
  public List getListarTiposClasificacionesPost() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposClasificacionesPost", null);
  }  

  public int setPstRegistrarMatricula(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setPstRegistrarMatricula", postulante);
    return i.intValue();
  }
  
  public List getListarPstMateriasProgramadas(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getListarPstMateriasProgramadas", postulante);
  }
  
  public Postulantes getPstBuscarPostulanteNombres(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getPstBuscarPostulanteNombres", postulante);
  }
  
  public Postulantes getPstBuscarPostulanteNombresSede(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getPstBuscarPostulanteNombresSede", postulante);
  }
  
  public Postulantes getPstBuscarMatriculaPostulante(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getPstBuscarMatriculaPostulante", postulante);
  }
  
  public List getMiListarPstDipGestionPeriodo(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPstDipGestionPeriodo", postulante);
  }
  
  public List getMiListarPstNombreGestionPeriodo(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPstNombreGestionPeriodo", postulante);
  }

  public List getMiListarPstProgramaGestionPeriodo(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPstProgramaGestionPeriodo", postulante);
  }
  
  public List getMiListarPstProgramaGestionPeriodoSede(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPstProgramaGestionPeriodoSede", postulante);
  }
  //Fin REgistra Postulante
     public List getMiListarPstPsaGestionPeriodo(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPstPsaGestionPeriodo", postulante);
  }
   public List getRepAsistenciapostulantepsa(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getRepAsistenciapostulantepsa", postulante);
  }
 public int setRegistrarasignacion(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarasignacion", postulante);
    return i.intValue();
  }
  public int setPstModificarAsistenciaPostulante(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setPstModificarAsistenciaPostulante", postulante);
    return i.intValue();
  }
  public List getRepAsistenciapostulantepsaci(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getRepAsistenciapostulantepsaci", postulante);
  }
   public List getDctListarPostulantespsasoloid(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getDctListarPostulantespsasoloid", postulante);
  }
  public List getNroPostulantesPsa(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getNroPostulantesPsa", postulante);
  }
  public List getMiListarPstAprobadoDipGestionPeriodo(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPstAprobadoDipGestionPeriodo", postulante);
  }
  
  public List getMiListarPstAprobadoNombreGestionPeriodo(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPstAprobadoNombreGestionPeriodo", postulante);
  }
  
  public int setPstModificarEstadoPostulante(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setPstModificarEstadoPostulante", postulante);
    return i.intValue();
  }
  
  //Pst PErsonas
  public List getPstListarPersonasNombre(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getPstListarPersonasNombre", postulante);
  }
  
  public List getPstListarPersonasDip(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getPstListarPersonasDip", postulante);
  }
  
  public List getMiListarPostulantesPorPersona(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPostulantesPorPersona", postulante);
  }
  
  public int setRegistrarPstPrsColegio(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarPstPrsColegio", postulante);
    return i.intValue();
  }
  
  public Postulantes getBuscarPstPersonaColegio(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getBuscarPstPersonaColegio", postulante);
  }

  // inicio JOJO
  public Postulantes getMiPrsBuscarPostulante(Postulantes postulante) throws DataAccessException {
    return (Postulantes) getSqlSession().selectOne("getMiPrsBuscarPostulante", postulante);
  }

  public void setPstRegistrarPrograma(Postulantes postulante) throws DataAccessException {
    getSqlSession().selectOne("setPstRegistrarPrograma", postulante);
  }
  // fin JOJO
  //Estadistica
  public List getNroPstInscritosHabilitados(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getNroPstInscritosHabilitados", postulante);
  }
 
  public List getNroPstInscritosHabilitadosTipoAdmision(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getNroPstInscritosHabilitadosTipoAdmision", postulante);
  } 
  
  //Programa anterios postulante
  public int setPstRegistrarProgramaAnterior(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setPstRegistrarProgramaAnterior", postulante);
    return i.intValue();
  }

  //Listado de Postulantes Inscritos
  public List getPstListarInscritosPorProgramaTipoAdmision(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getPstListarInscritosPorProgramaTipoAdmision", postulante);
  }

  //Listado de Postulantes Aprobados
  public List getPstListarAprobadosPorProgramaTipoAdmision(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getPstListarAprobadosPorProgramaTipoAdmision", postulante);
  }

  //Listado de Postulantes Reprobados
  public List getPstListarReprobadosPorProgramaTipoAdmision(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getPstListarReprobadosPorProgramaTipoAdmision", postulante);
  }
 
 //Buscar Postulantes
 public List getMiListarPostulantesDipTipoAdm(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPostulantesDipTipoAdm", postulante);
  }

  public List getMiListarPostulantesNombreTipoAdm(Postulantes postulante) throws DataAccessException {
    return getSqlSession().selectList("getMiListarPostulantesNombreTipoAdm", postulante);
  } 

//INICIO - METODOS ADICIONADOS POR LA UAP
 //Insertar pst_personas para tramites
  public int setMiRegistrarPstPersonaTrn(Postulantes postulante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setMiRegistrarPstPersonaTrn", postulante);
    return i.intValue();
  }
//FIN - METODOS ADICIONADOS POR LA UAP

}
package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Postulantes;

public interface PostulantesDao {
  
  Postulantes getPstBuscarPostulante(Postulantes postulante) throws DataAccessException;  
  Postulantes getPstBuscarPostulantePrograma(Postulantes postulante) throws DataAccessException;  
  List getPstListarPostulantesNombres(Postulantes postulante) throws DataAccessException;    
  List getPstListarPostulantesDip(Postulantes postulante) throws DataAccessException;     
  //Registrar Postulantes
  // JOJO
  List getMiListarPostulantesDip(Postulantes postulante) throws DataAccessException;
  List getMiListarPostulantesNombre(Postulantes postulante) throws DataAccessException;
  // JOJO
  //CRCB
  int setMiRegistrarPstPersona(Postulantes postulante) throws DataAccessException;      
  int setMiRegistrarPostulante(Postulantes postulante) throws DataAccessException;      
  //
  int setMiRegistrarPostulanteC(Postulantes postulante) throws DataAccessException;      
  
  int setPstRegistrarDocumentos(Postulantes postulante) throws DataAccessException;      
  Postulantes getPstBuscarPersona(Postulantes postulante) throws DataAccessException;  
  List getListarTiposDocumentos() throws DataAccessException;
  List getListarTiposDocumentosClasificacionVigente(Postulantes postulante) throws DataAccessException;
  List getListarTiposClasificaciones() throws DataAccessException;
  List getListarTiposClasificacionesPost() throws DataAccessException;
  int setPstRegistrarMatricula(Postulantes postulante) throws DataAccessException;      
  List getListarPstMateriasProgramadas(Postulantes postulante) throws DataAccessException;
  Postulantes getPstBuscarPostulanteNombres(Postulantes postulante) throws DataAccessException;  
  Postulantes getPstBuscarPostulanteNombresSede(Postulantes postulante) throws DataAccessException;  
  Postulantes getPstBuscarMatriculaPostulante(Postulantes postulante) throws DataAccessException;  
  List getMiListarPstNombreGestionPeriodo(Postulantes postulante) throws DataAccessException;
  List getMiListarPstDipGestionPeriodo(Postulantes postulante) throws DataAccessException;
  List getMiListarPstProgramaGestionPeriodo(Postulantes postulante) throws DataAccessException; 
   List getMiListarPstProgramaGestionPeriodoSede(Postulantes postulante) throws DataAccessException; 
  // FIN Registrar Postulantes
   List getMiListarPstPsaGestionPeriodo(Postulantes postulante) throws DataAccessException;
   List getRepAsistenciapostulantepsa(Postulantes postulante) throws DataAccessException;
  int setRegistrarasignacion(Postulantes postulante) throws DataAccessException;      
   List getRepAsistenciapostulantepsaci(Postulantes postulante) throws DataAccessException;
   List getDctListarPostulantespsasoloid(Postulantes postulante) throws DataAccessException;
    List getNroPostulantesPsa(Postulantes postulante) throws DataAccessException;
  int setPstModificarAsistenciaPostulante(Postulantes postulante) throws DataAccessException;    
  List getMiListarPstAprobadoDipGestionPeriodo(Postulantes postulante) throws DataAccessException;
  List getMiListarPstAprobadoNombreGestionPeriodo(Postulantes postulante) throws DataAccessException;  
  int setPstModificarEstadoPostulante(Postulantes postulante) throws DataAccessException;      
  //Pst Personas
  List getPstListarPersonasNombre(Postulantes postulante) throws DataAccessException;  
  List getPstListarPersonasDip(Postulantes postulante) throws DataAccessException;  
  List getMiListarPostulantesPorPersona(Postulantes postulante) throws DataAccessException;     
  int setRegistrarPstPrsColegio(Postulantes postulante) throws DataAccessException;      
  Postulantes getBuscarPstPersonaColegio(Postulantes postulante) throws DataAccessException;     

  // inicio JOJO
  Postulantes getMiPrsBuscarPostulante(Postulantes postulante) throws DataAccessException;
  void setPstRegistrarPrograma(Postulantes postulante) throws DataAccessException;
  // fin JOJO
  //Estadistica
  List getNroPstInscritosHabilitados(Postulantes postulante) throws DataAccessException;     
  List getNroPstInscritosHabilitadosTipoAdmision(Postulantes postulante) throws DataAccessException;     
  //Registrar programa anterior
  int setPstRegistrarProgramaAnterior(Postulantes postulante) throws DataAccessException;     

  //Listado de Postulantes Inscritos
  List getPstListarInscritosPorProgramaTipoAdmision(Postulantes postulante) throws DataAccessException;

  //Listado de Postulantes Aprobados
  List getPstListarAprobadosPorProgramaTipoAdmision(Postulantes postulante) throws DataAccessException;

  //Listado de Postulantes Reprobados
  List getPstListarReprobadosPorProgramaTipoAdmision(Postulantes postulante) throws DataAccessException;
  
  //Buscar Postulantes
  List getMiListarPostulantesDipTipoAdm(Postulantes postulante) throws DataAccessException;
  List getMiListarPostulantesNombreTipoAdm(Postulantes postulante) throws DataAccessException;     

//INICIO - METODOS ADICIONADOS POR LA UAP
  //Insertar Pst_personas para tramites
  int setMiRegistrarPstPersonaTrn(Postulantes postulante) throws DataAccessException;      
//FIN - METODOS ADICIONADOS POR LA UAP

}
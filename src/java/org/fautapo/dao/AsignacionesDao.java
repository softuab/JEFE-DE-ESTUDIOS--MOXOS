package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Materias;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-07
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-07
*/

public interface AsignacionesDao {

  Asignaciones getDctBuscarAsignacionDocente(Asignaciones asignacion) throws DataAccessException;
   Asignaciones getDctBuscarAsignacionDocentemaslafuncion(Asignaciones asignacion) throws DataAccessException;
 
  Asignaciones getDctBuscarAsignacionDocenteDesignacion(Asignaciones asignacion) throws DataAccessException;
  List getMtrBuscarMateriaAhorro(Asignaciones asignacion) throws DataAccessException;    
  //Alex
  List getDctListarAsignacionDocente(Asignaciones asignacion) throws DataAccessException;
  List getMtrListarMateriaAhorro(Asignaciones asignacion) throws DataAccessException;
  Asignaciones getDctBuscarAsignacionDocenteMateria(Asignaciones asignacion) throws DataAccessException;
  //Fin Alex
  int setRegistrarAsignacionDocente(Asignaciones asignacion) throws DataAccessException;
   int setRegistrarAsignacionDocentefac(Asignaciones asignacion) throws DataAccessException;
   int setRegistrarMemo(Asignaciones asignacion) throws DataAccessException;
  int setRegistrarFaseResolucion(Asignaciones asignacion) throws DataAccessException;
  int setRegistrarFaseResolucionfac(Asignaciones asignacion) throws DataAccessException;
  int setRegistrarFaseResolucionuni(Asignaciones asignacion) throws DataAccessException;
  int setmostrarplan(Asignaciones asignacion) throws DataAccessException;
   int setRegistrarRetrocederFaseResolucion(Asignaciones asignacion) throws DataAccessException;
  Asignaciones getDctVerificarAsignacionDocenteGestion(Asignaciones asignacion) throws DataAccessException;
  List getListarDocentesProgramados(Asignaciones asignacion) throws DataAccessException;
  //para sacar el numero del siguiente memo
   int getTrnBuscarSiguienteNroMemo(Asignaciones asignacion) throws DataAccessException;
     int getTrnBuscaridMemo(Asignaciones asignacion) throws DataAccessException;
  //por programa
  List getDctListarAsignacionDocenteProgramaPlan(Asignaciones asignacion) throws DataAccessException;
  List getDctListarAsignacionDocenteProgramaPlanTipoGrado(Asignaciones asignacion) throws DataAccessException;

  //Buscar docentes
  List getListarAsignacionDocenteTodas(Asignaciones asignacion) throws DataAccessException;

  //Cerrar libreta Por Dct Asignacion
  List getListarMateriasCerrarLibretaDctAsignacion(Materias materia) throws DataAccessException;
  
  //Eliminar Asignacion
  int setEliminarAsignacionDocenteMateria(Asignaciones asignacion) throws DataAccessException;
  
  //Devuelve id fase resolucion
  int setBuscar_id_fase_resolucion(Asignaciones asignacion) throws DataAccessException;
   int setBuscar_id_fase_resolucionFinal(Asignaciones asignacion) throws DataAccessException;

//INICIO - METODOS ADICIONADOS POR LA UAP  
  //Asignacion Docente- Materia
  List getDctListarAsignacionDocenteMateria(Asignaciones asignacion) throws DataAccessException;
  List getDctListarAsignacionDocenteMateriaFuncion(Asignaciones asignacion) throws DataAccessException;
  List getDctListarAsignacionDocenteMateriaFuncionxid(Asignaciones asignacion) throws DataAccessException;
  List getDctListarAsignacionDocenteMateriaFuncionsintitular(Asignaciones asignacion) throws DataAccessException;
   List getDctListarAsignacionDocenteMateriaFuncionsintitularfinal(Asignaciones asignacion) throws DataAccessException;
  List getDctListarAsignacionDocenteMateriaFuncionsoloid(Asignaciones asignacion) throws DataAccessException;
  List getDctListarAsignacionDocenteMateriaFuncionparamemo(Asignaciones asignacion) throws DataAccessException;
  List getDctListarAsignacionDocenteMateriacontador(Asignaciones asignacion) throws DataAccessException;
List getDctListarAsignacionDocenteMateriatc(Asignaciones asignacion) throws DataAccessException;

 List getDctListarNroAsignacionDocenteMateriaFuncionxid(Asignaciones asignacion) throws DataAccessException;
  //Asignacion Auxiliar- Materia
  List getDctListarAsignacionAuxiliarMateria(Asignaciones asignacion) throws DataAccessException;

  //Asignacion Auxiliar docencia
  int setRegistrarAsignacionAuxiliar(Asignaciones asignacion) throws DataAccessException;  
  Asignaciones getDctBuscarAsignacionAuxiliar(Asignaciones asignacion) throws DataAccessException;  
  int setEliminarAsignacionAuxiliarMateria(Asignaciones asignacion) throws DataAccessException;  
  
  
  
  List getDctListarAsignacionDocenteporProgramaAnalitico (Asignaciones asignacion) throws DataAccessException;
  
  List<Asignaciones> getEvaluarAsignacionesGrupo (Asignaciones asignacion) throws DataAccessException;
  
//FIN - METODOS ADICIONADOS POR LA UAP  

}

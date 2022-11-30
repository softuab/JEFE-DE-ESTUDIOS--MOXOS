package org.fautapo.dao.ibatis;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.AsignacionesDao;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Materias;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-07
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-07
*/

public class SqlMapAsignacionesDao extends SqlSessionDaoSupport implements AsignacionesDao {

  public Asignaciones getDctBuscarAsignacionDocente(Asignaciones asignacion) throws DataAccessException {
    return (Asignaciones) getSqlSession().selectOne("getDctBuscarAsignacionDocente", asignacion);
  }
  public Asignaciones getDctBuscarAsignacionDocentemaslafuncion(Asignaciones asignacion) throws DataAccessException {
    return (Asignaciones) getSqlSession().selectOne("getDctBuscarAsignacionDocentemaslafuncion", asignacion);
  }
    
  public Asignaciones getDctBuscarAsignacionDocenteDesignacion(Asignaciones asignacion) throws DataAccessException {
    return (Asignaciones) getSqlSession().selectOne("getDctBuscarAsignacionDocenteDesignacion", asignacion);
  }
  
  public List getMtrBuscarMateriaAhorro(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getMtrBuscarMateriaAhorro", asignacion);
  }
 //Alex
  public List getDctListarAsignacionDocente(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocente", asignacion);
  }
 
  public List getMtrListarMateriaAhorro(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getMtrListarMateriaAhorro", asignacion);
  }

  public Asignaciones getDctBuscarAsignacionDocenteMateria(Asignaciones asignacion) throws DataAccessException {
    return (Asignaciones) getSqlSession().selectOne("getDctBuscarAsignacionDocenteMateria", asignacion);
  }
 //Fin Alex 
 
  public int setRegistrarAsignacionDocente(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarAsignacionDocente", asignacion);
    return i.intValue();
  }
   //para sacar el numero del siguiente memo
   public int getTrnBuscarSiguienteNroMemo(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("getTrnBuscarSiguienteNroMemo", asignacion);
    return i.intValue();
  }
  public int getTrnBuscaridMemo(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("getTrnBuscaridMemo", asignacion);
    return i.intValue();
  }
  // Fin para sacar el numero del siguiente memo
  public int setRegistrarAsignacionDocentefac(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarAsignacionDocentefac", asignacion);
    return i.intValue();
  }
   public int setRegistrarMemo(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarMemo", asignacion);
    return i.intValue();
  }
  
    public int setRegistrarFaseResolucion(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarFaseResolucion", asignacion);
    return i.intValue();
  }
  public int setRegistrarFaseResolucionfac(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarFaseResolucionfac", asignacion);
    return i.intValue();
  }
  public int setRegistrarFaseResolucionuni(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarFaseResolucionuni", asignacion);
    return i.intValue();
  }
  
  public int setmostrarplan(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setmostrarplan", asignacion);
    return i.intValue();
  }
  
   public int setRegistrarRetrocederFaseResolucion(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarRetrocederFaseResolucion", asignacion);
    return i.intValue();
  }
  
  public Asignaciones getDctVerificarAsignacionDocenteGestion(Asignaciones asignacion) throws DataAccessException {
    return (Asignaciones) getSqlSession().selectOne("getDctVerificarAsignacionDocenteGestion", asignacion);
  }
  
  public List getListarDocentesProgramados(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getListarDocentesProgramados", asignacion);
  }
  
  //Listar dct_asignacion por programa
  public List getDctListarAsignacionDocenteProgramaPlan(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteProgramaPlan", asignacion);
  }
  
  //Buscar docente
  public List getListarAsignacionDocenteTodas(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getListarAsignacionDocenteTodas", asignacion);
  }
  
  //Listar dct_asignacion por programa_plan_tipo_grado
  public List getDctListarAsignacionDocenteProgramaPlanTipoGrado(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteProgramaPlanTipoGrado", asignacion);
  }  
  
  //Cerrar libretas Por Dct Asignacion
  public List getListarMateriasCerrarLibretaDctAsignacion(Materias materia) throws DataAccessException {
    return getSqlSession().selectList("getListarMateriasCerrarLibretaDctAsignacion", materia);
  }
  
  //Eliminar Asignacion
  public int setEliminarAsignacionDocenteMateria(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setEliminarAsignacionDocenteMateria", asignacion);
    return i.intValue();
  }
  
  //Devuelve id fase resolucion
  public int setBuscar_id_fase_resolucion(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setBuscar_id_fase_resolucion", asignacion);
    return i.intValue();
  }
  
  public int setBuscar_id_fase_resolucionFinal(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setBuscar_id_fase_resolucionFinal", asignacion);
    return i.intValue();
  }

//INICIO - METODOS ADICIONADOS POR LA UAP
  //Asignacion Docente - Materia
  public List getDctListarAsignacionDocenteMateria(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateria", asignacion);
  }
   public List getDctListarAsignacionDocenteMateriaFuncion(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriaFuncion", asignacion);
  }
   public List getDctListarAsignacionDocenteMateriaFuncionxid(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriaFuncionxid", asignacion);
  }
  public List getDctListarAsignacionDocenteMateriaFuncionsintitular(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriaFuncionsintitular", asignacion);
  }
   public List getDctListarAsignacionDocenteMateriaFuncionsintitularfinal(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriaFuncionsintitularfinal", asignacion);
  }
     public List getDctListarNroAsignacionDocenteMateriaFuncionxid(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarNroAsignacionDocenteMateriaFuncionxid", asignacion);
  }
    public List getDctListarAsignacionDocenteMateriaFuncionsoloid(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriaFuncionsoloid", asignacion);
  }
  public List getDctListarAsignacionDocenteMateriaFuncionparamemo(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriaFuncionparamemo", asignacion);
  }
  public List getDctListarAsignacionDocenteMateriacontador(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriacontador", asignacion);
  }
  public List getDctListarAsignacionDocenteMateriatc(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionDocenteMateriatc", asignacion);
  }


  //Asignacion Auxiliar - Materia
  public List getDctListarAsignacionAuxiliarMateria(Asignaciones asignacion) throws DataAccessException {
    return getSqlSession().selectList("getDctListarAsignacionAuxiliarMateria", asignacion);
  }

  //asignacion auxiliares de Docencia
  public int setRegistrarAsignacionAuxiliar(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarAsignacionAuxiliar", asignacion);
    return i.intValue();
  }

  public Asignaciones getDctBuscarAsignacionAuxiliar(Asignaciones asignacion) throws DataAccessException {
    return (Asignaciones) getSqlSession().selectOne("getDctBuscarAsignacionAuxiliar", asignacion); 
  }
  
  public int setEliminarAsignacionAuxiliarMateria(Asignaciones asignacion) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setEliminarAsignacionAuxiliarMateria", asignacion);
    return i.intValue(); 
  }
//FIN - METODOS ADICIONADOS POR LA UAP

    @Override
    public List getDctListarAsignacionDocenteporProgramaAnalitico(Asignaciones asignacion) throws DataAccessException {
       return getSqlSession().selectList("getDctListarAsignacionDocenteporProgramaAnalitico", asignacion);
    }
    @Override
    public List<Asignaciones> getEvaluarAsignacionesGrupo(Asignaciones asignacion) throws DataAccessException {
       return getSqlSession().selectList("getEvaluarAsignacionesGrupo", asignacion);
    }
    

}

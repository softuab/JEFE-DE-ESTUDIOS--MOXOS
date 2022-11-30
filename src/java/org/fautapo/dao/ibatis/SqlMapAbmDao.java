package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.AbmDao;
import org.fautapo.domain.Abm;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapAbmDao extends SqlSessionDaoSupport implements AbmDao {

  public List getListarTablas() throws DataAccessException {
    return getSqlSession().selectList("getListarTablas", null);
  }

  public Abm getBuscarTabla(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarTabla", abm);
  }

  public List getListarCamposTabla(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposTabla", abm);
  }

  public int setEjecutarConsulta(Abm abm) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setEjecutarConsulta", abm);
    return i.intValue();
  }

  public List getEjecutarListado(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getEjecutarListado", abm);
  }

  //  INICIO JOJO  \\
  public List getEjecutarListado2(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getEjecutarListado2", abm);
  }

  public String getDibContadorClasico(Abm abm) throws DataAccessException {
    System.out.println("tabla-----"+abm.getTabla());
    System.out.println("condicion-----"+abm.getCondicion());
    return (String) getSqlSession().selectOne("getDibContadorClasico", abm);
  }

  public String getDibBuscarParametro(Abm abm) throws DataAccessException {
    return (String) getSqlSession().selectOne("getDibBuscarParametro", abm);
  }

  public List getListarRegistros(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getListarRegistros", abm);
  }

  public int setInsertarDatos(Abm abm) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setInsertarDatos", abm);
    return i.intValue();
  }

  public List getListarCombos(Abm abm) throws DataAccessException {
    System.out.println("tabla_foranea----"+abm.getTabla_foranea());
    System.out.println("campo----"+abm.getCampo());
    System.out.println("condicion----"+abm.getCondicion());
    return getSqlSession().selectList("getListarCombos", abm);
  }

  public Abm getBuscarForanea(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarForanea", abm);
  }

  public Abm getBuscarCampoTabla(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarCampoTabla", abm);
  }

  public int getContarDependientes(Abm abm) throws DataAccessException {
    return ((Integer) getSqlSession().selectOne("getContarDependientes", abm)).intValue();
  }

    //  INICIO huaica  \\
  public List getListarCamposTablaActividad(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposTablaActividad", abm);
  }

  public List getEjecutarListado3(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getEjecutarListado3", abm);
  }

  public List getListarRegistrosActividad(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getListarRegistrosActividad", abm);
  }
    //  FIN huaica  \\

    //  INICIO combustible  \\
  public List getEnlListarCamposTabla(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getEnlListarCamposTabla", abm);
  }

  public List getEnlEjecutarListado(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getEnlEjecutarListado", abm);
  }

  public List getEnlListarRegistros(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getEnlListarRegistros", abm);
  }
    //  FIN combustible  \\

  //  FIN JOJO  \\

  public List getListarCamposCondicion(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposCondicion", abm);
  }

  public Abm getBuscarCampo(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarCampo", abm);
  }

  public List getListarForaneosTabla(Abm abm) throws DataAccessException {
    return getSqlSession().selectList("getListarForaneosTabla", abm);
  }

  public Abm getBuscarTabla1(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarTabla1", abm);
  }

  public int setInsertarConsulta(Abm abm) throws DataAccessException {
     Integer i = (Integer) getSqlSession().selectOne("setInsertarConsulta", abm);
    return i.intValue();
  }

  public Abm getBuscarConsulta(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarConsulta", abm);
  }

  public int setInsertarConsultaTotales(Abm abm) throws DataAccessException {
     Integer i = (Integer) getSqlSession().selectOne("setInsertarConsultaTotales", abm);
    return i.intValue();
  }

  public Abm getBuscarConsultaTotales(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarConsultaTotales", abm);
  }

  public List getListarConsultas() throws DataAccessException {
    return getSqlSession().selectList("getListarConsultas", null);
  }

  public Abm getBuscarCampoTabla1(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getBuscarCampoTabla1", abm);
  }

  public int setBorrarConsulta(Abm abm) throws DataAccessException {
     Integer i = (Integer) getSqlSession().selectOne("setBorrarConsulta", abm);
    return i.intValue();
  }

  public int setModificarConsulta(Abm abm) throws DataAccessException {
     Integer i = (Integer) getSqlSession().selectOne("setModificarConsulta", abm);
    return i.intValue();
  }
  
  public String setDibInsertarRegistro(Abm abm) throws DataAccessException {
        return (String) getSqlSession().selectOne("setDibInsertarRegistro", abm);
  }
  
}
package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.DibwaykaDao;
import org.fautapo.domain.Dibwayka;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapDibwaykaDao extends SqlSessionDaoSupport implements DibwaykaDao {

  public List getListarCamposProcesoWK(Dibwayka dibwayka) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposProcesoWK", dibwayka);
  }

  public List getListarComboWK(Dibwayka dibwayka) throws DataAccessException {
    return getSqlSession().selectList("getListarComboWK",dibwayka);
  }

  public int setCrearTablasDibWK(Dibwayka dibwayka) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setCrearTablasDibWK", dibwayka);
    return i.intValue();
  }

  public List getListarCamposDibWK(Dibwayka dibwayka) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposDibWK",dibwayka);
  }

  public Dibwayka getBuscarTablaDibWK(Dibwayka dibwayka) throws DataAccessException {
    return (Dibwayka) getSqlSession().selectOne("getBuscarTablaDibWK", dibwayka);
  }
 
 public Dibwayka getBuscarCampoDibWK(Dibwayka dibwayka) throws DataAccessException {
    return (Dibwayka) getSqlSession().selectOne("getBuscarCampoDibWK", dibwayka);
 }

 public Dibwayka getBuscarTuplaDibWK(Dibwayka dibwayka) throws DataAccessException {
    return (Dibwayka) getSqlSession().selectOne("getBuscarTuplaDibWK", dibwayka);
 }


  public int setInsertarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setInsertarConsultaDibWK", dibwayka);
    return i.intValue();
  }

  public List getListarCondicionesConsultaDibWK(Dibwayka dibwayka) throws DataAccessException {
    return getSqlSession().selectList("getListarCondicionesConsultaDibWK", dibwayka);
  }

  public List getListarConsultasDibWK() throws DataAccessException {
    return getSqlSession().selectList("getListarConsultasDibWK", null);
  }

  public int setBorrarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setBorrarConsultaDibWK", dibwayka);
    return i.intValue();
  }

  public int setModificarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setModificarConsultaDibWK", dibwayka);
    return i.intValue();
  }

  public List getConsultaCondicionDibWK(Dibwayka dibwayka) throws DataAccessException {
    return getSqlSession().selectList("getConsultaCondicionDibWK", dibwayka);
  }

  public Dibwayka getBuscarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException {
    return (Dibwayka) getSqlSession().selectOne("getBuscarConsultaDibWK", dibwayka);
  }

}
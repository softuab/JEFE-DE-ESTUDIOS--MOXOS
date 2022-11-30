package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.EnlacesDao;
import org.fautapo.domain.Enlaces;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapEnlacesDao extends SqlSessionDaoSupport implements EnlacesDao {

  public List getListarEnlaces(Enlaces enlace) throws DataAccessException {
    return getSqlSession().selectList("getListarEnlaces", enlace);
  }

  public Enlaces getBuscarEnlace(Enlaces enlace) throws DataAccessException {
    return (Enlaces) getSqlSession().selectOne("getBuscarEnlaces", enlace);
  }

  // INICIO Combustible \\
  public Enlaces getEnlBuscarEnlace(Enlaces enlace) throws DataAccessException {
    return (Enlaces) getSqlSession().selectOne("getEnlBuscarEnlace", enlace);
  }
  // FIN Combustible \\

  // INICIO - MI 
  //Listar estados por tabla
  public List getStdListarEstadosTabla(Enlaces enlace) throws DataAccessException {
    return getSqlSession().selectList("getStdListarEstadosTabla", enlace);
  }
  // FIN - MI 

}
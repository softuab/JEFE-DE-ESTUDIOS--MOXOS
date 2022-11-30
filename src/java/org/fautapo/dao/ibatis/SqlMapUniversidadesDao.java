package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.UniversidadesDao;
import org.fautapo.domain.Universidades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapUniversidadesDao extends SqlSessionDaoSupport implements UniversidadesDao {

  public Universidades getUnvBuscarUniversidad(Universidades universidad) throws DataAccessException {
    return (Universidades) getSqlSession().selectOne("getUnvBuscarUniversidad", universidad);
  }
  
  public List getUnvListarUniversidades() throws DataAccessException {
    return getSqlSession().selectList("getUnvListarUniversidades", null);
  }

}
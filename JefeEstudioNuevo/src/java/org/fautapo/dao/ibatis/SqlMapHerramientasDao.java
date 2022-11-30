package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.HerramientasDao;
import org.fautapo.domain.Herramientas;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapHerramientasDao extends SqlSessionDaoSupport implements HerramientasDao {

  public List getListarCombosPagina(Herramientas herramienta) throws DataAccessException {
    return getSqlSession().selectList("getListarCombosPagina", herramienta);
  }

}
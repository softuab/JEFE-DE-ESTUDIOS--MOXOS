package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.CategoriasDao;
import org.fautapo.domain.Categorias;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapCategoriasDao extends SqlSessionDaoSupport implements CategoriasDao {

  public List getListarCategorias(Categorias categoria) throws DataAccessException {
    return getSqlSession().selectList("getListarCategorias", categoria);
  }

}
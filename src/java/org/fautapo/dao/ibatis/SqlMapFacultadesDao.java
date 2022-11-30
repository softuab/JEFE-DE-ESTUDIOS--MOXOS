package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.FacultadesDao;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Universidades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapFacultadesDao extends SqlSessionDaoSupport implements FacultadesDao {

  public Facultades getFclBuscarFacultad(Facultades facultad) throws DataAccessException {
    return (Facultades) getSqlSession().selectOne("getFclBuscarFacultad", facultad);
  }

  public List getUnvListarFacultades(Universidades universidad) throws DataAccessException {
    return getSqlSession().selectList("getUnvListarFacultades", universidad);
  }

  public List getUnvListarFacultadesPost(Universidades universidad) throws DataAccessException {
    return getSqlSession().selectList("getUnvListarFacultadesPost", universidad);
  }

}
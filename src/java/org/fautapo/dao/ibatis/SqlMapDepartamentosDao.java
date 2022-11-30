package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.DepartamentosDao;
import org.fautapo.domain.Departamentos;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Universidades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapDepartamentosDao extends SqlSessionDaoSupport implements DepartamentosDao {

  public Departamentos getDptBuscarDepartamento(Departamentos departamento) throws DataAccessException {
    return (Departamentos) getSqlSession().selectOne("getDptBuscarDepartamento", departamento);
  }

  public List getFclListarDepartamentos(Facultades facultad) throws DataAccessException {
    return getSqlSession().selectList("getFclListarDepartamentos", facultad);
  }

  public List getUnvListarDepartamentos(Universidades universidad) throws DataAccessException {
    return getSqlSession().selectList("getUnvListarDepartamentos", universidad);
  }

}
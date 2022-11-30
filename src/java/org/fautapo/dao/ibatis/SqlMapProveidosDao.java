package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.ProveidosDao;
import org.fautapo.domain.Proveidos;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-27
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-27
*/

public class SqlMapProveidosDao extends SqlSessionDaoSupport implements ProveidosDao {

  public int setRegistrarProveido(Proveidos proveido) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarProveido", proveido);
    return i.intValue();
  }

  public Proveidos getBuscarUltimoProveido(Proveidos proveido) throws DataAccessException {
    return (Proveidos) getSqlSession().selectOne("getBuscarUltimoProveido", proveido);
  }

  public String getBuscarUltimoProveido2(Proveidos proveido) throws DataAccessException {
    String cadena = (String) getSqlSession().selectOne("getBuscarUltimoProveido2", proveido);
    return cadena;
  }

  public List getListarProveidosHistoricos(Proveidos proveido) throws DataAccessException {
    return getSqlSession().selectList("getListarProveidosHistoricos", proveido);
  }

  public Proveidos getBuscarProveido(Proveidos proveido) throws DataAccessException {
    return (Proveidos) getSqlSession().selectOne("getBuscarProveido", proveido);
  }

  public Proveidos getBuscarProveidoCorresp(Proveidos proveido) throws DataAccessException {
    return (Proveidos) getSqlSession().selectOne("getBuscarProveidoCorresp", proveido);
  }

}
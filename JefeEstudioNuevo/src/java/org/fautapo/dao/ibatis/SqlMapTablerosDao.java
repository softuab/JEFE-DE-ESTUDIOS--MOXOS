package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.TablerosDao;
import org.fautapo.domain.Tableros;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-18
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-20
*/

public class SqlMapTablerosDao extends SqlSessionDaoSupport implements TablerosDao {

  public List getListarNoticias() throws DataAccessException {
    return getSqlSession().selectList("getListarNoticias", null);
  }
  
  public List getListarTiposTableros() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposTableros", null);
  }
 
  public List getListarTiposAvisos() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposAvisos", null);
  } 

  public int setRegistrarTablero(Tableros tablero) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarTablero", tablero);
    return i.intValue();
  }
 
  public Tableros getBuscarTablero(Tableros tablero) throws DataAccessException {
    return (Tableros) getSqlSession().selectOne("getBuscarTablero", tablero);
  } 

  public int setEliminarTablero(Tableros tablero) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarTablero", tablero);
    return i.intValue();
  }
 
  // INICIO - MI 
  public List getListarNoticiasRol(Tableros tablero) throws DataAccessException {
    return getSqlSession().selectList("getListarNoticiasRol", tablero);
  }

  public List getListarRolesNoticias() throws DataAccessException {
    return getSqlSession().selectList("getListarRolesNoticias", null);
  }
  // FIN - MI 

}
package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.InformesDao;
import org.fautapo.domain.Informes;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-18
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-20
*/

public class SqlMapInformesDao extends SqlSessionDaoSupport implements InformesDao {

  //Administracion de informes
  public List getListarInformes(Informes informe) throws DataAccessException {
    return getSqlSession().selectList("getListarInformes", informe);
  }

  public Informes getBuscarInforme(Informes informe) throws DataAccessException {
    return (Informes) getSqlSession().selectOne("getBuscarInforme", informe);
  }

  public int setRegistrarInforme(Informes informe) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarInforme", informe);
    return i.intValue();
  }
 
  public int setEliminarInforme(Informes informe) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarInforme", informe);
    return i.intValue();
  }
  //Fin Administracion de informes
 
  //Administracion de tramites
  public List getListarInformesActividad(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarInformesActividad", tramite);
  }

  public Informes getBuscarInforme2(Informes informe) throws DataAccessException {
    return (Informes) getSqlSession().selectOne("getBuscarInforme2", informe);
  }
  //Fin Administracion de tramites

}
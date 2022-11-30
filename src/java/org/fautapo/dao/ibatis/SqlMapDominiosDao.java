package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.DominiosDao;
import org.fautapo.domain.Dominios;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-18
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-22
*/

public class SqlMapDominiosDao extends SqlSessionDaoSupport implements DominiosDao {

  //Administracion de dominios
  public List getListarDominios() throws DataAccessException {
    return getSqlSession().selectList("getListarDominios", null);
  }

  public List getListarDominiosAcceso(Clientes cliente) throws DataAccessException {
    return getSqlSession().selectList("getListarDominiosAcceso", cliente);
  }

  public List getListarTiposDominios() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposDominios", null);
  }

  public Dominios getBuscarDominio(Dominios dominio) throws DataAccessException {
    return (Dominios) getSqlSession().selectOne("getBuscarDominio", dominio);
  }
  
  public Dominios getBuscarTipoDominio(Dominios dominio) throws DataAccessException {
    return (Dominios) getSqlSession().selectOne("getBuscarTipoDominio", dominio);
  }
  
  public int setRegistrarDominio(Dominios dominio) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarDominio", dominio);
    return i.intValue();
  }
 
  public int setEliminarDominio(Dominios dominio) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarDominio", dominio);
    return i.intValue();
  }
  
  public int getBuscarDominioOtrasTb(Dominios dominio) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getBuscarDominioOtrasTb", dominio);
    return i.intValue();
  }
  //Fin Administracion de dominios
  
  //Administracion de tuplas
  public List getListarTuplas(Dominios dominio) throws DataAccessException {
    return getSqlSession().selectList("getListarTuplas", dominio);
  }

  public List getListarTuplasPadre(Dominios dominio) throws DataAccessException {
    return getSqlSession().selectList("getListarTuplasPadre", dominio);
  }

  public Dominios getBuscarTupla(Dominios dominio) throws DataAccessException {
    return (Dominios) getSqlSession().selectOne("getBuscarTupla", dominio);
  }

  public int setRegistrarTupla(Dominios dominio) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarTupla", dominio);
    return i.intValue();
  }
 
  public int setEliminarTupla(Dominios dominio) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarTupla", dominio);
    return i.intValue();
  }
  //Fin Administracion de tuplas
  
  //Administracion de tramites
  public int getBuscarTieneHijos(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getBuscarTieneHijos", tramite);
    return i.intValue();
  }

  public List getListarCombos2(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarCombos2", tramite);
  }

  public int getBuscarTuplaPadre(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getBuscarTuplaPadre", tramite);
    return i.intValue();
  }

  public Dominios getBuscarTupla2(Dominios dominio) throws DataAccessException {
    return (Dominios) getSqlSession().selectOne("getBuscarTupla2", dominio);
  }

  public int setRegistrarTempTupla(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarTempTupla", tramite);
    return i.intValue();
  }

  public int setLimpiarTempTuplas() throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setLimpiarTempTuplas", null);
    return i.intValue();
  }
  //Fin Administracion de tramites
 
}
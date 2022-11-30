package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.HilosDao;
import org.fautapo.domain.Hilos;
import org.fautapo.domain.Usuarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-04
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-04
*/

import org.fautapo.dao.HilosDao;
import org.fautapo.domain.Hilos;
import org.fautapo.domain.Usuarios;

public class SqlMapHilosDao extends SqlSessionDaoSupport implements HilosDao {


  public List getListarUsuariosHilos(Usuarios usuario) throws DataAccessException {
    return getSqlSession().selectList("getListarUsuariosHilos", usuario);
  }
  
  public List getListarTiposHilos() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposHilos", null);
  }
  
  public int setRegistrarHilo(Hilos hilo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarHilo", hilo);
    return i.intValue();
  }

  public List getListarTiposSegmentos() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposSegmentos", null);
  }

  public List getListarSegmentos(Hilos hilo) throws DataAccessException {
    return getSqlSession().selectList("getListarSegmentos", hilo);
  }

  public List getListarDestinatarios(Hilos hilo) throws DataAccessException {
    return getSqlSession().selectList("getListarDestinatarios", hilo);
  }

  public int setRegistrarSegmento(Hilos hilo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarSegmento", hilo);
    return i.intValue();
  }

  public int setRegistrarSgmAdjunto(Hilos hilo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarSgmAdjunto", hilo);
    return i.intValue();
  }

  public List getListarAdjuntosHilos(Hilos hilo) throws DataAccessException {
    return getSqlSession().selectList("getListarAdjuntosHilos", hilo);
  }

  public Hilos getBuscarHilo(Hilos hilo) throws DataAccessException {
    return (Hilos) getSqlSession().selectOne("getBuscarHilo", hilo);
  }

  public List getListarHilosMios(Hilos hilo) throws DataAccessException {
    return getSqlSession().selectList("getListarHilosMios", hilo);
  }

  public List getListarHilosAMi(Hilos hilo) throws DataAccessException {
    return getSqlSession().selectList("getListarHilosAMi", hilo);
  }

  public int getNroMensajes(Hilos hilo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getNroMensajes", hilo);
    return i.intValue();
  }

  public int getNroMensajesNuevos(Hilos hilo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getNroMensajesNuevos", hilo);
    return i.intValue();
  }

  public int setBorrarHilo(Hilos hilo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setBorrarHilo", hilo);
    return i.intValue();
  }

}


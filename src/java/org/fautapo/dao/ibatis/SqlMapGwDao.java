package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.GwDao;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-22
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-22
*/

public class SqlMapGwDao extends SqlSessionDaoSupport implements GwDao {

  public String getListarDatosTabla(Abm abm) throws DataAccessException {
    String cadena = (String) getSqlSession().selectOne("getListarDatosTabla", abm);
    return cadena;
  }

  public String getListarDatosPrimarios(Abm abm) throws DataAccessException {
    String cadena = (String) getSqlSession().selectOne("getListarDatosPrimarios", abm);
    return cadena;
  }

  public Abm getListarCamposTabla2(Abm abm) throws DataAccessException {
    return (Abm) getSqlSession().selectOne("getListarCamposTabla2", abm);
  }

  public Tramites getBuscarCampoGw(Tramites tramite) throws DataAccessException {
    return (Tramites) getSqlSession().selectOne("getBuscarCampoGw", tramite);
  }

  //Tramites Limbo
  public List getListarTramitesMiosLimbo(Tramites tramite) throws DataAccessException {
    return getSqlSession().selectList("getListarTramitesMiosLimbo", tramite);
  }

  public int setRegistrarValorLimbo(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarValorLimbo", tramite);
    return i.intValue();
  }

  public int setInsertarTramiteLimbo(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setInsertarTramiteLimbo", tramite);
    return i.intValue();
  }

  public int setRetrocederTramiteLimbo(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRetrocederTramiteLimbo", tramite);
    return i.intValue();
  }
  //Fin Tramites Limbo

  public String getBuscarTablaLimbo(Tramites tramite) throws DataAccessException {
    String cadena = (String) getSqlSession().selectOne("getBuscarTablaLimbo", tramite);
    return cadena;
  }

  public int setAvanzarTramiteLimbo(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setAvanzarTramiteLimbo", tramite);
    return i.intValue();
  }

  public int getBuscarIdCampoLimbo(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("getBuscarIdCampoLimbo", tramite);
    return i.intValue();
  }

  public int setRegistrarValorLimbo2(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarValorLimbo2", tramite);
    return i.intValue();
  }

  public String getContarPaginasLimbo(Tramites tramite) throws DataAccessException {
    return (String) getSqlSession().selectOne("getContarPaginasLimbo", tramite);
  }

  public int setRegistrarTrPrFrLogLimbo(Tramites tramite) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarTrPrFrLogLimbo", tramite);
    return i.intValue();
  }

}
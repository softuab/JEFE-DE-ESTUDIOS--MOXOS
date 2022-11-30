package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.ActividadesDao;
import org.fautapo.domain.Actividades;
import org.fautapo.domain.Clientes;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-15
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-17
*/

public class SqlMapActividadesDao extends SqlSessionDaoSupport implements ActividadesDao {
  
  //Administracion de actividades
  public List getListarActividades(Actividades actividad) throws DataAccessException {
    return getSqlSession().selectList("getListarActividades", actividad);
  }

  public List getListarActividadesNoLimbo(Actividades actividad) throws DataAccessException {
    return getSqlSession().selectList("getListarActividadesNoLimbo", actividad);
  }

  public List getListarActividadesLimbo(Actividades actividad) throws DataAccessException {
    return getSqlSession().selectList("getListarActividadesLimbo", actividad);
  }

  public List getListarTiposAlertasAct(Actividades actividad) throws DataAccessException {
    return getSqlSession().selectList("getListarTiposAlertasAct", actividad);
  }

  public Actividades getBuscarProceso(Actividades actividad) throws DataAccessException {
    return (Actividades) getSqlSession().selectOne("getBuscarProceso", actividad);
  }

  public List getListarProcesosAcceso(Clientes cliente) throws DataAccessException {
    return getSqlSession().selectList("getListarProcesosAcceso", cliente);
  }

  public List getListarProcesosAccesoTramites(Clientes cliente) throws DataAccessException {
    return getSqlSession().selectList("getListarProcesosAccesoTramites", cliente);
  }

  public List getListarProcesosAccesoTramites2(Clientes cliente) throws DataAccessException {
    return getSqlSession().selectList("getListarProcesosAccesoTramites2", cliente);
  }

  public List getListarProcesosAccesoCorresp(Clientes cliente) throws DataAccessException {
    return getSqlSession().selectList("getListarProcesosAccesoCorresp", cliente);
  }

  public Actividades getBuscarTipoAlerta(Actividades actividad) throws DataAccessException {
    return (Actividades) getSqlSession().selectOne("getBuscarTipoAlerta", actividad);
  }

  public List getListarTiposAlertas(Actividades actividad) throws DataAccessException {
    return getSqlSession().selectList("getListarTiposAlertas", actividad);
  }

  public Actividades getBuscarActividad(Actividades actividad) throws DataAccessException {
    return (Actividades) getSqlSession().selectOne("getBuscarActividad", actividad);
  }

  public Actividades getBuscarActividadOrden(Actividades actividad) throws DataAccessException {
    return (Actividades) getSqlSession().selectOne("getBuscarActividadOrden", actividad);
  }

  public List getListarUbicacionesOrganicas() throws DataAccessException {
    return getSqlSession().selectList("getListarUbicacionesOrganicas", null);
  }

  public Actividades getBuscarUbicacionOrganica(Actividades actividad) throws DataAccessException {
    return (Actividades) getSqlSession().selectOne("getBuscarUbicacionOrganica", actividad);
  }

  public List getListarTiposActuaciones() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposActuaciones", null);
  }

  public Actividades getBuscarTipoActuacion(Actividades actividad) throws DataAccessException {
    return (Actividades) getSqlSession().selectOne("getBuscarTipoActuacion", actividad);
  }
 
  public int setRegistrarActividad(Actividades actividad) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarActividad", actividad);
    return i.intValue();
  }
 
  public int setReiniciarTiposAlertas(Actividades actividad) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setReiniciarTiposAlertas", actividad);
    return i.intValue();
  }
 
  public int setRegistrarTipoAlerta(Actividades actividad) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarTipoAlerta", actividad);
    return i.intValue();
  }

  public int setEliminarActividad(Actividades actividad) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarActividad", actividad);
    return i.intValue();
  }
  //Fin Administracion de actividades
  
  public List getListarTiposProcesos() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposProcesos", null);
  }

  //Redireccionar tramites
  public List getListarActividades2(Actividades actividad) throws DataAccessException {
    return getSqlSession().selectList("getListarActividades2", actividad);
  } 
  
  public List getListarUsuariosRolActividad(Actividades actividad) throws DataAccessException {
    return getSqlSession().selectList("getListarUsuariosRolActividad", actividad);
  } 
  //Fin Redireccionar tramites

  //Reporte de actividades por roles
  public String getListarActividadesRoles(Actividades actividad) throws DataAccessException {
    String s = (String) getSqlSession().selectOne("getListarActividadesRoles", actividad);
    return s;
  }
  //Fin Reporte de actividades por roles

  //Tipos duraciones
  public List getListarTiposDuraciones() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposDuraciones", null);
  }

  public Actividades getBuscarTipoDuracion(Actividades actividad) throws DataAccessException {
    return (Actividades) getSqlSession().selectOne("getBuscarTipoDuracion", actividad);
  }
  //Fin Tipos duraciones
  
  //Administrar Kardex
   public List getListarProcesosAccesoKardex() throws DataAccessException {
    return getSqlSession().selectList("getListarProcesosAccesoKardex", null);
  }
 
  public List getListarProcesosKardexs() throws DataAccessException {
    return getSqlSession().selectList("getListarProcesosKardexs", null);
  }
  
  public int setRegistrarProcesoKardex(Actividades actividad) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarProcesoKardex", actividad);
    return i.intValue();
  }
  
  public int setModificarProcesoKardex(Actividades actividad) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setModificarProcesoKardex", actividad);
    return i.intValue();
  }
  
  public int setEliminarProcesoKardex(Actividades actividad) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarProcesoKardex", actividad);
    return i.intValue();
  }
  
  //Fin Administrar Kardex
 
}
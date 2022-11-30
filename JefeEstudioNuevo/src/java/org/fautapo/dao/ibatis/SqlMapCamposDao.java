package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.CamposDao;
import org.fautapo.domain.Campos;
import org.fautapo.domain.Clientes;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-18
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-18
*/

public class SqlMapCamposDao extends SqlSessionDaoSupport implements CamposDao {

  //Administracion de campos
  public List getListarFormularios() throws DataAccessException {
    return getSqlSession().selectList("getListarFormularios", null);
  }

  public List getListarFormulariosAcceso(Clientes cliente) throws DataAccessException {
    return getSqlSession().selectList("getListarFormulariosAcceso", cliente);
  }

  public List getListarCampos(Campos campo) throws DataAccessException {
    return getSqlSession().selectList("getListarCampos", campo);
  }

  public Campos getBuscarFormulario(Campos campo) throws DataAccessException {
    return (Campos) getSqlSession().selectOne("getBuscarFormulario", campo);
  }

  public Campos getBuscarCampoForm(Campos campo) throws DataAccessException {
    return (Campos) getSqlSession().selectOne("getBuscarCampoForm", campo);
  }

  public List getListarTiposValidaciones() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposValidaciones", null);
  }

  public Campos getBuscarTipoValidacion(Campos campo) throws DataAccessException {
    return (Campos) getSqlSession().selectOne("getBuscarTipoValidacion", campo);
  }

  public int setRegistrarCampo(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarCampo", campo);
    return i.intValue();
  }
 
  public int setEliminarCampo(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarCampo", campo);
    return i.intValue();
  }
  //Fin Administracion de campos

  //Administracion de acl
  public Campos getBuscarFormulario1(Campos campo) throws DataAccessException {
    return (Campos) getSqlSession().selectOne("getBuscarFormulario1", campo);
  }

  public List getListarTiposPermisos() throws DataAccessException {
    return getSqlSession().selectList("getListarTiposPermisos", null);
  }

  public List getListarCamposAcl(Campos campo) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposAcl", campo);
  }

  public int setRegistrarAcl(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarAcl", campo);
    return i.intValue();
  }
 
  public int setEliminarAcl(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarAcl", campo);
    return i.intValue();
  }
  //Fin Administracion de acl

  //Administracion de Reportes
  public List getListarCamposProceso(Campos campo) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposProceso", campo);
  }

  public List getListarCamposReporte(Campos campo) throws DataAccessException {
    System.out.println("cadena  "+campo.getCadena());
    System.out.println("campos  "+campo.getCampos());
    System.out.println("cadena_1  "+campo.getCadena_1());
    System.out.println("tablita  "+campo.getTablita());
    System.out.println("campos_suma  "+campo.getCampos_suma());
    return getSqlSession().selectList("getListarCamposReporte", campo);
  }

  public List getListarCamposReporte2(Campos campo) throws DataAccessException {
    System.out.println("1-cadena  "+campo.getCadena());
    System.out.println("1-campos  "+campo.getCampos());
    System.out.println("1-cadena_1  "+campo.getCadena_1());
    System.out.println("1-tablita  "+campo.getTablita());
    return getSqlSession().selectList("getListarCamposReporte2", campo);
  }
  
  public String getListarTotalesDatos(Campos campo) throws DataAccessException {
    String i = (String) getSqlSession().selectOne("getListarTotalesDatos", campo);
    return i;
  }
  //Fin Administraci�n de Reportes

  //Reporte de campos por actividades
  public String getListarCamposActividad(Campos campo) throws DataAccessException {
    String s = (String) getSqlSession().selectOne("getListarCamposActividad", campo);
    return s;
  //Fin Reporte de campos por actividades
  }

  //Administracion de acl dibRap
  public List getListarCamposAcl2(Campos campo) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposAcl2", campo);
  }

  public int setRegistrarAcl2(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarAcl2", campo);
    return i.intValue();
  }
 
  public int setEliminarAcl2(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarAcl2", campo);
    return i.intValue();
  }
  //Fin Administracion de acl dibRap

  //Administracion de formularios
  public int setRegistrarFormulario(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarFormulario", campo);
    return i.intValue();
  }
 
  public int setEliminarFormulario(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setEliminarFormulario", campo);
    return i.intValue();
  }
  //Fin Administracion de formularios
  
  //Administrar Campos y Acl Proceso Kardex
  public Campos getBuscarTipoPermiso(Campos campo) throws DataAccessException {
    return (Campos) getSqlSession().selectOne("getBuscarTipoPermiso", campo);
  }
  
  public int setRegistrarCampoAclProcesoKardex(Campos campo) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarCampoAclProcesoKardex", campo);
    return i.intValue();
  }
  //Administrar Campos y Acl Proceso Kardex

  public List getListarCamposReferenciaProceso(Campos campo) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposReferenciaProceso", campo);
  }

  public List getListarCamposReporteProceso(Campos campo) throws DataAccessException {
    return getSqlSession().selectList("getListarCamposReporteProceso", campo);
  }

  //INICIO - Administrar Reportes
  public List getListarTuplasCampo(Campos campo) throws DataAccessException {
    return getSqlSession().selectList("getListarTuplasCampo", campo);
  }
  //NUEVO - Administrar Reportes

}
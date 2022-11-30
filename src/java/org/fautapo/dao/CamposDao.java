package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Campos;
import org.fautapo.domain.Clientes;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-18
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-18
*/

public interface CamposDao {
  
  //Administracion de campos
  List getListarFormularios() throws DataAccessException;
  List getListarFormulariosAcceso(Clientes cliente) throws DataAccessException;
  List getListarCampos(Campos campo) throws DataAccessException;
  Campos getBuscarFormulario(Campos campo) throws DataAccessException;
  Campos getBuscarCampoForm(Campos campo) throws DataAccessException;
  List getListarTiposValidaciones() throws DataAccessException;
  Campos getBuscarTipoValidacion(Campos campo) throws DataAccessException;
  int setRegistrarCampo(Campos campo) throws DataAccessException;
  int setEliminarCampo(Campos campo) throws DataAccessException;
  //Fin Administracion de campos

  //Administracion de acl
  Campos getBuscarFormulario1(Campos campo) throws DataAccessException;
  List getListarTiposPermisos() throws DataAccessException;
  List getListarCamposAcl(Campos campo) throws DataAccessException;
  int setRegistrarAcl(Campos campo) throws DataAccessException;
  int setEliminarAcl(Campos campo) throws DataAccessException;
  //Fin Administracion de acl

  //Administracion de Reportes
  List getListarCamposProceso(Campos campo) throws DataAccessException;
  List getListarCamposReporte(Campos campo) throws DataAccessException;
  List getListarCamposReporte2(Campos campo) throws DataAccessException;
  String getListarTotalesDatos(Campos campo) throws DataAccessException;
  //Fin Administracion de Reportes

  //Reporte de campos por actividades
  String getListarCamposActividad(Campos campo) throws DataAccessException;
  //Fin Reporte de campos por actividades

  //Administracion de acl dibRap
  List getListarCamposAcl2(Campos campo) throws DataAccessException;
  int setRegistrarAcl2(Campos campo) throws DataAccessException;
  int setEliminarAcl2(Campos campo) throws DataAccessException;
  //Fin Administracion de acl dibRap

  //Administracion de formularios
  int setRegistrarFormulario(Campos campo) throws DataAccessException;
  int setEliminarFormulario(Campos campo) throws DataAccessException;
  //Fin Administracion de formularios
  
  //Administrar Campos y Acl Proceso Kardex
  Campos getBuscarTipoPermiso(Campos campo) throws DataAccessException; 
  int setRegistrarCampoAclProcesoKardex(Campos campo) throws DataAccessException;
  // Fin Administrar Campos y Acl Proceso KArdex 

  List getListarCamposReferenciaProceso(Campos campo) throws DataAccessException;
  List getListarCamposReporteProceso(Campos campo) throws DataAccessException;
  
  //INICIO - Administrar Reportes
  List getListarTuplasCampo(Campos campo) throws DataAccessException;
  //NUEVO - Administrar Reportes

}
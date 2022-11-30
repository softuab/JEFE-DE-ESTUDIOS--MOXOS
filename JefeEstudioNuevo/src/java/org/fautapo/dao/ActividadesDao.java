package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Actividades;
import org.fautapo.domain.Clientes;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-15
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-17
*/

public interface ActividadesDao {

  //Administrar actividades
  List getListarActividades(Actividades actividad) throws DataAccessException;
  List getListarActividadesNoLimbo(Actividades actividad) throws DataAccessException;
  List getListarActividadesLimbo(Actividades actividad) throws DataAccessException;
  List getListarTiposAlertasAct(Actividades actividad) throws DataAccessException;
  Actividades getBuscarProceso(Actividades actividad) throws DataAccessException;
  List getListarProcesosAcceso(Clientes cliente) throws DataAccessException;
  List getListarProcesosAccesoTramites(Clientes cliente) throws DataAccessException;  
  List getListarProcesosAccesoTramites2(Clientes cliente) throws DataAccessException;  
  List getListarProcesosAccesoCorresp(Clientes cliente) throws DataAccessException;  
  Actividades getBuscarTipoAlerta(Actividades actividad) throws DataAccessException;
  List getListarTiposAlertas(Actividades actividad) throws DataAccessException;
  Actividades getBuscarActividad(Actividades actividad) throws DataAccessException;
  Actividades getBuscarActividadOrden(Actividades actividad) throws DataAccessException;
  List getListarUbicacionesOrganicas() throws DataAccessException;
  Actividades getBuscarUbicacionOrganica(Actividades actividad) throws DataAccessException;
  List getListarTiposActuaciones() throws DataAccessException;
  Actividades getBuscarTipoActuacion(Actividades actividad) throws DataAccessException;
  int setRegistrarActividad(Actividades actividad) throws DataAccessException;
  int setReiniciarTiposAlertas(Actividades actividad) throws DataAccessException;
  int setRegistrarTipoAlerta(Actividades actividad) throws DataAccessException;
  int setEliminarActividad(Actividades actividad) throws DataAccessException;
  //Fin Administrar actividades

  List getListarTiposProcesos() throws DataAccessException;

  //Redireccionar tramites
  List getListarActividades2(Actividades actividad) throws DataAccessException;
  List getListarUsuariosRolActividad(Actividades actividad) throws DataAccessException;
  //Fin Redireccionar tramites

  //Reporte de actividades por roles
  String getListarActividadesRoles(Actividades actividad) throws DataAccessException;
  //Fin Reporte de actividades por roles

  //Tipos duraciones
  List getListarTiposDuraciones() throws DataAccessException;
  Actividades getBuscarTipoDuracion(Actividades actividad) throws DataAccessException;
  //Fin Tipos duraciones
  
  //Administrar Kardex
  List getListarProcesosAccesoKardex() throws DataAccessException;  
  List getListarProcesosKardexs() throws DataAccessException;  
  int setRegistrarProcesoKardex(Actividades actividad) throws DataAccessException;  
  int setModificarProcesoKardex(Actividades actividad) throws DataAccessException;  
  int setEliminarProcesoKardex(Actividades actividad) throws DataAccessException;  
  //Fin Administrar Kardex

}
package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Abm;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface AbmDao {

  List getListarTablas() throws DataAccessException;
  Abm getBuscarTabla(Abm abm) throws DataAccessException;
  List getListarCamposTabla(Abm abm) throws DataAccessException;
  int setEjecutarConsulta(Abm abm) throws DataAccessException;
  List getEjecutarListado(Abm abm) throws DataAccessException;
  //  INICIO JOJO  \\
  List getEjecutarListado2(Abm abm) throws DataAccessException;
  String getDibContadorClasico(Abm abm) throws DataAccessException;
  String getDibBuscarParametro(Abm abm) throws DataAccessException;
  List getListarRegistros(Abm abm) throws DataAccessException;
  int setInsertarDatos(Abm abm) throws DataAccessException;
  List getListarCombos(Abm abm) throws DataAccessException;
  Abm getBuscarForanea(Abm abm) throws DataAccessException;
  Abm getBuscarCampoTabla(Abm abm) throws DataAccessException;
  int getContarDependientes(Abm abm) throws DataAccessException;
    //  INICIO huaica  \\
  List getListarCamposTablaActividad(Abm abm) throws DataAccessException;
  List getEjecutarListado3(Abm abm) throws DataAccessException;
  List getListarRegistrosActividad(Abm abm) throws DataAccessException;
    //  FIN huaica  \\
    //  INICIO combustible  \\
  List getEnlListarCamposTabla(Abm abm) throws DataAccessException;
  List getEnlEjecutarListado(Abm abm) throws DataAccessException;
  List getEnlListarRegistros(Abm abm) throws DataAccessException;
    //  FIN combustible  \\
  //  FIN JOJO  \\
  List getListarCamposCondicion(Abm abm) throws DataAccessException;
  Abm getBuscarCampo(Abm abm) throws DataAccessException;
  List getListarForaneosTabla(Abm abm) throws DataAccessException;
  Abm getBuscarTabla1(Abm abm) throws DataAccessException;
  int setInsertarConsulta(Abm abm) throws DataAccessException;
  Abm  getBuscarConsulta(Abm abm) throws DataAccessException;
  int setInsertarConsultaTotales(Abm abm) throws DataAccessException;
  Abm  getBuscarConsultaTotales(Abm abm) throws DataAccessException;
  List getListarConsultas() throws DataAccessException;  

  Abm getBuscarCampoTabla1(Abm abm) throws DataAccessException;
  int setBorrarConsulta(Abm abm) throws DataAccessException;
  int setModificarConsulta(Abm abm) throws DataAccessException;
  
  //Nuevo
  String setDibInsertarRegistro(Abm abm) throws DataAccessException;


}
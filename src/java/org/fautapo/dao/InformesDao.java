package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Informes;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-20
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-20
*/

public interface InformesDao {

  //Administracion de informes
  List getListarInformes(Informes informe) throws DataAccessException;
  Informes getBuscarInforme(Informes informe) throws DataAccessException;
  int setRegistrarInforme(Informes informe) throws DataAccessException;
  int setEliminarInforme(Informes informe) throws DataAccessException;
  //Fin Administracion de informes

  //Administracion de tramites
  List getListarInformesActividad(Tramites tramite) throws DataAccessException;
  Informes getBuscarInforme2(Informes informe) throws DataAccessException;
  //Fin Administracion de tramites
  
}
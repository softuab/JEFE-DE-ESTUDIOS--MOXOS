package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Enlaces;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface EnlacesDao {

  List getListarEnlaces(Enlaces enlace) throws DataAccessException;
  Enlaces getBuscarEnlace(Enlaces enlace) throws DataAccessException;
  // INICIO Combustible \\
  Enlaces getEnlBuscarEnlace(Enlaces enlace) throws DataAccessException;
  // FIN Combustible \\

  //INICIO - MI
  //Listar Estados por tabla
  List getStdListarEstadosTabla(Enlaces enlace) throws DataAccessException;
  //FIN - MI

}
package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Tableros;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-03
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-03
*/

public interface TablerosDao {

  List getListarNoticias() throws DataAccessException;
  List getListarTiposTableros() throws DataAccessException;
  List getListarTiposAvisos() throws DataAccessException;  
  int setRegistrarTablero(Tableros tablero) throws DataAccessException;
  Tableros getBuscarTablero(Tableros tablero) throws DataAccessException;
  int setEliminarTablero(Tableros tablero) throws DataAccessException;

  // INICIO - MI
  List getListarNoticiasRol(Tableros tablero) throws DataAccessException;
  List getListarRolesNoticias() throws DataAccessException;
  // FIN - MI

}
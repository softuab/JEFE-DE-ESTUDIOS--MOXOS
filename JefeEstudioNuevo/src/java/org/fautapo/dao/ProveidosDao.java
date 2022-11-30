package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Proveidos;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-27
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-27
*/

public interface ProveidosDao {

  int setRegistrarProveido(Proveidos proveido) throws DataAccessException;
  Proveidos getBuscarUltimoProveido(Proveidos proveido) throws DataAccessException;
  String getBuscarUltimoProveido2(Proveidos proveido) throws DataAccessException;
  List getListarProveidosHistoricos(Proveidos proveido) throws DataAccessException;
  Proveidos getBuscarProveido(Proveidos proveido) throws DataAccessException;
  Proveidos getBuscarProveidoCorresp(Proveidos proveido) throws DataAccessException;
  
}
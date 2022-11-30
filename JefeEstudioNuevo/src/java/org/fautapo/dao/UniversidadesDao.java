package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Universidades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface UniversidadesDao {

  Universidades getUnvBuscarUniversidad(Universidades universidad) throws DataAccessException;
  List getUnvListarUniversidades() throws DataAccessException;

}
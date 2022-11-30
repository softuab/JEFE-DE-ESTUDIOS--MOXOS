package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Departamentos;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Universidades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface DepartamentosDao {

  Departamentos getDptBuscarDepartamento(Departamentos departamento) throws DataAccessException;
  List getFclListarDepartamentos(Facultades facultad) throws DataAccessException;
  List getUnvListarDepartamentos(Universidades universidad) throws DataAccessException;

}
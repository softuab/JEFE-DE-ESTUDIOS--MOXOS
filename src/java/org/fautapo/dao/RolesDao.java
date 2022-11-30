package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Roles;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface RolesDao {

  Roles getBuscarRol(Roles rol) throws DataAccessException;
  List getListarRoles() throws DataAccessException;
  List getListarRolesCliente(Roles rol) throws DataAccessException;
  Roles getBuscarRolCliente(Roles rol) throws DataAccessException;
  List getListarAlmacenesCliente(Roles rol) throws DataAccessException;
  Roles getBuscarAlmacenCliente(Roles rol) throws DataAccessException;

}
package org.fautapo.dao;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.Instituciones;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public interface ClientesDao {

    Clientes getBuscarConexion(Usuarios usuario) throws DataAccessException;

    Clientes getComprobarUsuario(Usuarios usuario) throws DataAccessException;

    Clientes getComprobarUsuSede(Usuarios usuario) throws DataAccessException;

    Instituciones getBuscarInstitucion(Instituciones institucion) throws DataAccessException;

    Instituciones getBuscarInstitucionSede(Instituciones institucion) throws DataAccessException;

    String getFechaCadena(Clientes cliente) throws DataAccessException;

    String getCadenaFecha(Clientes cliente) throws DataAccessException;

    Integer getUsrBuscarIp(Clientes cliente) throws DataAccessException;

    Clientes getBuscarConexionAdministrativo(String correo) throws DataAccessException;

    public Clientes getBuscarConexionUsuario(String correo) throws DataAccessException;
}

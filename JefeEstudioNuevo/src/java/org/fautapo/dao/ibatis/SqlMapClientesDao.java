package org.fautapo.dao.ibatis;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.ClientesDao;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.Instituciones;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public class SqlMapClientesDao extends SqlSessionDaoSupport implements ClientesDao {

    @Override
    public Clientes getBuscarConexion(Usuarios usuario) throws DataAccessException {
        return (Clientes) getSqlSession().selectOne("getBuscarConexion", usuario);
    }

    @Override
    public Clientes getComprobarUsuario(Usuarios usuario) throws DataAccessException {
        return (Clientes) getSqlSession().selectOne("getComprobarUsuario", usuario);
    }

    @Override
    public Clientes getComprobarUsuSede(Usuarios usuario) throws DataAccessException {
        return (Clientes) getSqlSession().selectOne("getComprobarUsuSede", usuario);
    }

    @Override
    public Instituciones getBuscarInstitucion(Instituciones institucion) throws DataAccessException {
        return (Instituciones) getSqlSession().selectOne("getBuscarInstitucion", institucion);
    }

    @Override
    public Instituciones getBuscarInstitucionSede(Instituciones institucion) throws DataAccessException {
        return (Instituciones) getSqlSession().selectOne("getBuscarInstitucionSede", institucion);
    }

    @Override
    public String getFechaCadena(Clientes cliente) throws DataAccessException {
        return (String) getSqlSession().selectOne("getFechaCadena", cliente);
    }

    @Override
    public String getCadenaFecha(Clientes cliente) throws DataAccessException {
        return (String) getSqlSession().selectOne("getCadenaFecha", cliente);
    }

    @Override
    public Integer getUsrBuscarIp(Clientes cliente) throws DataAccessException {
        return (Integer) getSqlSession().selectOne("getUsrBuscarIp", cliente);
    }

    @Override
    public Clientes getBuscarConexionAdministrativo(String correo) throws DataAccessException {
        return getSqlSession().selectOne("getBuscarConexionAdministrativo", correo);
    }

    @Override
    public Clientes getBuscarConexionUsuario(String correo) throws DataAccessException{
        return getSqlSession().selectOne("getBuscarConexionUsuario", correo);
    }
}

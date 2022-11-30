package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.RolesDao;
import org.fautapo.domain.Roles;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public class SqlMapRolesDao extends SqlSessionDaoSupport implements RolesDao {

    public Roles getBuscarRol(Roles rol) throws DataAccessException {
        return (Roles) getSqlSession().selectOne("getBuscarRol", rol);
    }

    public List getListarRoles() throws DataAccessException {
        return getSqlSession().selectList("getListarRoles", null);
    }

    public List getListarRolesCliente(Roles rol) throws DataAccessException {
        return getSqlSession().selectList("getListarRolesCliente", rol);
    }

    public Roles getBuscarRolCliente(Roles rol) throws DataAccessException {
        return (Roles) getSqlSession().selectOne("getBuscarRolCliente", rol);
    }

    public List getListarAlmacenesCliente(Roles rol) throws DataAccessException {
        return getSqlSession().selectList("getListarAlmacenesCliente", rol);
    }

    public Roles getBuscarAlmacenCliente(Roles rol) throws DataAccessException {
        return (Roles) getSqlSession().selectOne("getBuscarAlmacenCliente", rol);
    }

    public List getListarRolesCliente(Integer id_usuario) throws DataAccessException {
        return getSqlSession().selectList("getListarRolesCliente", id_usuario);
    }
}

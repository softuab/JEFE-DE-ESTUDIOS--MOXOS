package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.UsuariosDao;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.EstudianteUsuario;
import org.fautapo.domain.Usuarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-01
 */
public class SqlMapUsuariosDao extends SqlSessionDaoSupport implements UsuariosDao {

    @Override
    public Usuarios getBuscarUsuario(Usuarios usuario) throws DataAccessException {
        return (Usuarios) getSqlSession().selectOne("getBuscarUsuario", usuario);
    }

    @Override
    public List getListarUsuarios(Usuarios usuario) throws DataAccessException {
        return getSqlSession().selectList("getListarUsuarios", usuario);
    }

    @Override
    public List getListarUsuariosUbicacionOrganica(Usuarios usuario) throws DataAccessException {
        return getSqlSession().selectList("getListarUsuariosUbicacionOrganica", usuario);
    }

    @Override
    public int getVerificarUsuario(Usuarios usuario) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getVerificarUsuario", usuario);
        return i.intValue();
    }

    @Override
    public int setRegistrarNuevaClave(Usuarios usuario) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarNuevaClave", usuario);
        return i.intValue();
    }

    @Override
    public int setRegistrarUsuario(Usuarios usuario) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarUsuario", usuario);
        return i.intValue();
    }

    public int setEliminarUsuario(Usuarios usuario) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setEliminarUsuario", usuario);
        return i.intValue();
    }

    @Override
    public Usuarios getUsuario(String correo) throws DataAccessException {
        return getSqlSession().selectOne("getUsuario", correo);
    }

    @Override
    public Integer getIDUsuario(String correo) throws DataAccessException {
        return getSqlSession().selectOne("getIDUsuario", correo);
    }

    @Override
    public Usuarios getUsuarioadministrativo(String correo) throws DataAccessException {
        return getSqlSession().selectOne("getUsuarioadministrativo", correo);
    }

    @Override
    public Integer setCambioPinAdministrativo(Usuarios usuario) throws DataAccessException {
        return getSqlSession().selectOne("setCambioPinAdministrativo", usuario);
    }

    @Override
    public Usuarios  GetUsuarioPorPersona(Integer id_persona) throws DataAccessException {
        return getSqlSession().selectOne("GetUsuarioPorPersona", id_persona);
    }

    @Override
    public EstudianteUsuario GetUsuarioEstudiantePorPersona(Integer id_persona) throws DataAccessException {
        return getSqlSession().selectOne("GetUsuarioEstudiantePorPersona", id_persona);
    }

    @Override
    public Docentes GetUsuarioDocentePorPersona(Integer id_persona) throws DataAccessException {
        return getSqlSession().selectOne("GetUsuarioDocentePorPersona", id_persona);
    }

    @Override
    public Docentes getUsuarioDocente(String apodo) throws DataAccessException {
        return getSqlSession().selectOne("getUsuarioDocente", apodo);
    }

    @Override
    public EstudianteUsuario getUsuarioEstudiante(String apodo) throws DataAccessException {
        return getSqlSession().selectOne("getUsuarioEstudiante", apodo);
    }

    @Override
    public Usuarios getUsuarioAdministrativoActivo(String apodo) throws DataAccessException {
        return getSqlSession().selectOne("getUsuarioAdministrativoActivo", apodo);
    }

}

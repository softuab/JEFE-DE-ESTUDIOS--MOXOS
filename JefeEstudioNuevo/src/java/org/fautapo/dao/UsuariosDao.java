package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.EstudianteUsuario;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Usuarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-22
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-29
 */
public interface UsuariosDao {

    Usuarios getBuscarUsuario(Usuarios usuario) throws DataAccessException;

    List getListarUsuarios(Usuarios usuario) throws DataAccessException;

    List getListarUsuariosUbicacionOrganica(Usuarios usuario) throws DataAccessException;

    int getVerificarUsuario(Usuarios usuario) throws DataAccessException;

    int setRegistrarNuevaClave(Usuarios usuario) throws DataAccessException;

    int setRegistrarUsuario(Usuarios usuario) throws DataAccessException;

    int setEliminarUsuario(Usuarios usuario) throws DataAccessException;

    Usuarios getUsuario(String correo) throws DataAccessException;

    Integer getIDUsuario(String correo) throws DataAccessException;

    Usuarios getUsuarioadministrativo(String correo) throws DataAccessException;

    Integer setCambioPinAdministrativo(Usuarios usuario) throws DataAccessException;

    Usuarios GetUsuarioPorPersona(Integer id_persona) throws DataAccessException;

    EstudianteUsuario GetUsuarioEstudiantePorPersona(Integer id_persona) throws DataAccessException;

    Docentes GetUsuarioDocentePorPersona(Integer id_persona) throws DataAccessException;

    Docentes getUsuarioDocente(String apodo) throws DataAccessException;

    EstudianteUsuario getUsuarioEstudiante(String apodo) throws DataAccessException;

    Usuarios getUsuarioAdministrativoActivo(String apodo) throws DataAccessException;

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao.ibatis;

import java.util.List;
import org.fautapo.dao.CursosMoodleDao;
import org.fautapo.domain.CursosMoodle;
import org.fautapo.domain.MoodleConfiguracion;
import org.fautapo.domain.ParametrosBusqueda;
import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;

/**
 *
 * @author FNZABALETAA
 */
public class SqlMapCursosMoodleDao extends SqlSessionDaoSupport implements CursosMoodleDao {

    @Override
    public List<CursosMoodle> GetListarCursosMoodleEstudiante(ParametrosBusqueda parametros) throws DataAccessException {
        return getSqlSession().selectList("GetListarCursosMoodleEstudiante", parametros); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<CursosMoodle> GetListarCursosMoodleDocente(ParametrosBusqueda parametros) throws DataAccessException {
        return getSqlSession().selectList("GetListarCursosMoodleDocente", parametros); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void RegistrarCursosMoodleDocente(CursosMoodle cursos) throws DataAccessException {
        getSqlSession().insert("RegistrarCursosMoodleDocente", cursos);
    }

    @Override
    public void RegistrarCursosMoodleEstudiante(CursosMoodle cursos) throws DataAccessException {
        getSqlSession().insert("RegistrarCursosMoodleEstudiante", cursos);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void MatricularMoodle(CursosMoodle cursos) throws DataAccessException {
        getSqlSession().update("MatricularMoodle", cursos); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void UpdateUserMoodle(CursosMoodle cursos) throws DataAccessException {
        getSqlSession().update("UpdateUserMoodle", cursos); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public MoodleConfiguracion GetConfiguracionCursosMoodle() throws DataAccessException {
        return (MoodleConfiguracion) getSqlSession().selectOne("GetConfiguracionCursosMoodle");//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<CursosMoodle> GetListarCursosMoodleEstudiantePorCurso(ParametrosBusqueda parametros) throws DataAccessException {
        return getSqlSession().selectList("GetListarCursosMoodleEstudiante", parametros); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CursosMoodle GetCursoMoodleEstudiante(ParametrosBusqueda parametros) throws DataAccessException {
        return (CursosMoodle) getSqlSession().selectOne("GetCursoMoodleEstudiante", parametros); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void RegistrarUsuariosMoodle(CursosMoodle cursos) throws DataAccessException {
        getSqlSession().update("RegistrarUsuariosMoodle", cursos);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void ActualizarUsuariosMoodle(CursosMoodle cursos) throws DataAccessException {
        getSqlSession().update("ActualizarUsuariosMoodle", cursos); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CursosMoodle GetUsuarioMoodle(int id) throws DataAccessException {
        return (CursosMoodle) getSqlSession().selectOne("GetUsuarioMoodle", id); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<CursosMoodle> GetListaCursosMoodlePorPrograma(CursosMoodle curso) throws DataAccessException {
        return getSqlSession().selectList("GetListaCursosMoodlePorPrograma", curso);
    }

}

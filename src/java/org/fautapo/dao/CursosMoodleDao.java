/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.CursosMoodle;
import org.fautapo.domain.MoodleConfiguracion;
import org.fautapo.domain.ParametrosBusqueda;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author FNZABALETAA
 */
public interface CursosMoodleDao {

    List<CursosMoodle> GetListarCursosMoodleEstudiante(ParametrosBusqueda parametros) throws DataAccessException;

    List<CursosMoodle> GetListarCursosMoodleDocente(ParametrosBusqueda parametros) throws DataAccessException;

    List<CursosMoodle> GetListarCursosMoodleEstudiantePorCurso(ParametrosBusqueda parametros) throws DataAccessException;

    void RegistrarCursosMoodleDocente(CursosMoodle cursos) throws DataAccessException;

    void RegistrarCursosMoodleEstudiante(CursosMoodle cursos) throws DataAccessException;

    void MatricularMoodle(CursosMoodle cursos) throws DataAccessException;

    void UpdateUserMoodle(CursosMoodle cursos) throws DataAccessException;

    MoodleConfiguracion GetConfiguracionCursosMoodle() throws DataAccessException;

    CursosMoodle GetCursoMoodleEstudiante(ParametrosBusqueda parametros) throws DataAccessException;

    void RegistrarUsuariosMoodle(CursosMoodle cursos) throws DataAccessException;

    void ActualizarUsuariosMoodle(CursosMoodle cursos) throws DataAccessException;

    CursosMoodle GetUsuarioMoodle(int id) throws DataAccessException;

    List<CursosMoodle> GetListaCursosMoodlePorPrograma(CursosMoodle curso) throws DataAccessException;
}

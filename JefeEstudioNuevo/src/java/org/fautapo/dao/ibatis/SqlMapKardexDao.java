/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao.ibatis;

import java.util.List;
import org.fautapo.dao.KardexDao;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.PersonaCursosRealizados;
import org.fautapo.domain.PersonaEvaluacionDocente;
import org.fautapo.domain.PersonaExperienciaLaboral;
import org.fautapo.domain.PersonaFormacionAcademica;
import org.fautapo.domain.PersonaIdioma;
import org.fautapo.domain.PersonaKardex;
import org.fautapo.domain.PersonaProduccionCientifica;
import org.fautapo.util.ListViewItem;
import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;

/**
 *
 * @author hp
 */
public class SqlMapKardexDao extends SqlSessionDaoSupport implements KardexDao {

    @Override
    public void RegistrarNuevoKardexDocente(PersonaKardex kardex) throws DataAccessException {
        getSqlSession().insert("RegistrarNuevoKardexDocente", kardex);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PersonaKardex GetKardexPersonalNuevo(int id_persona) throws DataAccessException {
        return (PersonaKardex) getSqlSession().selectOne("GetKardexPersonalNuevo", id_persona); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void ActualizarDatosKardexDocente(PersonaKardex kardex) throws DataAccessException {
        getSqlSession().insert("ActualizarDatosKardexDocente", kardex); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ListViewItem> GetLocalidadPersona() throws DataAccessException {
        return getSqlSession().selectList("GetLocalidadPersona", null);
    }

    @Override
    public List<ListViewItem> GetNivelEstudio() throws DataAccessException {
        return getSqlSession().selectList("GetNivelEstudio", null); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ListViewItem> GetProfesiones() throws DataAccessException {
        return getSqlSession().selectList("GetProfesiones", null); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ListViewItem> GetColegiosProfesionales() throws DataAccessException {
        return getSqlSession().selectList("GetColegiosProfesionales", null); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ListViewItem> GetBancos() throws DataAccessException {
        return getSqlSession().selectList("GetBancos", null); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PersonaKardex GetImagenesPersonaKardex(int id_persona) throws DataAccessException {
        return (PersonaKardex) getSqlSession().selectOne("GetImagenesPersonaKardex", id_persona); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int RegistrarNuevoIdiomaKardex(PersonaIdioma idioma) throws DataAccessException {
        Integer insertedId = (Integer) getSqlSession().insert("RegistrarNuevoIdiomaKardex", idioma);
        return insertedId;
    }

    @Override
    public void ActualizarDatosiIdiomaKardexDocente(PersonaIdioma idioma) throws DataAccessException {
        getSqlSession().insert("ActualizarDatosiIdiomaKardexDocente", idioma);
    }

    @Override
    public void AprobarIdiomaKardexDocente(PersonaIdioma idioma) throws DataAccessException {
        getSqlSession().insert("AprobarIdiomaKardexDocente", idioma);
    }

    @Override
    public void EliminarIdiomaKardexDocente(int id_idioma) throws DataAccessException {
        getSqlSession().insert("EliminarIdiomaKardexDocente", id_idioma); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<PersonaIdioma> GetPersonaTotalIdiomaKardex(int id_persona) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaTotalIdiomaKardex", id_persona); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<PersonaIdioma> GetPersonaSubTotalIdiomaKardex(PersonaKardex kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaSubTotalIdiomaKardex", kardex); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PersonaIdioma GetPersonaIdiomaKardex(int id_idioma) throws DataAccessException {
        return (PersonaIdioma) getSqlSession().selectOne("GetPersonaIdiomaKardex", id_idioma); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void ActualizarImagenIdiomaKardexDocente(PersonaIdioma idioma) throws DataAccessException {
        getSqlSession().insert("ActualizarImagenIdiomaKardexDocente", idioma);
    }
//formacion academica

    @Override
    public int RegistrarNuevoFormacionAcademicaKardex(PersonaFormacionAcademica formacion) throws DataAccessException {
        Integer insertedId = (Integer) getSqlSession().insert("RegistrarNuevoFormacionAcademicaKardex", formacion);
        return insertedId;
    }

    @Override
    public void ActualizarDatosFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion) throws DataAccessException {
        getSqlSession().insert("ActualizarDatosFormacionAcademicaKardexDocente", formacion); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void AprobarFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion) throws DataAccessException {
        getSqlSession().insert("AprobarFormacionAcademicaKardexDocente", formacion); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void EliminarFormacionAcademicaKardexDocente(int id_formacion) throws DataAccessException {
        getSqlSession().insert("EliminarFormacionAcademicaKardexDocente", id_formacion);
    }

    @Override
    public void ActualizarImagenFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion) throws DataAccessException {
        getSqlSession().insert("ActualizarImagenFormacionAcademicaKardexDocente", formacion); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<PersonaFormacionAcademica> GetPersonaTotalFormacionAcademicaKardex(int id_persona_kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaTotalFormacionAcademicaKardex", id_persona_kardex);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PersonaFormacionAcademica GetPersonaFormacionAcademicaKardex(int id_formacion) throws DataAccessException {
        return (PersonaFormacionAcademica) getSqlSession().selectOne("GetPersonaFormacionAcademicaKardex", id_formacion);
    }

    @Override
    public List<PersonaFormacionAcademica> GetPersonaSubTotalFormacionAcademicaKardex(PersonaKardex kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaSubTotalFormacionAcademicaKardex", kardex); //To change body of generated methods, choose Tools | Templates.
    }
//experiencia laboral

    @Override
    public int RegistrarExperienciaLaboralKardex(PersonaExperienciaLaboral experiencia) throws DataAccessException {
        Integer insertedId = (Integer) getSqlSession().insert("RegistrarExperienciaLaboralKardex", experiencia);
        return insertedId;
    }

    @Override
    public int RegistrarCursosRealizadosKardex(PersonaCursosRealizados cursos) throws DataAccessException {
        Integer insertedId = (Integer) getSqlSession().insert("RegistrarCursosRealizadosKardex", cursos);
        return insertedId;
    }

    @Override
    public int RegistrarProduccionCientificaKardex(PersonaProduccionCientifica produccion) throws DataAccessException {
        Integer insertedId = (Integer) getSqlSession().insert("RegistrarProduccionCientificaKardex", produccion);
        return insertedId;
    }

    @Override
    public int RegistrarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException {
        Integer insertedId = (Integer) getSqlSession().insert("RegistrarEvaluacionDocenteKardex", evaluacion);
        return insertedId;
    }

    @Override
    public void ActualizarDatosExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia) throws DataAccessException {
        getSqlSession().insert("ActualizarDatosExperienciaLaboralKardexDocente", experiencia);
    }

    @Override
    public void AprobarExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia) throws DataAccessException {
        getSqlSession().insert("AprobarExperienciaLaboralKardexDocente", experiencia);
    }

    @Override
    public void EliminarExperienciaLaboralKardexDocente(int id_experiencia_laboral) throws DataAccessException {
        getSqlSession().insert("EliminarExperienciaLaboralKardexDocente", id_experiencia_laboral);
    }

    @Override
    public void ActualizarImagenExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia) throws DataAccessException {
        getSqlSession().insert("ActualizarImagenExperienciaLaboralKardexDocente", experiencia);
    }

    @Override
    public List<PersonaExperienciaLaboral> GetPersonaTotalExperienciaLaboralKardex(int id_persona_kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaTotalExperienciaLaboralKardex", id_persona_kardex);
    }

    @Override
    public PersonaExperienciaLaboral GetPersonaExperienciaLaboralKardex(int id_experiencia_laboral) throws DataAccessException {
        return (PersonaExperienciaLaboral) getSqlSession().selectOne("GetPersonaExperienciaLaboralKardex", id_experiencia_laboral);
    }

    @Override
    public List<PersonaExperienciaLaboral> GetPersonaSubTotalExperienciaLaboralKardex(PersonaKardex kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaSubTotalExperienciaLaboralKardex", kardex);
    }

    @Override
    public void ActualizarDatosCursosRealizadosKardexDocente(PersonaCursosRealizados cursos) throws DataAccessException {
        getSqlSession().insert("ActualizarDatosCursosRealizadosKardexDocente", cursos);
    }

    @Override
    public void AprobarCursosRealizadosKardexDocente(PersonaCursosRealizados cursos) throws DataAccessException {
        getSqlSession().insert("AprobarCursosRealizadosKardexDocente", cursos);
    }

    @Override
    public void EliminarCursosRealizadosKardexDocente(int id_cursos_realizados) throws DataAccessException {
        getSqlSession().insert("EliminarCursosRealizadosKardexDocente", id_cursos_realizados);
    }

    @Override
    public void ActualizarImagenCursosRealizadosKardexDocente(PersonaCursosRealizados cursos) throws DataAccessException {
        getSqlSession().insert("ActualizarImagenCursosRealizadosKardexDocente", cursos);
    }

    @Override
    public List<PersonaCursosRealizados> GetPersonaTotalCursosRealizadosKardex(int id_persona_kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaTotalCursosRealizadosKardex", id_persona_kardex);
    }

    @Override
    public PersonaCursosRealizados GetPersonaCursosRealizadosKardex(int id_cursos_realizados) throws DataAccessException {
        return (PersonaCursosRealizados) getSqlSession().selectOne("GetPersonaCursosRealizadosKardex", id_cursos_realizados);
    }

    @Override
    public List<PersonaCursosRealizados> GetPersonaSubTotalCursosRealizadosKardex(PersonaKardex kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaSubTotalCursosRealizadosKardex", kardex);
    }

    @Override
    public void ActualizarProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion) throws DataAccessException {
        getSqlSession().insert("ActualizarProduccionCientificaKardexDocente", produccion);
    }

    @Override
    public void AprobarProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion) throws DataAccessException {
        getSqlSession().insert("AprobarProduccionCientificaKardexDocente", produccion);
    }

    @Override
    public void EliminarProduccionCientificaKardexDocente(int id_produccion_cientifica) throws DataAccessException {
        getSqlSession().insert("EliminarProduccionCientificaKardexDocente", id_produccion_cientifica);
    }

    @Override
    public void ActualizarImagenProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion) throws DataAccessException {
        getSqlSession().insert("ActualizarImagenProduccionCientificaKardexDocente", produccion);
    }

    @Override
    public List<PersonaProduccionCientifica> GetPersonaTotalProduccionCientificaKardex(int id_persona_kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaTotalProduccionCientificaKardex", id_persona_kardex);
    }

    @Override
    public PersonaProduccionCientifica GetPersonaProduccionCientificaKardex(int id_produccion_cientifica) throws DataAccessException {
        return (PersonaProduccionCientifica) getSqlSession().selectOne("GetPersonaProduccionCientificaKardex", id_produccion_cientifica);
    }

    @Override
    public List<PersonaProduccionCientifica> GetPersonaSubTotalProduccionCientificaKardex(PersonaKardex kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaSubTotalProduccionCientificaKardex", kardex);
    }

    @Override
    public void ActualizarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException {
        getSqlSession().insert("ActualizarEvaluacionDocenteKardex", evaluacion);
    }

    @Override
    public void AprobarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException {
        getSqlSession().insert("AprobarEvaluacionDocenteKardex", evaluacion);
    }

    @Override
    public void EliminarEvaluacionDocenteKardex(int id_evaluacion_docente) throws DataAccessException {
        getSqlSession().insert("EliminarEvaluacionDocenteKardex", id_evaluacion_docente);
    }

    @Override
    public void ActualizarImagenEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException {
        getSqlSession().insert("ActualizarImagenEvaluacionDocenteKardex", evaluacion);
    }

    @Override
    public List<PersonaEvaluacionDocente> GetPersonaTotalEvaluacionDocenteKardex(int id_persona_kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaTotalEvaluacionDocenteKardex", id_persona_kardex);
    }

    @Override
    public PersonaEvaluacionDocente GetPersonaEvaluacionDocenteKardex(int id_evaluacion_docente) throws DataAccessException {
        return (PersonaEvaluacionDocente) getSqlSession().selectOne("GetPersonaEvaluacionDocenteKardex", id_evaluacion_docente);
    }

    @Override
    public List<PersonaEvaluacionDocente> GetPersonaSubTotalEvaluacionDocenteKardex(PersonaKardex kardex) throws DataAccessException {
        return getSqlSession().selectList("GetPersonaSubTotalEvaluacionDocenteKardex", kardex);
    }

    @Override
    public PersonaKardex GetPersonaDocumentosExportar(Integer id_persona) {
        return getSqlSession().selectOne("GetPersonaDocumentosExportar", id_persona);
    }

    @Override
    public List<PersonaKardex> GetPersonaDocumentosAnexosExportar(Integer id_persona) {
        return getSqlSession().selectList("GetPersonaDocumentosAnexosExportar", id_persona);
    }

    @Override
    public List<PersonaKardex> GetPersonaDocumentosExportarCarrera(Asignaciones asignacion) {
        return getSqlSession().selectList("GetPersonaDocumentosExportarCarrera", asignacion);
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao;

import java.util.List;
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

/**
 *
 * @author hp
 */
public interface KardexDao {

    void RegistrarNuevoKardexDocente(PersonaKardex kardex) throws DataAccessException;

    PersonaKardex GetKardexPersonalNuevo(int id_persona) throws DataAccessException;

    void ActualizarDatosKardexDocente(PersonaKardex kardex) throws DataAccessException;

    List<ListViewItem> GetNivelEstudio() throws DataAccessException;

    List<ListViewItem> GetLocalidadPersona() throws DataAccessException;

    List<ListViewItem> GetProfesiones() throws DataAccessException;

    List<ListViewItem> GetColegiosProfesionales() throws DataAccessException;

    List<ListViewItem> GetBancos() throws DataAccessException;

    PersonaKardex GetImagenesPersonaKardex(int id_persona) throws DataAccessException;

    int RegistrarNuevoIdiomaKardex(PersonaIdioma idioma) throws DataAccessException;

    void ActualizarDatosiIdiomaKardexDocente(PersonaIdioma idioma) throws DataAccessException;

    void AprobarIdiomaKardexDocente(PersonaIdioma idioma) throws DataAccessException;

    void EliminarIdiomaKardexDocente(int id_idioma) throws DataAccessException;

    List<PersonaIdioma> GetPersonaTotalIdiomaKardex(int id_persona) throws DataAccessException;

    List<PersonaIdioma> GetPersonaSubTotalIdiomaKardex(PersonaKardex kardex) throws DataAccessException;

    PersonaIdioma GetPersonaIdiomaKardex(int id_idioma) throws DataAccessException;

    void ActualizarImagenIdiomaKardexDocente(PersonaIdioma idioma) throws DataAccessException;

    // PersonaFormacionAcademica academica
    int RegistrarNuevoFormacionAcademicaKardex(PersonaFormacionAcademica formacion) throws DataAccessException;

    void ActualizarDatosFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion) throws DataAccessException;

    void AprobarFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion) throws DataAccessException;

    void EliminarFormacionAcademicaKardexDocente(int id_formacion) throws DataAccessException;

    void ActualizarImagenFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion) throws DataAccessException;

    List<PersonaFormacionAcademica> GetPersonaTotalFormacionAcademicaKardex(int id_persona_kardex) throws DataAccessException;

    PersonaFormacionAcademica GetPersonaFormacionAcademicaKardex(int id_formacion) throws DataAccessException;

    List<PersonaFormacionAcademica> GetPersonaSubTotalFormacionAcademicaKardex(PersonaKardex kardex) throws DataAccessException;

    int RegistrarExperienciaLaboralKardex(PersonaExperienciaLaboral experiencia) throws DataAccessException;

    int RegistrarCursosRealizadosKardex(PersonaCursosRealizados cursos) throws DataAccessException;

    int RegistrarProduccionCientificaKardex(PersonaProduccionCientifica produccion) throws DataAccessException;

    int RegistrarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException;

    void ActualizarDatosExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia) throws DataAccessException;

    void AprobarExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia) throws DataAccessException;

    void EliminarExperienciaLaboralKardexDocente(int id_experiencia_laboral) throws DataAccessException;

    void ActualizarImagenExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia) throws DataAccessException;

    List<PersonaExperienciaLaboral> GetPersonaTotalExperienciaLaboralKardex(int id_persona_kardex) throws DataAccessException;

    PersonaExperienciaLaboral GetPersonaExperienciaLaboralKardex(int id_experiencia_laboral) throws DataAccessException;

    List<PersonaExperienciaLaboral> GetPersonaSubTotalExperienciaLaboralKardex(PersonaKardex kardex) throws DataAccessException;

    void ActualizarDatosCursosRealizadosKardexDocente(PersonaCursosRealizados cursos) throws DataAccessException;

    void AprobarCursosRealizadosKardexDocente(PersonaCursosRealizados cursos) throws DataAccessException;

    void EliminarCursosRealizadosKardexDocente(int id_cursos_realizados) throws DataAccessException;

    void ActualizarImagenCursosRealizadosKardexDocente(PersonaCursosRealizados cursos) throws DataAccessException;

    List<PersonaCursosRealizados> GetPersonaTotalCursosRealizadosKardex(int id_persona_kardex) throws DataAccessException;

    PersonaCursosRealizados GetPersonaCursosRealizadosKardex(int id_cursos_realizados) throws DataAccessException;

    List<PersonaCursosRealizados> GetPersonaSubTotalCursosRealizadosKardex(PersonaKardex kardex) throws DataAccessException;

    void ActualizarProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion) throws DataAccessException;

    void AprobarProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion) throws DataAccessException;

    void EliminarProduccionCientificaKardexDocente(int id_produccion_cientifica) throws DataAccessException;

    void ActualizarImagenProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion) throws DataAccessException;

    List<PersonaProduccionCientifica> GetPersonaTotalProduccionCientificaKardex(int id_persona_kardex) throws DataAccessException;

    PersonaProduccionCientifica GetPersonaProduccionCientificaKardex(int id_produccion_cientifica) throws DataAccessException;

    List<PersonaProduccionCientifica> GetPersonaSubTotalProduccionCientificaKardex(PersonaKardex kardex) throws DataAccessException;

    void ActualizarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException;

    void AprobarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException;

    void EliminarEvaluacionDocenteKardex(int id_evaluacion_docente) throws DataAccessException;

    void ActualizarImagenEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion) throws DataAccessException;

    List<PersonaEvaluacionDocente> GetPersonaTotalEvaluacionDocenteKardex(int id_persona_kardex) throws DataAccessException;

    PersonaEvaluacionDocente GetPersonaEvaluacionDocenteKardex(int id_evaluacion_docente) throws DataAccessException;

    List<PersonaEvaluacionDocente> GetPersonaSubTotalEvaluacionDocenteKardex(PersonaKardex kardex) throws DataAccessException;

    PersonaKardex GetPersonaDocumentosExportar(Integer id_persona);

    List<PersonaKardex> GetPersonaDocumentosAnexosExportar(Integer id_persona);

    List<PersonaKardex> GetPersonaDocumentosExportarCarrera(Asignaciones asignacion);

}

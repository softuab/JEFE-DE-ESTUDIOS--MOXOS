package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Libretas;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-07
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-07
 */
public interface LibretasDao {

    //Administrar libretas
    Libretas getLbrBuscarFase(Libretas libreta) throws DataAccessException;

    int getLbrBuscarFaseMinima(Libretas libreta) throws DataAccessException;

    int getLbrBuscarFaseMaxima(Libretas libreta) throws DataAccessException;

    List getGrpListarEvaluacionDefinida(Libretas libreta);

    Libretas getLbrBuscarTipoNota(Libretas libreta) throws DataAccessException;

    List getEstBuscarEstudiantesProgramados(Libretas libreta);

    List<Libretas> getEstBuscarEstudiantesProgramadospersona(Libretas libreta);

    List getPstBuscarPostulantesProgramados(Libretas libreta);

    List<Libretas> getPstBuscarPostulantesProgramadospersona(Libretas libreta);

    List getEstListarNotasEstudiante(Libretas libreta);

    List getEstListarNotasEstudianteLibreta(Libretas libreta);

    List getEstListarNotasEstudiantePermitidoModificar(Libretas libreta);

    List getPstListarNotasPostulante(Libretas libreta);

    int setEstInsertarNotaEstudianteFase(Libretas libreta) throws DataAccessException;

    int setPstInsertarNotaPostulanteFase(Libretas libreta) throws DataAccessException;

    int setDctAvanzarFase(Libretas libreta) throws DataAccessException;

    int setDctAvanzarFaseSemiFinal(Libretas libreta) throws DataAccessException;

    int getEstSumarNotasEstudianteEvalRegular(Libretas libreta) throws DataAccessException;

    int getEstSumarNotasEstudianteEvalContinua(Libretas libreta) throws DataAccessException;
    //Fin Administrar libretas

    //Definir evaluacion
    List getLbrListarTiposNotasDefinidas(Libretas libreta) throws DataAccessException;

    List getLbrListarTiposNotas(Libretas libreta) throws DataAccessException;

    Libretas getLbrBuscarTipoNotaDefinida(Libretas libreta) throws DataAccessException;

    int setGrpInsertarEvaluacion(Libretas libreta) throws DataAccessException;

    int setGrpModificarEvaluacion(Libretas libreta) throws DataAccessException;

    int setGrpRegistrarEvaluacion(Libretas libreta) throws DataAccessException;

    int setGrpEliminarEvaluacion(Libretas libreta) throws DataAccessException;
    //Fin Definir evaluacion

    //Cerrar libreta
    List getListarMateriasCerrarLibreta(Libretas libreta) throws DataAccessException;

    int setCerrarLibreta(Libretas libreta) throws DataAccessException;
    //Fin Cerrar libreta

    //Administrar lbr_tipos_notas
    List getTpsListarTiposEvaluaciones() throws DataAccessException;

    List getListaParametrosdeEvaluacionporMateria(Libretas libreta) throws DataAccessException;

    List getTpsListarTiposEstados() throws DataAccessException;

    Libretas getTpsBuscarTipoEvaluacion(Libretas libreta) throws DataAccessException;

    List getLbrListarFases(Libretas libreta) throws DataAccessException;

    List getLbrListarFases2(Libretas libreta) throws DataAccessException;

    List getLbrListarTiposNotasFase(Libretas libreta) throws DataAccessException;

    int setLbrInsertarTipoNota(Libretas libreta) throws DataAccessException;

    int setLbrModificarTipoNota(Libretas libreta) throws DataAccessException;
    //Fin administrar lbr tipos notas

    //Reporte de libretas
    List getListarNotasFaseEstudiantes(Libretas libreta);
    //Fin reporte de libretas

    //Reporte resumen de Notas
    List getListarResumenNotasEstudiantes(Libretas libreta);
    //Fin reporte de notas

    //Cerrar libreta Por Materia
    List getListarMateriasCerrarLibretaIndiv(Libretas libreta) throws DataAccessException;

    int setCerrarLibretaPorMateria(Libretas libreta) throws DataAccessException;
    //Fin Cerrar libreta Por Materia

    //Edgar
    //Reporte certificado de calificaciones
    List getListarCerticadoCalificaciones(Libretas libreta);
    //Fin reporte certificado de calificaciones

    //listar detalle de materia notas contnua
    List getEstListarNotasEvaluacionContinua(Libretas libreta);
    //fin listar detalle de materia notas contnua

    //listar evaluacion contunua estudiantes
    List getListarEstudiantesEvaluacionContinua(Libretas libreta);
    //fin listar evaluacion continua estudiantes

    //listar fase tipos notas de la definicion evaluacion
    List getLbrTiposnotasListarDefinicion(Libretas libreta);
    //listar fase tipos notas de la definicion evaluacion 

    //RETROCEDER FASE
    // modificar fase del docente
    int setModificarFaseDocente(Libretas libreta) throws DataAccessException;

    int setModificarFaseDocenteCerrarLibreta(Libretas libreta) throws DataAccessException;
    //Fin modificar fase del docente

    // eliminar fase calculado
    int setEliminarFaseEstLibretas(Libretas libreta) throws DataAccessException;
    //Fin eliminar fase calculado
    //FIN RETROCEDER FASE

    //Curso Verano
    List getTrnListarEvaluacionesVerano() throws DataAccessException;
    //Fin curso verano

    //listar fase tipos notas de la definicion evaluacion
    Libretas getBuscarGradoAcademicoPrograma(Libretas libreta);
    //listar fase tipos notas de la definicion evaluacion 
    //Listar tipos notas

    List getListarTiposNotas() throws DataAccessException;

    //Buscar Lbr Fases
    Libretas getBuscarLbrFase(Libretas libreta);

    Libretas getBuscarLbrTipoNota(Libretas libreta);

    int setLbrRegistrarTipoNota(Libretas libreta) throws DataAccessException;

    int setLbrEliminarTipoNota(Libretas libreta) throws DataAccessException;

    //Listar estudiantes cierre libreta
    List getListarEstudiantesParaCierreLibreta(Libretas libreta);

    List getListarEstudiantesEnEstLibretas(Libretas libreta);

    List getListarEvaluacionesFinalesFase(Libretas libreta);

    List getTotalAprobadosReprobadosMateria(Libretas libreta);

    //Listar Notas pondradas est_libretas
    List getListarNotasEstudiantesLibretas(Libretas libreta);

    List getListarCalificacionCalendario(Libretas libreta);

    List getListarCalificacionCalendarioDocente(Libretas libreta);
    //Buscar Tipo Nota

    Libretas getMiBuscarTipoNota(Libretas libreta) throws DataAccessException;

    //INICIO - METODOS ADICIONADOS POR LA UAP
    //NOTAS RECTIFICADAS
    List getEstListarNotasRectificadasEstudiante(Libretas libreta);
    //FIN - METODOS ADICIONADOS POR LA UAP

    int setBuscarCalendarioAcademicoPrograma(Libretas libreta) throws DataAccessException;

    int setBuscarCalendarioAcademicoProgramaDocenteMateria(Libretas libreta) throws DataAccessException;

    int setBuscarProgramacionAutorizacion(Libretas libreta) throws DataAccessException;

    int setCambioEstadoProgramacionAutorizacion(Libretas libreta) throws DataAccessException;

    Libretas getNotasEstudiante(Libretas libreta) throws DataAccessException;

    void RegistrarBitacoraCambiosDocente(Libretas libreta) throws DataAccessException;
}

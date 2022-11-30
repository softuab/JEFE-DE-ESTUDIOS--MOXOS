package org.fautapo.dao.ibatis;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.LibretasDao;
import org.fautapo.domain.Libretas;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-07
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-07
 */
public class SqlMapLibretasDao extends SqlSessionDaoSupport implements LibretasDao {

    //Administrar libretas
    public Libretas getLbrBuscarFase(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getLbrBuscarFase", libreta);
    }

    public List getGrpListarEvaluacionDefinida(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getGrpListarEvaluacionDefinida", libreta);
    }

    public Libretas getLbrBuscarTipoNota(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getLbrBuscarTipoNota", libreta);
    }

    public List getEstBuscarEstudiantesProgramados(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getEstBuscarEstudiantesProgramados", libreta);
    }

    public List getPstBuscarPostulantesProgramados(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getPstBuscarPostulantesProgramados", libreta);
    }

    public List getEstListarNotasEstudiante(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getEstListarNotasEstudiante", libreta);
    }

    public List getEstListarNotasEstudiantePermitidoModificar(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getEstListarNotasEstudiantePermitidoModificar", libreta);
    }

    public List getPstListarNotasPostulante(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getPstListarNotasPostulante", libreta);
    }

    public int setEstInsertarNotaEstudianteFase(Libretas libreta) throws DataAccessException {
        Integer i = 0;
        /*    try {
            i = (Integer) getSqlSession().execute(new SqlMapClientCallback() {
                public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
                    executor.startBatch();
                    Integer i = (Integer) executor.selectOne("setEstInsertarNotaEstudianteFase", libreta);
                    executor.executeBatch();
                    return i.intValue();
                }
            });
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            i = -1;
        }*/
        return i.intValue();
    }

    public int setPstInsertarNotaPostulanteFase(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setPstInsertarNotaPostulanteFase", libreta);
        return i.intValue();
    }

    public int setDctAvanzarFase(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setDctAvanzarFase", libreta);
        return i.intValue();
    }

    public int setDctAvanzarFaseSemiFinal(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setDctAvanzarFaseSemiFinal", libreta);
        return i.intValue();
    }

    public int getEstSumarNotasEstudianteEvalRegular(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getEstSumarNotasEstudianteEvalRegular", libreta);
        return i.intValue();
    }

    public int getEstSumarNotasEstudianteEvalContinua(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getEstSumarNotasEstudianteEvalContinua", libreta);
        return i.intValue();
    }

    public int getLbrBuscarFaseMinima(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getLbrBuscarFaseMinima", libreta);
        return i.intValue();
    }

    public int getLbrBuscarFaseMaxima(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getLbrBuscarFaseMaxima", libreta);
        return i.intValue();
    }
    //Fin Administrar libretas

    //Definir evaluacion
    public List getLbrListarTiposNotas(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getLbrListarTiposNotas", libreta);
    }

    public List getLbrListarTiposNotasDefinidas(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getLbrListarTiposNotasDefinidas", libreta);
    }

    public Libretas getLbrBuscarTipoNotaDefinida(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getLbrBuscarTipoNotaDefinida", libreta);
    }

    public int setGrpInsertarEvaluacion(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setGrpInsertarEvaluacion", libreta);
        return i.intValue();
    }

    public int setGrpModificarEvaluacion(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setGrpModificarEvaluacion", libreta);
        return i.intValue();
    }

    public int setGrpRegistrarEvaluacion(Libretas libreta) throws DataAccessException {
        Integer i = 0;
        /* try {
            i = (Integer) getSqlSession().execute(new SqlMapClientCallback() {
                public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
                    executor.startBatch();
                    Integer i = (Integer) executor.selectOne("setGrpRegistrarEvaluacion", libreta);
                    executor.executeBatch();
                    return i.intValue();
                }
            });
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            i = -1;
        }*/
        return i.intValue();
    }

    public int setGrpEliminarEvaluacion(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setGrpEliminarEvaluacion", libreta);
        return i.intValue();
    }
    //Fin Definir evaluacion

    //Cerrar libretas
    public List getListarMateriasCerrarLibreta(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasCerrarLibreta", libreta);
    }

    public int setCerrarLibreta(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setCerrarLibreta", libreta);
        return i.intValue();
    }
    //Fin Cerrar libretas

    //Administrar LBR TIPOS NOTAS
    public List getTpsListarTiposEvaluaciones() throws DataAccessException {
        return getSqlSession().selectList("getTpsListarTiposEvaluaciones", null);
    }

    public List getTpsListarTiposEstados() throws DataAccessException {
        return getSqlSession().selectList("getTpsListarTiposEstados", null);
    }

    public Libretas getTpsBuscarTipoEvaluacion(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getTpsBuscarTipoEvaluacion", libreta);
    }

    public List getLbrListarFases(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getLbrListarFases", libreta);
    }

    public List getLbrListarFases2(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getLbrListarFases2", libreta);
    }

    public List getLbrListarTiposNotasFase(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getLbrListarTiposNotasFase", libreta);
    }

    public int setLbrInsertarTipoNota(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setLbrInsertarTipoNota", libreta);
        return i.intValue();
    }

    public int setLbrModificarTipoNota(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setLbrModificarTipoNota", libreta);
        return i.intValue();
    }

    //fin lbr_tipos_notas
    //reporte de libretas 
    public List getListarNotasFaseEstudiantes(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarNotasFaseEstudiantes", libreta);
    }
    //Fin reporte libretas

    //reporte resumen de notas 
    public List getListarResumenNotasEstudiantes(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarResumenNotasEstudiantes", libreta);
    }

    //Cerrar libretas Por Materia
    public List getListarMateriasCerrarLibretaIndiv(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasCerrarLibretaIndiv", libreta);
    }

    public int setCerrarLibretaPorMateria(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setCerrarLibretaPorMateria", libreta);
        return i.intValue();
    }
    //Fin Cerrar libretas  Por Materia

    //Reportes Notas
    //reporte certificado de calificaciones
    public List getListarCerticadoCalificaciones(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarCerticadoCalificaciones", libreta);
    }
    //fin reporte certificado de calificaciones

    //listar detalle de materia notas contnua
    public List getEstListarNotasEvaluacionContinua(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getEstListarNotasEvaluacionContinua", libreta);
    }
    //fin listar detalle de materia notas contnua

    //listar evaluacion contunua estudiantes
    public List getListarEstudiantesEvaluacionContinua(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarEstudiantesEvaluacionContinua", libreta);
    }
    //fin listar evaluacion continua estudiantes

    //listar fases tipos notas de la definicion de evaluacion
    public List getLbrTiposnotasListarDefinicion(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getLbrTiposnotasListarDefinicion", libreta);
    }
    //fin listar fases tipos notas de la definicion de evaluacion
    //Fin Reportes Notas  

    //Retroceder Fase
    //Modifcar fase retroceder fase docente
    public int setModificarFaseDocente(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setModificarFaseDocente", libreta);
        return i.intValue();
    }

    public int setModificarFaseDocenteCerrarLibreta(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setModificarFaseDocenteCerrarLibreta", libreta);
        return i.intValue();
    }

    //Fin Modifcar fase retroceder fase docente
    //eliminar notas de fases calculados
    public int setEliminarFaseEstLibretas(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setEliminarFaseEstLibretas", libreta);
        return i.intValue();
    }
    //Fin eliminar notas de fases calculados
    //Fin Retroceder Fase

    //Curso verano
    public List getTrnListarEvaluacionesVerano() throws DataAccessException {
        return getSqlSession().selectList("getTrnListarEvaluacionesVerano", null);
    }

    //Grados academicos
    public Libretas getBuscarGradoAcademicoPrograma(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getBuscarGradoAcademicoPrograma", libreta);
    }

    public List getListarTiposNotas() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposNotas", null);
    }

    //Buscar Lbr Fases
    public Libretas getBuscarLbrFase(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getBuscarLbrFase", libreta);
    }

    public Libretas getBuscarLbrTipoNota(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getBuscarLbrTipoNota", libreta);
    }

    public int setLbrRegistrarTipoNota(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setLbrRegistrarTipoNota", libreta);
        return i.intValue();
    }

    public int setLbrEliminarTipoNota(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setLbrEliminarTipoNota", libreta);
        return i.intValue();
    }

    //listar estudiantes cierre libreta
    public List getListarEstudiantesParaCierreLibreta(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarEstudiantesParaCierreLibreta", libreta);
    }

    public List getListarEstudiantesEnEstLibretas(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarEstudiantesEnEstLibretas", libreta);
    }

    public List getListarEvaluacionesFinalesFase(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarEvaluacionesFinalesFase", libreta);
    }

    public List getTotalAprobadosReprobadosMateria(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getTotalAprobadosReprobadosMateria", libreta);
    }

    //Listar notas ponderadas est_libretas
    public List getListarNotasEstudiantesLibretas(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarNotasEstudiantesLibretas", libreta);
    }

    public List getListarCalificacionCalendario(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarCalificacionCalendario", libreta);
    }

    public List getListarCalificacionCalendarioDocente(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListarCalificacionCalendarioDocente", libreta);
    }
    //Buscar Tipo Nota

    public Libretas getMiBuscarTipoNota(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getMiBuscarTipoNota", libreta);
    }

//INICIO - METODOS ADICIONADOS POR LA UAP
    //NOTAS RECTIFICADAS
    public List getEstListarNotasRectificadasEstudiante(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getEstListarNotasRectificadasEstudiante", libreta);
    }
//FIN - METODOS ADICIONADOS POR LA UAP

    public int setBuscarCalendarioAcademicoPrograma(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setBuscarCalendarioAcademicoPrograma", libreta);
        return i.intValue();
    }

    public int setBuscarCalendarioAcademicoProgramaDocenteMateria(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setBuscarCalendarioAcademicoProgramaDocenteMateria", libreta);
        return i.intValue();
    }

    public int setBuscarProgramacionAutorizacion(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setBuscarProgramacionAutorizacion", libreta);
        return i.intValue();
    }

    public int setCambioEstadoProgramacionAutorizacion(Libretas libreta) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setCambioEstadoProgramacionAutorizacion", libreta);
        return i.intValue();
    }

    @Override
    public List getListaParametrosdeEvaluacionporMateria(Libretas libreta) throws DataAccessException {
        return getSqlSession().selectList("getListaParametrosdeEvaluacionporMateria", libreta);
    }

    @Override
    public List getEstListarNotasEstudianteLibreta(Libretas libreta) {
        return getSqlSession().selectList("getEstListarNotasEstudianteLibreta", libreta);
    }

    @Override
    public List<Libretas> getEstBuscarEstudiantesProgramadospersona(Libretas libreta) {
        return getSqlSession().selectList("getEstBuscarEstudiantesProgramadospersona", libreta);
    }

    @Override
    public List<Libretas> getPstBuscarPostulantesProgramadospersona(Libretas libreta) {
        return getSqlSession().selectList("getPstBuscarPostulantesProgramadospersona", libreta);
    }

    @Override
    public Libretas getNotasEstudiante(Libretas libreta) throws DataAccessException {
        return (Libretas) getSqlSession().selectOne("getNotasEstudiante", libreta);
    }

    @Override
    public void RegistrarBitacoraCambiosDocente(Libretas libreta) throws DataAccessException {
        getSqlSession().insert("RegistrarBitacoraCambiosDocente", libreta);//To change body of generated methods, choose Tools | Templates.
    }
}

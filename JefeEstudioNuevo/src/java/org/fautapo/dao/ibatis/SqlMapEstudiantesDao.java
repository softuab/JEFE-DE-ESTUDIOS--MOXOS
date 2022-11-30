package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.EstudiantesDao;
import org.fautapo.domain.EstudianteUsuario;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Menciones;

public class SqlMapEstudiantesDao extends SqlSessionDaoSupport implements EstudiantesDao {

    public int getMiEstListarCompromisosCant(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getMiEstListarCompromisosCant", estudiante);
        return i.intValue();
    }

    //CRCB  
    public Estudiantes getEstBuscarEstudiante(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudiante", estudiante);
    }

    public Estudiantes getEstBuscarEstudiantePrograma(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudiantePrograma", estudiante);
    }

    public Estudiantes getEstBuscarEstudianteAccesos(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudianteAccesos", estudiante);
    }

    public List getEstListarEstudiantesNombres(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesNombres", estudiante);
    }

    public List getEstListarEstudiantesDip(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesDip", estudiante);
    }

    public List getEstListarEstudiantesNombresAccesos(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesNombresAccesos", estudiante);
    }

    public List getEstListarEstudiantesDipAccesos(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesDipAccesos", estudiante);
    }

    public List getEstListarEstudiantesNombres2(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesNombres2", estudiante);
    }

    public List getEstListarEstudiantesDip2(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesDip2", estudiante);
    }

    //Programacion como estudiante
    public Estudiantes getComprobarEstudiante(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getComprobarEstudiante", estudiante);
    }
    // Fin Programacion como estudiante

    // Cambiar Pin Estudiante
    public Estudiantes getMtrBuscarMatricula(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getMtrBuscarMatricula", estudiante);
    }

    public Estudiantes getMtrBuscarMatriculaNuevo(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getMtrBuscarMatriculaNuevo", estudiante);
    }

    public Estudiantes getEstBuscarEstudianteTipoGrado(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudianteTipoGrado", estudiante);
    }

    public int setMtrModificarPinEstudiante(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setMtrModificarPinEstudiante", estudiante);
        return i.intValue();
    }
    // Fin Cambiar Pin Estudiante  

    //Mostrar año de ingreso a la UAB
    public Estudiantes getListarIngresoUAB(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getListarIngresoUAB", estudiante);
    }

    //FIN año de ingreso a la uab
    //Reg. Estudiante
    public int setRegistrarEstudiante(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarEstudiante", estudiante);
        return i.intValue();
    }

    public int setModificarEstudiante(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setModificarEstudiante", estudiante);
        return i.intValue();
    }

    public Estudiantes getEstBuscarEstudiantePrs(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudiantePrs", estudiante);
    }

    public Estudiantes getEstBuscarEstudiantePrsSede(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudiantePrsSede", estudiante);
    }

    public Estudiantes getEstBuscarEstudiantePrsPos(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudiantePrsPos", estudiante);
    }

    public Estudiantes getEstBuscarEstudiantePrsPre(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudiantePrsPre", estudiante);
    }

    public Estudiantes getEstBuscarEstudiantePrsPreSede(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudiantePrsPreSede", estudiante);
    }

    public int setRegistrarMatriculaEstudiante(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarMatriculaEstudiante", estudiante);
        return i.intValue();
    }

    public Estudiantes getBuscarMatriculaEstPrs(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getBuscarMatriculaEstPrs", estudiante);
    }

    //Fin Reg. Estudiante
    //INICIO - Ver Ficha Academica
    public Estudiantes getEstBuscarEstudianteNombres(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudianteNombres", estudiante);
    }

    public Estudiantes getEstBuscarEstudianteNombresSede(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudianteNombresSede", estudiante);
    }

    public List getEstListarFichaAcademica(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarFichaAcademica", estudiante);
    }

    public List getEstListarFichaAcademicaModificar(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarFichaAcademicaModificar", estudiante);
    }

    public List getEstListarFichaAcademicaConvalidada(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarFichaAcademicaConvalidada", estudiante);
    }

    public List getEstListarFichaAcademicaConvalidada2(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarFichaAcademicaConvalidada2", estudiante);
    }

    public List getEstListarFichaAcademicaAprobadas(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarFichaAcademicaAprobadas", estudiante);
    }
    //FIN - Ver Ficha Academica

    //INICIO - Ver Programacion
    public List getEstListarProgramacion(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarProgramacion", estudiante);
    }

    public List getEstListarProgramacioncv(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarProgramacioncv", estudiante);
    }

    //FIN - Ver Programacion
    // INICIO - Cambio de Plan
    public int setEstRegistrarCambioPlan(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setEstRegistrarCambioPlan", plan)).intValue();
    }
    // FIN - Cambio de Plan

    //INICIO - Materias no aprobadas
    public List getEstListarMateriasNoAprobadas(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarMateriasNoAprobadas", estudiante);
    }
    //FIN - Materias no aprobadas 

    //Mi Matricula Antiguo
    public List getMtrListarMatriculasEstudiante(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getMtrListarMatriculasEstudiante", estudiante);
    }

    //Fin Mi Matricula
    //Cambio de estado
    public int setRegistrarCambiarEstadoEstudiante(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarCambiarEstadoEstudiante", estudiante);
        return i.intValue();
    }

    public int setRegistrarCambiarEstadoMatricula(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarCambiarEstadoMatricula", estudiante);
        return i.intValue();
    }
    //Fin Cambio de estado

    //Adjuntos Est
    public int setRegistrarEstAdjuntos(Estudiantes estudiante) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setRegistrarEstAdjuntos", estudiante)).intValue();
    }

    public List getListarAdjuntosEstudiante(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarAdjuntosEstudiante", estudiante);
    }

    public int setEliminarEstAdjunto(Estudiantes estudiante) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setEliminarEstAdjunto", estudiante)).intValue();
    }

    //Inicio estadisticas
    public List getListarNroEstudiantesMatriculados(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstudiantesMatriculados", estudiante);
    }

    @Override
    public List getListarNroEstudiantesMatriculadosporPrograma(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstudiantesMatriculadosporPrograma", estudiante);
    }

    public List getListarNroEstMatriculadosSexosNacionalidades(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstMatriculadosSexosNacionalidades", estudiante);
    }

    public List getListarNroEstMatriculadosTipoEstudiante(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstMatriculadosTipoEstudiante", estudiante);
    }

    public List getListarNroEstMatriculadosTipoAdmision(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstMatriculadosTipoAdmision", estudiante);
    }

    public List getListarNroEstMatriculadosSexos(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstMatriculadosSexos", estudiante);
    }

    public List getListarNroEstMatriculadosNacionalidad(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstMatriculadosNacionalidad", estudiante);
    }

    public List getListarNroEstProgramadosMaterias(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstProgramadosMaterias", estudiante);
    }

    public List getListarNroEstProgramadosSexosNacionalidades(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstProgramadosSexosNacionalidades", estudiante);
    }

    public List getListarNroPostProgramadosMaterias(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroPostProgramadosMaterias", estudiante);
    }

    public List getListarNroEstProgAprReprAbaMaterias(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstProgAprReprAbaMaterias", estudiante);
    }

    public List getListarNroEstAproPreU(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstAproPreU", estudiante);
    }

    public List getListarNroEstAproAdmiEsp(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstAproAdmiEsp", estudiante);
    }

    public List getListarNroEstAproPreUSexosNacionalidad(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstAproPreUSexosNacionalidad", estudiante);
    }

    public List getListarNroEstAproAdEspSexosNacionalidad(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNroEstAproAdEspSexosNacionalidad", estudiante);
    }
    //Fin Estadisticas

    //listar datos programacion Edgar
    public List getEstListarDetalleProgramacion(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarDetalleProgramacion", estudiante);
    }
    //Fin listar Datos programacion Edgar

    //Estudiantes por grupos
    public List getEstListarEstudiantesPorGrupos(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesPorGrupos", estudiante);
    }
    //Fin Estudiantes por grupos

    //Bloquear estudiantes todos
    public int setBloquearEstudiantesTodos(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setBloquearEstudiantesTodos", estudiante);
        return i.intValue();
    }
    //Fin Bloquear estudiantes todos

    //Modificar tipo_estudiante
    public int setModificarTipoEstudiante(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setModificarTipoEstudiante", estudiante);
        return i.intValue();
    }
    //Fin Modificar Tipo Estudiante

    public List getMiEstListarCompromisos(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getMiEstListarCompromisos", estudiante);
    }

    //Registrar est_programacion
    public int setRegistrarEstProgramacionTipo(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarEstProgramacionTipo", estudiante);
        return i.intValue();
    }

    public Estudiantes getMiPrsBuscarEstudiante(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getMiPrsBuscarEstudiante", estudiante);
    }

    // inicio JOJO
    public List getTrnListarMateriasVerano(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getTrnListarMateriasVerano", estudiante);
    }
    // fin JOJO

    public List getEstListarProgramasEstudiante(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarProgramasEstudiante", estudiante);
    }

    public List getEstListarMatriculadosPorPrograma(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarMatriculadosPorPrograma", estudiante);
    }

    public List getEstListarMatriculadosPorProgramaTipoAdmision(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarMatriculadosPorProgramaTipoAdmision", estudiante);
    }

    //Buscar est_programacion
    public Estudiantes getMiBuscarEstProgramacion(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getMiBuscarEstProgramacion", estudiante);
    }

    public List getEstListarMatriculadosPorProgramaTipoEstudiante(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarMatriculadosPorProgramaTipoEstudiante", estudiante);
    }

    //Buscar tipos Admisiones
    public Estudiantes getBuscarTipoAdmision(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getBuscarTipoAdmision", estudiante);
    }

    //est_clasificaciones
    public Estudiantes getBuscarTipoClasificacionEstudiante(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getBuscarTipoClasificacionEstudiante", estudiante);
    }

    public int setRegistrarEstClasificacion(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarEstClasificacion", estudiante);
        return i.intValue();
    }

    //Est_regularizaciones
    public Estudiantes getMiBuscarUltimoEstRegularizacion(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getMiBuscarUltimoEstRegularizacion", estudiante);
    }

    public Estudiantes getMiBuscarEstRegularizacion(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getMiBuscarEstRegularizacion", estudiante);
    }

    public List getMiListarRegularizacionesEstudiante(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getMiListarRegularizacionesEstudiante", estudiante);
    }

    public int setRegistrarEstRegularizacionBloqueoEst(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarEstRegularizacionBloqueoEst", estudiante);
        return i.intValue();
    }

    public int setModificarRegularizar(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setModificarRegularizar", estudiante);
        return i.intValue();
    }

    public List getMiListarTiposRegularizaciones() throws DataAccessException {
        return getSqlSession().selectList("getMiListarTiposRegularizaciones", null);
    }
    //Fin Est_regularizaciones

    public Menciones getEstBuscarMencion(Estudiantes estudiante) throws DataAccessException {
        return (Menciones) getSqlSession().selectOne("getEstBuscarMencion", estudiante);
    }

    // Inicio Est Deudas
    public List getListarDeudasEstudiante(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarDeudasEstudiante", estudiante);
    }

    public Estudiantes getMiBuscarEstDeuda(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getMiBuscarEstDeuda", estudiante);
    }

    public Estudiantes getBuscarUltimaEstDeuda(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getBuscarUltimaEstDeuda", estudiante);
    }

    public int setRegistrarEstDeuda(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarEstDeuda", estudiante);
        return i.intValue();
    }

    public int setModificarEstDeuda(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setModificarEstDeuda", estudiante);
        return i.intValue();
    }

    public List getMiListarTiposDeudas() throws DataAccessException {
        return getSqlSession().selectList("getMiListarTiposDeudas", null);
    }
    //Fin est_deudas

    // Cambiar PIM Estudiante General
    public int setMtrModificarApodoClaveEstudiante(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setMtrModificarApodoClaveEstudiante", estudiante);
        return i.intValue();
    }

    public int setRegistrarApodoClaveMatricula(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarApodoClaveMatricula", estudiante);
        return i.intValue();
    }

    //Fin Cambiar PIN Estudiante General
//INICIO - METODOS ADICIONADOS POR LA UAP
    // Listado de Estudiantes Con Descuentos
    public List getEstListarPorProgramaTipoDescuento(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarPorProgramaTipoDescuento", estudiante);
    }
    // Listado de Estudiante Con Prorroga

    public List getListarEstConProrroga(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarEstConProrroga", estudiante);
    }

    public List getRendimientoAcademico(Estudiantes promedio) throws DataAccessException {
        return getSqlSession().selectList("getRendimientoAcademico", promedio);
    }

    public Estudiantes getDesignacionBecaTrabajo(Estudiantes becario) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getDesignacionBecaTrabajo", becario);
    }

    // Listado de Becarios 
    public List getListarEstBecasTrabajo(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarEstBecasTrabajo", estudiante);
    }

    // Listado de Becarios por Unidad Funcional
    public List getListarEstBecasTrabajoFuncional(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarEstBecasTrabajoFuncional", estudiante);
    }

    // Listado de Estudiantes por Nivel Academico
    public List getListarNiveles(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNiveles", estudiante);
    }

    // Listado de Claves de Estudiantes por Programas
    public List getListarClavesEstPorPrograma(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarClavesEstPorPrograma", estudiante);
    }

    // Listado de Curso de Preparatoria de Ingles Estudiantes
    public List getListarCursoPreIngles(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarCursoPreIngles", estudiante);
    }

    //Admision Auxiliares de Docencia
    public Estudiantes getEstBuscarEstudianteNombresMatriculados(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudianteNombresMatriculados", estudiante);
    }

    public Estudiantes getEstBuscarEstudianteAdmitidoAuxiliar(Estudiantes estudiante) throws DataAccessException {
        return (Estudiantes) getSqlSession().selectOne("getEstBuscarEstudianteAdmitidoAuxiliar", estudiante);
    }

    public int setRegistrarAdmisionEstudianteAuxiliar(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarAdmisionEstudianteAuxiliar", estudiante);
        return i.intValue();
    }

    public int setEliminarAdmisionEstudianteAuxiliar(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setEliminarAdmisionEstudianteAuxiliar", estudiante);
        return i.intValue();
    }

    public List getBuscarEstudianteAuxiliar(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getBuscarEstudianteAuxiliar", estudiante);
    }

    public List getBuscarEstudianteAuxiliarTodas(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getBuscarEstudianteAuxiliarTodas", estudiante);
    }

    // REPORTES DE ESTUDIANTES DOCENCIA POR PROGRAMA
    public List getListarEstudiantesAuxiliaresPorPrograma(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarEstudiantesAuxiliaresPorPrograma", estudiante);
    }

    public List getBuscarEstudiantesAuxiliaresPorPrograma(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getBuscarEstudiantesAuxiliaresPorPrograma", estudiante);
    }

    //TARJETAS MAGNETICAS
    public List getBuscarEstudiantePersona(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getBuscarEstudiantePersona", estudiante);
    }

    // Listado de Curso Varios Extracurricular en la UAP
    public List getListarCursoPsicoEst(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarCursoPsicoEst", estudiante);
    }

    public List getListarCursoSemioEst(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarCursoSemioEst", estudiante);
    }

    public List getlistarMiembrosT(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getlistarMiembrosT", estudiante);
    }
    //Reg. CODE

    public List getListarCertGen(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarCertGen", estudiante);
    }

    public List getListarCertGenAnulados(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarCertGenAnulados", estudiante);
    }

    public List getListarCertGenEmitidos(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarCertGenEmitidos", estudiante);
    }

    public List getListarNotasCertificados(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarNotasCertificados", estudiante);
    }

    public int setRegistrarCerGen(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarCerGen", estudiante);
        return i.intValue();
    }

    public int getBuscarMaxCertSede(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getBuscarMaxCertSede", estudiante);
        return i.intValue();
    }

    public int setRegistrarCerGenNotas(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarCerGenNotas", estudiante);
        return i.intValue();
    }

    public void setEliminarCertificadoNotas(Estudiantes estudiante) throws DataAccessException {
        getSqlSession().selectOne("setEliminarCertificadoNotas", estudiante);
    }

    public int getbuscarnrotransacciones(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getbuscarnrotransacciones", estudiante);
        return i.intValue();
    }

    public int getbuscarnrocertificado(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getbuscarnrocertificado", estudiante);
        return i.intValue();
    }

    public int getcert_buscar_nro_certificado_gestioncode(Estudiantes estudiante) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getcert_buscar_nro_certificado_gestioncode", estudiante);
        return i.intValue();
    }

//FIN - METODOS ADICIONADOS POR LA UAP
    @Override
    public List getEstListarEstudiantesPorMateria(Estudiantes estudiante) throws DataAccessException {
        return getSqlSession().selectList("getEstListarEstudiantesPorMateria", estudiante);
    }

    @Override
    public List<EstudianteUsuario> getListarEstudiantes(EstudianteUsuario estudiante) throws DataAccessException {
        return getSqlSession().selectList("getListarEstudiantes", estudiante);
    }

    @Override
    public Integer setRegistrarUsuarioEstudiante(EstudianteUsuario usuario) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarUsuarioEstudiante", usuario);
        return i.intValue();
    }

    @Override
    public Integer setEliminarEstudiante(EstudianteUsuario usuario) throws DataAccessException {
        Integer i = (Integer) getSqlSession().update("setEliminarEstudiante", usuario);
        return i.intValue();
    }

    @Override
    public EstudianteUsuario getBuscarEstudianteUsuario(EstudianteUsuario datosUsuario) throws DataAccessException {
        return getSqlSession().selectOne("getBuscarEstudianteUsuario", datosUsuario);
    }

}

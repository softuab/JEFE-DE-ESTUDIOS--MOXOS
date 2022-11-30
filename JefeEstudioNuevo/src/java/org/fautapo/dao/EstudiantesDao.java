package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.EstudianteUsuario;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Personas;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Menciones;

public interface EstudiantesDao {

    int getMiEstListarCompromisosCant(Estudiantes estudiante) throws DataAccessException;
    //CRCB est_ prgramaciones

    Estudiantes getEstBuscarEstudiante(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudiantePrograma(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudianteAccesos(Estudiantes estudiante) throws DataAccessException;

    List getEstListarEstudiantesNombres(Estudiantes estudiante) throws DataAccessException;

    List getEstListarEstudiantesDip(Estudiantes estudiante) throws DataAccessException;

    List getEstListarEstudiantesNombresAccesos(Estudiantes estudiante) throws DataAccessException;

    List getEstListarEstudiantesDipAccesos(Estudiantes estudiante) throws DataAccessException;

    List getEstListarEstudiantesNombres2(Estudiantes estudiante) throws DataAccessException;

    List getEstListarEstudiantesDip2(Estudiantes estudiante) throws DataAccessException;
    //programaciones como estudiante

    Estudiantes getComprobarEstudiante(Estudiantes estudiante) throws DataAccessException;
    //fin programaciones como estudiante

    //Cambio Pin Estudiante
    Estudiantes getMtrBuscarMatricula(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getMtrBuscarMatriculaNuevo(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudianteTipoGrado(Estudiantes estudiante) throws DataAccessException;

    int setMtrModificarPinEstudiante(Estudiantes estudiante) throws DataAccessException;

    //MOSTRAR año de ingreso a la UAB
    Estudiantes getListarIngresoUAB(Estudiantes estudiante) throws DataAccessException;

    //Registar Estudiante
    int setRegistrarEstudiante(Estudiantes estudiante) throws DataAccessException;

    int setModificarEstudiante(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudiantePrs(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudiantePrsSede(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudiantePrsPos(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudiantePrsPre(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudiantePrsPreSede(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarMatriculaEstudiante(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getBuscarMatriculaEstPrs(Estudiantes estudiante) throws DataAccessException;
    //Fin Reg. Estudiante
    // INICIO - Ver Ficha Academica

    Estudiantes getEstBuscarEstudianteNombres(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudianteNombresSede(Estudiantes estudiante) throws DataAccessException;

    List getEstListarFichaAcademica(Estudiantes estudiante) throws DataAccessException;

    List getEstListarFichaAcademicaModificar(Estudiantes estudiante) throws DataAccessException;

    List getEstListarFichaAcademicaConvalidada(Estudiantes estudiante) throws DataAccessException;

    List getEstListarEstudiantesPorMateria(Estudiantes estudiante) throws DataAccessException;

    List getEstListarFichaAcademicaConvalidada2(Estudiantes estudiante) throws DataAccessException;

    List getEstListarFichaAcademicaAprobadas(Estudiantes estudiante) throws DataAccessException;
    // FIN - Ver Ficha Academica

    // INICIO - Ver Programacion
    List getEstListarProgramacion(Estudiantes estudiante) throws DataAccessException;

    List getEstListarProgramacioncv(Estudiantes estudiante) throws DataAccessException;
    // FIN - Ver Programacion

    // INICIO - Cambio de plan
    int setEstRegistrarCambioPlan(Planes plan) throws DataAccessException;
    // FIN - Cambio de plan

    // INICIO - Materias no aprobadas
    List getEstListarMateriasNoAprobadas(Estudiantes estudiante) throws DataAccessException;
    // FIN - Materias no aprobadas

    //Mi Matricula antiguo
    List getMtrListarMatriculasEstudiante(Estudiantes estudiante) throws DataAccessException;
    //Fin Mi Matricula antiguo
    //Cambiar estado estudiante

    int setRegistrarCambiarEstadoEstudiante(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarCambiarEstadoMatricula(Estudiantes estudiante) throws DataAccessException;
    //Fin Cambiar estado estudiante

    //Adjunto Docente
    int setRegistrarEstAdjuntos(Estudiantes estudiante) throws DataAccessException;

    List getListarAdjuntosEstudiante(Estudiantes estudiante) throws DataAccessException;

    int setEliminarEstAdjunto(Estudiantes estudiante) throws DataAccessException;

    //Inicio Estadisticas
    List getListarNroEstudiantesMatriculados(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstudiantesMatriculadosporPrograma(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstMatriculadosSexosNacionalidades(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstMatriculadosTipoEstudiante(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstMatriculadosTipoAdmision(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstMatriculadosSexos(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstMatriculadosNacionalidad(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstProgramadosMaterias(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstProgramadosSexosNacionalidades(Estudiantes estudiante) throws DataAccessException;

    List getListarNroPostProgramadosMaterias(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstProgAprReprAbaMaterias(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstAproPreU(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstAproAdmiEsp(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstAproPreUSexosNacionalidad(Estudiantes estudiante) throws DataAccessException;

    List getListarNroEstAproAdEspSexosNacionalidad(Estudiantes estudiante) throws DataAccessException;
    //Fin Estadisticas

    // Reportes Edgar
    // listar Datos detalle de programacion
    List getEstListarDetalleProgramacion(Estudiantes estudiante) throws DataAccessException;
    // FIN - listar datos detalle de programacion

    //listar Estudiantes por Grupos
    List getEstListarEstudiantesPorGrupos(Estudiantes estudiante) throws DataAccessException;
    // FIN - listar Estudiantes por Grupos

    //Bloquear estudiantes todos
    int setBloquearEstudiantesTodos(Estudiantes estudiante) throws DataAccessException;
    // Fin bloquear estudiantes todos

    //Modificar Tipo Estudiante
    int setModificarTipoEstudiante(Estudiantes estudiante) throws DataAccessException;
    //Fin Modificar Tipo Estudiante

    List getMiEstListarCompromisos(Estudiantes estudiante) throws DataAccessException;

    //Registrar est_programacion
    int setRegistrarEstProgramacionTipo(Estudiantes estudiante) throws DataAccessException;
    //Fin est_programacion

    Estudiantes getMiPrsBuscarEstudiante(Estudiantes estudiante) throws DataAccessException;

    // inicio JOJO
    List getTrnListarMateriasVerano(Estudiantes estudiante) throws DataAccessException;
    // fin JOJO

    List getEstListarProgramasEstudiante(Estudiantes estudiante) throws DataAccessException;

    List getEstListarMatriculadosPorPrograma(Estudiantes estudiante) throws DataAccessException;

    List getEstListarMatriculadosPorProgramaTipoAdmision(Estudiantes estudiante) throws DataAccessException;

    //Buscar est_programacion
    Estudiantes getMiBuscarEstProgramacion(Estudiantes estudiante) throws DataAccessException;

    //Listado de Estudiantes Matriculados
    List getEstListarMatriculadosPorProgramaTipoEstudiante(Estudiantes estudiante) throws DataAccessException;

    //Buscar tipos Admisiones
    Estudiantes getBuscarTipoAdmision(Estudiantes estudiante) throws DataAccessException;

    //Est_clasificaciones
    Estudiantes getBuscarTipoClasificacionEstudiante(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarEstClasificacion(Estudiantes estudiante) throws DataAccessException;

    //Est_regularizaciones
    Estudiantes getMiBuscarUltimoEstRegularizacion(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getMiBuscarEstRegularizacion(Estudiantes estudiante) throws DataAccessException;

    List getMiListarRegularizacionesEstudiante(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarEstRegularizacionBloqueoEst(Estudiantes estudiante) throws DataAccessException;

    int setModificarRegularizar(Estudiantes estudiante) throws DataAccessException;

    List getMiListarTiposRegularizaciones() throws DataAccessException;
    //Fin Est_regularizaciones

    Menciones getEstBuscarMencion(Estudiantes estudiante) throws DataAccessException;

    //Inicio est_deudas
    List getListarDeudasEstudiante(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getMiBuscarEstDeuda(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getBuscarUltimaEstDeuda(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarEstDeuda(Estudiantes estudiante) throws DataAccessException;

    int setModificarEstDeuda(Estudiantes estudiante) throws DataAccessException;

    List getMiListarTiposDeudas() throws DataAccessException;
    //Fin est_deudas
    //Inicio cambio PIN Estudiante General

    int setMtrModificarApodoClaveEstudiante(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarApodoClaveMatricula(Estudiantes estudiante) throws DataAccessException;
    //Fin cambio PIN Estudiante General

//INICIO - METODOS ADICIONADOS POR LA UAP
    // Listado de Estudiantes Con Descuentos
    List getEstListarPorProgramaTipoDescuento(Estudiantes estudiante) throws DataAccessException;

    // Listado de Estudiante Con Prorroga
    List getListarEstConProrroga(Estudiantes estudiante) throws DataAccessException;

    // Listado de Estudiante Con Rendimiento Academico
    List getRendimientoAcademico(Estudiantes promedio) throws DataAccessException;

    //Becas Trabajo
    Estudiantes getDesignacionBecaTrabajo(Estudiantes becario) throws DataAccessException;

    //Listado de Becarios 
    List getListarEstBecasTrabajo(Estudiantes estudiante) throws DataAccessException;

    //Listado de Becarios por Unidad Funcional
    List getListarEstBecasTrabajoFuncional(Estudiantes estudiante) throws DataAccessException;

    //Listado de Estudiantes por Nivel Academico
    List getListarNiveles(Estudiantes estudiante) throws DataAccessException;

    // Listado de Claves de Estudiantes por Programas
    List getListarClavesEstPorPrograma(Estudiantes estudiante) throws DataAccessException;

    // Listado de Curso de Preparatoria de Ingles
    List getListarCursoPreIngles(Estudiantes estudiante) throws DataAccessException;

    //Admision auxiliares de docencia
    Estudiantes getEstBuscarEstudianteNombresMatriculados(Estudiantes estudiante) throws DataAccessException;

    Estudiantes getEstBuscarEstudianteAdmitidoAuxiliar(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarAdmisionEstudianteAuxiliar(Estudiantes estudiante) throws DataAccessException;

    int setEliminarAdmisionEstudianteAuxiliar(Estudiantes estudiante) throws DataAccessException;

    List getBuscarEstudianteAuxiliar(Estudiantes estudiante) throws DataAccessException;

    List getBuscarEstudianteAuxiliarTodas(Estudiantes estudiante) throws DataAccessException;

    // REPORTES DE ESTUDIANTES DOCENCIA POR PROGRAMA
    List getListarEstudiantesAuxiliaresPorPrograma(Estudiantes estudiante) throws DataAccessException;

    List getBuscarEstudiantesAuxiliaresPorPrograma(Estudiantes estudiante) throws DataAccessException;

    //TARJETAS MAGNETICAS
    List getBuscarEstudiantePersona(Estudiantes estudiante) throws DataAccessException;

    // Listado de Curso Varios Extracurricular en la UAP
    List getListarCursoPsicoEst(Estudiantes estudiante) throws DataAccessException;

    List getListarCursoSemioEst(Estudiantes estudiante) throws DataAccessException;

    List getlistarMiembrosT(Estudiantes estudiante) throws DataAccessException;

    //Cambiar CODE
    int setRegistrarCerGen(Estudiantes estudiante) throws DataAccessException;

    int getBuscarMaxCertSede(Estudiantes estudiante) throws DataAccessException;

    int setRegistrarCerGenNotas(Estudiantes estudiante) throws DataAccessException;

    List getListarCertGen(Estudiantes estudiante) throws DataAccessException;

    List getListarCertGenAnulados(Estudiantes estudiante) throws DataAccessException;

    List getListarCertGenEmitidos(Estudiantes estudiante) throws DataAccessException;

    List getListarNotasCertificados(Estudiantes estudiante) throws DataAccessException;

    void setEliminarCertificadoNotas(Estudiantes estudiante) throws DataAccessException;

    int getbuscarnrotransacciones(Estudiantes estudiante) throws DataAccessException;

    int getbuscarnrocertificado(Estudiantes estudiante) throws DataAccessException;

    int getcert_buscar_nro_certificado_gestioncode(Estudiantes estudiante) throws DataAccessException;

    List<EstudianteUsuario> getListarEstudiantes(EstudianteUsuario estudiante) throws DataAccessException;
    //FIN - METODOS ADICIONADOS POR LA UAP

    Integer setRegistrarUsuarioEstudiante(EstudianteUsuario usuario) throws DataAccessException;

    Integer setEliminarEstudiante(EstudianteUsuario usuario) throws DataAccessException;

    EstudianteUsuario getBuscarEstudianteUsuario(EstudianteUsuario datosUsuario) throws DataAccessException;

}

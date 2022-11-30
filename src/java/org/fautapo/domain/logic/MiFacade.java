package org.fautapo.domain.logic;

import java.util.List;

import org.fautapo.domain.Abm;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Roles;
import org.fautapo.domain.Categorias;
import org.fautapo.domain.Enlaces;
import org.fautapo.domain.Instituciones;
import org.fautapo.domain.Herramientas;
import org.fautapo.domain.Actividades;
import org.fautapo.domain.Dominios;
import org.fautapo.domain.Campos;
import org.fautapo.domain.Informes;
import org.fautapo.domain.Tramites;
import org.fautapo.domain.Personas;
import org.fautapo.domain.Adjuntos;
import org.fautapo.domain.Proveidos;
import org.fautapo.domain.Tableros;
import org.fautapo.domain.Hilos;
import org.fautapo.domain.Dibwayka;
//MICOIMATA
import org.fautapo.domain.Horarios;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Departamentos;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.Notas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Materias;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.BiBliografia;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Grupos;
import org.fautapo.domain.Postulantes;
import org.fautapo.domain.Modelos_ahorros;
import org.fautapo.domain.Perfiles;
import org.fautapo.domain.Curriculum;
import org.fautapo.domain.Menciones;
import org.fautapo.domain.Calendarios;
import org.fautapo.domain.Contenidos;
import org.fautapo.domain.Cronograma;
import org.fautapo.domain.CursosMoodle;
import org.fautapo.domain.DepartamentoGrupos;
import org.fautapo.domain.DistribucionTiempos;
import org.fautapo.domain.FormasDistribucion;
import org.fautapo.domain.FormasOrganizacion;
import org.fautapo.domain.FormasTrabajoAula;
import org.fautapo.domain.MateriasOptativas;
import org.fautapo.domain.MoodleConfiguracion;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.domain.PersonaCursosRealizados;
import org.fautapo.domain.PersonaEvaluacionDocente;
import org.fautapo.domain.PersonaExperienciaLaboral;
import org.fautapo.domain.PersonaFormacionAcademica;
import org.fautapo.domain.PersonaIdioma;
import org.fautapo.domain.PersonaKardex;
import org.fautapo.domain.PersonaProduccionCientifica;
import org.fautapo.domain.ProgramaAnalitico;
import org.fautapo.domain.Tokens;
import org.fautapo.model.ConvalidacionModel;
import org.fautapo.model.ItemFacult;
import org.fautapo.util.ListViewItem;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-22
 */
public interface MiFacade {

    //ABM GENERAL
    List getListarTablas();

    Abm getBuscarTabla(Abm abm);

    Abm getBuscarTabla1(Abm abm);

    List getListarCamposTabla(Abm abm);

    int setEjecutarConsulta(Abm abm);

    List getEjecutarListado(Abm abm);
    //  INICIO JOJO  \\

    List getEjecutarListado2(Abm abm);

    String getDibContadorClasico(Abm abm);

    String getDibBuscarParametro(Abm abm);

    List getListarRegistros(Abm abm);

    List getListarCombos(Abm abm);

    Abm getBuscarForanea(Abm abm);

    Abm getBuscarCampoTabla(Abm abm);

    int getContarDependientes(Abm abm);

    String setDibInsertarRegistro(Abm abm);

    //  INICIO huaica  \\
    List getListarCamposTablaActividad(Abm abm);

    List getEjecutarListado3(Abm abm);

    List getListarRegistrosActividad(Abm abm);

    //  FIN huaica  \\
    // INICIO Combustible \\
    Enlaces getEnlBuscarEnlace(Enlaces enlace);

    List getEnlListarCamposTabla(Abm abm);

    List getEnlEjecutarListado(Abm abm);

    List getEnlListarRegistros(Abm abm);

    // FIN Combustible \\
    //  FIN JOJO  \\
    List getListarCamposCondicion(Abm abm);

    Abm getBuscarCampo(Abm abm);

    int setInsertarDatos(Abm abm);

    List getListarForaneosTabla(Abm abm);

    int setInsertarConsulta(Abm abm);

    Abm getBuscarConsulta(Abm abm);

    int setInsertarConsultaTotales(Abm abm);

    Abm getBuscarConsultaTotales(Abm abm);

    List getListarConsultas();
    //fin ABM GENERAL

    //Clientes
    Clientes getBuscarConexion(Usuarios usuario);

    String getFechaCadena(Clientes cliente);

    String getCadenaFecha(Clientes cliente);

    Integer getUsrBuscarIp(Clientes cliente);
    //fin Clientes

    //Roles
    Roles getBuscarRol(Roles rol);

    List getListarRoles();

    List getListarRolesCliente(Roles rol);

    Roles getBuscarRolCliente(Roles rol);

    List getListarAlmacenesCliente(Roles rol);

    Roles getBuscarAlmacenCliente(Roles rol);
    //fin Roles

    //Menues
    List getListarCategorias(Categorias categoria);

    List getListarEnlaces(Enlaces enlace);

    Enlaces getBuscarEnlace(Enlaces enlace);
    //fin Menues

    Abm getBuscarCampoTabla1(Abm abm);

    Clientes getComprobarUsuario(Usuarios usuario);

    int setBorrarConsulta(Abm abm);

    int setModificarConsulta(Abm abm);

    Clientes getComprobarUsuSede(Usuarios usuario);

    Instituciones getBuscarInstitucion(Instituciones institucion);

    Instituciones getBuscarInstitucionSede(Instituciones institucion);
    // Herramientas

    List getListarCombosPagina(Herramientas herramienta);
    // fin Herramientas

    //Inicio Wayka
    //Actividades
    List getListarActividades(Actividades actividad);

    List getListarTiposAlertasAct(Actividades actividad);

    Actividades getBuscarProceso(Actividades actividad);

    List getListarProcesosAcceso(Clientes cliente);

    List getListarProcesosAccesoTramites(Clientes cliente);

    List getListarProcesosAccesoTramites2(Clientes cliente);

    List getListarProcesosAccesoCorresp(Clientes cliente);

    Actividades getBuscarTipoAlerta(Actividades actividad);

    List getListarTiposAlertas(Actividades actividad);

    Actividades getBuscarActividad(Actividades actividad);

    Actividades getBuscarActividadOrden(Actividades actividad);

    List getListarUbicacionesOrganicas();

    Actividades getBuscarUbicacionOrganica(Actividades actividad);

    List getListarTiposActuaciones();

    Actividades getBuscarTipoActuacion(Actividades actividad);

    int setRegistrarActividad(Actividades actividad);

    int setReiniciarTiposAlertas(Actividades actividad);

    int setRegistrarTipoAlerta(Actividades actividad);

    int setEliminarActividad(Actividades actividad);

    List getListarTiposProcesos();

    List getListarTiposDuraciones();

    Actividades getBuscarTipoDuracion(Actividades actividad);
    //Fin Actividades

    //Dominios
    List getListarDominios();

    List getListarDominiosAcceso(Clientes cliente);

    List getListarTiposDominios();

    Dominios getBuscarDominio(Dominios dominio);

    Dominios getBuscarTipoDominio(Dominios dominio);

    int setRegistrarDominio(Dominios dominio);

    int setEliminarDominio(Dominios dominio);

    int getBuscarDominioOtrasTb(Dominios dominio);
    //Fin Dominios

    //Tuplas
    List getListarTuplas(Dominios dominio);

    List getListarTuplasPadre(Dominios dominio);

    Dominios getBuscarTupla(Dominios dominio);

    int setRegistrarTupla(Dominios dominio);

    int setEliminarTupla(Dominios dominio);

    Dominios getBuscarTupla2(Dominios dominio);

    int setRegistrarTempTupla(Tramites tramite);

    int setLimpiarTempTuplas();
    //Fin Tuplas

    //Campos
    List getListarFormularios();

    List getListarFormulariosAcceso(Clientes cliente);

    List getListarCampos(Campos campo);

    Campos getBuscarFormulario(Campos campo);

    Campos getBuscarCampoForm(Campos campo);

    List getListarTiposValidaciones();

    Campos getBuscarTipoValidacion(Campos campo);

    int setRegistrarCampo(Campos campo);

    int setEliminarCampo(Campos campo);
    //Fin Campos

    //Acls
    Campos getBuscarFormulario1(Campos campo);

    List getListarTiposPermisos();

    List getListarCamposAcl(Campos campo);

    int setRegistrarAcl(Campos campo);

    int setEliminarAcl(Campos campo);
    //Fin Acls

    //Informes
    List getListarInformes(Informes informe);

    Informes getBuscarInforme(Informes informe);

    int setRegistrarInforme(Informes informe);

    int setEliminarInforme(Informes informe);

    List getListarInformesActividad(Tramites tramite);

    Informes getBuscarInforme2(Informes informe);
    //Fin Informes

    //Gw
    String getListarDatosTabla(Abm abm);

    String getListarDatosPrimarios(Abm abm);

    Abm getListarCamposTabla2(Abm abm);

    Tramites getBuscarCampoGw(Tramites tramite);

    //Tramites Limbo
    List getListarTramitesMiosLimbo(Tramites tramite);

    int setRegistrarValorLimbo(Tramites tramite);

    int setInsertarTramiteLimbo(Tramites tramite);

    int setRetrocederTramiteLimbo(Tramites tramite);

    int setRegistrarValorLimbo2(Tramites tramite);

    int setRegistrarTrPrFrLogLimbo(Tramites tramite);
    //Fin Tramites Limbo
    //Fin Gw

    //Administracion de tramites
    List getListarFormularioNuevo(Tramites tramite);

    int getBuscarTieneHijos(Tramites tramite);

    List getListarCombos2(Tramites tramite);

    int getBuscarTuplaPadre(Tramites tramite);

    int setInsertarTramite(Tramites tramite);

    int getBuscarActividadMinima(Tramites tramite);

    int setInsertarFrLog(Tramites tramite);

    int setRegistrarValor(Tramites tramite);

    Tramites getBuscarTramite(Tramites tramite);

    int setRecibirTramite(Tramites tramite);

    Tramites getBuscarFrLog(Tramites tramite);

    int setAvanzarTramite(Tramites tramite);

    int setConcluirTramite(Tramites tramite);

    int setEliminarFrLog(Tramites tramite);

    List getListarTramitesMios(Tramites tramite);

    List getListarTramitesMiosFiltrado(Tramites tramite);

    List getListarTramitesMiosDespachados(Tramites tramite);

    List getListarTramitesMiosDespachadosFiltrado(Tramites tramite);

    List getListarUsuariosActividadSiguiente(Tramites tramite);

    List getListarCamposReferencia(Tramites tramite);

    int setRetrocederTramite(Tramites tramite);

    List getListarFormulario(Tramites tramite);
    //Fin Administracion de tramites

    //Personas
    Personas getBuscarPersonaUsuario(Personas persona);
    //Fin Personas

    //Proveidos
    int setRegistrarProveido(Proveidos proveido);

    Proveidos getBuscarUltimoProveido(Proveidos proveido);

    String getBuscarUltimoProveido2(Proveidos proveido);

    List getListarProveidosHistoricos(Proveidos proveido);

    Proveidos getBuscarProveido(Proveidos proveido);
    //Fin Proveidos

    //Adjuntos
    int setRegistrarAdjunto(Adjuntos adjunto);

    List getListarAdjuntos(Adjuntos adjunto);
    //Fin Adjuntos

    //Administrar mis pendientes agrupados
    List getListarTramitesMiosAgrupados(Tramites tramite);

    List getListarTramitesMiosAgrupados2(Tramites tramite);

    List getListarTramitesMiosAgrupadosDespachados(Tramites tramite);

    List getListarTramitesMiosAgrupadosDespachados2(Tramites tramite);

    Tramites getContarTramitesPorFechaEstado(Tramites tramite);

    Tramites getContarTramitesPorFechaEstado2(Tramites tramite);

    Tramites getContarTramitesPorFecha(Tramites tramite);

    Tramites getContarTramitesPorFecha2(Tramites tramite);

    Tramites getContarTramitesPorFecha3(Tramites tramite);
    //Fin Administrar mis pendientes agrupados

    //Administracion de Reporte
    List getListarCamposProceso(Campos campo);

    List getListarCamposReporte(Campos campo);

    List getListarCamposReporte2(Campos campo);

    String getListarTotalesDatos(Campos campo);
    //Fin Administracion de Reportes

    //Busqueda de tramites
    List getListarTramitesPorCampos(Tramites tramite);

    int getBuscarTramiteExisteUbicacionOrganica(Tramites tramite);

    Tramites getBuscarTramiteUbicacionOrganica(Tramites tramite);

    List getListarTramiteLog(Tramites tramite);

    List getListarTramitesFechaUbicacionOrganica(Tramites tramite);

    List getListarTramitesIniciados(Tramites tramite);

    List getListarTramitesMovidos(Tramites tramite);

    List getListarTramitesConcluidos(Tramites tramite);

    List getListarTramitesIniciadosDetalle(Tramites tramite);

    List getListarTramitesMovidosDetalle(Tramites tramite);

    List getListarTramitesConcluidosDetalle(Tramites tramite);
    //Fin Busqueda de tramites

    //Busqueda ejecutiva
    List getListarDatosTramite(Tramites tramite);
    //Fin Busqueda ejecutiva

    //Bloquear Tramites
    int setBloquearTramite(Tramites tramite);
    //Fin Bloquear Tramites

    //Desbloquear Tramites
    int setDesbloquearTramite(Tramites tramite);
    //Fin Desbloquear Tramites

    //Anular Tramites
    List getListarTramitesAnulados();

    int setAnularTramite(Tramites tramite);
    //Fin Anular Tramites

    //Cambiar Estado Tramites
    int setCambiarEstadoTramite(Tramites tramite);
    //Fin /Cambiar Estado Tramites

    //Administrar noticias
    List getListarNoticias();

    List getListarTiposTableros();

    List getListarTiposAvisos();

    int setRegistrarTablero(Tableros tablero);

    Tableros getBuscarTablero(Tableros tablero);

    int setEliminarTablero(Tableros tablero);
    //Fin Administrar noticias

    //Imprimir planilla
    List getListarTramitesImpresion(Tramites tramite);
    //Fin - Imprimir planilla

    //Redireccionar Tramites
    List getListarTramites(Tramites tramite);

    int setRedireccionarTramite(Tramites tramite);

    List getListarActividades2(Actividades actividad);

    List getListarUsuariosRolActividad(Actividades actividad);
    //Fin Redireccionar Tramites

    //Reingresar Tramites
    Tramites getBuscarTramite2(Tramites tramite);

    int setReingresarTramite(Tramites tramite);
    //Fin Reingresar Tramites

    //Administrar Correspondencias
    Tramites getBuscarTipoProceso2(Tramites tramite);

    Usuarios getBuscarUsuario(Usuarios usuario);

    List getListarUsuariosUbicacionOrganica(Usuarios usuario);

    List getListarTramitesMiosCorrespondenciaDe(Tramites tramite);

    List getListarTramitesMiosCorrespondenciaPara(Tramites tramite);

    int setAvanzarCorrespondencia(Tramites tramite);

    int setInsertarTramiteCopia(Tramites tramite);

    Proveidos getBuscarProveidoCorresp(Proveidos proveido);
    //Fin - Administrar Correspondencias

    //Reporte de campos por actividades
    String getListarCamposActividad(Campos campo);
    //Fin Reporte de campos por actividades

    //Reporte de actividades por roles
    String getListarActividadesRoles(Actividades actividad);
    //Fin Reporte de actividades por roles

    //Administracion de hilos
    List getListarUsuariosHilos(Usuarios usuario);

    List getListarTiposHilos();

    int setRegistrarHilo(Hilos hilo);

    List getListarTiposSegmentos();

    List getListarSegmentos(Hilos hilo);

    List getListarDestinatarios(Hilos hilo);

    int setRegistrarSegmento(Hilos hilo);

    int setRegistrarSgmAdjunto(Hilos hilo);

    List getListarAdjuntosHilos(Hilos hilo);

    Hilos getBuscarHilo(Hilos hilo);

    List getListarHilosMios(Hilos hilo);

    List getListarHilosAMi(Hilos hilo);

    int getNroMensajes(Hilos hilo);

    int getNroMensajesNuevos(Hilos hilo);

    int setBorrarHilo(Hilos hilo);
    //Fin Administracion de hilos

    //Busqueda por fechas Estados
    List getListarEstadosTramites();

    List getListarTramitesEstadoFechaUbicacionOrganica(Tramites tramite);
    //Fin Busqueda por fechas Estados

    //Acls dibRap
    List getListarCamposAcl2(Campos campo);

    int setRegistrarAcl2(Campos campo);

    int setEliminarAcl2(Campos campo);
    //Fin Acls dibRap

    //Limbo
    List getListarActividadesNoLimbo(Actividades actividad);

    List getListarActividadesLimbo(Actividades actividad);

    String getBuscarTablaLimbo(Tramites tramite);

    int setAvanzarTramiteLimbo(Tramites tramite);

    int getBuscarIdCampoLimbo(Tramites tramite);
    //Fin Limbo

    //Usuarios
    int getVerificarUsuario(Usuarios usuario);

    int setRegistrarNuevaClave(Usuarios usuario);
    //Fin Usuarios

    //Habilitar Tramites
    int setHabilitarTramite(Tramites tramite);
    //Fin Habilitar Tramites

    List getListarTramitesPorEstadoFecha(Tramites tramite);

    //administracion de formularios
    int setRegistrarFormulario(Campos campo);

    int setEliminarFormulario(Campos campo);
    //Fin de administracion de formularios

    // TramitesKardex
    List getListarProcesosAccesoKardex();

    List getListarTramitesMiosKardex(Tramites tramite);

    List getListarTramitesMiosKardexPorProceso(Tramites tramite);
    // Administrar Kardex

    List getListarProcesosKardexs();

    int setRegistrarProcesoKardex(Actividades actividad);

    int setModificarProcesoKardex(Actividades actividad);

    int setEliminarProcesoKardex(Actividades actividad);

    Campos getBuscarTipoPermiso(Campos campo);

    int setRegistrarCampoAclProcesoKardex(Campos campo);

    //Para ver kardex siguientes
    List getListarTramitesMiosKardexPorProcesoAtendidos(Tramites tramite);

    Tramites getBuscarMinMaxTramitesMiosKardexPorProceso(Tramites tramite);
    //Fin TramitesKardex

    //Reporte de tramites por funcionarios
    List getListarTramitesFuncionarios(Tramites tramite);

    List getListarTramitesFuncionarioProceso(Tramites tramite);

    List getListarTramitesAtendidos(Tramites tramite);

    Tramites getContarTramitesAtendidos(Tramites tramite);
    //Fin - Reporte de tramites por funcionarios

    String getContarPaginas(Tramites tramite);

    String getContarPaginasDespachados(Tramites tramite);

    String getContarPaginasLimbo(Tramites tramite);

    List getListarTramitesCorrelativo(Tramites tramite);

    //Administrar tramites concluidos
    List getListarTramitesConcluidosPorProceso(Tramites tramite);

    List getListarTramitesConcluidosPorProcesoFiltrado(Tramites tramite);

    String getContarPaginasConcluidos(Tramites tramite);

    String getContarPaginasTramitesGestionProceso(Tramites tramite);
    //Fin - Administrar tramites concluidos

    List getListarCamposReferenciaProceso(Campos campo);

    List getListarCamposReporteProceso(Campos campo);

    //INICIO - Administrar Reportes
    List getListarTuplasCampo(Campos campo);
    //NUEVO - Administrar Reportes

    //Inicio - DIBREP - WAYKA
    List getListarCamposProcesoWK(Dibwayka dibwayka);

    List getListarComboWK(Dibwayka dibwayka);

    int setCrearTablasDibWK(Dibwayka dibwayka);

    List getListarCamposDibWK(Dibwayka dibwayka);

    Dibwayka getBuscarTablaDibWK(Dibwayka dibwayka);

    Dibwayka getBuscarCampoDibWK(Dibwayka dibwayka);

    Dibwayka getBuscarTuplaDibWK(Dibwayka dibwayka);

    int setInsertarConsultaDibWK(Dibwayka dibwayka);

    List getListarCondicionesConsultaDibWK(Dibwayka dibwayka);

    List getListarConsultasDibWK();

    int setBorrarConsultaDibWK(Dibwayka dibwayka);

    int setModificarConsultaDibWK(Dibwayka dibwayka);

    Dibwayka getBuscarConsultaDibWK(Dibwayka dibwayka);

    List getConsultaCondicionDibWK(Dibwayka dibwayka);
    //Fin - DIBREP - WAYKA

    //Inicio MICOIMATA
    //PLANES
    List getPrgListarPlanes(Programas programa);

    List getFclListarPlanes(Facultades facultad);

    List getUnvListarPlanes(Universidades universidad);

    List getPlnListarMateriasNivel(Planes plan);

    int getPlnListarNroNiveles(Planes plan);

    List getPlnListarMateriasRequisitos(Planes plan);

    List getPlnListarMateriasNroRequisitos(Planes plan);

    List getUnvGrdListarPlanes(Planes plan);
    //fin PLANES

    // PROGRAMAS
    Programas getPrgBuscarPrograma(Programas programa);

    List getFclListarProgramas(Facultades facultad);

    List getUnvListarProgramas(Universidades universidad);

    List getUnvListarProgramasPost(Universidades universidad);
    // fin PROGRAMAS

    // DEPARTAMENTOS
    Departamentos getDptBuscarDepartamento(Departamentos departamento);

    List getFclListarDepartamentos(Facultades facultad);

    List getUnvListarDepartamentos(Universidades universidad);
    // fin DEPARTAMENTOS

    // FACULTADES
    Facultades getFclBuscarFacultad(Facultades facultad);

    List getUnvListarFacultades(Universidades universidad);

    List getUnvListarFacultadesPost(Universidades universidad);
    // fin FACULTADES

    // UNIVERSIDADES
    Universidades getUnvBuscarUniversidad(Universidades universidad);
    // fin UNIVERSIDADES

    //Mover notas
    Notas getMtcMoverNoMatriculados(Notas nota);

    Notas getMtcMoverMatriculados(Notas nota);
    //Fin mover notas

    // MATERIAS
    List getPlnListarMaterias(Planes plan);
    // fin MATERIAS

    //EST_PROGRAMACIONES
    List getEstListarEstudiantesNombres(Estudiantes estudiante);

    List getEstListarEstudiantesDip(Estudiantes estudiante);

    List getEstListarEstudiantesNombresAccesos(Estudiantes estudiante);

    List getEstListarEstudiantesDipAccesos(Estudiantes estudiante);

    List getEstListarEstudiantesNombres2(Estudiantes estudiante);

    List getEstListarEstudiantesDip2(Estudiantes estudiante);
    //PERSONAS

    Personas getPrsBuscarPersona(Personas persona);
    //FIN PERSONAS
    //ESTUDIANTE

    Estudiantes getEstBuscarEstudiante(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudiantePrograma(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudianteAccesos(Estudiantes estudiante);
    //FIN ESTUDIANTE

    Programas getPrdBuscarPrgPeriodo(Programas programa);

    List getPrgBuscarDetalles(Programas programa);

    List getEstPrgListarProgramacionMateriasAut(Materias materia);

    List getDptoListarMateriaGrupo(Materias materia);

    Programas getMdlBuscarMateriaAhorro(Programas programa);
    //GRUPOS

    Grupos getGrpBuscarGrupo(Grupos grupo);

    Grupos getDptoBuscarCupoRestanteGrupo(Grupos grupo);
    //FIN GRUPOS

    void setEstProgramacionMateria(Programas programa);
    //POSTULANTES

    Postulantes getPstBuscarPostulante(Postulantes postulante);

    Postulantes getPstBuscarPostulantePrograma(Postulantes postulante);

    List getPstListarPostulantesNombres(Postulantes postulante);

    List getPstListarPostulantesDip(Postulantes postulante);

    List getPstPrgListarProgramacionMateriasAut(Materias materia);

    int setPstProgramacionMateria(Programas programa);
    // inicio JOJO

    Postulantes getMiPrsBuscarPostulante(Postulantes postulante);

    void setPstRegistrarPrograma(Postulantes postulante);
    //TIPOS PROGRAMACIONES

    List getTpsListarProgramaciones();

    Programas getTpsBuscarProgramacion(Programas programa);
    //FIN EST_PROGRAMACIONES 

    //PROGRAMACIONES COMO ESTUDIANTE
    Estudiantes getComprobarEstudiante(Estudiantes estudiante);

    List getMncListarMenciones(Planes plan);

    int setEstRegistrarMencionEstudiante(Planes plan);

    List getEstListarProgramacionMateriasReq(Materias materia);

    int getBuscarNivelMaximoPlanesEst(Programas programa);

    List getZchListarChoqueMaterias(Programas programa);

    List getZchListarChoquePeriodos(Programas programa);

    List setEstListarProgramarMaterias(Programas programa);
    //FIN PROGRAMACIONES  COMO ESTUDIANTE 

    //RETIRO ADICION DE MATERIAS COMO AUTORIDAD
    List getEstListarProgramacionesEstudiante(Programas programa);

    List setEstPrgRetirarProgramacionesMaterias(Programas programa);

    List setEstPrgRegistrarListarCambiarGrupos(Programas programa);
    //FIN RETIRO ADICION DE MATERIAS COMO AUTORIDAD

    //ADMINISRTRAR LIBRETAS
    Asignaciones getDctBuscarAsignacionDocente(Asignaciones asignacion);

    Asignaciones getDctBuscarAsignacionDocentemaslafuncion(Asignaciones asignacion);

    Asignaciones getDctBuscarAsignacionDocenteDesignacion(Asignaciones asignacion);

    List getMtrBuscarMateriaAhorro(Asignaciones asignacion);

    Materias getMtrBuscarMateria(Materias materia);

    Libretas getLbrBuscarFase(Libretas libreta);

    List getGrpListarEvaluacionDefinida(Libretas libreta);

    Libretas getLbrBuscarTipoNota(Libretas libreta);

    List getEstBuscarEstudiantesProgramados(Libretas libreta);

    List getPstBuscarPostulantesProgramados(Libretas libreta);

    List getEstListarNotasEstudiante(Libretas libreta);

    List getEstListarNotasEstudianteLibreta(Libretas libreta);

    List getEstListarNotasEstudiantePermitidoModificar(Libretas libreta);

    List getPstListarNotasPostulante(Libretas libreta);

    int setEstInsertarNotaEstudianteFase(Libretas libreta);

    int setPstInsertarNotaPostulanteFase(Libretas libreta);

    int setDctAvanzarFase(Libretas libreta);

    int setDctAvanzarFaseSemiFinal(Libretas libreta);

    int getEstSumarNotasEstudianteEvalRegular(Libretas libreta);

    int getEstSumarNotasEstudianteEvalContinua(Libretas libreta);

    int getLbrBuscarFaseMinima(Libretas libreta);

    int getLbrBuscarFaseMaxima(Libretas libreta);
    //fin ADMINISTRAR LIBRETAS

    //ADMINISTRAR HORARIOS
    List getListarProgramasAcceso(Usuarios usuario);

    List getMtrListarPlanesPrograma(Programas programa);

    List getListarPlanProgramaModeloAhorro(Modelos_ahorros modelo);

    List getDptoListarGruposMateria(Materias materia);

    Grupos getDptoBuscarGrupo(Grupos grupo);

    List getListarDias();

    List getListarHorario(Horarios horario);

    List getListarAulasDisponibles(Horarios horario);

    void setHrsLimpiarHorarioMateria(Horarios horario);

    int setHrsRegistrarHorarioAula(Horarios horario);

    Planes getMtrBuscarPlanPrograma(Planes plan);
    //FIN ADMINISTRAR HORArIOS

    //DEFINIR EVALUACION
    Docentes getComprobarDocente(Docentes docente);

    Asignaciones getDctBuscarAsignacionDocenteMateria(Asignaciones asignacion);

    List getMtrListarMateriaAhorro(Asignaciones asignacion);

    List getDctListarAsignacionDocente(Asignaciones asignacion);

    Libretas getLbrBuscarTipoNotaDefinida(Libretas libreta);

    int setGrpModificarEvaluacion(Libretas libreta);

    int setGrpInsertarEvaluacion(Libretas libreta);

    int setGrpRegistrarEvaluacion(Libretas libreta);

    int setGrpEliminarEvaluacion(Libretas libreta);

    List getLbrListarTiposNotas(Libretas libreta);

    List getLbrListarTiposNotasDefinidas(Libretas libreta);
    // FIN DEFINIR EVALUACION

    //CERRAR LIBRETA
    List getListarMateriasCerrarLibreta(Libretas libreta);

    int setCerrarLibreta(Libretas libreta);
    //Fin CERRAR LIBRETA  

    //Administrar tableros/noticias
    List getListarNoticiasRol(Tableros tablero);

    List getListarRolesNoticias();
    //Fin Administrar tableros/noticias 

    //Cambio Pin Docente
    int setCambioPinDocente(Docentes docente);
    //FIN Cambio Pin Docente

    //Cambio Pin Estudiante
    Estudiantes getMtrBuscarMatricula(Estudiantes estudiante);

    Estudiantes getMtrBuscarMatriculaNuevo(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudianteTipoGrado(Estudiantes estudiante);

    int setMtrModificarPinEstudiante(Estudiantes estudiante);

//Mostrar Ingreso UAB
    Estudiantes getListarIngresoUAB(Estudiantes estudiante);

    //Administrar Tipos Notas
    List getTpsListarTiposEvaluaciones();
    //Administrar Tipos estados

    List getTpsListarTiposEstados();

    Libretas getTpsBuscarTipoEvaluacion(Libretas libreta);

    List getLbrListarFases(Libretas libreta);

    List getLbrListarFases2(Libretas libreta);

    List getLbrListarTiposNotasFase(Libretas libreta);

    List getStdListarEstadosTabla(Enlaces enlace);

    int setLbrInsertarTipoNota(Libretas libreta);

    int setLbrModificarTipoNota(Libretas libreta);
    //Fin Administrar Tipos Notas

    //MI SEGUNDA PARTE
    // Listar - JOJO
    List getMiListarPostulantesDip(Postulantes postulante);

    List getMiListarPostulantesNombre(Postulantes postulante);
    // Listar - JOJO
    //Registrar Postulante

    int setMiRegistrarPstPersona(Postulantes postulante);

    int setMiRegistrarPostulante(Postulantes postulante);

    int setMiRegistrarPostulanteC(Postulantes postulante);

    int setPstRegistrarDocumentos(Postulantes postulante);

    List getListarTiposDocumentos();
    //Fin Registrar Postulante
    // LISTAR TIPOS

    List getListarTiposAdmisiones();

    List getListarTiposAdmisionesPost();

    List getListarTiposAdmisionesPrograma(Programas programa);

    List getListarTiposAdmisionesProgramaLiberacion(Programas programa);

    List getListarTiposGrados();

    Planes getBuscarTiposGrados(Planes plan);

    List getListarPrgPlanesActual(Planes plan);

    List getListarTiposDocumentosClasificacionVigente(Postulantes postulante);

    List getListarTiposClasificaciones();

    List getListarTiposClasificacionesPost();
    //  FIN LISTAR TIPOS

    Postulantes getPstBuscarPersona(Postulantes postulante);
    //Programacion automatica

    Materias getDptoListarMateriaGrupoMinimo(Materias materia);

    int setPstRegistrarMatricula(Postulantes postulante);

    List getListarPstMateriasProgramadas(Postulantes postulante);

    Postulantes getPstBuscarPostulanteNombres(Postulantes postulante);

    Postulantes getPstBuscarPostulanteNombresSede(Postulantes postulante);

    Postulantes getPstBuscarMatriculaPostulante(Postulantes postulante);
    // inicio - CAJAS

    Perfiles getPrfBuscarPerfil(Perfiles perfil);

    List getPstListarPerfiles(Perfiles perfil);

    List getPstListarPerfilesEntidad(Perfiles perfil);

    List getPrfListarConceptos(Perfiles perfil);

    List getPstListarConceptos(Perfiles perfil);

    List getEstListarConceptos(Perfiles perfil);

    List getDctListarConceptos(Perfiles perfil);

    List getUsrListarConceptos(Perfiles perfil);

    int setPstRegistrarTransaccion(Perfiles perfil);

    Perfiles getPrcBuscarPerfil(Perfiles perfil);

    int setRegistrarTrnDetalle(Perfiles perfil);

    Perfiles getTrnBuscarTransaccion(Perfiles perfil);

    Perfiles getTrnBuscarTransaccionRecibo(Perfiles perfil);

    Perfiles getTrnBuscarTransaccionReciboSede(Perfiles perfil);

    List getTrnListarTrnDetalles(Perfiles perfil);

    List getPrsListarConceptos(Perfiles perfil);

    int setPrsRegistrarTransaccion(Perfiles perfil);

    List getTrnListarTiposDescuentos();

    Perfiles getTrnBuscarTipoDescuento(Perfiles perfil);

    Perfiles getBuscarPerfilConcepto(Perfiles perfil);

    List getTrnListarCajeros(Perfiles perfil);

    List getTrnListarCajerosProv(Perfiles perfil);

    List getTrnPrcListarPerfiles(Perfiles perfil);

    List getTrnListarTransacciones(Perfiles perfil);

    //aqui se agrego
    List getRepCajasTransaccionesDiarias(Perfiles perfil);

    List getRepCajasTransaccionesDiariasGlobal(Perfiles perfil);
    //inicio/

    List getRepCajasTransaccionesDiariasGlobalProv(Perfiles perfil);
    //fin

    List getRepCajasTransaccionesDiariasGlobalxcajero(Perfiles perfil);

    List getRepCajasTransaccionesDiariasGlobalxcajeroProv(Perfiles perfil);

    List getRepCajasTransaccionesDiariasEntidades(Perfiles perfil);

    List getRepCajasResumenTesoroEntidades(Perfiles perfil);

    List getRepCajasResumenInstitucionalEntidades(Perfiles perfil);

    List getRepCajasResumenInstitucionalEntidadesConcepto(Perfiles perfil);

    List getRepCajasResumenEstudiantilEntidades(Perfiles perfil);

    List getRepCajasResumenEstudiantilEntidadesConcepto(Perfiles perfil);

    List getRepCajasResumenProfactulativoEntidades(Perfiles perfil);

    List getRepCajasResumenProfactulativoCarrera(Perfiles perfil);

    List getRepCajasDetalladoEntidades(Perfiles perfil);

    List getRepCajasDetalladoCarrera(Perfiles perfil);

    List getRepCajasTransaccionesDetalleGlobal(Perfiles perfil);

    List getRepCajasTransaccionesDetalleGlobalProv(Perfiles perfil);

    List getRepCajasTransaccionesDetalleGlobalAnuladas(Perfiles perfil);

    List getRepCajasTransaccionesDetalleGlobalAnuladasProv(Perfiles perfil);

    List getRepCajasTransaccionesDetalleEntidad(Perfiles perfil);

    List getRepCajasTransaccionesDetalle(Perfiles perfil);

    List getRepCajasTransaccionesDetalleAnuladas(Perfiles perfil);

    List getRepCajasResumenMatriculas(Perfiles perfil);

    List getRepCajasResumenTesoroCarrera(Perfiles perfil);

    List getRepCajasResumenMatriculasGlobal(Perfiles perfil);
    //Nro_2

    List getRepCajasResumenMatriculasGlobalProv(Perfiles perfil);

    List getRepCajasResumenInstitucional(Perfiles perfil);

    List getRepCajasResumenInstitucionalGlobal(Perfiles perfil);
    //Nro_3

    List getRepCajasResumenInstitucionalGlobalProv(Perfiles perfil);

    List getRepCajasResumenEstudiantil(Perfiles perfil);

    List getRepCajasResumenEstudiantilGlobal(Perfiles perfil);
    //Nro_4

    List getRepCajasResumenEstudiantilGlobalProv(Perfiles perfil);

    List getRepCajasResumenProfacultativo(Perfiles perfil);

    List getRepCajasResumenProfacultativoGlobal(Perfiles perfil);
    //Nro_5

    List getRepCajasResumenProfacultativoGlobalProv(Perfiles perfil);

    List getRepCajasResumenDetalladoMatriculas(Perfiles perfil);

    List getRepCajasResumenDetalladoMatriculasGlobal(Perfiles perfil);

    List getRepCajasResumenDetalladoMatriculasGlobalProv(Perfiles perfil);

    List getRepCajasResumenDetalladoEstudiantil(Perfiles perfil);

    List getRepCajasResumenDetalladoEstudiantilGlobal(Perfiles perfil);

    List getRepCajasResumenDetalladoEstudiantilGlobalProv(Perfiles perfil);

    List getRepCajasResumenDetalladoInstitucional(Perfiles perfil);

    List getRepCajasResumenDetalladoInstitucionalGlobal(Perfiles perfil);

    List getRepCajasResumenDetalladoInstitucionalGlobalProv(Perfiles perfil);

    List getRepCajasResumenDetallado(Perfiles perfil);

    List getRepCajasResumenDetalladoGlobal(Perfiles perfil);

    List getRepCajasResumenDetalladoGlobalMatricula(Perfiles perfil);

    List getRepCajasResumenDetalladoGlobalProv(Perfiles perfil);

    List getRepCajasTransaccionesPorPrograma(Perfiles perfil);

    List getRepCajasResumenDetalladoEntidades(Perfiles perfil);
//  List getRepCajasGlobalGeneral(Perfiles perfil);

    //hasta aqui
    List getTrnListarTransaccionesRecibo(Perfiles perfil);

    List getTrnListarTransaccionesReciboSede(Perfiles perfil);

    List getTrnListarTrnDetalles2(Perfiles perfil);

    //Cursos Verano
    List getTrnListarMateriasVerano(Estudiantes estudiante);

    List getTrnListarEvaluacionesVerano();
    // inicio JOJO

    List getTrnBuscarPorNroRecibo(Perfiles perfil);

    List getTrnBuscarPorNroReciboSede(Perfiles perfil);

    void setTrnBorrarDetalle(Perfiles perfil);

    void setTrnBorrarTransaccion(Perfiles perfil);
    // fin - CAJAS

    //Docentes
    List getBuscarListaDocentesNombres(Docentes docente);

    List getBuscarListaDocentesDip(Docentes docente);

    List getListarTiposDocentes();

    List getListarTiposAsignaciones();

    List getListarTiposFunciones();

    int setRegistrarAsignacionDocente(Asignaciones asignacion);
    // Para sacar el numero del siguiente memo

    int getTrnBuscarSiguienteNroMemo(Asignaciones asignacion);

    int getTrnBuscaridMemo(Asignaciones asignacion);
    //Fin para sacar el numero del siguiente memo

    int setRegistrarAsignacionDocentefac(Asignaciones asignacion);

    int setRegistrarMemo(Asignaciones asignacion);

    int setRegistrarFaseResolucion(Asignaciones asignacion);

    int setRegistrarFaseResolucionfac(Asignaciones asignacion);

    int setRegistrarFaseResolucionuni(Asignaciones asignacion);

    int setmostrarplan(Asignaciones asignacion);

    int setRegistrarRetrocederFaseResolucion(Asignaciones asignacion);

    Asignaciones getDctVerificarAsignacionDocenteGestion(Asignaciones asignacion);
    //Fin Docentes  

    List getMiListarPstNombreGestionPeriodo(Postulantes postulante);

    List getMiListarPstDipGestionPeriodo(Postulantes postulante);

    List getMiListarPstAprobadoNombreGestionPeriodo(Postulantes postulante);

    List getMiListarPstAprobadoDipGestionPeriodo(Postulantes postulante);
    //Personas 

    List getListarPaises();

    List getListarDepartamentos(Personas persona);

    List getListarProvincias(Personas persona);

    List getListarLocalidades(Personas persona);

    List getListarLocalidadesTodas();

    List getListarTiposSexos();

    List getListarTiposEstadosCiviles();

    List getListarTiposEmpresasTelef();

    List getListarTiposEstudiantes();

    Personas getBuscarTipoEstudiante(Personas persona);

    List getListarTiposGraduaciones();

    List getListarTiposInstituciones();

    List getListarColegiosTipoIns(Personas persona);

    List getListarTiposTurnos();

    List getListarTiposProblemasRol(Personas persona);

    int setRegistrarPersona(Personas persona);

    int setRegistrarPrsColegio(Personas persona);

    int setRegistrarPrsClasificacion(Personas persona);

    int setRegistrarPrsDocumentos(Personas persona);

    int setRegistrarPrsCompromisos(Personas persona);

    List getListarPrsDocumentosPersona(Personas persona);

    Personas getBuscarTipoClasificacionPersona(Personas persona);

    List getListarTiposCompromisos();

    Personas getBuscarPersonaColegio(Personas persona);
    //Fin Persona
    //Estudiante

    int setRegistrarEstudiante(Estudiantes estudiante);

    int setModificarEstudiante(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudiantePrs(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudiantePrsSede(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudiantePrsPos(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudiantePrsPre(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudiantePrsPreSede(Estudiantes estudiante);

    int setPstModificarEstadoPostulante(Postulantes postulante);

    int setRegistrarMatriculaEstudiante(Estudiantes estudiante);

    Estudiantes getBuscarMatriculaEstPrs(Estudiantes estudiante);

    Estudiantes getMiPrsBuscarEstudiante(Estudiantes estudiante);
    //fin EStudiante

    // CURRICULUM
    List cvGetListarRubrosPersona(Curriculum curriculum);

    List cvGetListarRubros(Curriculum curriculum);

    List cvGetListarSubRubros(Curriculum curriculum);

    int cvSetRegistrarCurriculum(Curriculum curriculum);

    int setRegistrarDctAdjuntos(Curriculum curriculum);

    List getListarAdjuntosDocente(Curriculum curriculum);

    int setEliminarDctAdjunto(Curriculum curriculum);
    // FIN CURRICULUM

    Docentes getBuscarDocente(Docentes docente);

    Docentes getBuscarDocentexdepartamento(Docentes docente);
    // FIN MI SEGUNDA PARTE

    // INICIO - Ver ficha academica
    Estudiantes getEstBuscarEstudianteNombres(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudianteNombresSede(Estudiantes estudiante);

    List getEstListarFichaAcademica(Estudiantes estudiante);

    List getEstListarFichaAcademicaModificar(Estudiantes estudiante);

    List getEstListarFichaAcademicaConvalidada(Estudiantes estudiante);

    List getEstListarFichaAcademicaConvalidada2(Estudiantes estudiante);

    List getEstListarFichaAcademicaAprobadas(Estudiantes estudiante);
    // FIN - Ver ficha academica

    // INICIO - Ver programacion
    List getEstListarProgramacion(Estudiantes estudiante);

    List getEstListarProgramacioncv(Estudiantes estudiante);
    // FIN - Ver programacion

    // INICIO - Cambio de plan de estudios
    int setEstRegistrarCambioPlan(Planes plan);
    // FIN - Cambio de plan de estudios

    // INICIO - Convalidacion Automatica
    List getListarMateriasPlanGrupo(Planes plan);

    List getListarMateriasPlanGrupoCantidad(Planes plan);

    List getListarMateriasPlan(Planes plan);

    List getListarMateriasPlanAnterior(Planes plan);

    List getListarMateriasPlanAnterior2(Planes plan);

    List getListarMateriasPlanConvalidado(Planes plan);

    int setRegistrarMtrPlan(Planes plan);

    int setEliminarMtrPlan(Planes plan);

    Planes getMncBuscarMencion(Planes plan);

    Planes getBuscarMateriaPlan(Planes plan);
    // FIN - Convalidacion Automatica

    // INICIO - Materias no aprobadas
    List getEstListarMateriasNoAprobadas(Estudiantes estudiante);
    // FIN - Materias no aprobadas

    //Caja tipos
    List getTrnListarTiposPerfiles();

    List getTrnMiListarPerfilesProceso(Perfiles perfil);

    Perfiles getTrnBuscarPerfilProceso(Perfiles perfil);

    int getTrnPerfilTieneDescuento(Perfiles perfil);
    //Fin Caja tipos

    // INICIO - Perfiles materias
    List getTrnListarPerfilesMaterias(Planes plan);

    Perfiles getTrnBuscarPerfilMateria(Perfiles perfil);

    List getTrnListarPerfiles();

    Perfiles getTrnBuscarPerfil(Perfiles perfil);

    int setTrnRegistrarPerfilMateria(Planes plan);
    // FIN - Perfiles materias

    //Mi matricula antiguo
    List getMtrListarMatriculasEstudiante(Estudiantes estudiante);
    //Fin Mi matricula antiguo

    //INICIO- Admin Planes de Estudio
    List getListarMateriasPlanRequisitos(Planes plan);

    List getListarMateriasElectivasPlan(Planes plan);

    List getListarMateriasPlanMencion(Planes plan);

    List getListarMateriasRequisitos(Planes plan);

    List getListarMateriasNoRequisitos(Planes plan);

    List getListarMateriasConvalidadas(Planes plan);

    List getListarMateriasNoConvalidadas(Planes plan);

    List getListarMateriasNoPlan(Planes plan);

    List getPlnListarTiposMaterias();

    Planes getPlnBuscarTipoMateria(Planes plan);

    Planes getBuscarPrgPlan(Planes plan);

    Planes getBuscarPrgPlan2(Planes plan);

    Planes getBuscarMtrPlan(Planes plan);

    int setModificarMtrPlan(Planes plan);
    //FIN - Admin Planes de Estudio
    //Cambiar estado estudiante

    int setRegistrarCambiarEstadoEstudiante(Estudiantes estudiante);

    int setRegistrarCambiarEstadoMatricula(Estudiantes estudiante);
    //Fin Cambiar estado estudiante
    //Pst Personas

    List getPstListarPersonasNombre(Postulantes postulante);

    List getPstListarPersonasDip(Postulantes postulante);

    int setPstModificarAsistenciaPostulante(Postulantes postulante);

    List getMiListarPstProgramaGestionPeriodo(Postulantes postulante);

    List getMiListarPstProgramaGestionPeriodoSede(Postulantes postulante);

    List getMiListarPstPsaGestionPeriodo(Postulantes postulante);

    List getRepAsistenciapostulantepsa(Postulantes postulante);

    List getRepAsistenciapostulantepsaci(Postulantes postulante);

    List getDctListarPostulantespsasoloid(Postulantes postulante);

    List getNroPostulantesPsa(Postulantes postulante);
    //Fin Pst Personas
    //Personas

    List getPrsListarPersonasDip(Personas persona);
    //Items Persona

    List getListarItemsPersonasDip(Personas persona);

    Personas getBuscarItemPersona(Personas persona);

    Personas getBuscarItemsUsuario(Personas persona);
    //Adjunto Estudiante

    int setRegistrarEstAdjuntos(Estudiantes estudiante);

    List getListarAdjuntosEstudiante(Estudiantes estudiante);

    int setEliminarEstAdjunto(Estudiantes estudiante);
    //Fin Adjnto Estudiante

    List getMiListarPostulantesPorPersona(Postulantes postulante);

    int setRegistrarPstPrsColegio(Postulantes postulante);

    Postulantes getBuscarPstPersonaColegio(Postulantes postulante);

    List getListarPrgPlanesVestibulares();

    List getListarPrgPlanesUniversitarios();

    Planes getBuscarMaxPrgPlanActual(Planes plan);
    //reporte libretas

    List getListarNotasFaseEstudiantes(Libretas libreta);
    //FIN reporte libretas 
    // reporte resumen de notas

    List getListarDocentesProgramados(Asignaciones asignacion);

    List getListarResumenNotasEstudiantes(Libretas libreta);
    //FIN reporte resumen de notas

    //Reporte Acta de calificaciones
    List getListarActaCalificaciones(Notas nota);
    //fin Reporte Acta de calificaciones

    //Fin MICOIMATA
    //CERRAR LIBRETA POR MATERIA
    List getListarMateriasCerrarLibretaIndiv(Libretas libreta);

    int setCerrarLibretaPorMateria(Libretas libreta);
    //Fin CERRAR LIBRETA  POR MATERIA

    //Inicio Estadistica
    List getListarNroEstudiantesMatriculados(Estudiantes estudiante);

    List getListarNroEstudiantesMatriculadosporPrograma(Estudiantes estudiante);

    List getListarNroEstMatriculadosSexosNacionalidades(Estudiantes estudiante);

    List getListarNroEstMatriculadosTipoEstudiante(Estudiantes estudiante);

    List getListarNroEstMatriculadosTipoAdmision(Estudiantes estudiante);

    List getListarNroEstMatriculadosSexos(Estudiantes estudiante);

    List getListarNroEstMatriculadosNacionalidad(Estudiantes estudiante);

    List getListarGradosProgramas(Programas programa);

    List getListarNroEstProgramadosMaterias(Estudiantes estudiante);

    List getListarNroEstProgramadosSexosNacionalidades(Estudiantes estudiante);

    List getListarNroPostProgramadosMaterias(Estudiantes estudiante);

    List getListarNroEstProgAprReprAbaMaterias(Estudiantes estudiante);

    List getListarNroEstAproPreU(Estudiantes estudiante);

    List getListarNroEstAproAdmiEsp(Estudiantes estudiante);

    List getListarNroEstAproPreUSexosNacionalidad(Estudiantes estudiante);

    List getListarNroEstAproAdEspSexosNacionalidad(Estudiantes estudiante);

    List getListarMateriasGradoPlanPrograma(Materias materia);
    //Fin Estadistica

    //Inicio Reportes Academicos 
    //Reporte certificado de calificaciones
    List getListarCerticadoCalificaciones(Libretas libreta);
    //fin Reporte certificado de calificaciones

    //buscar programa de estudiante
    Programas getPrgBuscarProgramaEstudiante(Programas programa);
    //fin Buscar programa de estudiante

    //listar datos detalle de programacion
    List getEstListarDetalleProgramacion(Estudiantes estudiante);
    //fin listar datos detalle de programacion

    //INICIO - listar estudiantes por Grupos
    List getEstListarEstudiantesPorGrupos(Estudiantes estudiante);
    //FIN - listar estudiantes por Grupos

    //listar detalle de materia notas contnua
    List getEstListarNotasEvaluacionContinua(Libretas libreta);
    //fin listar detalle de materia notas contnua

    //listar evaluacion continua estudiantes
    List getListarEstudiantesEvaluacionContinua(Libretas libreta);
    //fin listar evaluacion continua estudiantes

    //listar fases tipos notas de la definicion de evaluacion
    List getLbrTiposnotasListarDefinicion(Libretas libreta);
    //fin listar fases tipos notas de la definicion de evaluacion           
    //Fin Reportes Academicos 

    //Retroceder Fase
    // Modificar fase del docente asignaciones
    int setModificarFaseDocente(Libretas libreta);

    int setModificarFaseDocenteCerrarLibreta(Libretas libreta);
    // Fin modificar fase del docente asignaciones

    // Eliminar fase calculado
    int setEliminarFaseEstLibretas(Libretas libreta);
    // Fin eliminar fase calculado
    //Fin Retroceder Fase

    //Bloquear estudiantes todos
    int setBloquearEstudiantesTodos(Estudiantes estudiante);
    //Fin Bloquear estudiantes todos

    //Modificar Tipo Estudiante
    int setModificarTipoEstudiante(Estudiantes estudiante);
    //Fin Modificar Tipo Estudiante  
    //Listar PrsCompromisos

    List getListarPrsCompromisosPersona(Personas persona);

    List getListarPrsDocumentosClasificacion(Personas persona);

    int getBuscarPrsDocumentacionCompleta(Personas persona);

    int getBuscarPrsDocumentacionCompletaEstudiante(Estudiantes persona);
    //Fin Listar PrsCompromisos 

    // COMPROMISOS
    List getMiEstListarCompromisos(Estudiantes estudiante);

    Personas getMiBuscarCompromiso(Personas persona);

    int getMiPrsNroCompromisos(Personas persona);

    int getMiEstListarCompromisosCant(Estudiantes estudiante);
    // fin - COMPROMISOS

    //est_programacion
    int setRegistrarEstProgramacionTipo(Estudiantes estudiante);
    //fin est_programacion

    //dct_asignacion por programa
    List getDctListarAsignacionDocenteProgramaPlan(Asignaciones asignacion);

    //prg_grados_Academicos
    Libretas getBuscarGradoAcademicoPrograma(Libretas libreta);
    //PRECIERRE

    List getListarActaCalificacionesPreCierre(Notas nota);
    //Fin PreCierre

    //INICIO - Buscar docentes
    List getListarAsignacionDocenteTodas(Asignaciones asignacion);
    //FIN - Buscar docentes

    //Por Fase
    List getListarActaCalificacionesPorFase(Notas nota);
    //Fin Por fase

    List getEstListarProgramasEstudiante(Estudiantes estudiante);

    List getEstListarMatriculadosPorPrograma(Estudiantes estudiante);

    List getEstListarMatriculadosPorProgramaTipoAdmision(Estudiantes estudiante);

    //Buscar est_programacion
    Estudiantes getMiBuscarEstProgramacion(Estudiantes estudiante);
    //Listar Plan por tipo_grado

    List getListarMateriasPlanTipoGrado(Planes plan);

    //Estadistica Postulantes
    List getNroPstInscritosHabilitados(Postulantes postulante);

    List getNroPstInscritosHabilitadosTipoAdmision(Postulantes postulante);
    //Fin Estadistica Postulantes
    //Registrar programa anterior postulante

    int setPstRegistrarProgramaAnterior(Postulantes postulante);

    //INICIO - Rectificacion de notas
    List getListarNotasRectificar(Notas nota);

    Notas getBuscarNota(Notas nota);

    int setRegistrarRectificacion(Notas nota);

    int setRegistrarRectificacionNota(Notas nota);
    //FIN - Rectificacion de notas

    Notas getEstListarFichaAcademicaBuscar(Notas nota);

    Notas getEstListarFichaAcademicaBuscarBuscarAnulada(Notas nota);
    //  inicio - GRUPOS jojo

    List getPrgListarGrupos(Grupos grupo);

    List getMtrListarGruposNoAsignados(Grupos grupo);

    List getMtrListarGruposNoAsignadosCompletos(Grupos grupo);

    Grupos getMiDptoBuscarGrupo(Grupos grupo);
    //  inicio - GRUPOS jojo

    // Inicio dct_asignaciones
    //dct_asignacion por programa_platipogrado
    List getDctListarAsignacionDocenteProgramaPlanTipoGrado(Asignaciones asignacion);
    //dct_asignacion plan grupos

    List getDptoListarGruposMateriaTipoEvaluacion(Materias materia);

    List getDptoListarGruposMateriaTipoEvaluacionDesignado(Materias materia);
    //Listar Docentes Todos

    List getListarDocentesTodos();
    //Fin dct_asignacion

    //Listar TiposNotas
    List getListarTiposNotas();

    //Buscar lbr Fase
    Libretas getBuscarLbrFase(Libretas libreta);

    Libretas getBuscarLbrTipoNota(Libretas libreta);

    int setLbrRegistrarTipoNota(Libretas libreta);

    int setLbrEliminarTipoNota(Libretas libreta);

    //Cerrar Libreta por Dct Asignacion
    List getListarMateriasCerrarLibretaDctAsignacion(Materias materia);
    //Listar Estudiantes cerrar libreta

    List getListarEstudiantesParaCierreLibreta(Libretas libreta);

    List getListarEstudiantesEnEstLibretas(Libretas libreta);

    //INICIO - Impresion de Certificado de Notas
    List getListarCertificadoNotasTodas(Estudiantes estudiante);

    List getListarCertificadoNotasNivel(Estudiantes estudiante);

    List getListarCertificadoNotasAprobadas(Estudiantes estudiante);
    //FIN - Impresion de Certificado de Notas

    //INICIO - Impresion de Certificado de Notas
    List getListarCertificadoNotasTodas2(Estudiantes estudiante);

    List getListarCertificadoNotasAprobadas2(Estudiantes estudiante);

    List getListarCertificadoNotasTodas3(Estudiantes estudiante);

    List getListarCertificadoNotasAprobadas3(Estudiantes estudiante);

    List getListarHistorialAcademico(Estudiantes estudiante);
    //FIN - Impresion de Certificado de Notas

    List getListarEvaluacionesFinalesFase(Libretas libreta);

    List getTotalAprobadosReprobadosMateria(Libretas libreta);

    //Listar notas_ponderadas estudiantes de est_libretas
    List getListarNotasEstudiantesLibretas(Libretas libreta);

    List getListarCalificacionCalendario(Libretas libreta);

    List getListarCalificacionCalendarioDocente(Libretas libreta);
    //Eliminar Asignacion DocenteMateria

    int setEliminarAsignacionDocenteMateria(Asignaciones asignacion);

    int setBuscar_id_fase_resolucion(Asignaciones asignacion);

    int setBuscar_id_fase_resolucionFinal(Asignaciones asignacion);

    List getEstListarMatriculadosPorProgramaTipoEstudiante(Estudiantes estudiante);

    //Listado de Postulantes Inscritos
    List getPstListarInscritosPorProgramaTipoAdmision(Postulantes postulantes);

    // Listado de Postulantes Aprobados
    List getPstListarAprobadosPorProgramaTipoAdmision(Postulantes postulante);

    // Listado de Postulantes Reprobados
    List getPstListarReprobadosPorProgramaTipoAdmision(Postulantes postulante);

    //Admin Materias
    List getListarMateriasPorDepartamento(Materias materia);

    List getListarMateriasPorSigla(Materias materia);

    List getListarMateriasPorMateria(Materias materia);

    Materias getMtrBuscarTipoMateria(Materias materia);

    List getMtrListarTiposMaterias();

    int setRegistrarMateria(Materias materia);

    int setEliminarMateria(Materias materia);

    int getBuscar_nro_excepcion_calendario(Materias materia);
    //Buscar Tipo Admision

    Estudiantes getBuscarTipoAdmision(Estudiantes estudiante);
    //est_clasificaciones

    Estudiantes getBuscarTipoClasificacionEstudiante(Estudiantes estudiante);

    int setRegistrarEstClasificacion(Estudiantes estudiante);

    List getMiListarPostulantesDipTipoAdm(Postulantes postulante);

    List getMiListarPostulantesNombreTipoAdm(Postulantes postulante);

    //Regularizar bloqueos est_regularizaciones
    Estudiantes getMiBuscarUltimoEstRegularizacion(Estudiantes estudiante);

    Estudiantes getMiBuscarEstRegularizacion(Estudiantes estudiante);

    List getMiListarRegularizacionesEstudiante(Estudiantes estudiante);

    List getEstListarEstudiantesPorMateria(Estudiantes estudiante);

    int setRegistrarEstRegularizacionBloqueoEst(Estudiantes estudiante);

    int setModificarRegularizar(Estudiantes estudiante);

    List getMiListarTiposRegularizaciones();
    //fin Est_regularizaciones

    Menciones getEstBuscarMencion(Estudiantes estudiante);

    //INICIO - Historial Academico
    List getListarPlanMateriasNotas(Estudiantes estudiante);

    List getListarPlanMateriasNotas2(Estudiantes estudiante);

    List getListarPlanMateriasNotas3(Estudiantes estudiante);

    double getBuscarPromedioDeNotas(Notas nota);

    int getCantidadMateriasAprobadas(Estudiantes estudiante);
    //FIN - Historial Academico

    //INICIO AdministrarDocente
    int setRegistrarDocente(Docentes docente);

    int setEliminarDocente(Docentes docente);

    List getListarPersonas(Personas persona);
    //FIN - Administrar Docente

    //INICIO - Administrar calendarios
    List getListarCalendarios(Calendarios calendario);
    //FIN - Administrar calendarios

    //Convalidacion Manual
    List getListarTiposConvalidaciones();

    Planes getBuscarTipoConvalidacion(Planes plan);

    List getUnvListarUniversidades();

    int setRegistrarConvalidacionManual(Planes plan);

    int setRegistrarDetallesConvalidacionManual(Planes plan);
    //Fin Convalidacion Manual
    //Autorizar Convalidacion Manual

    List getListarConvalidacionManualPrograma(Planes plan);

    List getListarConvalidacionManualPrograma2(Planes plan);

    Planes getBuscarConvalidacionManual(Planes plan);

    List getListarCnvDetallesConvalidacion(Planes plan);

    List getListarCnvDetallesConvalidacion2(Planes plan);

    List getListarNotasCruceCnvDetalles(Planes plan);

    int setRegistrarEstNotasConvalidacionManual(Planes plan);

    int setEliminarCnvDetalle(Planes plan);
    //Fin Autorizar Convalidacion Manual

    //Inicio-Estudiantes Deudas
    List getListarDeudasEstudiante(Estudiantes estudiante);

    Estudiantes getMiBuscarEstDeuda(Estudiantes estudiante);

    Estudiantes getBuscarUltimaEstDeuda(Estudiantes estudiante);

    int setRegistrarEstDeuda(Estudiantes estudiante);

    int setModificarEstDeuda(Estudiantes estudiante);

    List getMiListarTiposDeudas();
    //Fin-Estudiantes Deudas

    int getTrnBuscarSiguienteNroRecibo(Perfiles perfil);

    void setTrnActualizarNroRecibo(Perfiles perfil);

    //Admin. Usuarios
    Personas getBuscarPersona(Personas persona);

    List getListarUsuarios(Usuarios usuario);

    int setRegistrarUsuario(Usuarios usuario);

    int setEliminarUsuario(Usuarios usuario);
    //Fin Admin. Usuarios

    //Cambio PIN General Docentes
    int setModificarApodoClaveDocente(Docentes docente);
    //Cambio PIN General Estudiante

    int setMtrModificarApodoClaveEstudiante(Estudiantes estudiante);

    int setRegistrarApodoClaveMatricula(Estudiantes estudiante);
    //Fin Cambio PIN General Estudiante
    //Buscar Tipo Nota

    Libretas getMiBuscarTipoNota(Libretas libreta);

//INICIO - METODOS ADICIONADOS POR LA UAP
    //Listado de Estudiantes Con Descuentos
    List getEstListarPorProgramaTipoDescuento(Estudiantes estudiante);

    // Listado de Asingacion Docentes
    List getDctListarAsignacionDocenteMateria(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriaFuncion(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriaFuncionxid(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriaFuncionsintitular(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriaFuncionsintitularfinal(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriaFuncionsoloid(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriaFuncionparamemo(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriacontador(Asignaciones asignacion);

    List getDctListarAsignacionDocenteMateriatc(Asignaciones asignacion);

    List getDctListarNroAsignacionDocenteMateriaFuncionxid(Asignaciones asignacion);
    // Listado de Asingacion Auxiliares

    List getDctListarAsignacionAuxiliarMateria(Asignaciones asignacion);

    // Listado de Estudiante Con Prorroga
    List getListarEstConProrroga(Estudiantes estudiante);

    // Listado de Estudiante Con rendimiento Academico
    List getRendimientoAcademico(Estudiantes promedio);

    Estudiantes getDesignacionBecaTrabajo(Estudiantes becario);

    public Personas getEstBuscarEstudianteDocente(Personas persona);

    // Listado de Becarios 
    List getListarEstBecasTrabajo(Estudiantes estudiante);

    // Listado de Becarios por Unidad Funcional
    List getListarEstBecasTrabajoFuncional(Estudiantes estudiante);

    // Listado de Estudiantes por Nivel Academico
    List getListarNiveles(Estudiantes estudiante);

    // Insertar Pst_personas para tramites
    int setMiRegistrarPstPersonaTrn(Postulantes postulante);

    // Listado de Asignacion Docente por Dpto.
    List getListarDocentesPorDpto(Docentes docente);

    // Listado de Claves de Estudiantes por Programas
    List getListarClavesEstPorPrograma(Estudiantes estudiante);

    // Listado de Curso de Preparatoria de Ingles Estudiantes
    List getListarCursoPreIngles(Estudiantes estudiante);

    // Listado de Curso de Preparatoria de Ingles Otros
    List getListarCursoPreInglesOtros(Personas persona);

    //2008-06-20
    //aux_asignacion
    List getDptoListarGruposMateriaTipoEvaluacionAuxiliares(Materias materia);

    List getListarAuxiliaresTodos();

    int setRegistrarAsignacionAuxiliar(Asignaciones asignacion);

    int setRegistrarasignacion(Postulantes postulante);

    Asignaciones getDctBuscarAsignacionAuxiliar(Asignaciones asignacion);

    Docentes getBuscarAuxiliar(Docentes docente);

    int setEliminarAsignacionAuxiliarMateria(Asignaciones asignacion);

    Estudiantes getEstBuscarEstudianteNombresMatriculados(Estudiantes estudiante);

    Estudiantes getEstBuscarEstudianteAdmitidoAuxiliar(Estudiantes estudiante);

    int setRegistrarAdmisionEstudianteAuxiliar(Estudiantes estudiante);

    int setEliminarAdmisionEstudianteAuxiliar(Estudiantes estudiante);

    List getBuscarEstudianteAuxiliar(Estudiantes estudiante);

    List getBuscarEstudianteAuxiliarTodas(Estudiantes estudiante);

    //INICIO - REPORTES DE ESTUDIANTES DOCENCIA POR PROGRAMA
    List getListarEstudiantesAuxiliaresPorPrograma(Estudiantes estudiante);

    List getBuscarEstudiantesAuxiliaresPorPrograma(Estudiantes estudiante);
    //FIN - REPORTES DE ESTUDIANTES DOCENCIA POR PROGRAMA

    //TRAMITES ATENDIDOS
    List getTrListarProcesos();

    // LISTADO DE NOTAS RECTIFICADAS
    List getEstListarNotasRectificadasEstudiante(Libretas libreta);

    List getListaParametrosdeEvaluacionporMateria(Libretas libreta);

    // TARJETAS MAGNETICAS
    List getBuscarEstudiantePersona(Estudiantes estudiante);

    //Cursos Varios
    List getListarCursoPsicoEst(Estudiantes estudiante);

    List getListarCursoPsicoOtros(Personas persona);

    List getListarCursoSemioEst(Estudiantes estudiante);

    List getlistarMiembrosT(Estudiantes estudiante);
    //CODE

    List getListarCertGen(Estudiantes estudiante);

    List getListarCertGenAnulados(Estudiantes estudiante);

    List getListarCertGenEmitidos(Estudiantes estudiante);

    List getListarNotasCertificados(Estudiantes estudiante);

    int setRegistrarCerGen(Estudiantes estudiante);

    int getBuscarMaxCertSede(Estudiantes estudiante);

    int setRegistrarCerGenNotas(Estudiantes estudiante);

    void setEliminarCertificadoNotas(Estudiantes estudiante);

    int getbuscarnrotransacciones(Estudiantes estudiante);

    int getbuscarnrocertificado(Estudiantes estudiante);

    int getcert_buscar_nro_certificado_gestioncode(Estudiantes estudiante);
//FIN - METODOS ADICIONADOS POR LA UAP

    int setBuscarCalendarioAcademicoPrograma(Libretas libreta);

    int setBuscarCalendarioAcademicoProgramaDocenteMateria(Libretas libreta);

    int setBuscarProgramacionAutorizacion(Libretas libreta);

    int setCambioEstadoProgramacionAutorizacion(Libretas libreta);

    List<Programas> getEstListarNotaMinimaporPrograma(Programas programa);

    List<Docentes> getDetallefotoadjunto(Docentes docente);

    int setRegistrarDocenteAdjuntos(Docentes docente);

    int setActualizarDocenteAdjuntos(Docentes docente);

    List<Calendarios> getlistarCalendarioDocente(Calendarios calendario);

    int setGenerarToken(Tokens token);

    List<Docentes> getBuscarListaDocentesCorreo(String correo);

    List<Tokens> getListartokendocente(Tokens token);

    List getDctListarAsignacionDocenteporProgramaAnalitico(Asignaciones asignacion);

    List<ProgramaAnalitico> GetListarDatosCaratula(int id_asignacion);

    List<ProgramaAnalitico> GetListarMateriaProgramaAnalitico(int id_asignacion);

    int PermitirRegistroPrograma(ProgramaAnalitico programaAnalitico);

    List<ProgramaAnalitico> GetListarPrerequisitoMateria(ProgramaAnalitico programaAnalitico);

    int RegistrarProgromaAnalitico(ProgramaAnalitico programaAnalitico);

    List<ProgramaAnalitico> GetListaProgramaanalitico(ProgramaAnalitico programaAnalitico);

    int ActualizarProgramaAnalitico(ProgramaAnalitico programaAnalitico);

    List<ProgramaAnalitico> GetProgramaanalitico(ProgramaAnalitico programaAnalitico);

    int ActualizarBibliografia(BiBliografia bibliografia);

    int RegistrarBibliografia(BiBliografia bibliografia);

    int EliminarBibliografia(BiBliografia bibliografia);

    List<BiBliografia> GetListarBibliografia(BiBliografia bibliografia);

    List<BiBliografia> GetBibliografia(BiBliografia bibliografia);

    int ActualizarCronograma(Cronograma cronograma);

    int RegistrarCronograma(Cronograma cronograma);

    int EliminarCronograma(Cronograma cronograma);

    List<Cronograma> GetListarCronograma(Cronograma cronograma);

    List<Cronograma> GetCronograma(Cronograma cronograma);

    int ActualizarObjetivo_Instructivo(Contenidos contenidos);

    int RegistrarObjetivo_Instructivo(Contenidos contenidos);

    int EliminarObjetivo_Instructivo(Contenidos contenidos);

    List<Contenidos> GetListarContenido(Contenidos contenidos);

    List<Contenidos> GetContenido(Contenidos contenidos);

    /* distribucion de tiempos*/
    List<FormasOrganizacion> GetListarformas();

    List<FormasTrabajoAula> GetListarformastrabajoaula();

    List<Contenidos> GetListarformascontenido(Contenidos contenidos);

    List<DistribucionTiempos> GetListarDistribucionTiempos(DistribucionTiempos distribuciontiempos);

    List<DistribucionTiempos> GetDistribucionTiempos(DistribucionTiempos distribuciontiempos);

    int RegistrarDistribucionTiempos(DistribucionTiempos distribuciontiempos);

    int ActualizarDistribucionTiempos(DistribucionTiempos distribuciontiempos);

    int EliminarDistribucionTiempos(DistribucionTiempos distribuciontiempos);

    List<FormasDistribucion> GetListarFormasDistribucion(FormasDistribucion formasdistribucion);

    List<FormasDistribucion> GetFormasDistribucion(FormasDistribucion formasdistribucion);

    int RegistrarFormasDistribucion(FormasDistribucion formasdistribucion);

    int ActualizarFormasDistribucion(FormasDistribucion formasdistribucion);

    int EliminarFormasDistribucion(FormasDistribucion formasdistribucion);

    /* fin distribucion de tiempos*/
    List<Docentes> GetListaNotificacionDocente(ParametrosBusqueda buscar);

    Personas getPrsBuscarPersonaDocente(int id_docente);

    List<CursosMoodle> GetListarCursosMoodleEstudiante(ParametrosBusqueda parametros);

    List<CursosMoodle> GetListarCursosMoodleDocente(ParametrosBusqueda parametros);

    void RegistrarCursosMoodleDocente(CursosMoodle cursos);

    void RegistrarCursosMoodleEstudiante(CursosMoodle cursos);

    void MatricularMoodle(CursosMoodle cursos);

    void UpdateUserMoodle(CursosMoodle cursos);

    MoodleConfiguracion GetConfiguracionCursosMoodle();

    List<Libretas> getEstBuscarEstudiantesProgramadospersona(Libretas libreta);

    List<Libretas> getPstBuscarPostulantesProgramadospersona(Libretas libreta);

    List<CursosMoodle> GetListarCursosMoodleEstudiantePorCurso(ParametrosBusqueda parametros);

    CursosMoodle GetCursoMoodleEstudiante(ParametrosBusqueda parametros);

    ProgramaAnalitico GetDatosCaratula(int id_dct_programa_analitico);

    Libretas getNotasEstudiante(Libretas libreta);

    void RegistrarBitacoraCambiosDocente(Libretas libreta);

    CursosMoodle GetUsuarioMoodle(int id);

    void RegistrarUsuariosMoodle(CursosMoodle cursos);

    void ActualizarUsuariosMoodle(CursosMoodle cursos);

    void RegistrarNuevoKardexDocente(PersonaKardex kardex);

    PersonaKardex GetKardexPersonalNuevo(int id_persona);

    void ActualizarDatosKardexDocente(PersonaKardex kardex);

    List<ListViewItem> GetLocalidadPersona();

    List<ListViewItem> GetNivelEstudio();

    List<ListViewItem> GetProfesiones();

    List<ListViewItem> GetColegiosProfesionales();

    List<ListViewItem> GetBancos();

    PersonaKardex GetImagenesPersonaKardex(int id_persona);

    int RegistrarNuevoIdiomaKardex(PersonaIdioma idioma);

    void ActualizarDatosiIdiomaKardexDocente(PersonaIdioma idioma);

    void AprobarIdiomaKardexDocente(PersonaIdioma idioma);

    void EliminarIdiomaKardexDocente(int id_idioma);

    List<PersonaIdioma> GetPersonaTotalIdiomaKardex(int id_persona);

    List<PersonaIdioma> GetPersonaSubTotalIdiomaKardex(PersonaKardex kardex);

    PersonaIdioma GetPersonaIdiomaKardex(int id_idioma);

    void ActualizarImagenIdiomaKardexDocente(PersonaIdioma idioma);

    int RegistrarNuevoFormacionAcademicaKardex(PersonaFormacionAcademica formacion);

    void ActualizarDatosFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion);

    void AprobarFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion);

    void EliminarFormacionAcademicaKardexDocente(int id_formacion);

    void ActualizarImagenFormacionAcademicaKardexDocente(PersonaFormacionAcademica formacion);

    List<PersonaFormacionAcademica> GetPersonaTotalFormacionAcademicaKardex(int id_persona_kardex);

    PersonaFormacionAcademica GetPersonaFormacionAcademicaKardex(int id_formacion);

    List<PersonaFormacionAcademica> GetPersonaSubTotalFormacionAcademicaKardex(PersonaKardex kardex);

    ///////////////////////
    int RegistrarExperienciaLaboralKardex(PersonaExperienciaLaboral experiencia);

    int RegistrarCursosRealizadosKardex(PersonaCursosRealizados cursos);

    int RegistrarProduccionCientificaKardex(PersonaProduccionCientifica produccion);

    int RegistrarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion);

    void ActualizarDatosExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia);

    void AprobarExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia);

    void EliminarExperienciaLaboralKardexDocente(int id_experiencia_laboral);

    void ActualizarImagenExperienciaLaboralKardexDocente(PersonaExperienciaLaboral experiencia);

    List<PersonaExperienciaLaboral> GetPersonaTotalExperienciaLaboralKardex(int id_persona_kardex);

    PersonaExperienciaLaboral GetPersonaExperienciaLaboralKardex(int id_experiencia_laboral);

    List<PersonaExperienciaLaboral> GetPersonaSubTotalExperienciaLaboralKardex(PersonaKardex kardex);

    void ActualizarDatosCursosRealizadosKardexDocente(PersonaCursosRealizados cursos);

    void AprobarCursosRealizadosKardexDocente(PersonaCursosRealizados cursos);

    void EliminarCursosRealizadosKardexDocente(int id_cursos_realizados);

    void ActualizarImagenCursosRealizadosKardexDocente(PersonaCursosRealizados cursos);

    List<PersonaCursosRealizados> GetPersonaTotalCursosRealizadosKardex(int id_persona_kardex);

    PersonaCursosRealizados GetPersonaCursosRealizadosKardex(int id_cursos_realizados);

    List<PersonaCursosRealizados> GetPersonaSubTotalCursosRealizadosKardex(PersonaKardex kardex);

    void ActualizarProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion);

    void AprobarProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion);

    void EliminarProduccionCientificaKardexDocente(int id_produccion_cientifica);

    void ActualizarImagenProduccionCientificaKardexDocente(PersonaProduccionCientifica produccion);

    List<PersonaProduccionCientifica> GetPersonaTotalProduccionCientificaKardex(int id_persona_kardex);

    PersonaProduccionCientifica GetPersonaProduccionCientificaKardex(int id_produccion_cientifica);

    List<PersonaProduccionCientifica> GetPersonaSubTotalProduccionCientificaKardex(PersonaKardex kardex);

    void ActualizarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion);

    void AprobarEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion);

    void EliminarEvaluacionDocenteKardex(int id_evaluacion_docente);

    void ActualizarImagenEvaluacionDocenteKardex(PersonaEvaluacionDocente evaluacion);

    List<PersonaEvaluacionDocente> GetPersonaTotalEvaluacionDocenteKardex(int id_persona_kardex);

    PersonaEvaluacionDocente GetPersonaEvaluacionDocenteKardex(int id_evaluacion_docente);

    List<PersonaEvaluacionDocente> GetPersonaSubTotalEvaluacionDocenteKardex(PersonaKardex kardex);

    List<FormasTrabajoAula> GetListarformastrabajoaulaProgramaAnalitico(int id_dct_programa_analitico);

    List<FormasOrganizacion> GetListarformasProgramaAnalitico(int id_dct_programa_analitico);

    List<FormasDistribucion> GetDetalleHorasFormasDistribucion(int id_dct_programa_analitico);

    int RegistrarDepartamentosGrupo(DepartamentoGrupos grupos);

    boolean ExisteGrupoPrograma(ParametrosBusqueda grupos);

    void ActualizarDepartamentosGrupo(DepartamentoGrupos grupos);

    boolean EliminarGrupo(DepartamentoGrupos grupos);

//Menciones
    List GetListarMencionesProgramas(ParametrosBusqueda buscar);

    List<Estudiantes> GetListarMencionesEstudiantes(ParametrosBusqueda buscar);

    String GetProgramaMencion(ParametrosBusqueda buscar);

    List<String> GetProgramaPlanesMencion(ParametrosBusqueda buscar);

    List<Menciones> GetListarMencion(ParametrosBusqueda buscar);

    void RegistrarNuevaMencion(Menciones mencion);

    void EditarMencion(Menciones mencion);

    void EliminarMencion(Menciones mencion);

    List<DepartamentoGrupos> getGrupos_Permitidos(ParametrosBusqueda busqueda);

    Usuarios getUsuario(String correo);

    boolean ExisteCorreo(String correo);

    Clientes getBuscarConexionAdministrativo(String correo);

    Integer getIDUsuario(String correo);

    boolean ExisteUsuario(String correo);

    Clientes getBuscarConexionUsuario(String correo);

    Usuarios getUsuarioadministrativo(String correo);

    Integer setCambioPinAdministrativo(Usuarios usuario);

    List<MateriasOptativas> getListarMateriasOptativas(ParametrosBusqueda buscar);

    List<Planes> getListarMateriasElectivasOptativasPlan(Planes plan);

    void RegistrarNuevaOptativa(MateriasOptativas optativa);

    void EditarMateriaOptativa(MateriasOptativas optativa);

    void EliminarMateriaOptativa(Integer id_est_materiaoptativa);

    List<CursosMoodle> GetListaCursosMoodlePorPrograma(CursosMoodle curso);

    List<ItemFacult> GetCarrerasOrfertadas(ConvalidacionModel model);

    List<ItemFacult> GetCarrerasConvalidar(ConvalidacionModel model);

    Integer getBuscarCompromisosporCarrera(Estudiantes estudiante);
}

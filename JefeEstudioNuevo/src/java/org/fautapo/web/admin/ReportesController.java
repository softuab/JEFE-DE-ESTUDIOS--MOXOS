/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Instituciones;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Materias;
import org.fautapo.domain.Personas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.Libretas_ListarProgramasModel;
import org.fautapo.model.ListarDocentesActaCalificaciones;
import org.fautapo.model.ListarDocentesMaterias;
import org.fautapo.model.ListarEstudiantesModel;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.ParametrosEntrada2Model;
import org.fautapo.model.ReporteModel;
import org.fautapo.model.ReportesPlanEstudiosModel;
import org.fautapo.model.asignacionListarDocentes;
import org.fautapo.util.Convert;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class ReportesController {

    @Autowired
    private MiFacade mi;
    private ModelMapper modelMapper;
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;
    @Autowired
    private HttpServletRequest request;

    public Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/estudiantesPorGrupos/Entrada.fautapo", method = RequestMethod.GET)
    public String EstudiantesPorGrupos(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada2Model model = new ParametrosEntrada2Model();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "reportesAcademicos/estudiantesPorGrupos/Entrada";
    }

    @RequestMapping(value = "/estudiantesPorGrupos/ListarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String EstudiantesListarProgramasPlanes(@ModelAttribute("model") Libretas_ListarProgramasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/estudiantesPorGrupos/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/estudiantesPorGrupos/ListarPlanEstudios.fautapo", method = RequestMethod.POST)
    public String EstudiantesListarPlanEstudios(@ModelAttribute("model") ReportesPlanEstudiosModel model, ModelMap modelo) {
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosPrgPlan.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = new Libretas();
        datosTipoEvaluacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos el listado del plan
        Planes datosPlan = new Planes();
        datosPlan.setId_programa(datosPrgPlan.getId_programa());
        datosPlan.setId_plan(datosPrgPlan.getId_plan());
        datosPlan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        datosPlan.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosPlan.setGestion(model.getGestion());
        datosPlan.setPeriodo(model.getPeriodo());
        List lMateriasPlan = this.mi.getListarMateriasPlanGrupoCantidad(datosPlan);
        modelo.addAttribute("lMateriasPlan", lMateriasPlan);

        return "reportesAcademicos/estudiantesPorGrupos/ListarPlanEstudios";
    }

    @RequestMapping(value = "/listarEstudianteforma.fautapo", method = RequestMethod.POST)
    public String estudiantesListarEstudiantes(@ModelAttribute("model") ReporteModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_materia", model.getId_materia());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("model", model);

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosPrgPlan.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);
        String sId_materia = Convert.ToString(model.getId_materia());

        // if (sId_materia.isEmpty()) {
        //   return new ModelAndView("reportesAcademicos/estudiantesPorGrupos/Aviso", "mensaje", "Debe seleccionar la Materia !!!");
        // }
        //Sacamos el id_materia y id_modelo_ahorro
        String sDatos[] = sId_materia.split(":");
        int iId_materia = Integer.parseInt(sDatos[0]);
        int iId_modelo_ahorro = Integer.parseInt(sDatos[1]);
        iId_modelo_ahorro = -1000000;  //CAMBIARLO
        int iId_grupo = Integer.parseInt(sDatos[2]);

        //Sacamos datos de la materia
        Materias datosMateria = new Materias();
        datosMateria.setId_materia(iId_materia);
        datosMateria = this.mi.getMtrBuscarMateria(datosMateria);
        modelo.addAttribute("datosMateria", datosMateria);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = new Libretas();
        datosTipoEvaluacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos el listado de los estudiantes
        Estudiantes datosEstudiantes = new Estudiantes();
        datosEstudiantes.setId_programa(datosPrgPlan.getId_programa());
        datosEstudiantes.setId_plan(datosPrgPlan.getId_plan());
        datosEstudiantes.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosEstudiantes.setId_materia(iId_materia);
        datosEstudiantes.setId_modelo_ahorro(iId_modelo_ahorro);
        datosEstudiantes.setId_grupo(iId_grupo);
        datosEstudiantes.setGestion(model.getGestion());
        datosEstudiantes.setPeriodo(model.getPeriodo());
        List lEstudiantes = this.mi.getEstListarEstudiantesPorGrupos(datosEstudiantes);
        modelo.addAttribute("lEstudiantes", lEstudiantes);

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }

        Instituciones datosInstitucionSede = new Instituciones();
        datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
        datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
        if (datosInstitucionSede != null) {
            modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
        }

        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        //Sacamos el formato de la hora
        Abm formatoHora = new Abm();
        formatoHora.setCampo("formato_hora");
        formatoHora.setCodigo("dibrap");
        modelo.addAttribute("formatoHora", this.mi.getDibBuscarParametro(formatoHora));

        return "reportesAcademicos/estudiantesPorGrupos/ListarEstudiantes";
    }

    @RequestMapping(value = "/asignacionAuxiliares/verAsignacionDocentes.fautapo", method = RequestMethod.GET)
    public String AsignacionAuxiliares(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);

        return "reportesAcademicos/asignacionAuxiliares/Entrada";
    }

    @RequestMapping(value = "/asignacionAuxiliares/ListarFacultadPrograma.fautapo", method = RequestMethod.POST)
    public String ListarFacultadPrograma(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "reportesAcademicos/asignacionAuxiliares/Entrada";
        }
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        // Comprobamos es quien debe, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("cliente", cliente);
        return "reportesAcademicos/asignacionAuxiliares/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/asignacionAuxiliares/ListarDocentesMaterias.fautapo", method = RequestMethod.POST)
    public String ListarDocenciasMaterias(@ModelAttribute("model") ListarDocentesMaterias model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String _nombres = cliente.getNombres();
        int _id_docente = cliente.getId_usuario();
        int _id_rol = cliente.getId_rol();

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("periodo", model.getPeriodo());

        if ((!"".equals(model.getId_programa())) && (!"".equals(model.getId_plan()))) {

            //Lista de Programas (carreras)
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("datosPrograma", programa);

            //Sacamos los datos de la Facultad
            Facultades datosFacultad = new Facultades();
            datosFacultad.setId_facultad(programa.getId_facultad());
            datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
            modelo.addAttribute("datosFacultad", datosFacultad);

            //Sacamos los datos de la institucion
            Instituciones datosInstitucion = new Instituciones();
            datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
            datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
            if (datosInstitucion != null) {
                modelo.addAttribute("datosInstitucion", datosInstitucion);
            }

            Instituciones datosInstitucionSede = new Instituciones();
            datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
            datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
            if (datosInstitucionSede != null) {
                modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
            }

            //Sacamos el formato de la fecha
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

            //Sacamos lista de docente con sus asignaciones a las materias
            Asignaciones datosAsignacion = new Asignaciones();
            datosAsignacion.setGestion(model.getGestion());
            datosAsignacion.setPeriodo(model.getPeriodo());
            datosAsignacion.setId_programa(model.getId_programa());
            datosAsignacion.setId_plan(Convert.ToString(model.getId_plan()));
            List lAsignacionDocentesMateria = this.mi.getDctListarAsignacionAuxiliarMateria(datosAsignacion);
            modelo.addAttribute("lAsignacionDocentesMateria", lAsignacionDocentesMateria);

            modelo.addAttribute("id_rol", Integer.toString(_id_rol));
        } else {
            return "Error";
        }
        return "reportesAcademicos/asignacionAuxiliares/ListarAsignacionesDocentesPrograma";
    }

    @RequestMapping(value = "/matriculadosPorPrograma/Entrada.fautapo", method = RequestMethod.GET)
    public String MatriculadosPorPrograma(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada2Model model = new ParametrosEntrada2Model();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);

        return "reportesAcademicos/matriculadosPorPrograma/Entrada";
    }

    @RequestMapping(value = "/matriculadosPorPrograma/ListarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String MatriculadosPorProgramaListarProgramasPlanes(@ModelAttribute("model") Libretas_ListarProgramasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        return "reportesAcademicos/matriculadosPorPrograma/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/matriculadosPorPrograma/ListarEstudiantes.fautapo", method = RequestMethod.POST)
    public String MatriculadosPorProgramaListarEstudiantes(@ModelAttribute("model") ListarDocentesMaterias model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();    //Recuperamos las variables del jsp
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_plan", model.getId_plan());

        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Sacamos el listado de los estudiantes
        Estudiantes datosEstudiantes = new Estudiantes();
        datosEstudiantes.setId_programa(model.getId_programa());
        datosEstudiantes.setId_plan(Convert.ToString(model.getId_plan()));
        datosEstudiantes.setGestion(model.getGestion());
        datosEstudiantes.setPeriodo(model.getPeriodo());
        List lEstudiantes = this.mi.getEstListarMatriculadosPorPrograma(datosEstudiantes);
        modelo.addAttribute("lEstudiantes", lEstudiantes);

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }

        Instituciones datosInstitucionSede = new Instituciones();
        datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
        datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
        if (datosInstitucionSede != null) {
            modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
        }

        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        return "reportesAcademicos/matriculadosPorPrograma/ListarEstudiantes";
    }

    @RequestMapping(value = "/matriculadosPorProgramaTipoEstudiante/entrada.fautapo", method = RequestMethod.GET)
    public String matriculadosTipoEstudiante(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada2Model model = new ParametrosEntrada2Model();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);

        return "reportesAcademicos/matriculadosPorProgramaTipoEstudiante/Entrada";
    }

    @RequestMapping(value = "/matriculadosPorProgramaTipoEstudiante/listarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlanes(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Listamos los tipo estudiantes
        List lTiposEstudiantes = this.mi.getListarTiposEstudiantes();
        modelo.addAttribute("lTiposEstudiantes", lTiposEstudiantes);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        return "reportesAcademicos/matriculadosPorProgramaTipoEstudiante/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/matriculadosPorProgramaTipoEstudiante/listarEstudiantes.fautapo", method = RequestMethod.POST)
    public String listarEstudiante(@ModelAttribute("model") ListarEstudiantesModel model, ModelMap modelo) {
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        int iId_tipo_estudiante = 1;

        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Sacamos los tipos estudiantes
        Personas datosTipoEstudiante = new Personas();
        datosTipoEstudiante.setId_tipo_estudiante(iId_tipo_estudiante);
        datosTipoEstudiante = this.mi.getBuscarTipoEstudiante(datosTipoEstudiante);
        modelo.addAttribute("datosTipoEstudiante", datosTipoEstudiante);

        //Sacamos el listado de los estudiantes
        Estudiantes datosEstudiantes = new Estudiantes();
        datosEstudiantes.setId_programa(model.getId_programa());
        datosEstudiantes.setGestion(model.getGestion());
        //datosEstudiantes.setId_tipo_estudiante(iId_tipo_estudiante);
        datosEstudiantes.setPeriodo(model.getPeriodo());
        List lEstudiantes = this.mi.getEstListarMatriculadosPorProgramaTipoEstudiante(datosEstudiantes);
        modelo.addAttribute("lEstudiantes", lEstudiantes);

        //Sacamos los datos de la institucion
        /*
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }

        Instituciones datosInstitucionSede = new Instituciones();
        datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
        datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
        if (datosInstitucionSede != null) {
            modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
        }*/
        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        return "reportesAcademicos/matriculadosPorProgramaTipoEstudiante/ListarEstudiantes";
    }

    @RequestMapping(value = "/auxiliaresPorPrograma/entrada.fautapo", method = RequestMethod.GET)
    public String auxiliaresProgramaEntrada(@ModelAttribute("model") ParametrosEntrada2Model model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/reporteAuxiliaresPorPrograma/Entrada";
    }

    @RequestMapping(value = "/reporteAuxiliaresPorPrograma/ListarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String auxiliaresListarProgramasPlanes(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        return "reportesAcademicos/reporteAuxiliaresPorPrograma/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/reporteAuxiliaresPorPrograma/ListarEstudiantes.fautapo", method = RequestMethod.POST)
    public String auxiliarListarEstudiantes(@ModelAttribute("model") ListarDocentesMaterias model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_plan", model.getId_plan());

        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Sacamos el listado de los estudiantes
        Estudiantes datosEstudiantes = new Estudiantes();
        datosEstudiantes.setId_programa(model.getId_programa());
        datosEstudiantes.setId_plan(Convert.ToString(model.getId_plan()));
        datosEstudiantes.setGestion(model.getGestion());
        datosEstudiantes.setPeriodo(model.getPeriodo());

        List lEstudiantes = this.mi.getListarEstudiantesAuxiliaresPorPrograma(datosEstudiantes);

        //  for(int i=0;i<lEstudiantes.size();i++){
        //Estudiantes aux = (Estudiantes) lEstudiantes.get(i);
//	Estudiantes aux2 = new Estudiantes();
        //aux2.setId_programa(aux.getId_programa()); 
        //aux2.setId_estudiante(aux.getId_estudiante());
        ///aux2.setGestion(iGestion);
        //aux2.setPeriodo(iPeriodo);
        //aux.setEstudiantes(this.mi.getBuscarEstudiantesAuxiliaresPorPrograma(aux2));
        //aux.setCant_materias(this.mi.getBuscarEstudiantesAuxiliaresPorPrograma(aux2).size());
        //  lEstudiantes.set(i, aux);	
        //}
        modelo.addAttribute("lEstudiantes", lEstudiantes);
        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }

        Instituciones datosInstitucionSede = new Instituciones();
        datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
        datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
        if (datosInstitucionSede != null) {
            modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
        }

        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        return "reportesAcademicos/reporteAuxiliaresPorPrograma/ListarEstudiantes";
    }

    @RequestMapping(value = "/calendarioAcademico/verActaCalificaciones.fautapo", method = RequestMethod.GET)
    public String calendarioVerActa(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        return "reportesAcademicos/verCalendarioAcademico/Entrada";
    }

    @RequestMapping(value = "/calendarioAcademico/ListarDepartamentosTiposEvaluaciones.fautapo", method = RequestMethod.POST)
    public String calendarioListarDepartamentos(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "reportesAcademicos/verCalendarioAcademico/Entrada";
        }
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("usuario", cliente.getNombres());

        // Comprobamos es quien debe, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("cliente", cliente);
        return "reportesAcademicos/verCalendarioAcademico/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/calendarioAcademico/ListarDocentesActaCalificaciones.fautapo", method = RequestMethod.POST)
    public String calendarioListarDocentesActa(@ModelAttribute("model") ListarEstudiantesModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int _id_rol = cliente.getId_rol();
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        //modelo.addAttribute("id_plan", sId_plan);    
        modelo.addAttribute("periodo", model.getPeriodo());

        if ((!"".equals(model.getId_programa()))) {
            //Lista de Programas (carreras)
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("datosPrograma", programa);

            Libretas datosCA = new Libretas();
            datosCA.setGestion(model.getGestion());
            datosCA.setPeriodo(model.getPeriodo());
            datosCA.setId_programa(model.getId_programa());
            List lcalificacionCalendario = this.mi.getListarCalificacionCalendario(datosCA);

            ////Sacamos lista de docente con sus asignaciones a las materias
            //Asignaciones datosAsignacion = new Asignaciones();
            //datosAsignacion.setGestion(iGestion);
            //datosAsignacion.setPeriodo(iPeriodo);
            //datosAsignacion.setId_programa(Integer.parseInt(sId_programa));
            //datosAsignacion.setId_plan(sId_plan);
            //List lAsignacionDocentesProgramaPlan = this.mi.getDctListarAsignacionDocenteProgramaPlan(datosAsignacion);
            //modelo.addAttribute("lAsignacionDocentesProgramaPlan", lAsignacionDocentesProgramaPlan);
            //Sacamos el formato de la fecha
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

            modelo.addAttribute("lcalificacionCalendario", lcalificacionCalendario);
            modelo.addAttribute("id_rol", Integer.toString(_id_rol));
        } else {
            return "Error";
        }
        return "reportesAcademicos/verCalendarioAcademico/ListarAsignacionesDocentesPrograma";
    }

    @RequestMapping(value = "/calendarioAcademicoDocente/verActaCalificaciones.fautapo", method = RequestMethod.GET)
    public String calendarioDocente(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/verCalendarioAcademicoDocente/Entrada";
    }

    @RequestMapping(value = "/calendarioAcademicoDocente/ListarDepartamentosTiposEvaluaciones.fautapo", method = RequestMethod.POST)
    public String calendarioListarDepartamento(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());

            return "reportesAcademicos/verCalendarioAcademicoDocente/Entrada";
        }
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("usuario", cliente.getNombres());

        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los tipos de evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("cliente", cliente);
        return "reportesAcademicos/verCalendarioAcademicoDocente/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/calendarioAcademicoDocente/ListarDocentesActaCalificaciones.fautapo", method = RequestMethod.POST)
    public String calendarioListarDocentesActa(@ModelAttribute("model") ListarDocentesActaCalificaciones model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int _id_rol = cliente.getId_rol();

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());

        if ((!"".equals(model.getId_programa()))) {
            //Lista de Programas (carreras)
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("datosPrograma", programa);

            Timestamp tFecha = new Timestamp(System.currentTimeMillis());
            Date dateFecha = new Date(tFecha.getTime());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String fechaSis = df.format(dateFecha);

            Libretas datosCA = new Libretas();
            datosCA.setGestion(model.getGestion());
            datosCA.setPeriodo(model.getPeriodo());
            datosCA.setId_programa((model.getId_programa()));
            datosCA.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            datosCA.setfec_actual(fechaSis);
            List lcalificacionCalendario = this.mi.getListarCalificacionCalendarioDocente(datosCA);

            ////Sacamos lista de docente con sus asignaciones a las materias
            //Asignaciones datosAsignacion = new Asignaciones();
            //datosAsignacion.setGestion(iGestion);
            //datosAsignacion.setPeriodo(iPeriodo);
            //datosAsignacion.setId_programa(Integer.parseInt(sId_programa));
            //datosAsignacion.setId_plan(sId_plan);
            //List lAsignacionDocentesProgramaPlan = this.mi.getDctListarAsignacionDocenteProgramaPlan(datosAsignacion);
            //modelo.addAttribute("lAsignacionDocentesProgramaPlan", lAsignacionDocentesProgramaPlan);
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

            modelo.addAttribute("lcalificacionCalendario", lcalificacionCalendario);
            modelo.addAttribute("evaluacion", Integer.toString(model.getId_tipo_evaluacion()));
            modelo.addAttribute("id_rol", Integer.toString(_id_rol));
        } else {
            return "Error";
        }
        return "reportesAcademicos/verCalendarioAcademicoDocente/ListarAsignacionesDocentesPrograma";
    }

    @RequestMapping(value = "/asignacionDocentesxid/verAsignacionDocentes.fautapo", method = RequestMethod.GET)
    public String asignacionVerAsignacion(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/asignacionDocentesxid/Entrada";
    }

    @RequestMapping(value = "/asignacionDocentesxid/ListarFacultadPrograma.fautapo", method = RequestMethod.POST)
    public String asignacionListarFacultad(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());

            return "reportesAcademicos/asignacionDocentesxid/Entrada";
        }
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        // Comprobamos es quien debe, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("cliente", cliente);
        return "reportesAcademicos/asignacionDocentesxid/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/asignacionDocentesxid/ListarDocentesMaterias.fautapo", method = RequestMethod.POST)
    public String asignacionListarDocentesMaterias(@ModelAttribute("model") asignacionListarDocentes model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int _id_rol = cliente.getId_rol();

        modelo.addAttribute("evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());

        if ((!"".equals(model.getId_programa())) && (!"".equals(model.getId_plan()))) {

            //Lista de Programas (carreras)
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("datosPrograma", programa);

            //Sacamos los datos de la Facultad
            Facultades datosFacultad = new Facultades();
            datosFacultad.setId_facultad(programa.getId_facultad());
            datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
            modelo.addAttribute("datosFacultad", datosFacultad);

            //Sacamos los datos de la institucion
            Instituciones datosInstitucion = new Instituciones();
            datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
            datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
            if (datosInstitucion != null) {
                modelo.addAttribute("datosInstitucion", datosInstitucion);
            }

            Instituciones datosInstitucionSede = new Instituciones();
            datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
            datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
            if (datosInstitucionSede != null) {
                modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
            }

            //Sacamos el formato de la fecha
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

            //Sacamos lista de docente con sus asignaciones a las materias
            Asignaciones datosAsignacion = new Asignaciones();
            datosAsignacion.setGestion(model.getGestion());
            datosAsignacion.setPeriodo(model.getPeriodo());
            datosAsignacion.setId_programa(model.getId_programa());
            System.out.println("El id_programa es -->" + (model.getId_programa()));
            datosAsignacion.setId_plan(Convert.ToString(model.getId_plan()));
            datosAsignacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            List lAsignacionDocentesMateria = this.mi.getDctListarAsignacionDocenteMateriaFuncionxid(datosAsignacion);
            modelo.addAttribute("lAsignacionDocentesMateria", lAsignacionDocentesMateria);

            //PARA CONTAR LA CANTIDAD DE MATERIAS QUE TIENE CADA DOCENTE
            List lNroAsignacionDocentesMateria = this.mi.getDctListarNroAsignacionDocenteMateriaFuncionxid(datosAsignacion);
            modelo.addAttribute("lNroAsignacionDocentesMateria", lNroAsignacionDocentesMateria);
            //FIN PARA CONTAR LA CANTIDAD DE MATERIAS QUE TIENE CADA DOCENTE

            modelo.addAttribute("id_rol", Integer.toString(_id_rol));
        } else {
            return "Error";
        }
        return "reportesAcademicos/asignacionDocentesxid/ListarAsignacionesDocentesPrograma";
    }

    @RequestMapping(value = "/asignacionDocentessintitular/verAsignacionDocentes.fautapo", method = RequestMethod.GET)
    public String asignacionDVerAsignacion(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/asignacionDocentessintitular/Entrada";
    }

    @RequestMapping(value = "/asignacionDocentessintitular/ListarFacultadPrograma.fautapo", method = RequestMethod.POST)
    public String asignacionDocentessinTitular(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());

            return "reportesAcademicos/asignacionDocentessintitular/Entrada";
        }

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("usuario", cliente.getNombres());

        // Comprobamos es quien debe, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("cliente", cliente);
        return "reportesAcademicos/asignacionDocentessintitular/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/asignacionDocentessintitular/ListarDocentesMaterias.fautapo", method = RequestMethod.POST)
    public String asignacionDocenteListarDocentes(@ModelAttribute("model") asignacionListarDocentes model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int _id_rol = cliente.getId_rol();

        modelo.addAttribute("evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());

        if ((!"".equals(model.getId_programa())) && (!"".equals(model.getId_plan()))) {

            //Lista de Programas (carreras)
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("datosPrograma", programa);

            //Sacamos los datos de la Facultad
            Facultades datosFacultad = new Facultades();
            datosFacultad.setId_facultad(programa.getId_facultad());
            datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
            modelo.addAttribute("datosFacultad", datosFacultad);

            //Sacamos los datos de la institucion
            Instituciones datosInstitucion = new Instituciones();
            datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
            datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
            if (datosInstitucion != null) {
                modelo.addAttribute("datosInstitucion", datosInstitucion);
            }

            Instituciones datosInstitucionSede = new Instituciones();
            datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
            datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
            if (datosInstitucionSede != null) {
                modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
            }

            //Sacamos el formato de la fecha
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

            //Sacamos lista de docente con sus asignaciones a las materias
            Asignaciones datosAsignacion = new Asignaciones();
            datosAsignacion.setGestion(model.getGestion());
            datosAsignacion.setPeriodo(model.getPeriodo());
            datosAsignacion.setId_programa(model.getId_programa());
            System.out.println("El id_programa es -->" + (model.getId_programa()));
            datosAsignacion.setId_plan(Convert.ToString(model.getId_plan()));
            datosAsignacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            List lAsignacionDocentesMateria = this.mi.getDctListarAsignacionDocenteMateriaFuncionsintitular(datosAsignacion);
            modelo.addAttribute("lAsignacionDocentesMateria", lAsignacionDocentesMateria);

            List lNroAsignacionDocentesMateria = this.mi.getDctListarAsignacionDocenteMateriaFuncionsintitularfinal(datosAsignacion);
            modelo.addAttribute("lNroAsignacionDocentesMateria", lNroAsignacionDocentesMateria);

            modelo.addAttribute("id_rol", Integer.toString(_id_rol));
        } else {
            return "Error";
        }
        return "reportesAcademicos/asignacionDocentessintitular/ListarAsignacionesDocentesPrograma";
    }

    @RequestMapping(value = "/asignacionDocentes/verAsignacionDocentes.fautapo", method = RequestMethod.GET)
    public String asignacionDocentesVerasign(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/asignacionDocentes/Entrada";
    }

    @RequestMapping(value = "/asignacionDocentes/ListarFacultadPrograma.fautapo", method = RequestMethod.POST)
    public String asigancionDocenListarFacultad(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "reportesAcademicos/asignacionDocentes/Entrada";
        }

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("usuario", cliente.getNombres());

        // Comprobamos es quien debe, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("cliente", cliente);
        return "reportesAcademicos/asignacionDocentes/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/asignacionDocentes/ListarDocentesMaterias.fautapo", method = RequestMethod.POST)
    public String asignacionDocListarDocentes(@ModelAttribute("model") asignacionListarDocentes model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int _id_rol = cliente.getId_rol();
        modelo.addAttribute("evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());

        if ((!"".equals(model.getId_programa())) && (!"".equals(model.getId_plan()))) {

            //Lista de Programas (carreras)
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("datosPrograma", programa);

            //Sacamos los datos de la Facultad
            Facultades datosFacultad = new Facultades();
            datosFacultad.setId_facultad(programa.getId_facultad());
            datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
            modelo.addAttribute("datosFacultad", datosFacultad);

            //Sacamos los datos de la institucion
            Instituciones datosInstitucion = new Instituciones();
            datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
            datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
            if (datosInstitucion != null) {
                modelo.addAttribute("datosInstitucion", datosInstitucion);
            }

            Instituciones datosInstitucionSede = new Instituciones();
            datosInstitucionSede.setId_institucion(cliente.getId_almacen()); //--------------------------ESTATICO
            datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
            if (datosInstitucionSede != null) {
                modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
            }

            //Sacamos el formato de la fecha
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

            //Sacamos lista de docente con sus asignaciones a las materias
            Asignaciones datosAsignacion = new Asignaciones();
            datosAsignacion.setGestion(model.getGestion());
            datosAsignacion.setPeriodo(model.getPeriodo());
            datosAsignacion.setId_programa(model.getId_programa());
            datosAsignacion.setId_plan(Convert.ToString(model.getId_plan()));
            datosAsignacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            List lAsignacionDocentesMateria = this.mi.getDctListarAsignacionDocenteMateriaFuncion(datosAsignacion);
            modelo.addAttribute("lAsignacionDocentesMateria", lAsignacionDocentesMateria);

            modelo.addAttribute("id_rol", Integer.toString(_id_rol));

        } else {
            return "Error";
        }
        return "reportesAcademicos/asignacionDocentes/ListarAsignacionesDocentesPrograma";
    }

    @RequestMapping(value = "/postulantesPorProgramaTipoAdmision/entrada.fautapo", method = RequestMethod.GET)
    public String postulanteporTipoAdmision(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada2Model model = new ParametrosEntrada2Model();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "reportesAcademicos/postulantesPorProgramaTipoAdmision/Entrada";
    }
}

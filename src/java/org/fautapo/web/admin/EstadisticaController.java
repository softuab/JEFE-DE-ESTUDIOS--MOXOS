/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Funciones;
import org.fautapo.domain.Instituciones;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.EstadisticasNivelListarCondicionesModel;
import org.fautapo.model.Libretas_ListarEstudiantes;
import org.fautapo.model.Libretas_ListarMatriculadosModel;
import org.fautapo.model.Libretas_ListarProgramasModel;
import org.fautapo.model.ParametrosEntrada2Model;
import org.fautapo.model.PromedioMayorNota;
import org.fautapo.model.PromedioNotalModel;
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
public class EstadisticaController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BCryptPasswordEncoder bcrytEncoder;
    @Autowired
    private HttpServletRequest request;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/nroEstudiantesMatriculados/Entrada.fautapo", method = RequestMethod.GET)
    public String EstudiantesMatriculados(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada2Model model = new ParametrosEntrada2Model();

        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);

        return "reportesAcademicos/nroEstudiantesMatriculados/Entrada";
    }

    @RequestMapping(value = "/nroEstudiantesMatriculados/ListarProgramasNroMatriculados.fautapo", method = RequestMethod.POST)
    public String ListarProgramasNroMatriculados(@ModelAttribute("model") Libretas_ListarProgramasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Listamos los tipo estudiantes
        List lTiposEstudiantes = this.mi.getListarTiposEstudiantes();
        modelo.addAttribute("lTiposEstudiantes", lTiposEstudiantes);
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        return "reportesAcademicos/nroEstudiantesMatriculados/ListarPlanMatriculas";
    }

    @RequestMapping(value = "/nroEstudiantesMatriculados/ListarMatriculados.fautapo", method = RequestMethod.POST)
    public String ListarMatriculados(@ModelAttribute("model") Libretas_ListarMatriculadosModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Sacando la lista de estudiantes matriculados
        Estudiantes datosEstudiantes = new Estudiantes();
        datosEstudiantes.setGestion(model.getGestion());
        datosEstudiantes.setPeriodo(model.getPeriodo());
        datosEstudiantes.setId_programa(model.getId_programa());
        List lEstudiantes = this.mi.getListarNroEstudiantesMatriculadosporPrograma(datosEstudiantes);
        modelo.addAttribute("lEstudiantes", lEstudiantes);

        //Sacamos la lista de los programas
        /*Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(Integer.parseInt(sId_programa));
        List lProgramas = this.mi.getUnvListarProgramas(datosPrograma);
        modelo.addAttribute("lProgramas", lProgramas);*/
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

        return "reportesAcademicos/nroEstudiantesMatriculados/ListarMatriculados";
    }

    @RequestMapping(value = "/nroEstMatriculadosTipoEstudiante/Entrada.fautapo", method = RequestMethod.GET)
    public String TipoEstudiante(@ModelAttribute("model") ParametrosEntrada2Model model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/nroEstMatriculadosTipoEstudiante/Entrada";

    }

    @RequestMapping(value = "/nroEstMatriculadosTipoEstudiante/ListarProgramasTipoEstudiante.fautapo", method = RequestMethod.POST)
    public String ListarProgramasTipoEstudiante(@ModelAttribute("model") Libretas_ListarProgramasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Listamos los tipo estudiantes
        List lTipoEstudiantes = this.mi.getListarTiposEstudiantes();
        modelo.addAttribute("lTipoEstudiantes", lTipoEstudiantes);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        return "reportesAcademicos/nroEstMatriculadosTipoEstudiante/ListarProgramasPlanesTipoEst";
    }

    @RequestMapping(value = "/nroEstMatriculadosTipoEstudiante/ListarMatriculados.fautapo", method = RequestMethod.POST)
    public String TipoEstudianteListarMatriculados(@ModelAttribute("model") Libretas_ListarMatriculadosModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Sacando la lista de estudiantes matriculados
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setGestion(model.getGestion());
        datosEstudiante.setPeriodo(model.getPeriodo());
        datosEstudiante.setId_programa(model.getId_programa());
        List lEstudiantes = this.mi.getListarNroEstMatriculadosTipoEstudiante(datosEstudiante);
        modelo.addAttribute("lEstudiantes", lEstudiantes);

        //Listamos los programas
        //   Programas datosPrograma = new Programas();
        //   datosPrograma.setId_universidad(iId_universidad);
        //   List lProgramas = this.mi.getUnvListarProgramas(datosPrograma);
        //   modelo.addAttribute("lProgramas", lProgramas);
        //Listamos los tipo estudiantes
        //   List lTiposEstudiantes = this.mi.getListarTiposEstudiantes();
        //   modelo.addAttribute("lTiposEstudiantes", lTiposEstudiantes);
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

        return "reportesAcademicos/nroEstMatriculadosTipoEstudiante/ListarMatriculados";
    }

    @RequestMapping(value = "/nroEstMatriculadosSexo/Entrada.fautapo", method = RequestMethod.GET)
    public String MatriculadosEntrdaSexo(@ModelAttribute("model") ParametrosEntrada2Model model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/nroEstMatriculadosSexo/Entrada";
    }

    @RequestMapping(value = "/nroEstMatriculadosSexo/ListarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String MatriculadosSexoListarProgramasPlanes(@ModelAttribute("model") Libretas_ListarProgramasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        return "reportesAcademicos/nroEstMatriculadosSexo/ListarProgramasPlanesSexp";
    }

    @RequestMapping(value = "/nroEstMatriculadosSexo/ListarMatriculados.fautapo", method = RequestMethod.POST)
    public String MatriculadosSexoListarMatriculados(@ModelAttribute("model") Libretas_ListarMatriculadosModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Sacando la lista de estudiantes matriculados
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_programa(model.getId_programa());
        datosEstudiante.setGestion(model.getGestion());
        datosEstudiante.setPeriodo(model.getPeriodo());
        List lEstudiantes = this.mi.getListarNroEstMatriculadosSexos(datosEstudiante);
        modelo.addAttribute("lEstudiantes", lEstudiantes);

        //  Estudiantes datosEstudiante = new Estudiantes();
        // List lProgramas = this.mi.getListarNroEstudiantesMatriculados(datosEstudiante);
        // modelo.addAttribute("lProgramas", lProgramas);
//    Programas datosPrograma = new Programas();
//    datosPrograma.setId_universidad(iId_universidad);
//    List lProgramas = this.mi.getUnvListarProgramas(datosPrograma);
//    modelo.addAttribute("lProgramas", lProgramas);
//    List lTestudiantes = this.mi.getListarTiposEstudiantes();
//    modelo.addAttribute("lTiposEstudiantes", lTestudiantes);
//    List lTiposSexos = this.mi.getListarTiposSexos();
//    modelo.addAttribute("tTsexos", Integer.toString(lTiposSexos.size()));
//    modelo.addAttribute("lTiposSexos", lTiposSexos);
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

        return "reportesAcademicos/nroEstMatriculadosSexo/ListarMatriculados";
    }

    @RequestMapping(value = "/nroEstProgramadosMaterias/Entrada.fautapo", method = RequestMethod.GET)
    public String ProgramadosMaterias(@ModelAttribute("model") ParametrosEntrada2Model model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        return "reportesAcademicos/nroEstProgramadosMaterias/Entrada";
    }

    @RequestMapping(value = "/nroEstProgramadosMaterias/ListarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String ProgramadosListarProgramasPlanes(@ModelAttribute("model") Libretas_ListarProgramasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/nroEstProgramadosMaterias/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/nroEstProgramadosMaterias/ListarEstudiantes.fautapo", method = RequestMethod.POST)
    public String MateriasListarEstudiantes(@ModelAttribute("model") Libretas_ListarEstudiantes model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        List lTiposSexos = this.mi.getListarTiposSexos();
        modelo.addAttribute("tTipoSexo", Integer.toString(lTiposSexos.size()));
        modelo.addAttribute("lTiposSexos", lTiposSexos);

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Sacando el listado de materias con grupos
        Planes datosPlan = new Planes();
        datosPlan.setId_programa(model.getId_programa());
        datosPlan.setId_plan(datosPrgPlan.getId_plan());
        datosPlan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        datosPlan.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosPlan.setGestion(model.getGestion());
        datosPlan.setPeriodo(model.getPeriodo());
        List lMaterias = this.mi.getListarMateriasPlanGrupoCantidad(datosPlan);
        modelo.addAttribute("lMaterias", lMaterias);

        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_programa(model.getId_programa());
        datosEstudiante.setId_plan(datosPrgPlan.getId_plan());
        datosEstudiante.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosEstudiante.setGestion(model.getGestion());
        datosEstudiante.setPeriodo(model.getPeriodo());
        List lEstudiantes = this.mi.getListarNroEstProgramadosMaterias(datosEstudiante);
        modelo.addAttribute("lEstudiantes", lEstudiantes);

        //sacamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
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

        return "reportesAcademicos/nroEstProgramadosMaterias/ListarEstudiantes";
    }

    @RequestMapping(value = "/estadisticaEspecializada/mayorNota/listarCondiciones.fautapo", method = RequestMethod.GET)
    public String listarCondiciones(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Funciones f = new Funciones(request, modelo, mi);
        Facultades facultad = new Facultades();
        facultad.setId_universidad(1);
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("cliente", cliente);
        if (cliente.getId_programa() > 0) {
            Programas programa = new Programas();
            programa.setId_programa(cliente.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("programa", programa);
        }
        PromedioMayorNota model = new PromedioMayorNota();
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
        //Sacamos el listado de los planes

        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);
        Planes plan = new Planes();
        plan.setId_programa(cliente.getId_programa());
        List lista = this.mi.getPrgListarPlanes(plan);
        modelo.addAttribute("lPlanesPrograma", lista);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("forma", model);
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));

        return "reportesEspecializados/estadisticas/mayorNota/ListarCondiciones";
    }

    ////****
    @RequestMapping(value = "/estadisticaEspecializada/mayorNota/listarCondicionesVolver.fautapo", method = RequestMethod.POST)
    public String listarCondicionesVolver(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Funciones f = new Funciones(request, modelo, mi);
        Facultades facultad = new Facultades();
        facultad.setId_universidad(1);
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("cliente", cliente);
        if (cliente.getId_programa() > 0) {
            Programas programa = new Programas();
            programa.setId_programa(cliente.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("programa", programa);
        }
        PromedioMayorNota model = new PromedioMayorNota();
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
        //Sacamos el listado de los planes

        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);
        Planes plan = new Planes();
        plan.setId_programa(cliente.getId_programa());
        List lista = this.mi.getPrgListarPlanes(plan);
        modelo.addAttribute("lPlanesPrograma", lista);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("forma", model);
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));

        return "reportesEspecializados/estadisticas/mayorNota/ListarCondiciones";
    }

    @RequestMapping(value = "/estadisticaEspecializada/mayorNota/formarReporte.fautapo", method = RequestMethod.POST)
    public String mayorNotaformarReporte(@ModelAttribute("forma") @Validated PromedioMayorNota model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            Funciones f = new Funciones(request, modelo, mi);
            Facultades facultad = new Facultades();
            facultad.setId_universidad(1);
            modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

            modelo.addAttribute("cliente", cliente);
            if (cliente.getId_programa() > 0) {
                Programas programa = new Programas();
                programa.setId_programa(cliente.getId_programa());
                programa = this.mi.getPrgBuscarPrograma(programa);
                modelo.addAttribute("programa", programa);
            }
            //Sacamos el listado de las facultades
            Universidades datosUniversidad = new Universidades();
            datosUniversidad.setId_universidad(cliente.getId_universidad());

            //Listando los tipos_evaluaciones
            List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
            modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
            //Sacamos el listado de los planes

            List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
            modelo.addAttribute("lPlanes", lPlanes);
            Planes plan = new Planes();
            plan.setId_programa(cliente.getId_programa());
            List lista = this.mi.getPrgListarPlanes(plan);
            modelo.addAttribute("lPlanesPrograma", lista);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("forma", model);
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));

            return "reportesEspecializados/estadisticas/mayorNota/ListarCondiciones";
        }
        Funciones f = new Funciones(request, modelo, mi);
        String sql = "";

        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(Integer.parseInt(f.sRequest("id_programa")));
        programa = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", programa);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(programa.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = new Libretas();
        datosTipoEvaluacion.setId_tipo_evaluacion(f.iRequest("id_tipo_evaluacion"));
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(f.iRequest("id_prg_plan"));
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }
        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

         // Definicion de la consulta SQL
        sql += "\n SELECT * FROM mi_rep_mayor_nota(" + f.sRequest("id_programa") + ", '" + datosPrgPlan.getId_plan() + "', " + datosPrgPlan.getId_tipo_grado() + ", " + f.sRequest("gestion") + ", " + f.sRequest("periodo") + ", " + f.sRequest("id_tipo_evaluacion") + ")";
        sql += "\n AS (id_materia integer, nivel_academico dentero, sigla dtexto, materia dtexto, grupo dtexto, id_estudiante dentero, paterno dtexto2, materno dtexto2, nombres dtexto, nota integer)";

        System.out.println("\n\n--Listar Transacciones-->\n" + sql + ";\n\n\n");

        //definicion de las etiquetas
        String etiquetas = "Id_Materia###Nivel###Sigla###Materia###Grupo###R.U.###Paterno###Materno###Nombres###Mayor Nota";
        //Generacion de la matriz
        f.matriz_etiquetas(sql, "datos", 0, "desde", 9, etiquetas);
        modelo.put("nombres", cliente.getNombres());
        modelo.put("periodo", f.sRequest("periodo"));
        modelo.put("gestion", f.sRequest("gestion"));
        return "reportesEspecializados/estadisticas/mayorNota/FormarReporte";
    }

    @RequestMapping(value = "/estadisticaEspecializada/promedioNotas/listarCondiciones.fautapo", method = RequestMethod.GET)
    public String promedioNotasListarCondiciones(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Funciones f = new Funciones(request, modelo, mi);

        Facultades facultad = new Facultades();
        facultad.setId_universidad(1);
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("cliente", cliente);
        if (cliente.getId_programa() > 0) {
            Programas programa = new Programas();
            programa.setId_programa(cliente.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("programa", programa);
        }
        PromedioNotalModel model = new PromedioNotalModel();
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);
        Planes plan = new Planes();
        plan.setId_programa(cliente.getId_programa());
        List lista = this.mi.getPrgListarPlanes(plan);
        modelo.addAttribute("lPlanesPrograma", lista);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("forma", model);
        modelo.addAttribute("gestion", cliente.getGestion());
        return "reportesEspecializados/estadisticas/promedioNotas/ListarCondiciones";
    }

    //***
    @RequestMapping(value = "/estadisticaEspecializada/promedioNotas/listarCondicionesVolver.fautapo", method = RequestMethod.POST)
    public String promedioNotasListarCondicionesVolver(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Funciones f = new Funciones(request, modelo, mi);

        Facultades facultad = new Facultades();
        facultad.setId_universidad(1);
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("cliente", cliente);
        if (cliente.getId_programa() > 0) {
            Programas programa = new Programas();
            programa.setId_programa(cliente.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("programa", programa);
        }
        PromedioNotalModel model = new PromedioNotalModel();
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);
        Planes plan = new Planes();
        plan.setId_programa(cliente.getId_programa());
        List lista = this.mi.getPrgListarPlanes(plan);
        modelo.addAttribute("lPlanesPrograma", lista);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("forma", model);
        modelo.addAttribute("gestion", cliente.getGestion());
        return "reportesEspecializados/estadisticas/promedioNotas/ListarCondiciones";
    }

    @RequestMapping(value = "/estadisticaEspecializada/promedioNotas/formarReporte.fautapo", method = RequestMethod.POST)
    public String promedioNotasFormarReporte(@ModelAttribute("forma") @Validated PromedioNotalModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            Funciones f = new Funciones(request, modelo, mi);

            Facultades facultad = new Facultades();
            facultad.setId_universidad(1);
            modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

            modelo.addAttribute("cliente", cliente);
            if (cliente.getId_programa() > 0) {
                Programas programa = new Programas();
                programa.setId_programa(cliente.getId_programa());
                programa = this.mi.getPrgBuscarPrograma(programa);
                modelo.addAttribute("programa", programa);
            }
            //Sacamos el listado de las facultades
            Universidades datosUniversidad = new Universidades();
            datosUniversidad.setId_universidad(cliente.getId_universidad());
            //Listando los tipos_evaluaciones
            List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
            modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

            List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
            modelo.addAttribute("lPlanes", lPlanes);
            Planes plan = new Planes();
            plan.setId_programa(cliente.getId_programa());
            List lista = this.mi.getPrgListarPlanes(plan);
            modelo.addAttribute("lPlanesPrograma", lista);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("forma", model);
            modelo.addAttribute("gestion", cliente.getGestion());
            return "reportesEspecializados/estadisticas/promedioNotas/ListarCondiciones";
        }
        Funciones f = new Funciones(request, modelo, mi);
        String sql = "";

        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(Integer.parseInt(f.sRequest("id_programa")));
        programa = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", programa);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(programa.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = new Libretas();
        datosTipoEvaluacion.setId_tipo_evaluacion(f.iRequest("id_tipo_evaluacion"));
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(f.iRequest("id_prg_plan"));
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }
        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        // Definicion de la consulta SQL
        sql += "\n SELECT * FROM mi_rep_promedio_notas(" + f.sRequest("id_programa") + ", '" + datosPrgPlan.getId_plan() + "', " + datosPrgPlan.getId_tipo_grado() + ", " + f.sRequest("id_tipo_evaluacion") + ", " + f.sRequest("gestion") + ", " + f.sRequest("periodo") + ")";
        sql += "\n AS (id_estudiante integer, paterno dtexto2, materno dtexto2, nombres dtexto, nro_materias bigint, promedio numeric)";

        System.out.println("\n\n--Listar Transacciones-->\n" + sql + ";\n\n\n");

        //definicion de las etiquetas
        String etiquetas = "R.U.###Paterno###Materno###Nombres###Nro. Materias###Promedio";

        //Generacion de la matriz
        f.matriz_etiquetas(sql, "datos", 0, "desde", 4, etiquetas);
        modelo.addAttribute("nombres", cliente.getNombres());

        modelo.addAttribute("periodo", f.sRequest("periodo"));
        modelo.addAttribute("gestion", f.sRequest("gestion"));

        return "reportesEspecializados/estadisticas/promedioNotas/FormarReporte";
    }

    @RequestMapping(value = "/estadisticaEspecializada/rendimientoNivel/listarCondiciones.fautapo", method = RequestMethod.GET)
    public String rendimientoNivelListarCondiciones(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        Funciones f = new Funciones(request, modelo, mi);

        Facultades facultad = new Facultades();
        facultad.setId_universidad(1);
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("cliente", cliente);
        if (cliente.getId_programa() > 0) {
            Programas programa = new Programas();
            programa.setId_programa(cliente.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("programa", programa);
        }
        EstadisticasNivelListarCondicionesModel model = new EstadisticasNivelListarCondicionesModel();
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);
        Planes plan = new Planes();
        plan.setId_programa(cliente.getId_programa());
        List lista = this.mi.getPrgListarPlanes(plan);
        modelo.addAttribute("lPlanesPrograma", lista);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("forma", model);
        modelo.addAttribute("gestion", cliente.getGestion());

        return "reportesEspecializados/estadisticas/rendimientoNivel/ListarCondiciones";
    }

    ///*
    @RequestMapping(value = "/estadisticaEspecializada/rendimientoNivel/listarCondicionesVolver.fautapo", method = RequestMethod.POST)
    public String rendimientoNivelListarCondicionesVolver(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        Funciones f = new Funciones(request, modelo, mi);

        Facultades facultad = new Facultades();
        facultad.setId_universidad(1);
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("cliente", cliente);
        if (cliente.getId_programa() > 0) {
            Programas programa = new Programas();
            programa.setId_programa(cliente.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("programa", programa);
        }
        EstadisticasNivelListarCondicionesModel model = new EstadisticasNivelListarCondicionesModel();
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);
        Planes plan = new Planes();
        plan.setId_programa(cliente.getId_programa());
        List lista = this.mi.getPrgListarPlanes(plan);
        modelo.addAttribute("lPlanesPrograma", lista);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("forma", model);
        modelo.addAttribute("gestion", cliente.getGestion());

        return "reportesEspecializados/estadisticas/rendimientoNivel/ListarCondiciones";
    }

    @RequestMapping(value = "/estadisticaEspecializada/rendimientoNivel/formarReporte.fautapo", method = RequestMethod.POST)
    public String rendimientoNivelFormarReporte(@ModelAttribute("forma") @Validated EstadisticasNivelListarCondicionesModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            Funciones f = new Funciones(request, modelo, mi);

            Facultades facultad = new Facultades();
            facultad.setId_universidad(1);
            modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

            modelo.addAttribute("cliente", cliente);
            if (cliente.getId_programa() > 0) {
                Programas programa = new Programas();
                programa.setId_programa(cliente.getId_programa());
                programa = this.mi.getPrgBuscarPrograma(programa);
                modelo.addAttribute("programa", programa);
            }
            //Sacamos el listado de las facultades
            Universidades datosUniversidad = new Universidades();
            datosUniversidad.setId_universidad(cliente.getId_universidad());

            //Listando los tipos_evaluaciones
            List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
            modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

            List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
            modelo.addAttribute("lPlanes", lPlanes);
            Planes plan = new Planes();
            plan.setId_programa(cliente.getId_programa());
            List lista = this.mi.getPrgListarPlanes(plan);
            modelo.addAttribute("lPlanesPrograma", lista);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", cliente.getGestion());

            return "reportesEspecializados/estadisticas/rendimientoNivel/ListarCondiciones";
        }

        Funciones f = new Funciones(request, modelo, mi);
        String sql = "";

        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(Integer.parseInt(f.sRequest("id_programa")));
        programa = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", programa);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(programa.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = new Libretas();
        datosTipoEvaluacion.setId_tipo_evaluacion(f.iRequest("id_tipo_evaluacion"));
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(f.iRequest("id_prg_plan"));
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }
        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        // Definicion de la consulta SQL
        sql += "\n SELECT * FROM mi_rep_rendimiento_nivel(" + f.sRequest("id_programa") + ", '" + datosPrgPlan.getId_plan() + "', " + datosPrgPlan.getId_tipo_grado() + ", " + f.sRequest("id_tipo_evaluacion") + ", " + f.sRequest("gestion") + ", " + f.sRequest("periodo") + ", " + f.sRequest("nivel_academico") + ")";
        sql += "\n AS (id_estudiante integer, paterno dtexto2, materno dtexto2, nombres dtexto, nro_materias bigint, promedio numeric)";

        System.out.println("\n\n--Listar Transacciones-->\n" + sql + ";\n\n\n");

        //definicion de las etiquetas
        String etiquetas = "R.U.###Paterno###Materno###Nombres###Nro. Materias###Promedio";

        //Generacion de la matriz
        f.matriz_etiquetas(sql, "datos", 0, "desde", 5, etiquetas);
        modelo.addAttribute("nombres", cliente.getNombres());

        modelo.addAttribute("periodo", f.sRequest("periodo"));
        modelo.addAttribute("gestion", f.sRequest("gestion"));

        return "reportesEspecializados/estadisticas/rendimientoNivel/FormarReporte";
    }
}

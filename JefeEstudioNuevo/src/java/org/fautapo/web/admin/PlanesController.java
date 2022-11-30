package org.fautapo.web.admin;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Instituciones;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Menciones;
import org.fautapo.domain.Personas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.BuscarPlanesModel;
import org.fautapo.model.MencionPlanesModel;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.PasswordClaveModel;
import org.fautapo.model.PlanesModel;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
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
public class PlanesController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private HttpServletRequest request;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/planes/verPlanesEstudiosEntrada.fautapo", method = RequestMethod.GET)
    public String EntradaPlanes(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "verPlanEstudios/Entrada";
    }

    @RequestMapping(value = "/planes/verPlanesEstudios.fautapo", method = RequestMethod.POST)
    public String ListarPlanes(@ModelAttribute("model") @Validated PasswordClaveModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "verPlanEstudios/Entrada";
        }
        modelo.addAttribute("cliente", cliente);
        Facultades facultad = new Facultades();
        facultad.setId_universidad(cliente.getId_universidad());
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());

        return "verPlanEstudios/ListarPlanes";
    }

    @RequestMapping(value = "/planes/verPlanEstudios.fautapo", method = RequestMethod.POST)
    public String VerPlanEstudios(@ModelAttribute("model") PlanesModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        String datosPlan = model.getId_plan();
        String[] planes = datosPlan.split("-");
        int iId_prg_plan = Integer.valueOf(planes[1]);
        modelo.addAttribute("id_prg_plan", Integer.toString(iId_prg_plan));

        //Sacamos los datos del plan
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(iId_prg_plan);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Listamos los datos del plan de estudios
        Planes plan = new Planes();
        plan.setId_plan(datosPrgPlan.getId_plan());
        plan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        plan.setId_programa(model.getId_programa());
        modelo.addAttribute("lMaterias", this.mi.getListarMateriasPlan(plan));
        modelo.addAttribute("lRequisitos", this.mi.getPlnListarMateriasRequisitos(plan));

        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));

        return "verPlanEstudios/VerPlanEstudios";
    }

    @RequestMapping(value = "/planDeEstudios/Entrada.fautapo", method = RequestMethod.GET)
    public String handleRequest(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "reportesAcademicos/planDeEstudios/Entrada";
    }

    @RequestMapping(value = "/planDeEstudios/listarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlanes(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "reportesAcademicos/planDeEstudios/Entrada";
        }
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/planDeEstudios/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/planDeEstudiosVolver/listarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlanesvolver(@ModelAttribute("model") ParametrosEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("id_programa", model.getId_programa());
        return "reportesAcademicos/planDeEstudios/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/planDeEstudiosVolver/listarMenciones.fautapo", method = RequestMethod.POST)
    public String listarMencionesVolver(@ModelAttribute("model") BuscarPlanesModel model, ModelMap modelo) {
        Estudiantes datosEstudiante = new Estudiantes();

        String tipobusqueda = model.getTipobusqueda();
        String valor = "";
        int iId_programa = 0;
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";

        if (tipobusqueda == null) {
            iId_programa = model.getId_programa();
            sId_estudiante = model.getId_estudiante() == null ? null : model.getId_estudiante().toString();
            sCi = model.getCi();
            sNombres = model.getNombres();
        } else {
            valor = model.getBusqueda();
            iId_programa = model.getId_programa();
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
        }
        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(iId_programa);
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        if (((sId_estudiante == null) && (sNombres == null) && (sCi == null))
                || (("".equals(sId_estudiante)) && ("".equals(sNombres)) && ("".equals(sCi)))) {
            return "reportesAcademicos/planDeEstudios/BuscarEstudiantes";
        }

        return "reportesAcademicos/planDeEstudios/BuscarEstudiantes";
    }

    @RequestMapping(value = "/planDeEstudios/listarMenciones.fautapo", method = RequestMethod.POST)
    public String listarMenciones(@ModelAttribute("model") BuscarPlanesModel model, ModelMap modelo) {
        Estudiantes datosEstudiante = new Estudiantes();

        String tipobusqueda = model.getTipobusqueda();
        String valor = "";
        int iId_programa = 0;
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";

        if (tipobusqueda == null) {
            iId_programa = model.getId_programa();
            sId_estudiante = model.getId_estudiante() == null ? null : model.getId_estudiante().toString();
            sCi = model.getCi();
            sNombres = model.getNombres();
        } else {
            valor = model.getBusqueda();
            iId_programa = model.getId_programa();
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
        }
        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(iId_programa);
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        if (((sId_estudiante == null) && (sNombres == null) && (sCi == null))
                || (("".equals(sId_estudiante)) && ("".equals(sNombres)) && ("".equals(sCi)))) {
            return "reportesAcademicos/planDeEstudios/BuscarEstudiantes";
        }

        if ((!"".equals(sId_estudiante)) && (sId_estudiante != null)) {
            //Sacando los datos del estudiante
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "reportesAcademicos/planDeEstudios/Aviso";
            }
            datosEstudiante.setId_programa(iId_programa);
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U. : " + sId_estudiante + "no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.");
                return "reportesAcademicos/planDeEstudios/Aviso";
            }
            //Sacando los datos personales del Estudiante encontrado
            Personas datosPersona = new Personas();
            datosPersona.setId_persona(datosEstudiante.getId_persona());
            datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
            modelo.addAttribute("datosPersona", datosPersona);

            //Sacamos los datos de la Facultad
            Facultades datosFacultad = new Facultades();
            datosFacultad.setId_facultad(datosPrograma.getId_facultad());
            datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
            modelo.addAttribute("datosFacultad", datosFacultad);

            //Buscamos el grado_academico por programa e id_plan
            Libretas datosGrados = new Libretas();
            datosGrados.setId_programa(datosEstudiante.getId_programa());
            datosGrados.setId_plan(datosEstudiante.getId_plan());
            datosGrados = this.mi.getBuscarGradoAcademicoPrograma(datosGrados);
            modelo.addAttribute("datosGrados", datosGrados);

            //Sacamos el listado de las materias del plan nuevo
            Planes datosPlan = new Planes();
            datosPlan.setId_programa(datosEstudiante.getId_programa());
            datosPlan.setId_plan(datosEstudiante.getId_plan());
            datosPlan.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
            List lMenciones = this.mi.getMncListarMenciones(datosPlan);
            modelo.addAttribute("lMenciones", lMenciones);
            if (lMenciones.isEmpty()) {
                List lPlanDeEstudios = this.mi.getListarMateriasPlanRequisitos(datosPlan);
                modelo.addAttribute("lPlanDeEstudios", lPlanDeEstudios);

                //Sacamos los datos de la institucion
                Instituciones datosInstitucion = new Instituciones();
                datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
                datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
                if (datosInstitucion != null) {
                    modelo.addAttribute("datosInstitucion", datosInstitucion);
                }

                Instituciones datosInstitucionSede = new Instituciones();
                datosInstitucionSede.setId_institucion(this.GetUsuario().getId_almacen()); //--------------------------ESTATICO
                datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
                if (datosInstitucionSede != null) {
                    modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
                }

                //Sacamos el formato de la fecha
                Abm formatoFecha = new Abm();
                formatoFecha.setCampo("formato_fecha");
                formatoFecha.setCodigo("dibrap");
                modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

                return "reportesAcademicos/planDeEstudios/ListarPlanEstudios";
            }
            //Sacando la mencion del estudiante
            Menciones datosMencion = new Menciones();
            datosMencion = this.mi.getEstBuscarMencion(datosEstudiante);
            modelo.addAttribute("datosMencion", datosMencion);

            return "reportesAcademicos/planDeEstudios/ListarMenciones";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(iId_programa);
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(iId_programa);
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        return "reportesAcademicos/planDeEstudios/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/planDeEstudios/listarPlanEstudios.fautapo", method = RequestMethod.POST)
    public String listarPlanEstudios(@ModelAttribute("model") MencionPlanesModel model, ModelMap modelo) {

        int iId_programa = model.getId_programa();
        int iId_mencion = model.getId_mencion();
        int iId_estudiante = model.getId_estudiante();

        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(iId_programa);
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacando los datos del estudiante    
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(iId_estudiante);
        datosEstudiante.setId_programa(iId_programa);
        datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Sacando los datos personales del Estudiante encontrado
        Personas datosPersona = new Personas();
        datosPersona.setId_persona(datosEstudiante.getId_persona());
        datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
        modelo.addAttribute("datosPersona", datosPersona);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Buscamos el grado_academico por programa e id_plan
        Libretas datosGrados = new Libretas();
        datosGrados.setId_programa(datosEstudiante.getId_programa());
        datosGrados.setId_plan(datosEstudiante.getId_plan());
        datosGrados = this.mi.getBuscarGradoAcademicoPrograma(datosGrados);
        modelo.addAttribute("datosGrados", datosGrados);

        //Sacamos el listado de las materias del plan nuevo
        Planes datosPlan = new Planes();
        datosPlan.setId_programa(datosEstudiante.getId_programa());
        datosPlan.setId_plan(datosEstudiante.getId_plan());
        datosPlan.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
        datosPlan.setId_mencion(iId_mencion);
        List lPlanDeEstudios = this.mi.getListarMateriasPlanMencion(datosPlan);
        modelo.addAttribute("lPlanDeEstudios", lPlanDeEstudios);

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }

        Instituciones datosInstitucionSede = new Instituciones();
        datosInstitucionSede.setId_institucion(this.GetUsuario().getId_almacen()); //--------------------------ESTATICO
        datosInstitucionSede = this.mi.getBuscarInstitucionSede(datosInstitucionSede);
        if (datosInstitucionSede != null) {
            modelo.addAttribute("datosInstitucionsede", datosInstitucionSede);
        }

        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        return "reportesAcademicos/planDeEstudios/ListarPlanEstudios";
    }

}

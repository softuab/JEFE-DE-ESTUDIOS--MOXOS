/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Grupos;
import org.fautapo.domain.Instituciones;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Literales;
import org.fautapo.domain.Materias;
import org.fautapo.domain.Modelos_ahorros;
import org.fautapo.domain.Notas;
import org.fautapo.domain.Perfiles;
import org.fautapo.domain.Personas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.BuscarEstudiante;
import org.fautapo.model.CertificadoNotalModel;
import org.fautapo.model.EstudiantePlanNuevoModel;
import org.fautapo.model.EstudianteProgramaModel;
import org.fautapo.model.ParametrosConvalidacionEntradas;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.PasswordClaveModel;
import org.fautapo.model.PasswordModelEstudiante;
import org.fautapo.util.Convert;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
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
public class EstudiantesController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;
    @Autowired
    private HttpServletRequest request1;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/imprimirHistorialAcademicoTipoCarrera/entrada.fautapo", method = RequestMethod.GET)
    public String ImprimirHistorial(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        PasswordClaveModel model = new PasswordClaveModel();
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("model", model);
        return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/Entrada";
    }

    @RequestMapping(value = "/listarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlans(@ModelAttribute("model") @Validated EstudianteProgramaModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("nombres", cliente.getNombres());
            return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/Entrada";
        }

        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());

        return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/listarProgramasPlanesVolver.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlans(@ModelAttribute("model") EstudianteProgramaModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());

        return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/buscarestudiante.fautapo", method = RequestMethod.POST)
    public String buscarestudiante(@ModelAttribute("model") EstudianteProgramaModel model, ModelMap modelo) {
        //Buscar Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);
        BuscarEstudiante buscar = new BuscarEstudiante();
        buscar.setId_programa(model.getId_programa());
        modelo.addAttribute("model", buscar);
        return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/BuscarEstudiantes";
    }

    @RequestMapping(value = "/listarHistorialAcademico.fautapo", method = RequestMethod.POST)
    public String ImprimirHistorialAcademico(HttpServletRequest request, ModelMap modelo) {

        Estudiantes datosEstudiante = new Estudiantes();

        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_programa = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");

        if (tipobusqueda == null) {
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
        } else {
            valor = request.getParameter("busqueda");
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
        }

        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_programa", sId_programa);

        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(Integer.parseInt(sId_programa));
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi))) {
            return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/BuscarEstudiantes";
        }

        if ((!"".equals(sId_estudiante)) && (sId_estudiante != null)) {
            //Sacando los datos del estudiante
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "Error";
            }
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.");
                return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/Aviso";
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

            //Listamos la ficha academica CONVALIDADA del estudiante
            List lMaterias = this.mi.getListarPlanMateriasNotas3(datosEstudiante);
            List lMateriasNotas = new ArrayList();
            for (int i = 0; i < lMaterias.size(); i++) {
                Notas datosNotas = (Notas) lMaterias.get(i);
                Literales literal = new Literales();
                datosNotas.setLiteral(literal.convertNumber(datosNotas.getNota()));
                System.out.println("tipo_evaluacion " + datosNotas.getTipo_evaluacion());
                System.out.println("gestion  " + datosNotas.getGestion());
                System.out.println("id_materia  " + datosNotas.getId_materia());
                System.out.println("nota  " + datosNotas.getNota());
                lMateriasNotas.add(i, datosNotas);
            }
            modelo.addAttribute("lMaterias", lMateriasNotas);

            List lFichaAcademica = this.mi.getEstListarFichaAcademicaConvalidada2(datosEstudiante);

            modelo.addAttribute("total_materias_aprobadas", Integer.toString(lFichaAcademica.size()));

            //Sacamos el plan de estudios
            Planes datosPlan = new Planes();
            datosPlan.setId_programa(datosEstudiante.getId_programa());
            datosPlan.setId_plan(datosEstudiante.getId_plan());
            datosPlan.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
            List lPlanDeEstudios = this.mi.getListarMateriasPlanRequisitos(datosPlan);
            //   modelo.addAttribute("total_materias_plan", Integer.toString(lPlanDeEstudios.size()));
            modelo.addAttribute("total_materias_plan", Integer.toString(lMateriasNotas.size()));

            //Sacamos el porcentaje de materias aprobadas
            double porcentaje = (lFichaAcademica.size() % lPlanDeEstudios.size()) * 100;
            modelo.addAttribute("porcentaje", Double.toString(porcentaje));

            //Sacamos el porcentaje de materias aprobadas
            Notas datosNota = new Notas();
            datosNota.setId_estudiante(datosEstudiante.getId_estudiante());
            double promedio = this.mi.getBuscarPromedioDeNotas(datosNota);
            modelo.addAttribute("promedio", Double.toString(promedio));

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
            return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/ImprimirHistorialAcademico";
        }
        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            //  List lEstudiantes = this.mi.getEstListarEstudiantesDip(datosEstudiante);
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        return "reportesAcademicos/imprimirHistorialAcademicoTipoCarrera/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/buscarEstudianteEntrada.fautapo", method = RequestMethod.GET)
    public String buscarEstudiante(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Docentes docentes = new Docentes();
        PasswordClaveModel model = new PasswordClaveModel();
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("model", model);
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        return "busquedasAcademicas/buscarEstudiante/Entrada";
    }

    @RequestMapping(value = "/bucarEstudiantes/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String buscarEstudianteComprobarEntrada(@ModelAttribute("model") @Validated ParametrosConvalidacionEntradas model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "busquedasAcademicas/buscarEstudiante/Entrada";
        }
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("simagen", cliente.getImagen());
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        return "busquedasAcademicas/buscarEstudiante/ComprobarEntrada";
    }

    @RequestMapping(value = "/bucarEstudiantesVolver/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String buscarEstudianteComprobarEntrada(@ModelAttribute("model") ParametrosConvalidacionEntradas model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("simagen", cliente.getImagen());
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        return "busquedasAcademicas/buscarEstudiante/ComprobarEntrada";
    }

    @RequestMapping(value = "/buscarestudiante1.fautapo", method = RequestMethod.POST)
    public String buscarestudiante1(@ModelAttribute("model") EstudianteProgramaModel model, ModelMap modelo) {
        //Buscar Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);
        BuscarEstudiante buscar = new BuscarEstudiante();
        buscar.setId_programa(model.getId_programa());
        modelo.addAttribute("model", buscar);
        return "busquedasAcademicas/buscarEstudiante/BuscarEstudiante";
    }

    @RequestMapping(value = "/buscarEstudiante.fautapo", method = RequestMethod.POST)
    public String buscarEstudianteEntrada(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";

        int sId_programa = Integer.parseInt(request.getParameter("id_programa"));

        if (tipobusqueda == null) {

        } else {
            valor = request.getParameter("buscar");
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombres") ? valor : "";
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
        }
        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(sId_programa);
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi))) {
            Docentes docentes = new Docentes();
            docentes.setId_docente(cliente.getId_usuario());
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "busquedasAcademicas/buscarEstudiante/BuscarEstudiante";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "Para el R.U. inserte un dato entero ");
                return "busquedasAcademicas/buscarEstudiante/Aviso1";
            }
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(sId_programa);
            datosEstudiante.setId_estudiante(Convert.ToInteger(sId_estudiante));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                //return new ModelAndView("administrarConvalidacionManual/Aviso","mensaje","El estudiante con R.U. : "+ sId_estudiante + "no esta registrado en el Programa : "+ datosPrograma.getPrograma() + ". Verifique.");
                modelo.addAttribute("mensaje", "El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.");
                return "busquedasAcademicas/buscarEstudiante/Aviso";
            }

            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            datosEstudiante = this.mi.getEstBuscarEstudianteAccesos(datosEstudiante);
            modelo.put("datosEstudiante", datosEstudiante);

            datosEstudiante = this.mi.getEstBuscarEstudianteNombres(datosEstudiante);
            List lEstudiantes = new ArrayList();
            lEstudiantes.add(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            modelo.addAttribute("usuario", cliente.getNombres());
            return "busquedasAcademicas/buscarEstudiante/ListarEstudiantes";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi + "%");
            List lEstudiantes = this.mi.getEstListarEstudiantesDip2(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            modelo.addAttribute("usuario", cliente.getNombres());
            return "busquedasAcademicas/buscarEstudiante/ListarEstudiantes";
        }
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesNombresAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            modelo.addAttribute("usuario", cliente.getNombres());
            return "busquedasAcademicas/buscarEstudiante/ListarEstudiantes";
        }

        Docentes docentes = new Docentes();
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        return "busquedasAcademicas/buscarEstudiante/BuscarEstudiante";
    }

    @RequestMapping(value = "/cambioPlanEstudiante.fautapo", method = RequestMethod.GET)
    public String cambioPlanEstudiante(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        PasswordClaveModel model = new PasswordClaveModel();
        Docentes docentes = new Docentes();
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "cambioPlanEstudiante/Entrada";
    }

    @RequestMapping(value = "/cambioPlanEstudianteVolver.fautapo", method = RequestMethod.POST)
    public String cambioPlanEstudianteVolver(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        PasswordClaveModel model = new PasswordClaveModel();
        Docentes docentes = new Docentes();
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "cambioPlanEstudiante/Entrada";
    }

    @RequestMapping(value = "/cambiolistarPlanes.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlanes(@ModelAttribute("model") @Validated PasswordModelEstudiante model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("cliente", cliente);
            return "cambioPlanEstudiante/Entrada";
        }
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "cambioPlanEstudiante/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/cambiolistarPlanesVolver.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlanesVolver(@ModelAttribute("model") PasswordModelEstudiante model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "cambioPlanEstudiante/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/cambioBuscarEstudiante.fautapo", method = RequestMethod.POST)
    public String BuscarEstudianteCambio(@ModelAttribute("model") ParametrosEntrada model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");

        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "cambioPlanEstudiante/EntradaBusqueda";
    }

    @RequestMapping(value = "/listarPlanes1.fautapo", method = RequestMethod.POST)
    public String handleRequest(@ModelAttribute("model") PasswordModelEstudiante model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        Docentes docentes = new Docentes();
        docentes.setId_docente(cliente.getId_usuario());

        String sId_estudiante = request.getParameter("id_estudiante");

        // Comprobamos es quien debe, de acuerdo a su clave
        Usuarios datosUsuario = new Usuarios();
        datosUsuario.setId_usuario(cliente.getId_usuario());
        datosUsuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        //Sacamos los datos del Estudiante
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(model.getId_estudiante());
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Listamos los planes de estudio
        Planes datosPlan = new Planes();
        datosPlan.setId_programa(datosEstudiante.getId_programa());
        List lPlanesEstudio = this.mi.getListarPrgPlanesActual(datosPlan);
        modelo.addAttribute("lPlanesEstudio", lPlanesEstudio);

        //Sacamos el nombre del Estudiante
        datosEstudiante = this.mi.getEstBuscarEstudianteNombres(datosEstudiante);
        modelo.addAttribute("datosEstudiante2", datosEstudiante);
        modelo.addAttribute("usuario", cliente.getNombres());

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "cambioPlanEstudiante/Aviso";
            }
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            datosEstudiante = this.mi.getEstBuscarEstudianteAccesos(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante no es de su Area Verifique");
                return "cambioPlanEstudiante/Aviso";
            }
        }
        return "cambioPlanEstudiante/ListarPlanes";
    }

    @RequestMapping(value = "/registrarCambioPlan.fautapo", method = RequestMethod.POST)
    public String registrarCambioPlan(@ModelAttribute("model") EstudiantePlanNuevoModel model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (("".equals(request.getParameter("id_estudiante"))) || ("".equals(request.getParameter("id_plan_nuevo")))) {
            modelo.addAttribute("mensaje", "Faltan datos el cambio no puede completarse");
            return "cambioPlanEstudiante/Error";
        }
        String sId_plan_nuevo = request.getParameter("id_plan_nuevo");
        //Sacamos los datos del Estudiante
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(model.getId_estudiante());
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);

        if (!(sId_plan_nuevo).equals(datosEstudiante.getId_plan())) {
            Planes datosPlan = new Planes();
            datosPlan.setId_estudiante(model.getId_estudiante());
            datosPlan.setId_plan(Convert.ToString(model.getId_plan_nuevo()));
            datosPlan.setId_rol(cliente.getId_rol());
            datosPlan.setUlt_usuario(cliente.getId_usuario());
            int iResultado = this.mi.setEstRegistrarCambioPlan(datosPlan);
            if (iResultado == 1) {
                modelo.addAttribute("mensaje", "El cambio de plan se registro correctamente");
                return "cambioPlanEstudiante/Aviso";
            }
        }
        modelo.addAttribute("mensaje", "El cambio de plan no se registro");
        return "cambioPlanEstudiante/Error";
    }

    @RequestMapping(value = "/verFichaAcademicaAutoridad/entrada.fautapo", method = RequestMethod.GET)
    public String verFichaAcademicaAutoridad(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Docentes docentes = new Docentes();
        PasswordClaveModel model = new PasswordClaveModel();
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "reportesAcademicos/verFichaAcademicaAutoridad/Entrada";
    }

    @RequestMapping(value = "/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String verFichaAcademicacomprobarEntrada(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("cliente", cliente);
            return "reportesAcademicos/verFichaAcademicaAutoridad/Entrada";
        }
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        // Comprobamos si es quien debe ingresar al modulo, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/verFichaAcademicaAutoridad/BuscarEstudiantes";
    }

    @RequestMapping(value = "/comprobarEntradaVolver.fautapo", method = RequestMethod.POST)
    public String verFichaAcademicacomprobarEntradaVolver(@ModelAttribute("model") ParametrosEntrada model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        // Comprobamos si es quien debe ingresar al modulo, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/verFichaAcademicaAutoridad/BuscarEstudiantes";
    }

    @RequestMapping(value = "/listarFichaAcademica.fautapo", method = RequestMethod.POST)
    public String listarFichaAcademica(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        if (tipobusqueda == null) {
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
        } else {
            valor = request.getParameter("busqueda");
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
        }

        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);

        if (("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi)))
                || (sId_estudiante == null) && (sNombres == null) && (sCi == null)) {
            return "reportesAcademicos/verFichaAcademicaAutoridad/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "reportesAcademicos/verFichaAcademicaAutoridad/Aviso";
            }
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            datosEstudiante = this.mi.getEstBuscarEstudianteAccesos(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante no es de su Area Verifique");
                return "reportesAcademicos/verFichaAcademicaAutoridad/Aviso";
            }
            //Sacamos los datos del Programa
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(datosEstudiante.getId_programa());
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            modelo.addAttribute("datosPrograma", datosPrograma);

            //Listamos la ficha academica del estudiante
            List lFichaAcademica = this.mi.getEstListarFichaAcademica(datosEstudiante);
            modelo.addAttribute("lFichaAcademica", lFichaAcademica);

            //Listamos la ficha academica convalidada del estudiante
            List lFichaAcademicaConvalidada = this.mi.getEstListarFichaAcademicaConvalidada2(datosEstudiante);
            modelo.addAttribute("lFichaAcademicaConvalidada", lFichaAcademicaConvalidada);

            //Sacamos los datos del Estudiante
            datosEstudiante = this.mi.getEstBuscarEstudianteNombres(datosEstudiante);
            modelo.addAttribute("datosEstudiante2", datosEstudiante);
            modelo.addAttribute("usuario", cliente.getNombres());
            return "reportesAcademicos/verFichaAcademicaAutoridad/ListarFichaAcademica";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesNombresAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/verFichaAcademicaAutoridad/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/listarFichaAcademica1.fautapo", method = RequestMethod.POST)
    public String listarFichaAcademica1(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        if (tipobusqueda == null) {
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
        } else {
            valor = request.getParameter("busqueda");
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
        }

        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);

        if (("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi)))
                || (sId_estudiante == null) && (sNombres == null) && (sCi == null)) {
            return "reportesAcademicos/verFichaAcademicaAutoridad/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "Error";
            }
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            datosEstudiante = this.mi.getEstBuscarEstudianteAccesos(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante no es de su Area Verifique");
                return "reportesAcademicos/verFichaAcademicaAutoridad/Aviso";
            }
            //Sacamos los datos del Programa
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(datosEstudiante.getId_programa());
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            modelo.addAttribute("datosPrograma", datosPrograma);

            //Listamos la ficha academica del estudiante
            List lFichaAcademica = this.mi.getEstListarFichaAcademica(datosEstudiante);
            modelo.addAttribute("lFichaAcademica", lFichaAcademica);

            //Listamos la ficha academica convalidada del estudiante
            List lFichaAcademicaConvalidada = this.mi.getEstListarFichaAcademicaConvalidada2(datosEstudiante);
            modelo.addAttribute("lFichaAcademicaConvalidada", lFichaAcademicaConvalidada);

            //Sacamos los datos del Estudiante
            datosEstudiante = this.mi.getEstBuscarEstudianteNombres(datosEstudiante);
            modelo.addAttribute("datosEstudiante2", datosEstudiante);
            modelo.addAttribute("usuario", cliente.getNombres());
            return "reportesAcademicos/verFichaAcademicaAutoridad/ListarFichaAcademica";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesNombresAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/verFichaAcademicaAutoridad/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/verDatosEstudiante/mostrarDatos.fautapo", method = RequestMethod.GET)
    public String verDatosEstudiante(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        return "busquedasAcademicas/verDatosEstudiante/BuscarEstudiantes";
    }

    @RequestMapping(value = "/mostrarDatos.fautapo", method = RequestMethod.POST)
    public String verDatosMostrar(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";

        if (tipobusqueda == null) {
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
        } else {
            valor = request.getParameter("buscar");
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombres") ? valor : "";
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
        }

        if (("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi)))
                || (sId_estudiante == null) && (sNombres == null) && (sCi == null)) {
            Docentes docentes = new Docentes();
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "busquedasAcademicas/verDatosEstudiante/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "busquedasAcademicas/verDatosEstudiante/Error";
            }
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            datosEstudiante = this.mi.getEstBuscarEstudianteAccesos(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante no es de su Area Verifique");
                return "busquedasAcademicas/verDatosEstudiante/Aviso";
            }

            //Buscar al estudiante
            datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);

            //Listamos sus matriculas
            List lMatriculasEstudiante = this.mi.getMtrListarMatriculasEstudiante(datosEstudiante);
            modelo.addAttribute("lMatriculasEstudiante", lMatriculasEstudiante);

            //Mostramos la imagen del estudiante, siempre sera uno por imagen cargada
            Estudiantes imagenEst = new Estudiantes();
            imagenEst.setId_estudiante(datosEstudiante.getId_estudiante());
            imagenEst.setId_estado("I");
            List lImagenes = this.mi.getListarAdjuntosEstudiante(imagenEst);
            modelo.addAttribute("lImagenes", lImagenes);

            //Buscar Persona Colegio
            Personas datosPrs = new Personas();
            datosPrs.setId_persona(datosEstudiante.getId_persona());
            datosPrs = this.mi.getPrsBuscarPersona(datosPrs);
            Personas datosCol = this.mi.getBuscarPersonaColegio(datosPrs);
            modelo.addAttribute("datosPrs", datosPrs);
            modelo.addAttribute("datosCol", datosCol);

            //Sacamos el tipo clasificacion estudiante
            Estudiantes datosClasificacion = new Estudiantes();
            datosClasificacion.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosClasificacion = this.mi.getBuscarTipoClasificacionEstudiante(datosClasificacion);
            modelo.addAttribute("datosClasificacion", datosClasificacion);

            //Listar PrsDocumentos y Prs_compromisos
            Personas documento = new Personas();
            documento.setId_persona(datosEstudiante.getId_persona());
            List lPrsCompromisosTodo = this.mi.getListarPrsCompromisosPersona(documento);
            modelo.addAttribute("lPrsCompromisosTodo", lPrsCompromisosTodo);

            //Desde aqui
            Estudiantes datosClas = new Estudiantes();
            datosClas.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosClas = this.mi.getBuscarTipoClasificacionEstudiante(datosClas);
            if (datosClas == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U.: " + sId_estudiante + " no tiene registrado el tipo de clasificacion por lo que no ver su documentacion. actualice sus datos como estudiante.");
                return "Aviso";
            }

            datosClas.setId_persona(datosEstudiante.getId_persona());

            List lPrsDocumentosClasificacion = this.mi.getListarPrsDocumentosClasificacion(datosClas);
            //List lPrsDocumentosTodo= this.mi.getListarPrsDocumentosPersona(documento);
            modelo.addAttribute("lPrsDocumentosTodo", lPrsDocumentosClasificacion);

            //Hasta aqui 
            //Listar el ultimo est_regularizacion
            Estudiantes lUltimoEstRegularizacion = this.mi.getMiBuscarUltimoEstRegularizacion(datosEstudiante);
            modelo.addAttribute("lUltimoEstRegularizacion", lUltimoEstRegularizacion);

            //Listar Est Deudas
            List lDeudasEstudiante = this.mi.getListarDeudasEstudiante(datosEstudiante);
            modelo.addAttribute("lDeudasEstudiante", lDeudasEstudiante);

            //Listar Detalle de ventas
            Perfiles datosPerfiles = new Perfiles();
            datosPerfiles.setId_estudiante(Integer.parseInt(sId_estudiante));
            List lDetalleVentas = this.mi.getPstListarPerfiles(datosPerfiles);
            modelo.addAttribute("lDetalleVentas", lDetalleVentas);

            List lDetalleVentasEntidades = this.mi.getPstListarPerfilesEntidad(datosPerfiles);
            modelo.addAttribute("lDetalleVentasEntidad", lDetalleVentasEntidades);

            //Listar Detalle de Auxiliarias de Docencia
            Estudiantes datosAuxiliares = new Estudiantes();
            datosAuxiliares.setId_estudiante(Integer.parseInt(sId_estudiante));
            List lDetalleAuxiliares = this.mi.getBuscarEstudianteAuxiliarTodas(datosAuxiliares);
            modelo.addAttribute("lDetalleAuxiliares", lDetalleAuxiliares);
            modelo.addAttribute("usuario", cliente.getNombres());
            return "busquedasAcademicas/verDatosEstudiante/MostrarDatosEstudiante";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesNombresAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        return "busquedasAcademicas/verDatosEstudiante/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/mostrarDatos1.fautapo", method = RequestMethod.POST)
    public String mostrarDatos1(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";

        if (tipobusqueda == null) {
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
        } else {
            valor = request.getParameter("buscar");
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombres") ? valor : "";
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
        }

        if (("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi)))
                || (sId_estudiante == null) && (sNombres == null) && (sCi == null)) {
            Docentes docentes = new Docentes();
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "busquedasAcademicas/verDatosEstudiante/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "busquedasAcademicas/verDatosEstudiante/Error";
            }
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            datosEstudiante = this.mi.getEstBuscarEstudianteAccesos(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante no es de su Area Verifique");
                return "busquedasAcademicas/verDatosEstudiante/Aviso";
            }

            //Buscar al estudiante
            datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);

            //Listamos sus matriculas
            List lMatriculasEstudiante = this.mi.getMtrListarMatriculasEstudiante(datosEstudiante);
            modelo.addAttribute("lMatriculasEstudiante", lMatriculasEstudiante);

            //Mostramos la imagen del estudiante, siempre sera uno por imagen cargada
            Estudiantes imagenEst = new Estudiantes();
            imagenEst.setId_estudiante(datosEstudiante.getId_estudiante());
            imagenEst.setId_estado("I");
            List lImagenes = this.mi.getListarAdjuntosEstudiante(imagenEst);
            modelo.addAttribute("lImagenes", lImagenes);

            //Buscar Persona Colegio
            Personas datosPrs = new Personas();
            datosPrs.setId_persona(datosEstudiante.getId_persona());
            datosPrs = this.mi.getPrsBuscarPersona(datosPrs);
            Personas datosCol = this.mi.getBuscarPersonaColegio(datosPrs);
            modelo.addAttribute("datosPrs", datosPrs);
            modelo.addAttribute("datosCol", datosCol);

            //Sacamos el tipo clasificacion estudiante
            Estudiantes datosClasificacion = new Estudiantes();
            datosClasificacion.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosClasificacion = this.mi.getBuscarTipoClasificacionEstudiante(datosClasificacion);
            modelo.addAttribute("datosClasificacion", datosClasificacion);

            //Listar PrsDocumentos y Prs_compromisos
            Personas documento = new Personas();
            documento.setId_persona(datosEstudiante.getId_persona());
            List lPrsCompromisosTodo = this.mi.getListarPrsCompromisosPersona(documento);
            modelo.addAttribute("lPrsCompromisosTodo", lPrsCompromisosTodo);

            //Desde aqui
            Estudiantes datosClas = new Estudiantes();
            datosClas.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosClas = this.mi.getBuscarTipoClasificacionEstudiante(datosClas);
            if (datosClas == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U.: " + sId_estudiante + " no tiene registrado el tipo de clasificacion por lo que no ver su documentacion. actualice sus datos como estudiante.");
                return "Aviso";
            }

            datosClas.setId_persona(datosEstudiante.getId_persona());

            List lPrsDocumentosClasificacion = this.mi.getListarPrsDocumentosClasificacion(datosClas);
            //List lPrsDocumentosTodo= this.mi.getListarPrsDocumentosPersona(documento);
            modelo.addAttribute("lPrsDocumentosTodo", lPrsDocumentosClasificacion);

            //Hasta aqui 
            //Listar el ultimo est_regularizacion
            Estudiantes lUltimoEstRegularizacion = this.mi.getMiBuscarUltimoEstRegularizacion(datosEstudiante);
            modelo.addAttribute("lUltimoEstRegularizacion", lUltimoEstRegularizacion);

            //Listar Est Deudas
            List lDeudasEstudiante = this.mi.getListarDeudasEstudiante(datosEstudiante);
            modelo.addAttribute("lDeudasEstudiante", lDeudasEstudiante);

            //Listar Detalle de ventas
            Perfiles datosPerfiles = new Perfiles();
            datosPerfiles.setId_estudiante(Integer.parseInt(sId_estudiante));
            List lDetalleVentas = this.mi.getPstListarPerfiles(datosPerfiles);
            modelo.addAttribute("lDetalleVentas", lDetalleVentas);

            List lDetalleVentasEntidades = this.mi.getPstListarPerfilesEntidad(datosPerfiles);
            modelo.addAttribute("lDetalleVentasEntidad", lDetalleVentasEntidades);

            //Listar Detalle de Auxiliarias de Docencia
            Estudiantes datosAuxiliares = new Estudiantes();
            datosAuxiliares.setId_estudiante(Integer.parseInt(sId_estudiante));
            List lDetalleAuxiliares = this.mi.getBuscarEstudianteAuxiliarTodas(datosAuxiliares);
            modelo.addAttribute("lDetalleAuxiliares", lDetalleAuxiliares);
            modelo.addAttribute("usuario", cliente.getNombres());
            return "busquedasAcademicas/verDatosEstudiante/MostrarDatosEstudiante";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_universidad(cliente.getId_universidad());
            datosEstudiante.setId_facultad(cliente.getId_facultad());
            datosEstudiante.setId_programa(cliente.getId_programa());
            List lEstudiantes = this.mi.getEstListarEstudiantesNombresAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        return "busquedasAcademicas/verDatosEstudiante/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/imprimirCertificadoNotas/entrada.fautapo", method = RequestMethod.GET)
    public String imprimirCertificadoNotas(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "reportesAcademicos/imprimirCertificadoNotas/Entrada";
    }

    @RequestMapping(value = "/imprimirCertificadoNotasVol/listarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String ImprimirlistarProgramasPlanesVol(@ModelAttribute("model") CertificadoNotalModel model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sTodas = request.getParameter("todas");
        //  String sNro = request.getParameter("nro");

        String sNroCertificado = request.getParameter("nrocertificado");
        String sObservacion = request.getParameter("observacion");
        //   String sNivel = request.getParameter("nivel");

        // Comprobamos si es quien debe ingresar al modulo, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        //  modelo.addAttribute("nro", sNro);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("nrocertificado", sNroCertificado);
        modelo.addAttribute("observacion", sObservacion);
        //      modelo.addAttribute("nivel", sNivel);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/imprimirCertificadoNotas/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/imprimirCertificadoNotas/listarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String ImprimirlistarProgramasPlanes(@ModelAttribute("model") @Validated CertificadoNotalModel model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "reportesAcademicos/imprimirCertificadoNotas/Entrada";
        }
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sTodas = request.getParameter("todas");
        //  String sNro = request.getParameter("nro");

        String sNroCertificado = request.getParameter("nrocertificado");
        String sObservacion = request.getParameter("observacion");
        //   String sNivel = request.getParameter("nivel");

        // Comprobamos si es quien debe ingresar al modulo, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        //  modelo.addAttribute("nro", sNro);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("nrocertificado", sNroCertificado);
        modelo.addAttribute("observacion", sObservacion);
        //      modelo.addAttribute("nivel", sNivel);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/imprimirCertificadoNotas/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/imprimirCertificadoNotas/listarProgramasPlanes1.fautapo", method = RequestMethod.POST)
    public String ImprimirlistarProgramasPlanes(@ModelAttribute("model") CertificadoNotalModel model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sNroCertificado = request.getParameter("nrocertificado");
        String sObservacion = request.getParameter("observacion");
        String sTodas = request.getParameter("todas");

        if ((sId_programa != null) && (sTodas != null) && (!"".equals(sTodas))) {
            modelo.addAttribute("gestion", sGestion);
            modelo.addAttribute("periodo", sPeriodo);
            modelo.addAttribute("id_programa", sId_programa);
            modelo.addAttribute("todas", sTodas);
            //  modelo.addAttribute("nro", sNro);

            modelo.addAttribute("nrocertificado", sNroCertificado);
            modelo.addAttribute("observacion", sObservacion);
            //modelo.addAttribute("nivel", sNivel);

            //Buscar Programa
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(Integer.parseInt(sId_programa));
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            modelo.addAttribute("datosPrograma", datosPrograma);

            return "reportesAcademicos/imprimirCertificadoNotas/BuscarEstudiantes";
        }
        return "reportesAcademicos/imprimirCertificadoNotas/BuscarEstudiantes";
    }

    @RequestMapping(value = "/imprimirCertificadoNotas/listarCertificadoNotas.fautapo", method = RequestMethod.POST)
    public String listarCertificadosNotas(@ModelAttribute("model") CertificadoNotalModel model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;

        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";

        if (tipobusqueda == null) {
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
        } else {
            valor = request.getParameter("busqueda");
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
        }
        List lNotas = new ArrayList();

        //Recuperando variables del jsp
        // sId_estudiante = request.getParameter("id_estudiante");
        // sCi = request.getParameter("ci");
        //  sNombres = request.getParameter("nombres");
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sTodas = request.getParameter("todas");

        String sNroCertificado = request.getParameter("nrocertificado");
        String sObservacion = request.getParameter("observacion");

        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_programa", sId_programa);
        modelo.addAttribute("todas", sTodas);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("nrocertificado", sNroCertificado);
        modelo.addAttribute("observacion", sObservacion);

        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(Integer.parseInt(sId_programa));
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi))) {
            return "reportesAcademicos/imprimirCertificadoNotas/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "Error";
            }
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.");
                return "reportesAcademicos/imprimirCertificadoNotas/Aviso";
            }
            datosEstudiante.setGestion(Integer.parseInt(sGestion));
            datosEstudiante.setPeriodo(Integer.parseInt(sPeriodo));

            //Sacamos los datos del certificado
            if ("Si".equals(sTodas)) {
                lNotas = this.mi.getListarCertificadoNotasTodas2(datosEstudiante);
            }
            if ("No".equals(sTodas)) {
                lNotas = this.mi.getListarCertificadoNotasAprobadas2(datosEstudiante);
            }

            List lMateriasNotas = new ArrayList();
            for (int i = 0; i < lNotas.size(); i++) {
                Libretas datosLibreta = (Libretas) lNotas.get(i);
                Literales literal = new Literales();
                datosLibreta.setLiteral(literal.convertNumber(datosLibreta.getNota()));
                lMateriasNotas.add(i, datosLibreta);
            }
            modelo.addAttribute("lMateriasNotas", lMateriasNotas);

            //Buscamos el grado_academico por programa e id_plan
            Libretas datosGrados = new Libretas();
            datosGrados.setId_programa(datosEstudiante.getId_programa());
            datosGrados.setId_plan(datosEstudiante.getId_plan());
            datosGrados = this.mi.getBuscarGradoAcademicoPrograma(datosGrados);
            modelo.addAttribute("datosGrados", datosGrados);

            //Sacamos los datos de la Facultad
            Facultades datosFacultad = new Facultades();
            datosFacultad.setId_facultad(datosPrograma.getId_facultad());
            datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
            modelo.addAttribute("datosFacultad", datosFacultad);

            //Sacamos los datos del Estudiante
            datosEstudiante = new Estudiantes();
            datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosEstudiante = this.mi.getEstBuscarEstudianteNombres(datosEstudiante);
            modelo.addAttribute("datosEstudiante2", datosEstudiante);

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

            return "reportesAcademicos/imprimirCertificadoNotas/ListarCertificadoNotas";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            //List lEstudiantes = this.mi.getEstListarEstudiantesDip(datosEstudiante);
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/imprimirCertificadoNotas/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/listarCertificadoNotas1.fautapo", method = RequestMethod.POST)
    public String listarCertificados1(@ModelAttribute("model") CertificadoNotalModel model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";

        if (tipobusqueda == null) {
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
        } else {
            valor = request.getParameter("busqueda");
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
        }
        List lNotas = new ArrayList();

        //Recuperando variables del jsp
        // sId_estudiante = request.getParameter("id_estudiante");
        // sCi = request.getParameter("ci");
        //  sNombres = request.getParameter("nombres");
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sTodas = request.getParameter("todas");

        String sNroCertificado = request.getParameter("nrocertificado");
        String sObservacion = request.getParameter("observacion");

        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_programa", sId_programa);
        modelo.addAttribute("todas", sTodas);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        modelo.addAttribute("nrocertificado", sNroCertificado);
        modelo.addAttribute("observacion", sObservacion);

        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(Integer.parseInt(sId_programa));
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi))) {
            return "reportesAcademicos/imprimirCertificadoNotas/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "Error";
            }
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.");
                return "reportesAcademicos/imprimirCertificadoNotas/Aviso";
            }
            datosEstudiante.setGestion(Integer.parseInt(sGestion));
            datosEstudiante.setPeriodo(Integer.parseInt(sPeriodo));

            //Sacamos los datos del certificado
            if ("Si".equals(sTodas)) {
                lNotas = this.mi.getListarCertificadoNotasTodas2(datosEstudiante);
            }
            if ("No".equals(sTodas)) {
                lNotas = this.mi.getListarCertificadoNotasAprobadas2(datosEstudiante);
            }

            List lMateriasNotas = new ArrayList();
            for (int i = 0; i < lNotas.size(); i++) {
                Libretas datosLibreta = (Libretas) lNotas.get(i);
                Literales literal = new Literales();
                datosLibreta.setLiteral(literal.convertNumber(datosLibreta.getNota()));
                lMateriasNotas.add(i, datosLibreta);
            }
            modelo.addAttribute("lMateriasNotas", lMateriasNotas);

            //Buscamos el grado_academico por programa e id_plan
            Libretas datosGrados = new Libretas();
            datosGrados.setId_programa(datosEstudiante.getId_programa());
            datosGrados.setId_plan(datosEstudiante.getId_plan());
            datosGrados = this.mi.getBuscarGradoAcademicoPrograma(datosGrados);
            modelo.addAttribute("datosGrados", datosGrados);

            //Sacamos los datos de la Facultad
            Facultades datosFacultad = new Facultades();
            datosFacultad.setId_facultad(datosPrograma.getId_facultad());
            datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
            modelo.addAttribute("datosFacultad", datosFacultad);

            //Sacamos los datos del Estudiante
            datosEstudiante = new Estudiantes();
            datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosEstudiante = this.mi.getEstBuscarEstudianteNombres(datosEstudiante);
            modelo.addAttribute("datosEstudiante2", datosEstudiante);

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

            return "reportesAcademicos/imprimirCertificadoNotas/ListarCertificadoNotas";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            //List lEstudiantes = this.mi.getEstListarEstudiantesDip(datosEstudiante);
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        return "reportesAcademicos/imprimirCertificadoNotas/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/entradaAdmisionEstudianteAuxiliar.fautapo", method = RequestMethod.GET)
    public String entradaAdmisionEstudianteAuxiliar(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Docentes docentes = new Docentes();
        docentes.setId_docente(cliente.getId_usuario());
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "admisionAuxiliar/buscarEstudiante/Entrada";
    }

    @RequestMapping(value = "/AuxlistarProgramasPlanes.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlanesAux(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "admisionAuxiliar/buscarEstudiante/Entrada";
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        return "admisionAuxiliar/buscarEstudiante/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/AuxlistarProgramasPlanesVolver.fautapo", method = RequestMethod.POST)
    public String listarProgramasPlanesAux(@ModelAttribute("model") ParametrosEntrada model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        return "admisionAuxiliar/buscarEstudiante/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/buscarEstudianteAuxiliar.fautapo", method = RequestMethod.POST)
    public String BuscarEstudiante(@ModelAttribute("model") ParametrosEntrada model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");

        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "admisionAuxiliar/buscarEstudiante/EntradaBusqueda";
    }

    @RequestMapping(value = "/listarEstudianteAuxiliar.fautapo", method = RequestMethod.POST)
    public String listarEstudianteAuxiliar(@ModelAttribute("model") ParametrosEntrada model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;
        Estudiantes datosEstudianteAdmitido;
        //Recuperando variables del jsp
        String sId_estudiante = request.getParameter("id_estudiante");
        int sId_programa = Convert.ToInteger(request.getParameter("id_programa"));
        String sNombres = "";
        String sMensaje = "";

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido. Introduzca un numero");
                return "Error";
            }
            //Buscamos el programa
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(sId_programa);
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            datosEstudiante.setId_programa(sId_programa);
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                //return new ModelAndView("administrarConvalidacionManual/Aviso","mensaje","El estudiante con R.U. : "+ sId_estudiante + "no esta registrado en el Programa : "+ datosPrograma.getPrograma() + ". Verifique.");
                sMensaje = "El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.";
                modelo.addAttribute("mensaje", sMensaje);
                modelo.addAttribute("id_programa", model.getId_programa());
                modelo.addAttribute("gestion", model.getGestion());
                modelo.addAttribute("periodo", model.getPeriodo());
                return "admisionAuxiliar/buscarEstudiante/Aviso";
            }
            datosEstudiante.setGestion(model.getGestion());
            datosEstudiante.setPeriodo(model.getPeriodo());
            datosEstudiante = this.mi.getEstBuscarEstudianteNombresMatriculados(datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("gestion", model.getGestion());
                modelo.addAttribute("periodo", model.getPeriodo());
                modelo.addAttribute("id_programa", model.getId_programa());
                modelo.addAttribute("mensaje", "ESTUDIANTE NO MATRICULADO EN (" + model.getGestion() + "/" + model.getPeriodo() + ")");
                return "admisionAuxiliar/buscarEstudiante/Aviso";
                // return new ModelAndView("admisionAuxiliar/buscarEstudiante/Entrada", modelo);
            }
            datosEstudianteAdmitido = this.mi.getEstBuscarEstudianteAdmitidoAuxiliar(datosEstudiante);
            if (datosEstudianteAdmitido == null) {
                datosEstudiante.setAdjunto("Admitir");
            } else {
                datosEstudiante.setAdjunto("Eliminar");
            }

            List lEstudiantes = new ArrayList();
            lEstudiantes.add(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("id_programa", model.getId_programa());
            modelo.addAttribute("gestion", model.getGestion());
            modelo.addAttribute("periodo", model.getPeriodo());
            return "admisionAuxiliar/buscarEstudiante/ListarEstudiantes";
        } else {
            return "admisionAuxiliar/buscarEstudiante/Entrada";
        }
    }

    @RequestMapping(value = "/registrarAdmisionEstudianteAuxiliar.fautapo", method = RequestMethod.POST)
    public String registrarAdmisionEstudianteAuxiliar(@ModelAttribute("model") ParametrosEntrada model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);
        Estudiantes datosEstudiante = new Estudiantes();
        String sId_estudiante = request.getParameter("id_estudiante");
        int sId_programa = Convert.ToInteger(request.getParameter("id_programa"));
        String sAccion = request.getParameter("accion");

        datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosEstudiante.setId_rol(cliente.getId_rol());
        datosEstudiante.setUlt_usuario(cliente.getId_usuario());

        if ("Admitir".equals(sAccion)) {
            int x = this.mi.setRegistrarAdmisionEstudianteAuxiliar(datosEstudiante);
            modelo.addAttribute("mensaje", "EL ESTUDIANTE " + sId_estudiante + " FUE ADMITIDO COMO AUXILIAR");
            modelo.addAttribute("id_programa", sId_programa);
            return "admisionAuxiliar/buscarEstudiante/AvisoEntrada";
        } else {
            int y = this.mi.setEliminarAdmisionEstudianteAuxiliar(datosEstudiante);
            modelo.addAttribute("mensaje", "EL ESTUDIANTE " + sId_estudiante + " FUE ELIMINADO COMO AUXILIAR");
            return "admisionAuxiliar/buscarEstudiante/AvisoEntrada";
        }

        //modelo.addAttribute("usuario", cliente.getNombres());
        // modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        // modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        // modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        //return "admisionAuxiliar/buscarEstudiante/Entrada";
    }

    @RequestMapping(value = "/auxiliares/entradaAsignacionAuxiliar.fautapo", method = RequestMethod.GET)
    public String auxiliaresEntrada(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);

        return "asignacionAuxiliarMaterias/Entrada";
    }

    @RequestMapping(value = "/auxiliares/verProgramaPlanAsignacion.fautapo", method = RequestMethod.POST)
    public String verPrograma(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "asignacionAuxiliarMaterias/Entrada";
        }
        //Recuperamos las variables
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        // String sId_facultad = request.getParameter("id_facultad");

        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String iId_programa = request.getParameter("id_programa");
        String iId_prg_plan = request.getParameter("id_prg_plan");
        String iId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        //String sId_programa = request.getParameter("id_programa");
        //String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        //modelo.addAttribute("id_programa", sId_programa);
        //modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
        modelo.addAttribute("gestion", request.getParameter("gestion"));
        modelo.addAttribute("periodo", request.getParameter("periodo"));

        // Comprobamos es quien debe, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("gestion", request.getParameter("gestion"));
        modelo.addAttribute("periodo", request.getParameter("periodo"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());

        return "asignacionAuxiliarMaterias/ListarProgramasPlan";
    }

    @RequestMapping(value = "/auxiliares/listarMateriasProgramaPlan.fautapo", method = RequestMethod.POST)
    public String listarMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iId_programa = 0;
        // String sId_plan = "";
        //Recuperamos las variables
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        //sId_plan = request.getParameter("id_plan");
        String iId_prg_plan = request.getParameter("id_prg_plan");
        int iId_tipo_evaluacion = Integer.parseInt(request.getParameter("id_tipo_evaluacion"));
        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(Convert.ToInteger(iId_prg_plan));
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No existe el plan seleccionado en Programas - Planes");
            return "Aviso";
        }
        if (iId_tipo_evaluacion == 0) {
            modelo.addAttribute("mensaje", "Seleccione el Tipo de Evalucion");
            return "Aviso";
        }
        //Buscando el programa
        Programas programa = new Programas();
        programa.setId_programa(iId_programa);
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);
        //Buscar Tipo evaluacion
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(iId_tipo_evaluacion);
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);
        //Listamos las materias del plan mas sus grupos
        Modelos_ahorros aux = new Modelos_ahorros();
        aux.setId_programa(iId_programa);
        //   System.out.println("El id_programa dct -->" + Integer.toString(aux.getId_programa()));
        aux.setId_plan(datosPrgPlan.getId_plan());  //Sacando el plan de prg_planes
        //   System.out.println("El id_plan dct -->" + aux.getId_plan());
        aux.setGestion(iGestion);
        // System.out.println("La gestion dct -->" + Integer.toString(aux.getGestion()));
        aux.setPeriodo(iPeriodo);
        //  System.out.println("El periodo dct -->" + Integer.toString(aux.getPeriodo()));
        aux.setId_tipo_grado(datosPrgPlan.getId_tipo_grado()); //Sacando el id_tipo_grado Universitario-Vestibular
        // System.out.println("El id_tipo_grado dct -->" + Integer.toString(aux.getId_tipo_grado()));
        List listaPlanEstudio = this.mi.getListarPlanProgramaModeloAhorro(aux);
        for (int i = 0; i < listaPlanEstudio.size(); i++) {
            Modelos_ahorros materias = (Modelos_ahorros) listaPlanEstudio.get(i);
            aux.setId_materia(materias.getId_materia());
            // System.out.println("El id_materia dct -->" + Integer.toString(materias.getId_materia()));
            aux.setId_modelo_ahorro(materias.getId_modelo_ahorro());
            // System.out.println("El id_modelo_ahorro dct -->" + Integer.toString(materias.getId_modelo_ahorro()));
            aux.setId_tipo_evaluacion(iId_tipo_evaluacion);
            //  System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(aux.getId_tipo_evaluacion()));
            materias.setGrupos(this.mi.getDptoListarGruposMateriaTipoEvaluacionAuxiliares(aux));
            materias.setNro_grupos(materias.getGrupos().size());
            listaPlanEstudio.set(i, materias);
        }
        PagedListHolder listarplanestudios = new PagedListHolder(listaPlanEstudio);
        listarplanestudios.setPageSize(listarplanestudios.getNrOfElements());
        modelo.addAttribute("listarplanestudios", listarplanestudios);
        modelo.addAttribute("gestion", Integer.toString(iGestion));
        modelo.addAttribute("periodo", Integer.toString(iPeriodo));
        modelo.addAttribute("id_programa", request.getParameter("id_programa"));
        //modelo.addAttribute("id_plan", request.getParameter("id_plan"));
        modelo.addAttribute("id_materia", request.getParameter("id_materia"));
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("id_tipo_evaluacion", iId_tipo_evaluacion);
        return "asignacionAuxiliarMaterias/ListarMaterias";
    }

    @RequestMapping(value = "/auxiliares/nuevoAsignacionAuxiliar.fautapo", method = RequestMethod.POST)
    public String nuevoAsignacion(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        int iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        String sId_plan = request.getParameter("id_plan");
        String sAccion = request.getParameter("accion");
        String iId_materia = request.getParameter("id_materia");
        String iId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        int iId_dpto_grupo = Integer.parseInt(request.getParameter("id_dpto_grupo"));
        int iId_asignacion = Integer.parseInt(request.getParameter("id_asignacion"));
        int iId_prg_plan = Integer.parseInt(request.getParameter("id_prg_plan"));

        /*int iId_dpto_grupo = cliente.get(request, "id_dpto_grupo");
        int iId_asignacion = cliente.getInt(request, "id_asignacion");
        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");*/
        modelo.addAttribute("gestion", iGestion);
        modelo.addAttribute("periodo", iPeriodo);
        modelo.addAttribute("id_programa", iId_programa);
        modelo.addAttribute("programa", request.getParameter("programa"));
        modelo.addAttribute("id_materia", iId_materia);
        modelo.addAttribute("materia", request.getParameter("materia"));
        modelo.addAttribute("id_prg_plan", iId_prg_plan);
        modelo.addAttribute("id_asignacion", iId_asignacion);
        modelo.addAttribute("accion", sAccion);
        modelo.addAttribute("id_tipo_evaluacion", iId_tipo_evaluacion);
        System.out.println("ID_ASIGNACION = " + iId_asignacion);
        //Buscamos la asignacion del auxiliar
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(iId_asignacion);
        datosAsignacion = this.mi.getDctBuscarAsignacionAuxiliar(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        if (datosAsignacion != null) {
            //Buscamos al auxiliar docente     
            Docentes datosDocente = new Docentes();
            System.out.println("ID_DOCENTE = " + datosAsignacion.getId_docente());
            datosDocente.setId_docente(datosAsignacion.getId_docente());
            datosDocente = this.mi.getBuscarAuxiliar(datosDocente);
            modelo.addAttribute("datosDocente", datosDocente);
        }

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(iId_prg_plan);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No existe el Programa-Plan");
            return "Error";
        }

        //Buscamos dpto_grupo
        Grupos datosDptoGrupo = new Grupos();
        System.out.println("ID_DPTO_GRUPO = " + iId_dpto_grupo);
        datosDptoGrupo.setId_dpto_grupo(iId_dpto_grupo);
        datosDptoGrupo = this.mi.getDptoBuscarGrupo(datosDptoGrupo);

        modelo.addAttribute("datosDptoGrupo", datosDptoGrupo);
        if (datosDptoGrupo == null) {
            modelo.addAttribute("mensaje", "No existen datos en Dpto-Grupos");
            return "Error";
        }

        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(iId_programa);
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);

        //Sacamos los datos de la Materia
        Materias materia = new Materias();
        materia.setId_materia(datosDptoGrupo.getId_materia());  //Sacamos la materia de dpto_Grupo
        System.out.println("La id_materia buscando -->" + Integer.toString(materia.getId_materia()));
        materia = (Materias) this.mi.getMtrBuscarMateria(materia);
        modelo.addAttribute("materia", materia);

        //Listamos auxiliares de docencia 
        List lDocentesTodos = this.mi.getListarAuxiliaresTodos();
        modelo.addAttribute("lDocentesTodos", lDocentesTodos);

        System.out.println("Tamanio de la lista -->" + Integer.toString(lDocentesTodos.size()));

        //Listamos los tipos
        List lTiposDocentes = this.mi.getListarTiposDocentes();
        modelo.addAttribute("lTiposDocentes", lTiposDocentes);
        List lTiposAsignaciones = this.mi.getListarTiposAsignaciones();
        modelo.addAttribute("lTiposAsignaciones", lTiposAsignaciones);

        //Sacamos el formato de la fecha del sistema
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        if ("Eliminar".equals(sAccion)) {
            return "asignacionAuxiliarMaterias/ConfirmarAccionAsignacionAuxiliar";
        }
        //modelo.addAttribute("id_modelo_ahorro", Integer.toString(iId_modelo_ahorro));

        return "asignacionAuxiliarMaterias/NuevoAsignacionAuxiliar";
    }

    @RequestMapping(value = "/auxiliares/registrarAsignacionAuxiliar.fautapo", method = RequestMethod.POST)
    public String handleRequest(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        //Estatico id_docente
        //String sId_docente ="1";
        int iResultadoAsignacion = 0;
        int iId_docente = cliente.getInt(request, "id_docente");  //id_docente
        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");
        int iId_asignacion = cliente.getInt(request, "id_asignacion");
        int iId_dpto_grupo = cliente.getInt(request, "id_dpto_grupo");
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        int iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        String sId_plan = request.getParameter("id_plan");
        String sCargaHoraria = request.getParameter("carga_horaria");
        //int iId_materia  = Integer.parseInt(request.getParameter("id_materia"));
        String sId_materia = request.getParameter("id_materia");
        String sId_grupo = request.getParameter("id_grupo");
        //int iId_tipo_docente = Integer.parseInt(request.getParameter("id_tipo_docente"));
        //int iId_tipo_evaluacion = Integer.parseInt(request.getParameter("id_tipo_evaluacion"));
        //int iId_tipo_asignacion = Integer.parseInt(request.getParameter("id_tipo_asignacion"));
        String sId_tipo_docente = request.getParameter("id_tipo_docente");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        String sId_tipo_asignacion = request.getParameter("id_tipo_asignacion");

        Date sFec_inicio = cliente.getDate(request, "fec_inicio", "yyyy-MM-dd");
        Date sFec_fin = cliente.getDate(request, "fec_fin", "yyyy-MM-dd");
        String sObservacion = request.getParameter("observacion");
        String sNro_resolucion = request.getParameter("nro_resolucion");
        Date sFec_resolucion = cliente.getDate(request, "fec_resolucion", "yyyy-MM-dd");
        String sAccion = request.getParameter("accion");

        modelo.addAttribute("gestion", iGestion);
        modelo.addAttribute("periodo", iPeriodo);
        modelo.addAttribute("id_programa", iId_programa);
        modelo.addAttribute("programa", request.getParameter("programa"));
        modelo.addAttribute("id_materia", sId_materia);
        modelo.addAttribute("materia", request.getParameter("materia"));
        modelo.addAttribute("id_plan", sId_plan);
        modelo.addAttribute("id_grupo", sId_grupo);
        modelo.addAttribute("accion", sAccion);

        if (("".equals(sAccion)) || (sAccion == null)) {
            modelo.addAttribute("mensaje", "No selecciono una Accion para Asignacion Docente-Materia");
            return "Error";
        }

        //Buscamos la asignacion docente
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(iId_asignacion);
        datosAsignacion = this.mi.getDctBuscarAsignacionAuxiliar(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(iId_prg_plan);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No existe el Programa-Plan");
            return "Error";
        }

        //Buscamos dpto_grupo
        Grupos datosDptoGrupo = new Grupos();
        datosDptoGrupo.setId_dpto_grupo(iId_dpto_grupo);
        datosDptoGrupo = this.mi.getDptoBuscarGrupo(datosDptoGrupo);
        modelo.addAttribute("datosDptoGrupo", datosDptoGrupo);
        modelo.addAttribute("id_tipo_evaluacion", Integer.toString(datosDptoGrupo.getId_tipo_evaluacion()));
        if (datosDptoGrupo == null) {
            modelo.addAttribute("mensaje", "No existen datos en Dpto-Grupos");
            return "Error";
        }
        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(iId_programa);
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);
        modelo.addAttribute("id_plan", sId_plan);

        if (!"Eliminar".equals(sAccion)) {
            //Sacamos los datos de la Materia
            Materias materia = new Materias();
            materia.setId_materia(Integer.parseInt(sId_materia));
            materia = (Materias) this.mi.getMtrBuscarMateria(materia);
            modelo.addAttribute("materia", materia);

            //Registramos la asignacion docente
            Asignaciones datosDoc = new Asignaciones();
            datosDoc.setId_docente(iId_docente);
            datosDoc.setId_departamento(materia.getId_departamento());  //de dpto_grupo
            datosDoc.setId_materia(materia.getId_materia());
            datosDoc.setId_grupo(datosDptoGrupo.getId_grupo());
            datosDoc.setId_modelo_ahorro(datosDptoGrupo.getId_modelo_ahorro());
            datosDoc.setId_fase(0);  //Empieza en fase //Cambiar
            datosDoc.setId_tipo_evaluacion(datosDptoGrupo.getId_tipo_evaluacion());
            datosDoc.setId_tipo_docente(Integer.parseInt(sId_tipo_docente));
            datosDoc.setId_tipo_asignacion(Integer.parseInt(sId_tipo_asignacion));
            datosDoc.setGestion(datosDptoGrupo.getGestion());
            datosDoc.setPeriodo(datosDptoGrupo.getPeriodo());
            datosDoc.setObservacion(sObservacion);
            datosDoc.setFec_inicio(sFec_inicio);
            datosDoc.setFec_fin(sFec_fin);
            datosDoc.setSnro_resolucion(sNro_resolucion);
            datosDoc.setFec_resolucion(sFec_resolucion);
            datosDoc.setId_asignacion(iId_asignacion);
            datosDoc.setId_rol(cliente.getId_rol());
            datosDoc.setUlt_usuario(cliente.getId_usuario());
            datosDoc.setCarga_horaria(sCargaHoraria);
            System.out.println("ID PLAN = " + sId_plan);
            datosDoc.setId_plan(sId_plan);
            iResultadoAsignacion = this.mi.setRegistrarAsignacionAuxiliar(datosDoc);
        } else {
            //Eliminar asignacion docente-materia
            if (datosAsignacion != null) {
                System.out.println("BORRAR ID_ASIGNACION = " + datosAsignacion.getId_asignacion());
                System.out.println("BORRAR ID_ROL = " + cliente.getId_rol());
                System.out.println("BORRAR ID_USUARIO = " + cliente.getId_usuario());

                Asignaciones eliminar = new Asignaciones();
                eliminar.setId_asignacion(datosAsignacion.getId_asignacion());
                eliminar.setId_rol(cliente.getId_rol());;
                eliminar.setUlt_usuario(cliente.getId_usuario());
                iResultadoAsignacion = this.mi.setEliminarAsignacionAuxiliarMateria(eliminar);
            }
        }
        if (iResultadoAsignacion > 0) {
            //Listamos las materias del plan mas sus grupos
            Modelos_ahorros aux = new Modelos_ahorros();
            aux.setId_programa(iId_programa);
            //System.out.println("El id_programa dct -->"+Integer.toString(aux.getId_programa()));
            aux.setId_plan(datosPrgPlan.getId_plan());  //Sacando el plan de prg_planes
            //System.out.println("El id_plan dct -->"+aux.getId_plan());
            aux.setGestion(iGestion);
            //System.out.println("La gestion dct -->"+Integer.toString(aux.getGestion()));
            aux.setPeriodo(iPeriodo);
            //System.out.println("El periodo dct -->"+Integer.toString(aux.getPeriodo()));
            aux.setId_tipo_grado(datosPrgPlan.getId_tipo_grado()); //Sacando el id_tipo_grado Universitario-Vestibular
            //System.out.println("El id_tipo_grado dct -->"+Integer.toString(aux.getId_tipo_grado()));
            List listaPlanEstudio = this.mi.getListarPlanProgramaModeloAhorro(aux);
            for (int i = 0; i < listaPlanEstudio.size(); i++) {
                Modelos_ahorros materias = (Modelos_ahorros) listaPlanEstudio.get(i);
                aux.setId_materia(materias.getId_materia());
                //System.out.println("El id_materia dct -->"+Integer.toString(materias.getId_materia()));
                aux.setId_modelo_ahorro(materias.getId_modelo_ahorro());
                //System.out.println("El id_modelo_ahorro dct -->"+Integer.toString(materias.getId_modelo_ahorro()));
                aux.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
                //System.out.println("El id_tipo_evaluacion dct -->"+Integer.toString(aux.getId_tipo_evaluacion()));
                materias.setGrupos(this.mi.getDptoListarGruposMateriaTipoEvaluacionAuxiliares(aux));
                materias.setNro_grupos(materias.getGrupos().size());
                listaPlanEstudio.set(i, materias);
            }
            PagedListHolder listarplanestudios = new PagedListHolder(listaPlanEstudio);
            listarplanestudios.setPageSize(listarplanestudios.getNrOfElements());
            modelo.addAttribute("listarplanestudios", listarplanestudios);

            modelo.addAttribute("gestion", Integer.toString(datosDptoGrupo.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(datosDptoGrupo.getPeriodo()));
            modelo.addAttribute("programa", datosPrograma);
            //modelo.addAttribute("id_plan", sId_plan);

            //return new ModelAndView("asignacionDocenteMaterias/ListarMaterias", modelo);
            return "asignacionAuxiliarMaterias/ListarMaterias";
        } else {
            modelo.addAttribute("mensaje", "No se realizo la accion de asignacion del auxiliar");
            return "Error";
        }
    }

    @RequestMapping(value = "/auxiliares/modificarAsignacionAuxiliar.fautapo", method = RequestMethod.POST)
    public String modificarAuxiliares(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        int iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        String sId_plan = request.getParameter("id_plan");
        String sAccion = request.getParameter("accion");
        String iId_materia = request.getParameter("id_materia");
        int iId_dpto_grupo = cliente.getInt(request, "id_dpto_grupo");
        int iId_asignacion = cliente.getInt(request, "id_asignacion");
        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");

        modelo.addAttribute("gestion", iGestion);
        modelo.addAttribute("periodo", iPeriodo);
        modelo.addAttribute("id_programa", iId_programa);
        modelo.addAttribute("programa", request.getParameter("programa"));
        modelo.addAttribute("id_materia", iId_materia);
        modelo.addAttribute("materia", request.getParameter("materia"));
        modelo.addAttribute("id_prg_plan", iId_prg_plan);
        modelo.addAttribute("id_asignacion", iId_asignacion);
        modelo.addAttribute("accion", sAccion);
        System.out.println("ID_ASIGNACION = " + iId_asignacion);

        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(iId_asignacion);
        datosAsignacion = this.mi.getDctBuscarAsignacionAuxiliar(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        if (datosAsignacion != null) {
            Docentes datosDocente = new Docentes();
            System.out.println("ID_DOCENTE = " + datosAsignacion.getId_docente());
            datosDocente.setId_docente(datosAsignacion.getId_docente());
            datosDocente = this.mi.getBuscarAuxiliar(datosDocente);
            modelo.addAttribute("datosDocente", datosDocente);

        }

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(iId_prg_plan);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No Existe el Programa-Plan");
            return "Error";
        }

        //Buscamos dpto_grupo
        Grupos datosDptoGrupo = new Grupos();
        System.out.println("ID_DPTO_GRUPO = " + iId_dpto_grupo);
        datosDptoGrupo.setId_dpto_grupo(iId_dpto_grupo);
        datosDptoGrupo = this.mi.getDptoBuscarGrupo(datosDptoGrupo);

        modelo.addAttribute("datosDptoGrupo", datosDptoGrupo);

        if (datosDptoGrupo == null) {
            modelo.addAttribute("mensaje", "No existen datos en Dpto-Grupos");
            return "Error";
        }

        //SACAMOS LOS DATOS DEL PROGRAMA
        Programas programa = new Programas();
        programa.setId_programa(iId_programa);
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);

        //Sacamos los datos de la materia
        Materias materia = new Materias();
        materia.setId_materia(datosDptoGrupo.getId_materia());
        System.out.println("El id_materia buscando -->" + Integer.toString(materia.getId_materia()));
        materia = (Materias) this.mi.getMtrBuscarMateria(materia);
        modelo.addAttribute("materia", materia);

        //Listamos auxiliares de docencia
        List lDocentesTodos = this.mi.getListarAuxiliaresTodos();
        modelo.addAttribute("lDocentesTodos", lDocentesTodos);

        System.out.println("Tamanio de la lista -->" + Integer.toString(lDocentesTodos.size()));

        //Listamos los tipos
        List lTiposDocentes = this.mi.getListarTiposDocentes();
        modelo.addAttribute("lTiposDocentes", lTiposDocentes);
        List lTiposAsignaciones = this.mi.getListarTiposAsignaciones();
        modelo.addAttribute("lTiposAsignaciones", lTiposAsignaciones);

        //Sacamos el formato de la fecha del sistema
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        return "asignacionAuxiliarMaterias/ModificarAsignacionAuxiliar";
    }

    @RequestMapping(value = "/auxiliares/EliminarAsignacionAuxiliar.fautapo", method = RequestMethod.POST)
    public String eliminar(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        //Estatico id_docente
        //String sId_docente ="1";
        int iResultadoAsignacion = 0;
        int iId_docente = cliente.getInt(request, "id_docente");  //id_docente
        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");
        int iId_asignacion = cliente.getInt(request, "id_asignacion");
        int iId_dpto_grupo = cliente.getInt(request, "id_dpto_grupo");
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        int iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        String sId_plan = request.getParameter("id_plan");
        String sCargaHoraria = request.getParameter("carga_horaria");
        //int iId_materia  = Integer.parseInt(request.getParameter("id_materia"));
        String sId_materia = request.getParameter("id_materia");
        String sId_grupo = request.getParameter("id_grupo");
        //int iId_tipo_docente = Integer.parseInt(request.getParameter("id_tipo_docente"));
        //int iId_tipo_evaluacion = Integer.parseInt(request.getParameter("id_tipo_evaluacion"));
        //int iId_tipo_asignacion = Integer.parseInt(request.getParameter("id_tipo_asignacion"));
        String sId_tipo_docente = request.getParameter("id_tipo_docente");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        String sId_tipo_asignacion = request.getParameter("id_tipo_asignacion");

        Date sFec_inicio = cliente.getDate(request, "fec_inicio", "yyyy-MM-dd");
        Date sFec_fin = cliente.getDate(request, "fec_fin", "yyyy-MM-dd");
        String sObservacion = request.getParameter("observacion");
        String sNro_resolucion = request.getParameter("nro_resolucion");
        Date sFec_resolucion = cliente.getDate(request, "fec_resolucion", "yyyy-MM-dd");
        String sAccion = request.getParameter("accion");

        modelo.addAttribute("gestion", iGestion);
        modelo.addAttribute("periodo", iPeriodo);
        modelo.addAttribute("id_programa", iId_programa);
        modelo.addAttribute("programa", request.getParameter("programa"));
        modelo.addAttribute("id_materia", sId_materia);
        modelo.addAttribute("materia", request.getParameter("materia"));
        modelo.addAttribute("id_plan", sId_plan);
        modelo.addAttribute("id_grupo", sId_grupo);
        modelo.addAttribute("accion", sAccion);

        if (("".equals(sAccion)) || (sAccion == null)) {
            modelo.addAttribute("mensaje", "No selecciono una Accion para Asignacion Docente-Materia");
            return "Error";
        }

        //Buscamos la asignacion docente
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(iId_asignacion);
        datosAsignacion = this.mi.getDctBuscarAsignacionAuxiliar(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(iId_prg_plan);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No existe el Programa-Plan");
            return "Error";
        }

        //Buscamos dpto_grupo
        Grupos datosDptoGrupo = new Grupos();
        datosDptoGrupo.setId_dpto_grupo(iId_dpto_grupo);
        datosDptoGrupo = this.mi.getDptoBuscarGrupo(datosDptoGrupo);
        modelo.addAttribute("datosDptoGrupo", datosDptoGrupo);
        modelo.addAttribute("id_tipo_evaluacion", Integer.toString(datosDptoGrupo.getId_tipo_evaluacion()));
        if (datosDptoGrupo == null) {
            modelo.addAttribute("mensaje", "No existen datos en Dpto-Grupos");
            return "Error";
        }
        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(iId_programa);
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);
        modelo.addAttribute("id_plan", sId_plan);

        if (!"Eliminar".equals(sAccion)) {
            //Sacamos los datos de la Materia
            Materias materia = new Materias();
            materia.setId_materia(Integer.parseInt(sId_materia));
            materia = (Materias) this.mi.getMtrBuscarMateria(materia);
            modelo.addAttribute("materia", materia);

            //Registramos la asignacion docente
            Asignaciones datosDoc = new Asignaciones();
            datosDoc.setId_docente(iId_docente);
            datosDoc.setId_departamento(materia.getId_departamento());  //de dpto_grupo
            datosDoc.setId_materia(materia.getId_materia());
            datosDoc.setId_grupo(datosDptoGrupo.getId_grupo());
            datosDoc.setId_modelo_ahorro(datosDptoGrupo.getId_modelo_ahorro());
            datosDoc.setId_fase(0);  //Empieza en fase //Cambiar
            datosDoc.setId_tipo_evaluacion(datosDptoGrupo.getId_tipo_evaluacion());
            datosDoc.setId_tipo_docente(Integer.parseInt(sId_tipo_docente));
            datosDoc.setId_tipo_asignacion(Integer.parseInt(sId_tipo_asignacion));
            datosDoc.setGestion(datosDptoGrupo.getGestion());
            datosDoc.setPeriodo(datosDptoGrupo.getPeriodo());
            datosDoc.setObservacion(sObservacion);
            datosDoc.setFec_inicio(sFec_inicio);
            datosDoc.setFec_fin(sFec_fin);
            datosDoc.setSnro_resolucion(sNro_resolucion);
            datosDoc.setFec_resolucion(sFec_resolucion);
            datosDoc.setId_asignacion(iId_asignacion);
            datosDoc.setId_rol(cliente.getId_rol());
            datosDoc.setUlt_usuario(cliente.getId_usuario());
            datosDoc.setCarga_horaria(sCargaHoraria);
            System.out.println("ID PLAN = " + sId_plan);
            datosDoc.setId_plan(sId_plan);
            iResultadoAsignacion = this.mi.setRegistrarAsignacionAuxiliar(datosDoc);
        } else {
            //Eliminar asignacion docente-materia
            if (datosAsignacion != null) {
                System.out.println("BORRAR ID_ASIGNACION = " + datosAsignacion.getId_asignacion());
                System.out.println("BORRAR ID_ROL = " + cliente.getId_rol());
                System.out.println("BORRAR ID_USUARIO = " + cliente.getId_usuario());

                Asignaciones eliminar = new Asignaciones();
                eliminar.setId_asignacion(datosAsignacion.getId_asignacion());
                eliminar.setId_rol(cliente.getId_rol());;
                eliminar.setUlt_usuario(cliente.getId_usuario());
                iResultadoAsignacion = this.mi.setEliminarAsignacionAuxiliarMateria(eliminar);
            }
        }
        if (iResultadoAsignacion > 0) {
            //Listamos las materias del plan mas sus grupos
            Modelos_ahorros aux = new Modelos_ahorros();
            aux.setId_programa(iId_programa);
            //System.out.println("El id_programa dct -->"+Integer.toString(aux.getId_programa()));
            aux.setId_plan(datosPrgPlan.getId_plan());  //Sacando el plan de prg_planes
            //System.out.println("El id_plan dct -->"+aux.getId_plan());
            aux.setGestion(iGestion);
            //System.out.println("La gestion dct -->"+Integer.toString(aux.getGestion()));
            aux.setPeriodo(iPeriodo);
            //System.out.println("El periodo dct -->"+Integer.toString(aux.getPeriodo()));
            aux.setId_tipo_grado(datosPrgPlan.getId_tipo_grado()); //Sacando el id_tipo_grado Universitario-Vestibular
            //System.out.println("El id_tipo_grado dct -->"+Integer.toString(aux.getId_tipo_grado()));
            List listaPlanEstudio = this.mi.getListarPlanProgramaModeloAhorro(aux);
            for (int i = 0; i < listaPlanEstudio.size(); i++) {
                Modelos_ahorros materias = (Modelos_ahorros) listaPlanEstudio.get(i);
                aux.setId_materia(materias.getId_materia());
                //System.out.println("El id_materia dct -->"+Integer.toString(materias.getId_materia()));
                aux.setId_modelo_ahorro(materias.getId_modelo_ahorro());
                //System.out.println("El id_modelo_ahorro dct -->"+Integer.toString(materias.getId_modelo_ahorro()));
                aux.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
                //System.out.println("El id_tipo_evaluacion dct -->"+Integer.toString(aux.getId_tipo_evaluacion()));
                materias.setGrupos(this.mi.getDptoListarGruposMateriaTipoEvaluacionAuxiliares(aux));
                materias.setNro_grupos(materias.getGrupos().size());
                listaPlanEstudio.set(i, materias);
            }
            PagedListHolder listarplanestudios = new PagedListHolder(listaPlanEstudio);
            listarplanestudios.setPageSize(listarplanestudios.getNrOfElements());
            modelo.addAttribute("listarplanestudios", listarplanestudios);

            modelo.addAttribute("gestion", Integer.toString(datosDptoGrupo.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(datosDptoGrupo.getPeriodo()));
            modelo.addAttribute("programa", datosPrograma);
            //modelo.addAttribute("id_plan", sId_plan);

            //return new ModelAndView("asignacionDocenteMaterias/ListarMaterias", modelo);
            return "asignacionAuxiliarMaterias/ListarMaterias";
        } else {
            modelo.addAttribute("mensaje", "No se realizo la accion de asignacion del auxiliar");
            return "Error";
        }
    }
}

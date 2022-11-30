/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Departamentos;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Instituciones;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Modelos_ahorros;
import org.fautapo.domain.Notas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.LibretasCierreConfirmarModel;
import org.fautapo.model.LibretasCierreModel;
import org.fautapo.model.LibretasConfirmarModel;
import org.fautapo.model.LibretasListarMateriasIdprplan;
import org.fautapo.model.LibretasModel;
import org.fautapo.model.Libretasasignaciones;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.util.Convert;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
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
public class LibretasController {

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

    @RequestMapping(value = "/actaPorFases/verActaCalificaciones.fautapo", method = RequestMethod.GET)
    public String verCalificaciones(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "reportesAcademicos/verActaPorFases/Entrada";

    }

    @RequestMapping(value = "/actaPorFases/ListarDepartamentosTiposEvaluaciones.fautapo", method = RequestMethod.POST)
    public String ListarDepartamentosTiposEvaluaciones(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "reportesAcademicos/verActaPorFases/Entrada";
        }
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("gestion", model.getGestion());

        Usuarios usuario = modelMapper.map(model, Usuarios.class);
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        //Sacamos el listado de las facultades
        Universidades datosUniversidad = modelMapper.map(model, Universidades.class);
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);
//Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);
        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("cliente", cliente);

        return "reportesAcademicos/verActaPorFases/ListarProgramasPlanes";
    }

    @RequestMapping(value = "/actaPorFases/ListarDocentesActaCalificaciones.fautapo", method = RequestMethod.POST)
    public String ListarDocentesActaCalificaciones(@ModelAttribute("model") LibretasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        // int _id_rol = cliente.getId_rol();
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());

        if ((!"".equals(model.getId_programa())) && (!"".equals(model.getId_programa()))) {
            //Lista de Programas (carreras)
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            programa = this.mi.getPrgBuscarPrograma(programa);
            modelo.addAttribute("datosPrograma", programa);
            //Sacamos lista de docente con sus asignaciones a las materias
            Asignaciones datosAsignacion = new Asignaciones();
            datosAsignacion.setGestion(model.getGestion());
            datosAsignacion.setPeriodo(model.getPeriodo());
            datosAsignacion.setId_programa(model.getId_programa());
            datosAsignacion.setId_plan(model.getId_plan());
            List lAsignacionDocentesProgramaPlan = this.mi.getDctListarAsignacionDocenteProgramaPlan(datosAsignacion);
            modelo.addAttribute("lAsignacionDocentesProgramaPlan", lAsignacionDocentesProgramaPlan);

            //Buscamos Tipo Evaluacion
          /*  Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
            datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
            modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);*/

            //  modelo.addAttribute("id_rol", Integer.toString(_id_rol));
        } else {
            modelo.addAttribute("mensaje", "Faltan datos");
            return "Errro";
        }
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("tipo_evaluacion", model.getId_tipo_evaluacion());
        return "reportesAcademicos/verActaPorFases/ListarAsignacionesDocentesPrograma";
    }

    @RequestMapping(value = "/actaPorFases/ListarFases.fautapo", method = RequestMethod.POST)
    public String ListarFases(@ModelAttribute("model") Libretasasignaciones model, ModelMap modelo) throws Exception {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("id_asignacion", model.getId_asignacion());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", cliente.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("id_fase", model.getId_fase());

        //Lista de Programas (carreras)
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        programa = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("datosPrograma", programa);

        //Buscamos los datos de la asignacion
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(model.getId_asignacion());
        datosAsignacion = this.mi.getDctBuscarAsignacionDocente(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        //Sacamos lista de fases < 1000
        Libretas datosLibreta = new Libretas();
        datosLibreta.setId_departamento(datosAsignacion.getId_departamento());
        datosLibreta.setId_tipo_evaluacion(datosAsignacion.getId_tipo_evaluacion());
        datosLibreta.setGestion(datosAsignacion.getGestion());
        datosLibreta.setPeriodo(datosAsignacion.getPeriodo());
        List lFases = this.mi.getLbrListarFases2(datosLibreta);
        modelo.addAttribute("lFases", lFases);

        return "reportesAcademicos/verActaPorFases/ListarFases";
    }

    @RequestMapping(value = "/actaPorFases/ListarActaCalificaciones.fautapo", method = RequestMethod.POST)
    public String ListarActaCalificaciones(@ModelAttribute("model") Libretasasignaciones model, ModelMap modelo) throws Exception {

        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("nombres", cliente.getNombres());

        //Buscamos el grado_academico por programa e id_plan
        Libretas datosGrados = new Libretas();
        datosGrados.setId_programa(model.getId_programa());
        datosGrados.setId_plan(model.getId_plan());
        datosGrados = this.mi.getBuscarGradoAcademicoPrograma(datosGrados);
        modelo.addAttribute("datosGrados", datosGrados);

        //Buscamos los datos de la asignacion
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(model.getId_asignacion());
        datosAsignacion = this.mi.getDctBuscarAsignacionDocente(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        //Buscar Docente
        Docentes datosDoc = new Docentes();
        datosDoc.setId_docente(datosAsignacion.getId_docente());
        datosDoc = this.mi.getBuscarDocente(datosDoc);
        modelo.addAttribute("datosDoc", datosDoc);

        //listamos los estudiantes con Acta de calificaciones (tabla notas)
        Notas datosNotas = new Notas();
        datosNotas.setId_materia(datosAsignacion.getId_materia());
        datosNotas.setId_grupo(datosAsignacion.getId_grupo());
        datosNotas.setGestion(datosAsignacion.getGestion());
        datosNotas.setPeriodo(datosAsignacion.getPeriodo());
        datosNotas.setId_tipo_evaluacion(datosAsignacion.getId_tipo_evaluacion());
        datosNotas.setId_departamento(datosAsignacion.getId_departamento());
        datosNotas.setId_modelo_ahorro(datosAsignacion.getId_modelo_ahorro());
        datosNotas.setId_fase(model.getId_fase());
        List listNotas = this.mi.getListarActaCalificacionesPorFase(datosNotas);
        modelo.addAttribute("listNotas", listNotas);

        //Sacamos el programa  
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(datosPrograma.getId_facultad());
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);

        //Sacamos la fase actual
        Libretas datosFase = new Libretas();
        datosFase.setId_fase(model.getId_fase());
        datosFase.setId_tipo_evaluacion(datosAsignacion.getId_tipo_evaluacion());
        datosFase.setId_departamento(datosAsignacion.getId_departamento());
        datosFase.setGestion(datosAsignacion.getGestion());
        datosFase.setPeriodo(datosAsignacion.getPeriodo());
        datosFase = this.mi.getLbrBuscarFase(datosFase);
        modelo.addAttribute("datosFase", datosFase);

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

        return "reportesAcademicos/verActaPorFases/ListarActaCalificaciones";
    }

    @RequestMapping(value = "/cerrarLibretasProgramasMaterias/entrada.fautapo", method = RequestMethod.GET)
    public String EntradaCierre(ModelMap modelo) throws Exception {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", cliente.getImagen());
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("model", model);
        return "cerrarLibretasProgramasMaterias/Entrada";
    }

    @RequestMapping(value = "/cerrarLibretasProgramasMaterias/ListarProgramasPlan.fautapo", method = RequestMethod.POST)
    public String ListarProgramasPlan(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", cliente.getImagen());
            return "cerrarLibretasProgramasMaterias/Entrada";
        }
        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());
        return "cerrarLibretasProgramasMaterias/ListarProgramasPlan";
    }

    @RequestMapping(value = "/cerrarLibretasProgramasMaterias/listarMateriasProgramaPlan.fautapo", method = RequestMethod.POST)
    public String ListarMaterias(@ModelAttribute("model") LibretasListarMateriasIdprplan model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if ("".equals(Integer.toString(cliente.getId_rol()))) {
            modelo.addAttribute("mensaje", "No se le permite entrar a este modulo");
            return "Error";
        }

        //Recuperamos las variables
        String sId_plan = "";
        String[] ides = model.getId_prg_plan().split("-");
        int sId_programa=model.getId_programa();

        sId_plan = ides[0];
        int iId_prg_plan = Integer.valueOf(ides[1]);

        
        if(iId_prg_plan==1 && sId_programa==4){
           iId_prg_plan= Integer.valueOf(ides[2]);
        }
        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(iId_prg_plan);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No existe el plan seleccionado en Programas - Planes");
            return "Aviso";
        }

        if (model.getId_tipo_evaluacion() == 0) {
            modelo.addAttribute("mensaje", "Seleccione el Tipo de Evalucion");
            return "Aviso";
        }

        //Buscando el programa
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);

        //Buscar Tipo evaluacion
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEval);

        //Listamos las materias del plan mas sus grupos
        Modelos_ahorros aux = new Modelos_ahorros();
        aux.setId_programa(model.getId_programa());
        // System.out.println("El id_programa dct -->" + Integer.toString(aux.getId_programa()));
        aux.setId_plan(datosPrgPlan.getId_plan());  //Sacando el plan de prg_planes
        // System.out.println("El id_plan dct -->" + aux.getId_plan());
        aux.setGestion(model.getGestion());
        // System.out.println("La gestion dct -->" + Integer.toString(aux.getGestion()));
        aux.setPeriodo(model.getPeriodo());
        //  System.out.println("El periodo dct -->" + Integer.toString(aux.getPeriodo()));
        aux.setId_tipo_grado(datosPrgPlan.getId_tipo_grado()); //Sacando el id_tipo_grado Universitario-Vestibular
        //  System.out.println("El id_tipo_grado dct -->" + Integer.toString(aux.getId_tipo_grado()));
        List listaPlanEstudio = this.mi.getListarPlanProgramaModeloAhorro(aux);
        Libretas datosAsignacion = new Libretas();
        for (int i = 0; i < listaPlanEstudio.size(); i++) {
            Modelos_ahorros asignacion = (Modelos_ahorros) listaPlanEstudio.get(i);
            aux.setId_materia(asignacion.getId_materia());
            System.out.println("El id_materia dct -->" + Integer.toString(asignacion.getId_materia()));
            aux.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(aux.getId_tipo_evaluacion()));
            asignacion.setMaterias(this.mi.getListarMateriasCerrarLibretaDctAsignacion(aux));
            asignacion.setNro_asignaciones(asignacion.getMaterias().size());
            listaPlanEstudio.set(i, asignacion);
        }

        PagedListHolder listarplanestudios = new PagedListHolder(listaPlanEstudio);
        listarplanestudios.setPageSize(listarplanestudios.getNrOfElements());
        modelo.addAttribute("listarplanestudios", listarplanestudios);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_plan", datosPrgPlan.getId_plan());
        modelo.addAttribute("id_materia", model.getId_materia());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        return "cerrarLibretasProgramasMaterias/ListarMaterias";
    }

    @RequestMapping(value = "/cerrarLibretasProgramasMateriasVolver/listarMateriasProgramaPlan.fautapo", method = RequestMethod.POST)
    public String ListarMateriasVolver(@ModelAttribute("model") LibretasListarMateriasIdprplan model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if ("".equals(Integer.toString(cliente.getId_rol()))) {
            modelo.addAttribute("mensaje", "No se le permite entrar a este modulo");
            return "Error";
        }

        //Recuperamos las variables
        /*  String sId_plan = "";
        String[] ides = model.getId_prg_plan().split("-");

        sId_plan = ides[0];
        int iId_prg_plan = Integer.valueOf(ides[1]);*/
        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(Convert.ToInteger(model.getId_prg_plan()));
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No existe el plan seleccionado en Programas - Planes");
            return "Aviso";
        }

        if (model.getId_tipo_evaluacion() == 0) {
            modelo.addAttribute("mensaje", "Seleccione el Tipo de Evalucion");
            return "Aviso";
        }

        //Buscando el programa
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);

        //Buscar Tipo evaluacion
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEval);

        //Listamos las materias del plan mas sus grupos
        Modelos_ahorros aux = new Modelos_ahorros();
        aux.setId_programa(model.getId_programa());
        // System.out.println("El id_programa dct -->" + Integer.toString(aux.getId_programa()));
        aux.setId_plan(datosPrgPlan.getId_plan());  //Sacando el plan de prg_planes
        //.out.println("El id_plan dct -->" + aux.getId_plan());
        aux.setGestion(model.getGestion());
        //System.out.println("La gestion dct -->" + Integer.toString(aux.getGestion()));
        aux.setPeriodo(model.getPeriodo());
        // System.out.println("El periodo dct -->" + Integer.toString(aux.getPeriodo()));
        aux.setId_tipo_grado(datosPrgPlan.getId_tipo_grado()); //Sacando el id_tipo_grado Universitario-Vestibular
        // System.out.println("El id_tipo_grado dct -->" + Integer.toString(aux.getId_tipo_grado()));
        List listaPlanEstudio = this.mi.getListarPlanProgramaModeloAhorro(aux);
        Libretas datosAsignacion = new Libretas();
        for (int i = 0; i < listaPlanEstudio.size(); i++) {
            Modelos_ahorros asignacion = (Modelos_ahorros) listaPlanEstudio.get(i);
            aux.setId_materia(asignacion.getId_materia());
            // System.out.println("El id_materia dct -->" + Integer.toString(asignacion.getId_materia()));
            aux.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            //  System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(aux.getId_tipo_evaluacion()));
            asignacion.setMaterias(this.mi.getListarMateriasCerrarLibretaDctAsignacion(aux));
            asignacion.setNro_asignaciones(asignacion.getMaterias().size());
            listaPlanEstudio.set(i, asignacion);
        }

        PagedListHolder listarplanestudios = new PagedListHolder(listaPlanEstudio);
        listarplanestudios.setPageSize(listarplanestudios.getNrOfElements());
        modelo.addAttribute("listarplanestudios", listarplanestudios);

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_programa", model.getId_programa());
        //modelo.addAttribute("id_plan", request.getParameter("id_plan"));
        modelo.addAttribute("id_materia", model.getId_materia());

        return "cerrarLibretasProgramasMaterias/ListarMaterias";
    }

    @RequestMapping(value = "/cerrarLibretasProgramasMaterias/confirmarListadoCierreLibreta.fautapo", method = RequestMethod.POST)
    public String ConfirmarListadoCierreLibreta(@ModelAttribute("model") LibretasConfirmarModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("id_materia", model.getId_materia());
        modelo.addAttribute("id_modelo_ahorro", model.getId_modelo_ahorro());
        modelo.addAttribute("id_fase", model.getId_fase());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_docente", model.getId_docente());
        modelo.addAttribute("id_grupo", model.getId_grupo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("nombresDocente", model.getNombreDocente());
        modelo.addAttribute("usuario", cliente.getNombres());

        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        //Buscando el programa
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);

        //Buscar Tipo evaluacion
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Buscamos la asignacion docente
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(model.getId_asignacion());
        datosAsignacion = this.mi.getDctBuscarAsignacionDocente(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        if (datosAsignacion == null) {
            modelo.addAttribute("mensaje", "No se encontro la asignacion docente para la materia");
            return "Error";
        }

        //Listar los estudiantes listos para el cierre de libretas en est_libretas con id_fase=1000 
        Libretas datosLibreta = new Libretas();
        datosLibreta.setId_materia(datosAsignacion.getId_materia());
        datosLibreta.setId_departamento(datosAsignacion.getId_departamento());
        datosLibreta.setId_grupo(datosAsignacion.getId_grupo());
        datosLibreta.setId_modelo_ahorro(datosAsignacion.getId_modelo_ahorro());
        datosLibreta.setId_tipo_evaluacion(datosAsignacion.getId_tipo_evaluacion());
        datosLibreta.setGestion(datosAsignacion.getGestion());
        datosLibreta.setPeriodo(datosAsignacion.getPeriodo());
        List lEstudiantesParaCierre = this.mi.getListarEstudiantesEnEstLibretas(datosLibreta);
        modelo.addAttribute("lEstudiantesParaCierre", lEstudiantesParaCierre);
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_plan", datosPrgPlan.getId_plan());

        return "cerrarLibretasProgramasMaterias/ConfirmarListadoCierreLibreta";
    }

    @RequestMapping(value = "/cerrarLibretasProgramasMaterias/registrarCerrarLibreta.fautapo", method = RequestMethod.POST)
    public String RegistrarCerrarLibretaMateria(@ModelAttribute("model") LibretasConfirmarModel model, ModelMap modelo) {
        String sMensaje;

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        if (model.getId_materia() != null && model.getId_modelo_ahorro() != null && model.getGestion() != null && model.getId_tipo_evaluacion() != null && model.getPeriodo() != null && model.getId_docente() != null && model.getId_grupo() != null) {

            Libretas cerrarLibreta = new Libretas();
            cerrarLibreta.setId_docente(model.getId_docente());
            cerrarLibreta.setId_materia(model.getId_materia());
            cerrarLibreta.setId_grupo(model.getId_grupo());
            cerrarLibreta.setId_fase(model.getId_fase());
            cerrarLibreta.setGestion(model.getGestion());
            cerrarLibreta.setPeriodo(model.getPeriodo());
            cerrarLibreta.setId_modelo_ahorro(model.getId_modelo_ahorro());
            cerrarLibreta.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            cerrarLibreta.setId_rol(this.GetUsuario().getId_rol());
            cerrarLibreta.setUlt_usuario(this.GetUsuario().getId_usuario());
            int iValor = this.mi.setCerrarLibretaPorMateria(cerrarLibreta);
            if (iValor == 1) {
                sMensaje = "Se ha cerrado la libreta de calificaciones para la materia seleccionada";
            } else {
                sMensaje = "No se pudo realizar el cierre de libreta";
            }
        } else {
            sMensaje = "Datos incompletos";
        }

        modelo.addAttribute("mensaje", sMensaje);
        return "cerrarLibretasProgramasMaterias/Aviso";
    }

    @RequestMapping(value = "/adminVolverFase.fautapo", method = RequestMethod.GET)
    public String EntradaFase(ModelMap modelo) throws Exception {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", cliente.getImagen());
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("model", model);
        return "administrarVolverFase/Entrada";
    }

    @RequestMapping(value = "/listarProgramasFacultad.fautapo", method = RequestMethod.POST)
    public String listarDepartamentosTevaluaciones(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        //Sacamos los datos de la session
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", cliente.getImagen());

            return "administrarVolverFase/Entrada";
        }
        //Listando los tipos_evaluaciones
        List lListarTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lListarTiposEvaluaciones", lListarTiposEvaluaciones);
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("nombres", cliente.getNombres());
        return "administrarVolverFase/listarDepartamentosTpsEvaluaciones";
    }

    @RequestMapping(value = "/listarDocentesAsignadosMaterias.fautapo", method = RequestMethod.POST)
    public String listarDocentes(@ModelAttribute("model") LibretasCierreModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int _id_rol = this.GetUsuario().getId_rol();
        int _gestion = 0;
        int _periodo = 0;
        int _Id_departamento = 0;
        int _Id_tipo_evaluacion = 0;
        int _Id_facultad = 0;

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());

        if (model.getId_departamento() == null) {
            _gestion = model.getGestion();
            _periodo = model.getPeriodo();
            _Id_departamento = model.getId_departamento();
            _Id_tipo_evaluacion = model.getId_tipo_evaluacion();
            modelo.addAttribute("id_departamento", model.getId_departamento());
            modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());

        } else {
            _gestion = model.getGestion();
            _periodo = model.getPeriodo();
            _Id_departamento = model.getId_departamento();
            _Id_tipo_evaluacion = model.getId_tipo_evaluacion();
            _Id_facultad = model.getId_facultad();

            modelo.addAttribute("id_departamento", model.getId_departamento());
            modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
            modelo.addAttribute("id_facultad", model.getId_facultad());
        }

        //Sacamos datos del FCLDepartamento
        Departamentos buscar = new Departamentos();
        buscar.setId_departamento(_Id_departamento);
        Departamentos datosFclDepartamento = this.mi.getDptBuscarDepartamento(buscar);
        modelo.addAttribute("fcldepartamento", datosFclDepartamento.getDepartamento());

        //Sacamos el listado de los tipos_evaluaciones
        Libretas datosTipoEvaluacion = new Libretas();
        datosTipoEvaluacion.setId_tipo_evaluacion(_Id_tipo_evaluacion);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos lista de docente con sus asignaciones a las materias
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setGestion(_gestion);
        datosAsignacion.setPeriodo(_periodo);
        datosAsignacion.setId_departamento(_Id_departamento);
        datosAsignacion.setId_tipo_evaluacion(_Id_tipo_evaluacion);
        List listaDatosAsignacion = this.mi.getListarDocentesProgramados(datosAsignacion);
        modelo.addAttribute("datosAsignacion", listaDatosAsignacion);

        //Sacamos los datos de la Facultad
        Facultades datosFacultad = new Facultades();
        datosFacultad.setId_facultad(_Id_facultad);
        datosFacultad = this.mi.getFclBuscarFacultad(datosFacultad);
        modelo.addAttribute("datosFacultad", datosFacultad);
        return "administrarVolverFase/listarDocentes";
    }

    @RequestMapping(value = "/confirmarModificarFaseDocente.fautapo", method = RequestMethod.POST)
    public String confirmarModificarFaseDocente(@ModelAttribute("model") LibretasCierreConfirmarModel model, ModelMap modelo) {
        modelo.addAttribute("gestion", model.getGestion());   // TOMANDO EN CUENTA LA GESTION Y PERIODO;    
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("nombres", this.GetUsuario().getNombres());
        modelo.addAttribute("id_docente", model.getId_docente());
        modelo.addAttribute("id_rol", this.GetUsuario().getId_rol());
        modelo.addAttribute("id_grupo", model.getId_grupo());
        modelo.addAttribute("grupo", model.getGrupo());
        modelo.addAttribute("id_fase", model.getId_fase());
        modelo.addAttribute("fase", model.getFase());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("tipo_evaluacion", model.getTipo_evaluacion());
        modelo.addAttribute("id_modelo_ahorro", model.getId_modelo_ahorro());
        modelo.addAttribute("nro_nota", model.getNro_nota_s());
        modelo.addAttribute("id_tipo_nota_s", model.getId_tipo_nota_s());
        modelo.addAttribute("nro_nota_s", model.getNro_nota_s());
        modelo.addAttribute("id_materia", model.getId_materia());
        modelo.addAttribute("materia", model.getMateria());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("programa", model.getPrograma());
        modelo.addAttribute("id_departamento", model.getId_departamento());
        modelo.addAttribute("departamento", model.getDepartamento());
        modelo.addAttribute("docente", model.getNombres());
        modelo.addAttribute("id_tipo_docente", model.getId_tipo_docente());
        modelo.addAttribute("id_asignacion", model.getId_asignacion());
        modelo.addAttribute("usuario", this.GetUsuario().getNombres());
        modelo.addAttribute("id_facultad", model.getId_facultad());
        return "administrarVolverFase/confirmarModificarFaseDocente";
    }

    @RequestMapping(value = "/modificarFaseDocente.fautapo", method = RequestMethod.POST)
    public String modificarFaseDocente(@ModelAttribute("model") LibretasCierreConfirmarModel model, ModelMap modelo) {
        int iResultado = 0;
        //Buscamos el id_fase del docente asignado
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(model.getId_asignacion());
        datosAsignacion = this.mi.getDctBuscarAsignacionDocente(datosAsignacion);
        if (datosAsignacion == null) {
            modelo.addAttribute("mensaje", "No existe la asignacion docente");
            return "administrarVolverFase/Error";
        }
        if (model.getId_fase() == 0) {
            modelo.addAttribute("gestion", model.getGestion());
            modelo.addAttribute("periodo", model.getPeriodo());
            modelo.addAttribute("id_departamento", model.getId_departamento());
            modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
            modelo.addAttribute("id_facultad", model.getId_facultad());
            modelo.addAttribute("mensaje", "No se puede retroceder la fase si esta en fase inicial");
            return "administrarVolverFase/Error";
        }
        //Retrocede fase y anula est_libretas
        Libretas datos = new Libretas();
        datos.setId_materia(model.getId_materia());
        datos.setId_grupo(model.getId_grupo());
        datos.setId_modelo_ahorro(model.getId_modelo_ahorro());
        datos.setGestion(model.getGestion());
        datos.setPeriodo(model.getPeriodo());
        datos.setId_docente(model.getId_docente());
        datos.setId_departamento(model.getId_departamento());
        datos.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        datos.setId_fase(datosAsignacion.getId_fase());
        datos.setId_rol(this.GetUsuario().getId_rol());
        datos.setId_usuario(this.GetUsuario().getId_usuario());
        iResultado = this.mi.setModificarFaseDocente(datos);

        if (iResultado == 1) {
            modelo.addAttribute("mensaje", "Los cambios se guardaron  correctamente");
            return "administrarVolverFase/Aviso";
        } else {
            modelo.addAttribute("mensaje", "No se pudo retroceder la fase");
            return "administrarVolverFase/Aviso";
        }
    }
}

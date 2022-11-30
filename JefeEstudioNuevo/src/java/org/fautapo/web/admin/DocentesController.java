/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.Grupos;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Materias;
import org.fautapo.domain.Modelos_ahorros;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.ParametrosEntrada;
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
public class DocentesController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;
    @Autowired
    private HttpServletRequest request;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/buscarDocenteEntrada.fautapo", method = RequestMethod.GET)
    public String handleRequest(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sId_proceso = request.getParameter("id_proceso");
        String sId_tramite = request.getParameter("id_tramite");
        modelo.addAttribute("id_proceso", sId_proceso);
        modelo.addAttribute("id_tramite", sId_tramite);
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("usuario", cliente.getNombres());

        return "administrarProgramasEspecializados/administrarAsignacionDocente/BuscarDocentePersona";
    }

    @RequestMapping(value = "/buscarDocente.fautapo", method = RequestMethod.POST)
    public String buscarDocente(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Docentes datosDocente;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sCi = "";
        String sNombres = request.getParameter("nombres");
        String sId_docente = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        Integer id_programa = cliente.getId_programa();

        Docentes docentes = new Docentes();
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        if (tipobusqueda == null) {
            sId_docente = request.getParameter("id_docente");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");

        } else {
            valor = request.getParameter("buscar");
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombres") ? valor : "";
        }

        if (("".equals(sNombres)) && ("".equals(sCi))) {
            docentes.setId_docente(cliente.getId_usuario());
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "busquedasAcademicas/buscarDocente/Entrada";
        }

        if ((!"".equals(sId_docente)) && (sId_docente != null)) {
            //Sacando los datos del docente
            datosDocente = new Docentes();
            datosDocente.setId_docente(Integer.parseInt(sId_docente));
            datosDocente = this.mi.getBuscarDocente(datosDocente);
            modelo.addAttribute("datosDocente", datosDocente);

            //Aqui buscamos la asignacion docente
            Asignaciones datosAsignacion = new Asignaciones();
            datosAsignacion.setId_docente(datosDocente.getId_docente());
            List lAsignaciones = this.mi.getListarAsignacionDocenteTodas(datosAsignacion);
            modelo.addAttribute("lAsignaciones", lAsignaciones);
            return "busquedasAcademicas/buscarDocente/ListarAsignacionDocente";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosDocente = new Docentes();
            datosDocente.setDip(sCi + "%");
            datosDocente.setId_programa(id_programa);
            List lDocentes = this.mi.getBuscarListaDocentesDip(datosDocente);
            modelo.addAttribute("lDocentes", lDocentes);
            return "busquedasAcademicas/buscarDocente/ListarDocentes";
        }

        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosDocente = new Docentes();
            datosDocente.setId_programa(id_programa);
            datosDocente.setNombres("%" + sNombres + "%");
            List lDocentes = this.mi.getBuscarListaDocentesNombres(datosDocente);
            modelo.addAttribute("lDocentes", lDocentes);
            return "busquedasAcademicas/buscarDocente/ListarDocentes";
        }
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        return "busquedasAcademicas/buscarDocente/Entrada";
    }

    @RequestMapping(value = "/buscarDocente1.fautapo", method = RequestMethod.POST)
    public String listarAsiga(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Docentes datosDocente;
        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sCi = "";
        String sNombres = request.getParameter("nombres");
        String sId_docente = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        Integer id_programa = cliente.getId_programa();

        Docentes docentes = new Docentes();
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());

        if (tipobusqueda == null) {
            sId_docente = request.getParameter("id_docente");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");

        } else {
            valor = request.getParameter("buscar");
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombres") ? valor : "";
        }

        if (("".equals(sNombres)) && ("".equals(sCi))) {
            docentes.setId_docente(cliente.getId_usuario());
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "busquedasAcademicas/buscarDocente/Entrada";
        }

        if ((!"".equals(sId_docente)) && (sId_docente != null)) {
            //Sacando los datos del docente
            datosDocente = new Docentes();
            datosDocente.setId_docente(Integer.parseInt(sId_docente));
            datosDocente = this.mi.getBuscarDocente(datosDocente);
            modelo.addAttribute("datosDocente", datosDocente);

            //Aqui buscamos la asignacion docente
            Asignaciones datosAsignacion = new Asignaciones();
            datosAsignacion.setId_docente(datosDocente.getId_docente());
            List lAsignaciones = this.mi.getListarAsignacionDocenteTodas(datosAsignacion);
            modelo.addAttribute("lAsignaciones", lAsignaciones);
            return "busquedasAcademicas/buscarDocente/ListarAsignacionDocente";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosDocente = new Docentes();
            datosDocente.setDip(sCi + "%");
            datosDocente.setId_programa(id_programa);
            List lDocentes = this.mi.getBuscarListaDocentesDip(datosDocente);
            modelo.addAttribute("lDocentes", lDocentes);
            return "busquedasAcademicas/buscarDocente/ListarDocentes";
        }

        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosDocente = new Docentes();
            datosDocente.setId_programa(id_programa);
            datosDocente.setNombres("%" + sNombres + "%");
            List lDocentes = this.mi.getBuscarListaDocentesNombres(datosDocente);
            modelo.addAttribute("lDocentes", lDocentes);
            return "busquedasAcademicas/buscarDocente/ListarDocentes";
        }
        docentes.setId_docente(cliente.getId_usuario());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        return "busquedasAcademicas/buscarDocente/Entrada";
    }

    @RequestMapping(value = "/docentes/entradaAsignacioDocente.fautapo", method = RequestMethod.GET)
    public String EntradaAsignacion(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "asignacionDocenteMaterias/Entrada";
    }

    @RequestMapping(value = "/docentes/verProgramaPlanAsignacion.fautapo", method = RequestMethod.POST)
    public String verProgramaPlanAsignacion(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "asignacionDocenteMaterias/Entrada";
        }
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

        return "asignacionDocenteMaterias/ListarProgramasPlan";
    }

    @RequestMapping(value = "/docentes/listarMateriasProgramaPlan.fautapo", method = RequestMethod.POST)
    public String listarMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iId_programa = 0;
        String sId_plan = "";
        //Recuperamos las variables
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        int iId_tipo_evaluacion = cliente.getInt(request, "id_tipo_evaluacion");
        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");

        modelo.addAttribute("id_prg_plan", Integer.toString(iId_prg_plan));
        modelo.addAttribute("id_programa", Integer.toString(iId_programa));
        modelo.addAttribute("gestion", Integer.toString(iGestion));
        modelo.addAttribute("periodo", Integer.toString(iPeriodo));
        modelo.addAttribute("id_tipo_evaluacion", Integer.toString(iId_tipo_evaluacion));

        /*//Recuperamos las variables
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");
        int iId_tipo_evaluacion = cliente.getInt(request, "id_tipo_evaluacion");

        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");*/
        //Para la sacar la fase de resolucion de la designacion
        int iResultadoFaseResolucion = 0;
        //Buscamos los datos de prg_planes
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(iId_prg_plan);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        modelo.addAttribute("id_plan", sId_plan);
        if (datosPrgPlan == null) {
            modelo.addAttribute("mensaje", "No existe el plan seleccionado en Programas -, Planes");
            return "Aviso";
        }

        if (iId_tipo_evaluacion == 0) {
            modelo.addAttribute("mensaje", "Seleccione el Tipo de Evaluacion");
            return "Aviso";
        }
        // sId_plan = this.mi.getBuscarPrgPlanidplan(iId_prg_plan);
        //Buscando el programa
        Programas programa = new Programas();
        programa.setId_programa(iId_programa);
        Programas datosPrograma = this.mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("programa", datosPrograma);

        //Buscando la fase de la resolucion
        Asignaciones asigna = new Asignaciones();
        asigna.setId_programa(iId_programa);
        System.out.println("El id_programa dct -->" + Integer.toString(asigna.getId_programa()));
        asigna.setId_plan(datosPrgPlan.getId_plan());
        modelo.addAttribute("id_plan", sId_plan);
        System.out.println("El id_plan dct1 -->" + asigna.getId_plan() + sId_plan);
        asigna.setId_tipo_evaluacion(iId_tipo_evaluacion);
        System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(asigna.getId_tipo_evaluacion()));
        asigna.setGestion(iGestion);
        System.out.println("La gestion dct -->" + Integer.toString(asigna.getGestion()));
        asigna.setPeriodo(iPeriodo);
        System.out.println("El periodo dct -->" + Integer.toString(asigna.getPeriodo()));
        modelo.addAttribute("asigna", asigna);

        try {
            iResultadoFaseResolucion = this.mi.setBuscar_id_fase_resolucionFinal(asigna);
            System.out.println("LA FASE DE RESOLUCION -->" + iResultadoFaseResolucion);
            modelo.addAttribute("iResultadoFaseResolucion", Integer.toString(iResultadoFaseResolucion));
        } catch (NullPointerException e) {
            System.out.println("Excepcion llenada");
        }
        // modelo.addAttribute("asigna", asigna);

        //Buscar Tipo evaluacion
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(iId_tipo_evaluacion);
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Listamos las materias del plan mas sus grupos
        Modelos_ahorros aux = new Modelos_ahorros();
        aux.setId_programa(iId_programa);
        System.out.println("El id_programa dct -->" + Integer.toString(aux.getId_programa()));
        aux.setId_plan(datosPrgPlan.getId_plan());  //Sacando el plan de prg_planes
        System.out.println("El id_plan dct -->" + aux.getId_plan());
        aux.setGestion(iGestion);
        System.out.println("La gestion dct -->" + Integer.toString(aux.getGestion()));
        aux.setPeriodo(iPeriodo);
        System.out.println("El periodo dct -->" + Integer.toString(aux.getPeriodo()));
        aux.setId_tipo_grado(datosPrgPlan.getId_tipo_grado()); //Sacando el id_tipo_grado Universitario-Vestibular
        System.out.println("El id_tipo_grado dct -->" + Integer.toString(aux.getId_tipo_grado()));
        //try{
        List listaPlanEstudio = this.mi.getListarPlanProgramaModeloAhorro(aux);
        for (int i = 0; i < listaPlanEstudio.size(); i++) {
            Modelos_ahorros materias = (Modelos_ahorros) listaPlanEstudio.get(i);
            aux.setId_materia(materias.getId_materia());
            System.out.println("El id_materia dct -->" + Integer.toString(materias.getId_materia()));
            aux.setId_modelo_ahorro(materias.getId_modelo_ahorro());
            System.out.println("El id_modelo_ahorro dct -->" + Integer.toString(materias.getId_modelo_ahorro()));
            aux.setId_tipo_evaluacion(iId_tipo_evaluacion);
            System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(aux.getId_tipo_evaluacion()));

            materias.setGrupos(this.mi.getDptoListarGruposMateriaTipoEvaluacion(aux)); //esta funcion fue modificada.
            materias.setNro_grupos(materias.getGrupos().size());
            System.out.println("datos de-->" + (materias.getGrupos().size()));
            listaPlanEstudio.set(i, materias);
        }

        PagedListHolder listarplanestudios = new PagedListHolder(listaPlanEstudio);
        listarplanestudios.setPageSize(listarplanestudios.getNrOfElements());
        modelo.addAttribute("listarplanestudios", listarplanestudios);
        //}catch(Exception e){ 
        //System.out.println( e.toString() );
        //System.out.println("Ocurrio un error");}

        modelo.addAttribute("gestion", Integer.toString(iGestion));
        modelo.addAttribute("periodo", Integer.toString(iPeriodo));
        modelo.addAttribute("id_programa", request.getParameter("id_programa"));
        modelo.addAttribute("id_plan", request.getParameter("id_plan"));
        modelo.addAttribute("id_materia", request.getParameter("id_materia"));

        return "asignacionDocenteMaterias/ListarMaterias";
    }

    @RequestMapping(value = "/docentes/nuevoAsignacionDocente.fautapo", method = RequestMethod.POST)
    public String nuevoAsignacionDocent(HttpServletRequest request, ModelMap modelo) {
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

        //Buscamos la asignacion docente
        Asignaciones datosAsignacion = new Asignaciones();
        datosAsignacion.setId_asignacion(iId_asignacion);
        datosAsignacion = this.mi.getDctBuscarAsignacionDocente(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        if (datosAsignacion != null) {
            //Buscamos al docente
            Docentes datosDocente = new Docentes();
            datosDocente.setId_docente(datosAsignacion.getId_docente());
            datosDocente = this.mi.getBuscarDocente(datosDocente);
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

        //Listamos docentes 
        List lDocentesTodos = this.mi.getListarDocentesTodos();
        modelo.addAttribute("lDocentesTodos", lDocentesTodos);
        System.out.println("Tamanio de la lista -->" + Integer.toString(lDocentesTodos.size()));

        //Listamos los tipos
        List lTiposDocentes = this.mi.getListarTiposDocentes();
        modelo.addAttribute("lTiposDocentes", lTiposDocentes);
        List lTiposAsignaciones = this.mi.getListarTiposAsignaciones();
        modelo.addAttribute("lTiposAsignaciones", lTiposAsignaciones);

        //Listamos funciones
        List lTiposFunciones = this.mi.getListarTiposFunciones();
        modelo.addAttribute("lTiposFunciones", lTiposFunciones);

        //Sacamos el formato de la fecha	
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        if ("Eliminar".equals(sAccion)) {
            return "asignacionDocenteMaterias/ConfirmarAccionAsignacionDocente";
        }
        //modelo.addAttribute("id_modelo_ahorro", Integer.toString(iId_modelo_ahorro));

        return "asignacionDocenteMaterias/NuevoAsignacionDocente";
    }

    @RequestMapping(value = "/docentes/registrarAsignacionDocente.fautapo", method = RequestMethod.POST)
    public String registrarAsignacionDocente(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        //Estatico id_docente
        //String sId_docente ="1";
        int iResultadoAsignacion = 0;
        int iResultadoFaseResolucion = 0;
        int iId_docente = cliente.getInt(request, "id_docente");  //id_docente
        int iId_prg_plan = cliente.getInt(request, "id_prg_plan");
        int iId_asignacion = cliente.getInt(request, "id_asignacion");
        int iId_dpto_grupo = cliente.getInt(request, "id_dpto_grupo");
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        int iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        String sId_plan = request.getParameter("id_plan");
        //int iId_materia  = Integer.parseInt(request.getParameter("id_materia"));
        String sId_materia = request.getParameter("id_materia");
        String sId_grupo = request.getParameter("id_grupo");
        //int iId_tipo_docente = Integer.parseInt(request.getParameter("id_tipo_docente"));
        int iId_tipo_evaluacion = Integer.parseInt(request.getParameter("id_tipo_evaluacion"));
        //int iId_tipo_asignacion = Integer.parseInt(request.getParameter("id_tipo_asignacion"));
        String sId_tipo_docente = request.getParameter("id_tipo_docente");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        String sId_tipo_asignacion = request.getParameter("id_tipo_asignacion");

        Date sFec_inicio = cliente.getDate(request, "fec_inicio", "yyyy-MM-dd");
        Date sFec_fin = cliente.getDate(request, "fec_fin", "yyyy-MM-dd");
        String sObservacion = request.getParameter("observacion");
        String sNro_resolucion = request.getParameter("nro_resolucion");
        String sNro_resolucionhcc = request.getParameter("nro_resolucionhcc");
        String sNro_resolucionhcf = request.getParameter("nro_resolucionhcf");
        String sNro_resolucionhcu = request.getParameter("nro_resolucionhcu");
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
        datosAsignacion = this.mi.getDctBuscarAsignacionDocente(datosAsignacion);
        modelo.addAttribute("datosAsignacion", datosAsignacion);

        //Buscar Tipo evaluacion
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(iId_tipo_evaluacion);
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

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

        //Buscando la fase de la resolucion
        Asignaciones asigna = new Asignaciones();
        asigna.setId_programa(iId_programa);
        System.out.println("El id_programa dct -->" + Integer.toString(asigna.getId_programa()));
        asigna.setId_plan(datosPrgPlan.getId_plan());
        modelo.addAttribute("id_plan", sId_plan);
        System.out.println("El id_plan dct1 -->" + asigna.getId_plan() + sId_plan);
        asigna.setId_tipo_evaluacion(iId_tipo_evaluacion);
        System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(asigna.getId_tipo_evaluacion()));
        asigna.setGestion(iGestion);
        System.out.println("La gestion dct -->" + Integer.toString(asigna.getGestion()));
        asigna.setPeriodo(iPeriodo);
        System.out.println("El periodo dct -->" + Integer.toString(asigna.getPeriodo()));
        modelo.addAttribute("asigna", asigna);

        try {
            iResultadoFaseResolucion = this.mi.setBuscar_id_fase_resolucionFinal(asigna);
            System.out.println("LA FASE DE RESOLUCION -->" + iResultadoFaseResolucion);
            modelo.addAttribute("iResultadoFaseResolucion", Integer.toString(iResultadoFaseResolucion));
        } catch (NullPointerException e) {
            System.out.println("Excepcion llenada");
        }
        /*  Libretas datosTipoEval = new Libretas();
    datosTipoEval.setId_tipo_evaluacion(sId_tipo_evaluacion);
    datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
    modelo.addAttribute("datosTipoEval", datosTipoEval);*/

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
            datosDoc.setNro_resolucion(Integer.parseInt(sNro_resolucion));
            datosDoc.setNro_resolucionhcc(sNro_resolucionhcc);
            datosDoc.setNro_resolucionhcf(sNro_resolucionhcf);
            datosDoc.setNro_resolucionhcu(sNro_resolucionhcu);
            datosDoc.setFec_resolucion(sFec_resolucion);
            datosDoc.setId_asignacion(iId_asignacion);
            datosDoc.setId_rol(cliente.getId_rol());
            datosDoc.setUlt_usuario(cliente.getId_usuario());
            iResultadoAsignacion = this.mi.setRegistrarAsignacionDocente(datosDoc);
        } else {
            //Eliminar asignacion docente-materia
            if (datosAsignacion != null) {
                Asignaciones eliminar = new Asignaciones();
                eliminar.setId_asignacion(datosAsignacion.getId_asignacion());
                eliminar.setId_rol(cliente.getId_rol());;
                eliminar.setUlt_usuario(cliente.getId_usuario());
                iResultadoAsignacion = this.mi.setEliminarAsignacionDocenteMateria(eliminar);
            }
        }
        if (iResultadoAsignacion > 0) {
            //Listamos las materias del plan mas sus grupos
            Modelos_ahorros aux = new Modelos_ahorros();
            aux.setId_programa(iId_programa);
            System.out.println("El id_programa dct -->" + Integer.toString(aux.getId_programa()));
            aux.setId_plan(datosPrgPlan.getId_plan());  //Sacando el plan de prg_planes
            System.out.println("El id_plan dct -->" + aux.getId_plan());
            aux.setGestion(iGestion);
            System.out.println("La gestion dct -->" + Integer.toString(aux.getGestion()));
            aux.setPeriodo(iPeriodo);
            System.out.println("El periodo dct -->" + Integer.toString(aux.getPeriodo()));
            aux.setId_tipo_grado(datosPrgPlan.getId_tipo_grado()); //Sacando el id_tipo_grado Universitario-Vestibular
            System.out.println("El id_tipo_grado dct -->" + Integer.toString(aux.getId_tipo_grado()));
            List listaPlanEstudio = this.mi.getListarPlanProgramaModeloAhorro(aux);
            for (int i = 0; i < listaPlanEstudio.size(); i++) {
                Modelos_ahorros materias = (Modelos_ahorros) listaPlanEstudio.get(i);
                aux.setId_materia(materias.getId_materia());
                System.out.println("El id_materia dct -->" + Integer.toString(materias.getId_materia()));
                aux.setId_modelo_ahorro(materias.getId_modelo_ahorro());
                System.out.println("El id_modelo_ahorro dct -->" + Integer.toString(materias.getId_modelo_ahorro()));
                aux.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
                System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(aux.getId_tipo_evaluacion()));
                materias.setGrupos(this.mi.getDptoListarGruposMateriaTipoEvaluacion(aux));
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
            return "asignacionDocenteMaterias/ListarMaterias";
        } else {
            modelo.addAttribute("mensaje", "No se realizo la accion de asignacion del docente");
            return "Error";
        }
    }
    @RequestMapping(value="/avanzarFaseDesignacion.fautapo", method= RequestMethod.POST)
    public String avanzarFase(HttpServletRequest request, ModelMap modelo){
        Clientes cliente = this.GetUsuario();
        //String sUlt_usuario = cliente.getId_usuario() + "|" + cliente.getId_rol();

        // String sId_tipo_nota_s     = "";  //AUXILIAR 
        // int iId_asignacion = cliente.getInt(request, "id_asignacion");
        // String sId_tipo_grado      = request.getParameter("id_tipo_grado");        
        //  String sId_programa        = request.getParameter("id_programa");
        //  System.out.println("id_asignacion_docente--------avanzar fase------>" + Integer.toString(iId_asignacion));
        //  modelo.addAttribute("nombres", cliente.getNombres());
        //  modelo.addAttribute("id_tipo_grado", sId_tipo_grado);    
        //  modelo.addAttribute("id_programa", sId_programa);    
        int iId_departamento = cliente.getInt(request, "id_programa");
        int iGestion = Integer.parseInt(request.getParameter("gestion"));
        int iPeriodo = Integer.parseInt(request.getParameter("periodo"));
        int iId_tipo_evaluacion = cliente.getInt(request, "id_tipo_evaluacion");
        int iId_programa = Integer.parseInt(request.getParameter("id_programa"));
        int iResultadoFaseResolucion = 0;
        int ibuscarResultadoFaseResolucion = 0;
        String sId_plan = "";

        //  String sId_plan  = request.getParameter("id_plan");
        //String sAccion   = request.getParameter("accion");
        //  int iId_dpto_grupo = cliente.getInt(request, "id_dpto_grupo");
        //  int iId_asignacion = cliente.getInt(request, "id_asignacion");
        //  int iId_prg_plan = cliente.getInt(request, "id_prg_plan");
        modelo.addAttribute("id_departamento", request.getParameter("iId_departamento"));
        modelo.addAttribute("gestion", request.getParameter("iGestion"));
        modelo.addAttribute("periodo", request.getParameter("iPeriodo"));
        modelo.addAttribute("id_tipo_evaluacion", request.getParameter("iId_tipo_evaluacion"));
        //  modelo.addAttribute("programa", request.getParameter("programa"));        
        //  modelo.addAttribute("id_materia", request.getParameter("id_materia"));        
        //  modelo.addAttribute("materia", request.getParameter("materia"));        
        //  modelo.addAttribute("id_prg_plan", request.getParameter("id_prg_plan"));
        //   modelo.addAttribute("id_asignacion", request.getParameter("id_asignacion"));
        // modelo.addAttribute("accion", sAccion);

        //Buscamos la asignacion docente
        Asignaciones buscarAsignacion = new Asignaciones();
        buscarAsignacion.setId_departamento(iId_departamento);
        System.out.println("El id departamento es: " + buscarAsignacion.getId_departamento());
        buscarAsignacion.setGestion(iGestion);
        System.out.println("la gestion es: " + buscarAsignacion.getGestion());
        buscarAsignacion.setPeriodo(iPeriodo);
        System.out.println("El periodo es: " + buscarAsignacion.getPeriodo());
        buscarAsignacion.setId_tipo_evaluacion(iId_tipo_evaluacion);
        System.out.println("El id evaluacion es: " + buscarAsignacion.getId_tipo_evaluacion());
        // Asignaciones datosAsignacion = this.mi.getDctBuscarAsignacionDocenteDesignacion(buscarAsignacion);

        // if(datosAsignacion == null)
        //   return new ModelAndView("Error", "mensaje", "No se encontr&oacute; la asignaci&oacute;n para la gestion"+iGestion+iPeriodo+iId_tipo_evaluacion+iId_departamento);
        // modelo.addAttribute("datosAsignacion", datosAsignacion);
        iResultadoFaseResolucion = this.mi.setRegistrarFaseResolucion(buscarAsignacion);

        if (iResultadoFaseResolucion == 0) {
            modelo.addAttribute( "mensaje", "No se realizo el avance de las designaciones o la fase ya a sido avanzada");
            return "Error";
        }

        //Buscando la fase de la resolucion
        Asignaciones asigna = new Asignaciones();
        asigna.setId_programa(iId_programa);
        System.out.println("El id_programa dct -->" + Integer.toString(asigna.getId_programa()));
        asigna.setId_tipo_evaluacion(iId_tipo_evaluacion);
        System.out.println("El id_tipo_evaluacion dct -->" + Integer.toString(asigna.getId_tipo_evaluacion()));
        asigna.setGestion(iGestion);
        System.out.println("La gestion dct -->" + Integer.toString(asigna.getGestion()));
        asigna.setPeriodo(iPeriodo);
        System.out.println("El periodo dct -->" + Integer.toString(asigna.getPeriodo()));
        modelo.addAttribute("asigna", asigna);
        //asigna=
        try {
            ibuscarResultadoFaseResolucion = this.mi.setBuscar_id_fase_resolucion(asigna);
            System.out.println("LA FASE DE RESOLUCION -->" + ibuscarResultadoFaseResolucion);
            modelo.addAttribute("ibuscarResultadoFaseResolucion", Integer.toString(ibuscarResultadoFaseResolucion));
        } catch (NullPointerException e) {
            System.out.println("Excepcion llenada");
        }

        return "administrarLibretasDesignacion/AvanzarFase";
    }
}

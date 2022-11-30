/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Materias;
import org.fautapo.domain.Menciones;
import org.fautapo.domain.Personas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.BuscarConvalidacionModel;
import org.fautapo.model.ConvalidacionModel;
import org.fautapo.model.ConvalidarUniversidad;
import org.fautapo.model.ItemFacult;
import org.fautapo.model.ItemModel;
import org.fautapo.model.ParametrosConvalidacionEntrada;
import org.fautapo.model.ParametrosConvalidacionEntradas;
import org.fautapo.util.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class ConvalidacionController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private HttpServletRequest request1;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/convalidacionManual/entrada.fautapo", method = RequestMethod.GET)
    public String EntradaConvalidacion(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosConvalidacionEntradas model = new ParametrosConvalidacionEntradas();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", cliente.getImagen());
        modelo.addAttribute("model", model);
        return "administrarConvalidacionManual/registrarConvalidacion/Entrada";
    }

    @RequestMapping(value = "/convalidacionManual/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String ComprobarEntradaManual(@ModelAttribute("model") @Validated ParametrosConvalidacionEntradas model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", model.getPeriodo());
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", cliente.getImagen());
            return "administrarConvalidacionManual/registrarConvalidacion/Entrada";
        }
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", cliente.getImagen());
        modelo.addAttribute("periodo", model.getPeriodo());

        return "administrarConvalidacionManual/registrarConvalidacion/ComprobarEntrada";

    }

    @RequestMapping(value = "/convalidacionManualVolver/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String ComprobarEntradaManualVolver(@ModelAttribute("model") ParametrosConvalidacionEntradas model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("simagen", cliente.getImagen());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_departamento", model.getId_departamento());

        return "administrarConvalidacionManual/registrarConvalidacion/ComprobarEntrada";

    }

    @RequestMapping(value = "/convalidacionManual/seleccionarprograma.fautapo", method = RequestMethod.POST)
    public String seleccionarPrograma(@ModelAttribute("model") ParametrosConvalidacionEntrada model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("id_programa", model.getId_programa());
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(model.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_departamento", model.getId_departamento());
        return "administrarConvalidacionManual/registrarConvalidacion/BuscarEstudiantes";
    }

    @RequestMapping(value = "/convalidacionManual/listarPlanEstudiante.fautapo", method = RequestMethod.POST)
    public String ListarPlanEstudiante(HttpServletRequest request, ModelMap modelo) {
        Estudiantes datosEstudiante = new Estudiantes();

        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        int sId_programa = 0;
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";
        String sId_tipo_convalidacion = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        // modelo.addAttribute("id_departamento", model.getId_departamento());
        if (tipobusqueda == null) {
            sId_programa = Convert.ToInteger(request, "id_programa");
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
            sId_tipo_convalidacion = request.getParameter("id_tipo_convalidacion");
        } else {
            valor = request.getParameter("busqueda");
            sId_programa = Convert.ToInteger(request, "id_programa");
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
            sId_tipo_convalidacion = request.getParameter("id_tipo_convalidacion");
        }
        String sMensaje = "";
        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_programa", sId_programa);
        modelo.addAttribute("id_tipo_convalidacion", sId_tipo_convalidacion);

        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(sId_programa);
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);
        modelo.addAttribute("id_facultad", datosPrograma.getId_facultad());
        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi))) {
            return "administrarConvalidacionManual/registrarConvalidacion/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido. Introduzca un numero");
                return "administrarConvalidacionManual/registrarConvalidacion/Aviso";
            }
            datosEstudiante.setId_programa(sId_programa);
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                //return new ModelAndView("administrarConvalidacionManual/Aviso","mensaje","El estudiante con R.U. : "+ sId_estudiante + "no esta registrado en el Programa : "+ datosPrograma.getPrograma() + ". Verifique.");
                sMensaje = "El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.";
                modelo.addAttribute("mensaje", sMensaje);
                return "administrarConvalidacionManual/registrarConvalidacion/Aviso";
            }

            //Verificamos si tiene matricula para la gestion y periodo
            Estudiantes datosMatricula = new Estudiantes();
            datosMatricula.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatricula.setGestion(Integer.parseInt(sGestion));
            datosMatricula.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatricula = this.mi.getMtrBuscarMatricula(datosMatricula);
            if (datosMatricula == null) {
                //return new ModelAndView("administrarConvalidacionManual/Aviso", "mensaje", "El estudiante con R.U. "+sId_estudiante+" no esta matriculado para la gestion "+sGestion+" y periodo "+sPeriodo);
                sMensaje = "El estudiante con R.U. " + sId_estudiante + " no esta matriculado para la gestion " + sGestion + " y periodo " + sPeriodo;
                modelo.addAttribute("mensaje", sMensaje);
                return "administrarConvalidacionManual/registrarConvalidacion/Aviso";
            }
            if ("B".equals(datosMatricula.getId_estado())) {
                //return new ModelAndView("administrarConvalidacionManual/Aviso", "mensaje", "La matricula del estudiante con R.U. "+sId_estudiante+" esta bloqueada. Regularice su situacion.");
                sMensaje = "La Matricula del estudiante con R.U. " + sId_estudiante + " esta bloqueado. El estudiante debe regularizar su situacion.";
                modelo.addAttribute("mensaje", sMensaje);
                return "administrarConvalidacionManual/registrarConvalidacion/Aviso";
            }

            if ("B".equals(datosEstudiante.getId_estado())) {
                //return new ModelAndView("administrarConvalidacionManual/Aviso", "mensaje", "La matricula del estudiante con R.U. "+sId_estudiante+" esta bloqueada. Regularice su situacion.");
                sMensaje = "El estudiante con R.U. " + sId_estudiante + " esta bloqueado. El estudiante debe regularizar su situacion.";
                modelo.addAttribute("mensaje", sMensaje);
                return "administrarConvalidacionManual/registrarConvalidacion/Aviso";
            }

            //Sacando los datos personales del Estudiante encontrado
            Personas datosPersona = new Personas();
            datosPersona.setId_persona(datosEstudiante.getId_persona());
            datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
            modelo.addAttribute("datosPersona", datosPersona);

            //Sacando el programa en que esta el estudiante
            Programas datosProgramaEst = new Programas();
            datosProgramaEst.setId_programa(datosEstudiante.getId_programa());
            datosProgramaEst = this.mi.getPrgBuscarPrograma(datosProgramaEst);
            modelo.addAttribute("datosPrograma", datosProgramaEst);

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
            //datosPlan.setId_mencion(0)

            //Sacamos la Mencion del Estudiante  
            //Estudiantes datosEstudiante1 = new Estudiantes();
            //datosEstudiante1.setId_Estudiante(1); 
            Menciones datosMenciones = new Menciones();
            datosMenciones = this.mi.getEstBuscarMencion(datosEstudiante);

            if (datosMenciones == null) {
                datosPlan.setId_mencion(0); //Ninguno   
            } else {
                datosPlan.setId_mencion(datosMenciones.getId_mencion());
            }

            List lPlanDeEstudios = this.mi.getListarMateriasPlanMencion(datosPlan);
            modelo.addAttribute("lPlanDeEstudios", lPlanDeEstudios);

            //Listar Tipos Convalidaciones
            List lTiposConvalidaciones = this.mi.getListarTiposConvalidaciones();
            modelo.addAttribute("lTiposConvalidaciones", lTiposConvalidaciones);

            return "administrarConvalidacionManual/registrarConvalidacion/ListarPlanEstudiante";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(sId_programa);
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            //    List lEstudiantes = this.mi.getEstListarEstudiantesDip(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(sId_programa);
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
        }

        return "administrarConvalidacionManual/registrarConvalidacion/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/convalidacionManual/listarMateriasConvalidar.fautapo", method = RequestMethod.POST)
    public String ListarMateriasConvalidar(@ModelAttribute("model") BuscarConvalidacionModel model, ModelMap modelo) {

        Estudiantes datosEstudiante;
        //Recuperamos las materias seleccionadas
        String sId_materia_conv[] = model.getId_materia_conv();
        List lMateriasSeleccionadas = new ArrayList();
        String sId_materia;
        Materias datosMateria;// = new Materias();
        //Votamos los datos
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("dip", model.getCi());
        modelo.addAttribute("nombres", model.getNombres());

        if (model.getId_estudiante() == null) {
            modelo.addAttribute("mensaje", "No ingreso el R.U. el estudiante.");
            return "administrarConvalidacionManual/registrarConvalidacion/Error";
        }

        //Sacando los datos del estudiante    
        datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(model.getId_estudiante());
        datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Buscar Tipos Convalidacion
        if (model.getId_tipo_convalidacion() == null) {
            modelo.addAttribute("mensaje", "No selecciono el Tipo de Convalidacion.");
            return "administrarConvalidacionManual/registrarConvalidacion/Error";
            //  return new ModelAndView("Error", "mensaje", "No selecciono el Tipo de Convalidacion.");
        }
        Planes buscarTipoConv = new Planes();
        buscarTipoConv.setId_tipo_convalidacion(model.getId_tipo_convalidacion());
        buscarTipoConv = this.mi.getBuscarTipoConvalidacion(buscarTipoConv);
        modelo.addAttribute("buscarTipoConv", buscarTipoConv);

        //Buscar materias seleccionadas
        if (sId_materia_conv != null) {
            System.out.println("El tamanio del id_materias_conv -->" + Integer.toString(sId_materia_conv.length));
            for (int i = 0; i < sId_materia_conv.length; i++) {
                datosMateria = new Materias();
                sId_materia = sId_materia_conv[i];
                System.out.println("EL ID  MATERIA SELECCIONADA -->" + i + " = " + sId_materia);
                datosMateria.setId_materia(Integer.parseInt(sId_materia));
                datosMateria = this.mi.getMtrBuscarMateria(datosMateria);
                lMateriasSeleccionadas.add(datosMateria);
            }
        } else {
            modelo.addAttribute("mensaje", "No selecciono ninguna materia del Plan de Estudio.");
            modelo.addAttribute("id_programa", model.getId_programa());
            return "administrarConvalidacionManual/registrarConvalidacion/Error";
        }

        //Listar Universidades
        List lUniversidades = this.mi.getUnvListarUniversidades();
        modelo.addAttribute("lUniversidades", lUniversidades);
        //Listar Tipos Materias
        List lTiposMaterias = this.mi.getMtrListarTiposMaterias();
        modelo.addAttribute("lTiposMaterias", lTiposMaterias);

        //Listamos por ahora las facultades, programa, planes actuales
        //Listando Facultades por la Universidades
        Universidades datosUniversidad = new Universidades();
        System.out.println("LA universidad del Rol -->" + Integer.toString(this.GetUsuario().getId_universidad()));
        datosUniversidad.setId_universidad(this.GetUsuario().getId_universidad()); // De la institucion
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);
        System.out.println("El tamino de los Programas -->" + Integer.toString(lProgramas.size()));

        //Listar Plan del programa actual
        List lPlanesActual = this.mi.getListarPrgPlanesUniversitarios();
        modelo.addAttribute("lPlanesActual", lPlanesActual);

        System.out.println("El tamanio de la lista lMateriaSeleccionadas  -->" + Integer.toString(lMateriasSeleccionadas.size()));
        modelo.addAttribute("lMateriasSeleccionadas", lMateriasSeleccionadas);
        modelo.addAttribute("id_estudiante", model.getId_estudiante());
        modelo.addAttribute("id_programa", model.getId_programa());

        return "administrarConvalidacionManual/registrarConvalidacion/ListarMateriasConvalidar";
    }

    @RequestMapping(value = "/cargarcarreras.fautapo", method = RequestMethod.POST, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<ItemFacult>> CargarcarrerasofertadasS(@RequestBody ConvalidacionModel model) {
        List<ItemFacult> facultad = mi.GetCarrerasConvalidar(model);
        if (facultad.isEmpty()) {
            return new ResponseEntity<>(facultad, HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(facultad, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/convalidacionManual/confirmarMateriasConvalidar.fautapo", method = RequestMethod.POST)
    public String ConfirmarMateriasConvalidar(@ModelAttribute("model") ConvalidarUniversidad model, HttpServletRequest request, ModelMap modelo) {
        Estudiantes datosEstudiante;
        int iId_universidad = Convert.ToInteger(request, "id_universidad");
        String sId_materia_conv[] = request.getParameterValues("id_materia_conv");
        List lMateriasSeleccionadas = new ArrayList();
        String sId_materia;
        Materias datosMateria;// = new Materias();
        //Votamos los datos
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("dip", model.getGestion());
        modelo.addAttribute("nombres", model.getNombres());
        modelo.addAttribute("id_universidad", iId_universidad);
        modelo.addAttribute("id_facultad", model.getId_facultad());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("plan_origen", model.getPlan_origen());
        modelo.addAttribute("resolucion", model.getResolucion());
        if ("".equals(model.getId_estudiante())) {
            modelo.addAttribute("mensaje", "No ingreso el R.U. del estudiante");
            return "Error";
        }
        //Sacando los datos del estudiante    
        datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(Integer.parseInt(model.getId_estudiante()));
        datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Buscar materias seleccionadas
        if (sId_materia_conv != null) {
            System.out.println("El tamanio del id_materias_conv -->" + Integer.toString(sId_materia_conv.length));
            for (int i = 0; i < sId_materia_conv.length; i++) {
                datosMateria = new Materias();
                sId_materia = sId_materia_conv[i];
                System.out.println("EL ID  MATERIA SELECCIONADA CONFIRMAR -->" + i + " = " + sId_materia);
                datosMateria.setId_materia(Integer.parseInt(sId_materia));
                datosMateria = this.mi.getMtrBuscarMateria(datosMateria); //Buscamos la materia
                datosMateria.setId_materia(datosMateria.getId_materia());
                datosMateria.setMateria(datosMateria.getMateria());
                datosMateria.setId_tipo_materia(Integer.parseInt(request.getParameter("id_tipo_materia" + sId_materia)));
                Materias datosTipoMateria = this.mi.getMtrBuscarTipoMateria(datosMateria);//Buscar Tipo Materia Seleccionado
                datosMateria.setTipo_materia(datosTipoMateria.getTipo_materia());
                datosMateria.setSigla_origen(request.getParameter("sigla_origen" + sId_materia));
                datosMateria.setMateria_origen(request.getParameter("materia_origen" + sId_materia));
                datosMateria.setSimilitud(Integer.parseInt(request.getParameter("similitud" + sId_materia)));
                datosMateria.setNota_origen(Integer.parseInt(request.getParameter("nota_origen" + sId_materia)));
                lMateriasSeleccionadas.add(datosMateria);
            }
        } else {
            modelo.addAttribute("mensaje", "No selecciono ninguna materia del Plan de Estudio.");
            return "Error";
        }

        //Buscar Tipos Convalidacion
        Planes buscarTipoConv = new Planes();
        buscarTipoConv.setId_tipo_convalidacion(Integer.parseInt(model.getId_tipo_convalidacion()));
        buscarTipoConv = this.mi.getBuscarTipoConvalidacion(buscarTipoConv);
        modelo.addAttribute("buscarTipoConv", buscarTipoConv);

        //Buscar Universidad
        Universidades datosUniv = new Universidades();
        datosUniv.setId_universidad(iId_universidad);
        datosUniv = this.mi.getUnvBuscarUniversidad(datosUniv);
        modelo.addAttribute("datosUniv", datosUniv);

        //Buscar Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(Integer.parseInt(model.getId_programa()));
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        System.out.println("El tamanio de la lista lMateriaSeleccionadas EOEO  -->" + Integer.toString(lMateriasSeleccionadas.size()));
        modelo.addAttribute("lMateriasSeleccionadas", lMateriasSeleccionadas);
        modelo.addAttribute("id_estudiante", model.getId_estudiante());
        //Buscar materias seleccionadas
        int iResultadoId_convalidacion = 0, iResCnvDetalles = 0;
        Planes datosMateria1;
        if (sId_materia_conv != null) {
            System.out.println("El tamanio del id_materias_conv -->" + Integer.toString(sId_materia_conv.length));
            //Registramos en convalidaciones
            datosMateria1 = new Planes();
            datosMateria1.setId_estudiante(Integer.parseInt(model.getId_estudiante()));
            datosMateria1.setId_universidad(iId_universidad);
            datosMateria1.setId_programa(Integer.parseInt(model.getId_programa()));
            datosMateria1.setId_plan(model.getPlan_origen());  //Plan anterior
            datosMateria1.setId_tipo_convalidacion(Integer.parseInt(model.getId_tipo_convalidacion()));
            datosMateria1.setGestion(Integer.parseInt(model.getGestion()));
            datosMateria1.setPeriodo(Integer.parseInt(model.getPeriodo()));
            datosMateria1.setNro_resolucion(model.getResolucion());
            datosMateria1.setUlt_usuario(this.GetUsuario().getId_usuario());
            iResultadoId_convalidacion = this.mi.setRegistrarConvalidacionManual(datosMateria1);
            System.out.println("EL  RESULTADO ID  CONVALIDACION -->" + Integer.toString(iResultadoId_convalidacion));
            //Registramos en cnv_detalles
            if (iResultadoId_convalidacion > 0) {
                datosMateria1.setId_convalidacion(iResultadoId_convalidacion);
                System.out.println("EL ID  CONVALIDACION  REGISTRAR -->" + Integer.toString(datosMateria1.getId_convalidacion()));
                for (int i = 0; i < sId_materia_conv.length; i++) {
                    //datosMateria = new Planes();
                    sId_materia = sId_materia_conv[i];
                    System.out.println("EL ID  MATERIA SELECCIONADA  REGISTRAR -->" + i + " = " + sId_materia);
                    datosMateria1.setId_materia(Integer.parseInt(sId_materia));
                    datosMateria1.setId_tipo_materia(Integer.parseInt(request.getParameter("id_tipo_materia" + sId_materia)));
                    datosMateria1.setSigla_origen(request.getParameter("sigla_origen" + sId_materia));
                    datosMateria1.setMateria_origen(request.getParameter("materia_origen" + sId_materia));
                    datosMateria1.setSimilitud(Integer.parseInt(request.getParameter("similitud" + sId_materia)));
                    datosMateria1.setNota_origen(Integer.parseInt(request.getParameter("nota_origen" + sId_materia)));

                    iResCnvDetalles = this.mi.setRegistrarDetallesConvalidacionManual(datosMateria1);
                }
            }
            //Sacamos el formato de la hora
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));
            return "administrarConvalidacionManual/registrarConvalidacion/ImprimirConvalidacion";
        } else {
            modelo.addAttribute("mensaje", "No selecciono ninguna materia del Plan de Estudio.");
            return "Error";
        }

        //return new ModelAndView("administrarConvalidacionManual/registrarConvalidacion/ConfirmarMateriasConvalidar", modelo);
    }

    @RequestMapping(value = "/listarPlanes.fautapo", method = RequestMethod.POST)
    public String ListarPlanes(HttpServletRequest request, ModelMap modelo) {
        modelo.addAttribute("cliente", this.GetUsuario());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(this.GetUsuario().getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        modelo.addAttribute("lPlanes", lPlanes);
        modelo.addAttribute("usuario", this.GetUsuario().getNombres());
        return "administrarConvalidacionManual/registrarConvalidacion/ListarPlanes";
    }

    @RequestMapping(value = "/convalidacionManual/registrarMateriasConvalidar.fautapo", method = RequestMethod.POST)
    public String RegistrarMateriasConvalidar(HttpServletRequest request, ModelMap modelo) throws Exception {

        Estudiantes datosEstudiante;
        //Recuperando variables del jsp
        String sId_estudiante = request.getParameter("id_estudiante");
        String sCi = request.getParameter("ci");
        String sNombres = request.getParameter("nombres");
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sId_tipo_convalidacion = request.getParameter("id_tipo_convalidacion");
        int iId_universidad = Convert.ToInteger(request, "id_universidad");
        int iId_programa = Convert.ToInteger(request, "id_programa");
        int iId_facultad = Convert.ToInteger(request, "id_facultad");
        String sPlan_origen = Convert.ToString(request, "plan_origen");
        String sResolucion = request.getParameter("resolucion");
        String buscarTipoConv[] = request.getParameterValues("buscarTipoConv");
        String datosUniv[] = request.getParameterValues("datosUniv");

        //Recuperamos Nuevament las materias seleccionadas
        String sId_materia_conv[] = request.getParameterValues("id_materia_conv");
        List lMateriasSeleccionadas = new ArrayList();

        String sId_materia, sMensaje = "";
        Planes datosMateria;// = new Materias();
        int iResultadoId_convalidacion = 0, iResCnvDetalles = 0;
        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("dip", sGestion);
        modelo.addAttribute("nombres", sNombres);
        modelo.addAttribute("id_universidad", Integer.toString(iId_universidad));
        modelo.addAttribute("id_facultad", Integer.toString(iId_facultad));
        modelo.addAttribute("id_programa", Integer.toString(iId_programa));
        modelo.addAttribute("resolucion", sResolucion);
        if ("".equals(sId_estudiante)) {
            modelo.addAttribute("mensaje", "No ingreso el R.U. del estudiante");
            return "Error";
        }

        //Sacando los datos del estudiante    
        datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);
        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Buscar materias seleccionadas
        if (sId_materia_conv != null) {
            System.out.println("El tamanio del id_materias_conv -->" + Integer.toString(sId_materia_conv.length));
            //Registramos en convalidaciones
            datosMateria = new Planes();
            datosMateria.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMateria.setId_universidad(iId_universidad);
            datosMateria.setId_programa(iId_programa);
            datosMateria.setId_plan(sPlan_origen);  //Plan anterior
            datosMateria.setId_tipo_convalidacion(Integer.parseInt(sId_tipo_convalidacion));
            datosMateria.setGestion(Integer.parseInt(sGestion));
            datosMateria.setPeriodo(Integer.parseInt(sPeriodo));
            datosMateria.setNro_resolucion(sResolucion);
            datosMateria.setUlt_usuario(this.GetUsuario().getId_usuario());
            iResultadoId_convalidacion = this.mi.setRegistrarConvalidacionManual(datosMateria);
            System.out.println("EL  RESULTADO ID  CONVALIDACION -->" + Integer.toString(iResultadoId_convalidacion));
            //Registramos en cnv_detalles
            if (iResultadoId_convalidacion > 0) {
                datosMateria.setId_convalidacion(iResultadoId_convalidacion);
                System.out.println("EL ID  CONVALIDACION  REGISTRAR -->" + Integer.toString(datosMateria.getId_convalidacion()));
                for (int i = 0; i < sId_materia_conv.length; i++) {
                    //datosMateria = new Planes();
                    sId_materia = sId_materia_conv[i];
                    System.out.println("EL ID  MATERIA SELECCIONADA  REGISTRAR -->" + i + " = " + sId_materia);
                    datosMateria.setId_materia(Integer.parseInt(sId_materia));
                    datosMateria.setId_tipo_materia(Integer.parseInt(request.getParameter("id_tipo_materia" + sId_materia)));
                    datosMateria.setSigla_origen(request.getParameter("sigla_origen" + sId_materia));
                    datosMateria.setMateria_origen(request.getParameter("materia_origen" + sId_materia));
                    datosMateria.setSimilitud(Integer.parseInt(request.getParameter("similitud" + sId_materia)));
                    datosMateria.setNota_origen(Integer.parseInt(request.getParameter("nota_origen" + sId_materia)));
                    iResCnvDetalles = this.mi.setRegistrarDetallesConvalidacionManual(datosMateria);
                }
            }
        } else {
            modelo.addAttribute("mensaje", "No selecciono ninguna materia del Plan de Estudio.");
            return "Error";
        }

        //Si se ha realizado el registro
        if (iResCnvDetalles != 0 && iResultadoId_convalidacion != 0) {
            sMensaje = "Se ha realizado el registro de Convalidacion";
        } else {
            sMensaje = "No se ha realizado el registro";
        }
        modelo.addAttribute("mensaje", sMensaje);

        //return new ModelAndView("administrarConvalidacionManual/registrarConvalidacion/Aviso", modelo);
        modelo.addAttribute("lMateriasSeleccionadas", lMateriasSeleccionadas);
        modelo.addAttribute("datosMateria", datosMateria);

        return "administrarConvalidacionManual/registrarConvalidacion/ImprimirConvalidacion";

    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Grupos;
import org.fautapo.domain.Instituciones;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Materias;
import org.fautapo.domain.Personas;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.util.Convert;
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
public class ProgramacionController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/inscripcionMateriasAutomatica/entrada.fautapo", method = RequestMethod.GET)
    public String handleRequest(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "inscripcionMaterias/autoridadautomatica/Entrada";

    }

    @RequestMapping(value = "/inscripcionMateriasAutomatica/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String comprobarEntrada(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "inscripcionMaterias/autoridadautomatica/Entrada";
        }
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("usuario", cliente.getNombres());
        return "inscripcionMaterias/autoridadautomatica/ComprobarEntrada";
    }

    @RequestMapping(value = "/inscripcionMateriasAutomaticaVolver/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String comprobarEntradaVolver(@ModelAttribute("model") ParametrosEntrada model, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
        modelo.addAttribute("id_departamento", model.getId_departamento());
        modelo.addAttribute("usuario", cliente.getNombres());
        return "inscripcionMaterias/autoridadautomatica/ComprobarEntrada";
    }

    @RequestMapping(value = "/inscripcionMateriasAutomatica/comprobarEntrada1.fautapo", method = RequestMethod.POST)
    public String comprobarEntrada1(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        String sId_partamento = request.getParameter("id_departamento");

        if ((sId_programa != null) && (sId_tipo_evaluacion != null) && (!"".equals(sId_tipo_evaluacion))) {
            modelo.addAttribute("gestion", sGestion);
            modelo.addAttribute("periodo", sPeriodo);
            modelo.addAttribute("id_programa", sId_programa);
            modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
            modelo.addAttribute("id_departamento", sId_partamento);

            //Buscar Programa
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(Integer.parseInt(sId_programa));
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            modelo.addAttribute("datosPrograma", datosPrograma);

            //Datos Tipo Evaluacion
            Libretas datosTipoEval = new Libretas();
            datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
            modelo.addAttribute("datosTipoEval", datosTipoEval);

            return "inscripcionMaterias/autoridadautomatica/BuscarEstudiantes";
        }

        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("usuario", cliente.getNombres());
        return "inscripcionMaterias/autoridadautomatica/ComprobarEntrada";
    }

    @RequestMapping(value = "/inscripcionMateriasAutomatica/listarProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String listarProgramacionMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;

        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_programa = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";
        //String sId_tipo_convalidacion="";
        String sId_tipo_evaluacion = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");

        if (tipobusqueda == null) {
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
            sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        } else {
            valor = request.getParameter("busqueda");
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
            sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
            // sId_tipo_convalidacion = request.getParameter("id_tipo_convalidacion");
        }

        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_programa", sId_programa);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
        //Buscamos el tipo Evaluacion para programar
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Buscamos el programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(Integer.parseInt(sId_programa));
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi))) {
            return "inscripcionMaterias/autoridadautomatica/BuscarEstudiantes";
        }

        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {
                modelo.addAttribute("mensaje", " El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosPrograma.getPrograma() + ". Verifique.");
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }

            //Verificamos si tiene matricula para la gestion y periodo
            Estudiantes datosMatricula = new Estudiantes();
            Estudiantes datosMatriculax = new Estudiantes();
            Estudiantes datosMatriculaNuevo = new Estudiantes();

            try {
                datosMatricula.setId_estudiante(Integer.parseInt(sId_estudiante));
                datosMatricula.setGestion(Integer.parseInt(sGestion));
                datosMatricula.setPeriodo(Integer.parseInt(sPeriodo));
                datosMatricula = this.mi.getMtrBuscarMatricula(datosMatricula);
            } catch (Exception ex) {
                modelo.addAttribute("mensaje", "El estudiante tiene mas de una matricula registrada o problemas con el registro de las matriculas");
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }
            datosMatriculax.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatriculax.setGestion(Integer.parseInt(sGestion));
            datosMatriculax.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatriculax.setId_programa(Integer.parseInt(sId_programa));

            datosMatriculaNuevo.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatriculaNuevo.setGestion(Integer.parseInt(sGestion));
            datosMatriculaNuevo.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatriculaNuevo = this.mi.getMtrBuscarMatriculaNuevo(datosMatriculaNuevo);

            if (datosMatricula == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U. " + sId_estudiante + " no esta matriculado para la gestion " + sGestion + " y periodo " + sPeriodo);
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }
            if ("B".equals(datosMatricula.getId_estado())) {
                modelo.addAttribute("mensaje", "La matricula del estudiante con R.U. " + sId_estudiante + " esta bloqueada");
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }

            //Sacando los datos personales del Estudiante encontrado
            Personas datosPersona = new Personas();
            datosPersona.setId_persona(datosEstudiante.getId_persona());
            datosPersona = this.mi.getPrsBuscarPersona(datosPersona);

            Estudiantes datosClas = new Estudiantes();
            datosClas.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosClas = this.mi.getBuscarTipoClasificacionEstudiante(datosClas);
            datosClas.setId_persona(datosEstudiante.getId_persona());

            int id_documento = this.mi.getBuscarPrsDocumentacionCompletaEstudiante(datosClas);
            int id_compromiso = this.mi.getMiEstListarCompromisosCant(datosMatriculax);
            int id_compromiso_carrera = this.mi.getBuscarCompromisosporCarrera(datosMatriculax);

            if ((Integer.parseInt(sId_programa) != 68) && (Integer.parseInt(sId_programa) != 69)) {
                if (id_compromiso_carrera == 0) {
                    if (id_compromiso == 0) {
                        if (id_documento == 0) {
                            if (datosMatriculaNuevo == null) {
                                if (Integer.parseInt(sId_tipo_evaluacion) != 3) {
                                    modelo.addAttribute("mensaje", "El estudiante con R.U. = " + sId_estudiante + " tiene deudas con Documentos de Admision Pasar por Registros e Inscripciones o se termino el periodo de Prorroga por Carreras");
                                    return "inscripcionMaterias/autoridadautomatica/Aviso";
                                }
                            }
                        }
                    }
                }
            }
            modelo.addAttribute("datosPersona", datosPersona);

            //Sacando el programa en que esta el estludiante
            Programas datosProgramaEst = new Programas();
            datosProgramaEst.setId_programa(datosEstudiante.getId_programa());
            datosProgramaEst = this.mi.getPrgBuscarPrograma(datosProgramaEst);
            modelo.addAttribute("datosPrograma", datosProgramaEst);

            //Buscamos el periodo
            Programas buscarPeriodo = new Programas();
            buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
            buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);
            modelo.addAttribute("id_periodo", Integer.toString(buscarPeriodo.getId_periodo()));

            if (buscarPeriodo != null) {
                //Sacando los parametros de progrmacion de prg_detalles
                Programas parametro = new Programas();
                parametro.setId_programa(datosEstudiante.getId_programa());
                parametro.setId_plan(datosEstudiante.getId_plan());
                parametro.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
                parametro.setId_tipo_programacion(1); //COMO AUTORIDAD
                parametro.setGestion(Integer.parseInt(sGestion));
                parametro.setPeriodo(Integer.parseInt(sPeriodo));
                parametro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion)); ///
                List lParametros = this.mi.getPrgBuscarDetalles(parametro);

                if (lParametros.size() == 0) {
                    ////////////////////////
                    String mensajeerror = null;

                    Timestamp tFecha = new Timestamp(System.currentTimeMillis());
                    Date dateFecha = new Date(tFecha.getTime());
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    String fechaSis = df.format(dateFecha);

                    Libretas proauto = new Libretas();
                    proauto.setId_estudiante(Integer.parseInt(sId_estudiante));
                    proauto.setGestion(Integer.parseInt(sGestion));
                    proauto.setPeriodo(Integer.parseInt(sPeriodo));
                    proauto.setfec_actual(fechaSis);
                    proauto.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
                    int iValor = this.mi.setBuscarProgramacionAutorizacion(proauto);

                    if (iValor != 1) {
                        String sMensaje = "Cerradas las Programaciones de acuerdo a Calendario Academico";
                        modelo.addAttribute("mensaje", sMensaje);
                        modelo.addAttribute("periodo", sPeriodo);
                        modelo.addAttribute("gestion", sGestion);
                        return "inscripcionMaterias/autoridadautomatica/ListarProgramacionMaterias";
                    }
                    if (iValor != 0) {
                        Materias programacion = new Materias();
                        programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                        programacion.setGestion(Integer.parseInt(sGestion));
                        programacion.setPeriodo(Integer.parseInt(sPeriodo));
                        programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  //Aumentado el listado de dpto_grupos salga por Regular-Verano-Mesa
                        List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                        //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                        for (int i = 0; i < lMaterias.size(); i++) {
                            Materias materia = (Materias) lMaterias.get(i);
                            if (materia.getCupo_restante() > 0) {
                                programacion.setId_materia(materia.getId_materia());
                                programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                                materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));  //Tambien por id_tipo_evaluacion Verano-Mesa-Regular
                                lMaterias.set(i, materia);
                            }
                        }
                        modelo.addAttribute("lMaterias", lMaterias);
                    }
                    ///////////////////////

                } else {
                    Materias programacion = new Materias();
                    programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                    programacion.setGestion(Integer.parseInt(sGestion));
                    programacion.setPeriodo(Integer.parseInt(sPeriodo));
                    programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  //Aumentado el listado de dpto_grupos salga por Regular-Verano-Mesa
                    List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                    //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                    for (int i = 0; i < lMaterias.size(); i++) {
                        Materias materia = (Materias) lMaterias.get(i);
                        if (materia.getCupo_restante() > 0) {
                            programacion.setId_materia(materia.getId_materia());
                            programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                            materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));  //Tambien por id_tipo_evaluacion Verano-Mesa-Regular
                            lMaterias.set(i, materia);
                        }
                    }
                    modelo.addAttribute("lMaterias", lMaterias);
                }
                //CODIGO SEGMENTADO 1

                // inicio codigo para listar programacion estudiante
                Materias programacionEst = new Materias();
                programacionEst.setId_estudiante(Integer.parseInt(sId_estudiante));
                programacionEst.setGestion(Integer.parseInt(sGestion));
                programacionEst.setPeriodo(Integer.parseInt(sPeriodo));
                programacionEst.setMax_niveles(10);
                //programacionEst.setMax_niveles(max_nivel_academico);

                List lMateriasEst = this.mi.getEstListarProgramacionMateriasReq(programacionEst);
                for (int i = 0; i < lMateriasEst.size(); i++) {
                    Materias materiaEst = (Materias) lMateriasEst.get(i);
                    if (materiaEst.getCupo_restante() > 0) {
                        programacionEst.setId_materia(materiaEst.getId_materia());
                        programacionEst.setId_modelo_ahorro(materiaEst.getId_modelo_ahorro());
                        materiaEst.setGrupos(this.mi.getDptoListarMateriaGrupo(programacionEst));
                        lMateriasEst.set(i, materiaEst);
                    }
                }
                modelo.addAttribute("lMateriasEst", lMateriasEst);
                // fin condigo listar programcion estudiante     

                //CODIGO SEGMENTADO 1
                modelo.addAttribute("lParametros", lParametros);
            }
            //modelo.addAttribute("gestion", sGestion);
            //modelo.addAttribute("periodo", sPeriodo);
            return "inscripcionMaterias/autoridadautomatica/ListarProgramacionMaterias";

        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            //this.mi.getEstListarEstudiantesDipAccesos
            //this.mi.getEstListarEstudiantesDip
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            //return new ModelAndView("inscripcionMaterias/autoridad/ListarDatosEstudiantes", modelo);
        }
        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            //return new ModelAndView("inscripcionMaterias/autoridad/ListarDatosEstudiantes", modelo);      
        }
        return "inscripcionMaterias/autoridadautomatica/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/inscripcionMateriasAutomatica/listarProgramacionMaterias1.fautapo", method = RequestMethod.POST)
    public String listarProgramacionMaterias1(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;

        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_programa = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";
        //String sId_tipo_convalidacion="";
        String sId_tipo_evaluacion = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");

        if (tipobusqueda == null) {
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
            sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        } else {
            valor = request.getParameter("busqueda");
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
            sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
            // sId_tipo_convalidacion = request.getParameter("id_tipo_convalidacion");
        }

        //Votamos los datos
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_programa", sId_programa);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
        //Buscamos el tipo Evaluacion para programar
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);

        modelo.addAttribute("datosTipoEval", datosTipoEval);
        //Buscamos el programa
        Programas datosPrograma = new Programas();

        datosPrograma.setId_programa(Integer.parseInt(sId_programa));
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);

        modelo.addAttribute("datosPrograma", datosPrograma);

        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi))) {
            return "inscripcionMaterias/autoridadautomatica/BuscarEstudiantes";
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
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }

            //Verificamos si tiene matricula para la gestion y periodo
            Estudiantes datosMatricula = new Estudiantes();
            Estudiantes datosMatriculax = new Estudiantes();
            Estudiantes datosMatriculaNuevo = new Estudiantes();

            datosMatricula.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatricula.setGestion(Integer.parseInt(sGestion));
            datosMatricula.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatricula = this.mi.getMtrBuscarMatricula(datosMatricula);

            datosMatriculax.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatriculax.setGestion(Integer.parseInt(sGestion));
            datosMatriculax.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatriculax.setId_programa(Integer.parseInt(sId_programa));

            datosMatriculaNuevo.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatriculaNuevo.setGestion(Integer.parseInt(sGestion));
            datosMatriculaNuevo.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatriculaNuevo = this.mi.getMtrBuscarMatriculaNuevo(datosMatriculaNuevo);

            if (datosMatricula == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U. " + sId_estudiante + " no esta matriculado para la gestion " + sGestion + " y periodo " + sPeriodo);
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }
            if ("B".equals(datosMatricula.getId_estado())) {
                modelo.addAttribute("mensaje", "La matricula del estudiante con R.U. " + sId_estudiante + " esta bloqueada");
                return "inscripcionMaterias/autoridadautomatica/Aviso";
            }

            //Sacando los datos personales del Estudiante encontrado
            Personas datosPersona = new Personas();
            datosPersona.setId_persona(datosEstudiante.getId_persona());
            datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
            int id_documento = this.mi.getBuscarPrsDocumentacionCompleta(datosPersona);
            int id_compromiso = this.mi.getMiEstListarCompromisosCant(datosMatriculax);
            int id_compromiso_carrera = this.mi.getBuscarCompromisosporCarrera(datosMatriculax);

            if ((Integer.parseInt(sId_programa) != 68) && (Integer.parseInt(sId_programa) != 69)) {
                if (id_compromiso_carrera == 0) {
                    if (id_compromiso == 0) {
                        if (id_documento == 0) {
                            if (datosMatriculaNuevo == null) {
                                if (Integer.parseInt(sId_tipo_evaluacion) != 3) {
                                    modelo.addAttribute("mensaje", "El estudiante con R.U. = " + sId_estudiante + " tiene deudas con Documentos de Admision Pasar por Registros e Inscripciones o se termino el periodo de Prorroga por Carreras");
                                    return "Aviso";
                                }
                            }
                        }
                    }
                }
            }
            modelo.addAttribute("datosPersona", datosPersona);

            //Sacando el programa en que esta el estludiante
            Programas datosProgramaEst = new Programas();
            datosProgramaEst.setId_programa(datosEstudiante.getId_programa());
            datosProgramaEst = this.mi.getPrgBuscarPrograma(datosProgramaEst);
            modelo.addAttribute("datosPrograma", datosProgramaEst);

            //Buscamos el periodo
            Programas buscarPeriodo = new Programas();
            buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
            buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);
            modelo.addAttribute("id_periodo", Integer.toString(buscarPeriodo.getId_periodo()));

            if (buscarPeriodo != null) {
                //Sacando los parametros de progrmacion de prg_detalles
                Programas parametro = new Programas();
                parametro.setId_programa(datosEstudiante.getId_programa());
                parametro.setId_plan(datosEstudiante.getId_plan());
                parametro.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
                parametro.setId_tipo_programacion(1); //COMO AUTORIDAD
                parametro.setGestion(Integer.parseInt(sGestion));
                parametro.setPeriodo(Integer.parseInt(sPeriodo));
                parametro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion)); ///
                List lParametros = this.mi.getPrgBuscarDetalles(parametro);

                if (lParametros.size() == 0) {
                    ////////////////////////
                    String mensajeerror = null;

                    Timestamp tFecha = new Timestamp(System.currentTimeMillis());
                    Date dateFecha = new Date(tFecha.getTime());
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    String fechaSis = df.format(dateFecha);

                    Libretas proauto = new Libretas();
                    proauto.setId_estudiante(Integer.parseInt(sId_estudiante));
                    proauto.setGestion(Integer.parseInt(sGestion));
                    proauto.setPeriodo(Integer.parseInt(sPeriodo));
                    proauto.setfec_actual(fechaSis);
                    proauto.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
                    int iValor = this.mi.setBuscarProgramacionAutorizacion(proauto);

                    if (iValor != 1) {
                        String sMensaje = "Cerradas las Programaciones de acuerdo a Calendario Academico";
                        modelo.addAttribute("mensaje", sMensaje);
                        return "inscripcionMaterias/autoridadautomatica/ListarProgramacionMaterias";
                    }
                    if (iValor != 0) {
                        Materias programacion = new Materias();
                        programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                        programacion.setGestion(Integer.parseInt(sGestion));
                        programacion.setPeriodo(Integer.parseInt(sPeriodo));
                        programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  //Aumentado el listado de dpto_grupos salga por Regular-Verano-Mesa
                        List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                        //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                        for (int i = 0; i < lMaterias.size(); i++) {
                            Materias materia = (Materias) lMaterias.get(i);
                            if (materia.getCupo_restante() > 0) {
                                programacion.setId_materia(materia.getId_materia());
                                programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                                materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));  //Tambien por id_tipo_evaluacion Verano-Mesa-Regular
                                lMaterias.set(i, materia);
                            }
                        }
                        modelo.addAttribute("lMaterias", lMaterias);
                    }
                    ///////////////////////

                } else {
                    Materias programacion = new Materias();
                    programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                    programacion.setGestion(Integer.parseInt(sGestion));
                    programacion.setPeriodo(Integer.parseInt(sPeriodo));
                    programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  //Aumentado el listado de dpto_grupos salga por Regular-Verano-Mesa
                    List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                    //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                    for (int i = 0; i < lMaterias.size(); i++) {
                        Materias materia = (Materias) lMaterias.get(i);
                        if (materia.getCupo_restante() > 0) {
                            programacion.setId_materia(materia.getId_materia());
                            programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                            materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));  //Tambien por id_tipo_evaluacion Verano-Mesa-Regular
                            lMaterias.set(i, materia);
                        }
                    }
                    modelo.addAttribute("lMaterias", lMaterias);
                }
                //CODIGO SEGMENTADO 1

                // inicio codigo para listar programacion estudiante
                Materias programacionEst = new Materias();
                programacionEst.setId_estudiante(Integer.parseInt(sId_estudiante));
                programacionEst.setGestion(Integer.parseInt(sGestion));
                programacionEst.setPeriodo(Integer.parseInt(sPeriodo));
                programacionEst.setMax_niveles(10);
                //programacionEst.setMax_niveles(max_nivel_academico);

                List lMateriasEst = this.mi.getEstListarProgramacionMateriasReq(programacionEst);
                for (int i = 0; i < lMateriasEst.size(); i++) {
                    Materias materiaEst = (Materias) lMateriasEst.get(i);
                    if (materiaEst.getCupo_restante() > 0) {
                        programacionEst.setId_materia(materiaEst.getId_materia());
                        programacionEst.setId_modelo_ahorro(materiaEst.getId_modelo_ahorro());
                        materiaEst.setGrupos(this.mi.getDptoListarMateriaGrupo(programacionEst));
                        lMateriasEst.set(i, materiaEst);
                    }
                }
                modelo.addAttribute("lMateriasEst", lMateriasEst);
                // fin condigo listar programcion estudiante     

                //CODIGO SEGMENTADO 1
                modelo.addAttribute("lParametros", lParametros);
            }
            //modelo.addAttribute("gestion", sGestion);
            //modelo.addAttribute("periodo", sPeriodo);
            return "inscripcionMaterias/autoridadautomatica/ListarProgramacionMaterias";

        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            //this.mi.getEstListarEstudiantesDipAccesos
            //this.mi.getEstListarEstudiantesDip
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            //return new ModelAndView("inscripcionMaterias/autoridad/ListarDatosEstudiantes", modelo);
        }
        //Si la busqueda es por nombre

        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            //return new ModelAndView("inscripcionMaterias/autoridad/ListarDatosEstudiantes", modelo);      
        }

        return "inscripcionMaterias/autoridadautomatica/ListarDatosEstudiantes";
    }

    @RequestMapping(value = "/inscripcionMateriasAutomatica/confirmarProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String confirmarProgramacionMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iNro_teoricas = 0;
        int iNro_laboratorios = 0;
        int iNro_normales = 0;
        String sNombre_materia = "";
        String sSigla = "";

        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_estudiante = request.getParameter("id_estudiante");
        String sId_periodo = request.getParameter("id_periodo");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        //Buscamos el tipo Evaluacion para programar
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Sacando los datos del estudiante    
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Sacando los datos personales del Estudiante encontrado
        Personas datosPersona = new Personas();
        datosPersona.setId_persona(datosEstudiante.getId_persona());
        datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
        modelo.addAttribute("datosPersona", datosPersona);

        //Sacando el programa en que esta el estudiante
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Buscamos el periodo
        Programas buscarPeriodo = new Programas();
        buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
        buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);
        modelo.addAttribute("id_periodo", Integer.toString(buscarPeriodo.getId_periodo()));

        //Sacando los parametros de progrmacion de prg_detalles
        Programas parametro = new Programas();
        parametro.setId_programa(datosEstudiante.getId_programa());
        parametro.setId_plan(datosEstudiante.getId_plan());
        parametro.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
        parametro.setId_tipo_programacion(1); //COMO AUTORIDAD
        parametro.setGestion(Integer.parseInt(sGestion));
        parametro.setPeriodo(Integer.parseInt(sPeriodo));
        parametro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion)); ///
        List lParametros = this.mi.getPrgBuscarDetalles(parametro);

        if (lParametros.size() == 0) {
            //////////////////////
            String mensajeerror = null;

            Timestamp tFecha = new Timestamp(System.currentTimeMillis());
            Date dateFecha = new Date(tFecha.getTime());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String fechaSis = df.format(dateFecha);

            Libretas proauto = new Libretas();
            proauto.setId_estudiante(Integer.parseInt(sId_estudiante));
            proauto.setGestion(Integer.parseInt(sGestion));
            proauto.setPeriodo(Integer.parseInt(sPeriodo));
            proauto.setfec_actual(fechaSis);
            proauto.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            int iValor = this.mi.setBuscarProgramacionAutorizacion(proauto);

            if (iValor != 1) {
                modelo.addAttribute("mensaje", "Cerradas las Programaciones de acuerdo ,a Calendario Academico");
                modelo.addAttribute("periodo", sPeriodo);
                modelo.addAttribute("gestion", sGestion);
                return "inscripcionMaterias/autoridadautomatica/Aviso";
                //return new ModelAndView("Aviso","mensaje","Cerradas las Programaciones de acuerdo ,a Calendario Academico");
            }
            //////////////////////
        }
        modelo.addAttribute("lParametros", lParametros);

        int iMax_materias_teoricas = parametro.getMax_materias_teoricas();

        int iMax_materias_laboratorios = parametro.getMax_materias_laboratorios();
        float fCosto_materia_teorica = parametro.getCosto_materia_teorica();
        float fCosto_materia_laboratorio = parametro.getCosto_materia_laboratorio();

        //Recuperamos las materias seleccionadas
        String sValores[] = request.getParameterValues("materia");
        if (sValores == null) {
            modelo.addAttribute("gestion", sGestion);
            modelo.addAttribute("periodo", sPeriodo);
            modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
            modelo.addAttribute("id_estudiante", sId_estudiante);
            modelo.addAttribute("id_programa", datosEstudiante.getId_programa());
            modelo.addAttribute("mensaje", "No selecciono ninguna materia");

            return "inscripcionMaterias/autoridadautomatica/AvisoMateria";
        }

        List lMaterias = new ArrayList();

        for (int i = 0; i < sValores.length; i++) {
            if (sValores[i] != null) {
                Programas aux = new Programas();
                Materias materia_obj = new Materias();
                String sDatos[] = sValores[i].split(":");
                int iId_materia = Integer.parseInt(sDatos[0]);
                int iId_modelo_ahorro = Integer.parseInt(sDatos[1]);
                iId_modelo_ahorro = -1000000;
                if ((iId_modelo_ahorro < 0) || (iId_modelo_ahorro == 0)) {
                    iNro_teoricas = iNro_teoricas + 1;
                    materia_obj.setId_materia(iId_materia);
                    materia_obj = this.mi.getMtrBuscarMateria(materia_obj);
                    sNombre_materia = materia_obj.getMateria();
                    sSigla = materia_obj.getSigla();
                } else {
                    aux.setId_modelo_ahorro(iId_modelo_ahorro);
                    aux = this.mi.getMdlBuscarMateriaAhorro(aux);
                    sNombre_materia = aux.getModelo_ahorro();
                    sSigla = "--";
                    iNro_laboratorios = iNro_laboratorios + 1;
                }
                String sId_grupo = request.getParameter("id_grupo:" + sValores[i]);
                Grupos grupo_obj = new Grupos();
                try {
                    grupo_obj.setId_grupo(Integer.parseInt(sId_grupo));
                } catch (Exception e) {
                    modelo.addAttribute("mensaje", "No selecciono el grupo de  la materia. Revise por favor");
                    return "inscripcionMaterias/autoridadautomatica/Error";
                }
                grupo_obj = this.mi.getGrpBuscarGrupo(grupo_obj);
                aux.setId_materia(iId_materia);
                aux.setMateria(sNombre_materia);
                aux.setSigla(sSigla);
                aux.setId_modelo_ahorro(iId_modelo_ahorro);
                aux.setGrupo(grupo_obj.getGrupo());
                aux.setId_grupo(Integer.parseInt(sId_grupo));
                lMaterias.add(aux);
            }
        }

        //Como todo esta bien, sumamos el total de materias
        int iTotal_materias = iNro_teoricas + iNro_laboratorios;
        modelo.addAttribute("total_materias", Integer.toString(iTotal_materias));
        modelo.addAttribute("lMaterias", lMaterias);
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
        modelo.addAttribute("nombres", cliente.getNombres());
        return "inscripcionMaterias/autoridadautomatica/ConfirmarProgramacionMaterias";
    }

    @RequestMapping(value = "/inscripcionMateriasAutomatica/registrarProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String registrarProgramacionMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        String sId_estudiante = request.getParameter("id_estudiante");
        String sId_periodo = request.getParameter("id_periodo");
        int iTotal_materias = Integer.parseInt(request.getParameter("total_materias"));
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);

        //Buscamos el tipo Evaluacion para programar
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Sacando los datos del estudiante    
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Buscamos el periodo
        Programas buscarPeriodo = new Programas();
        buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
        buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);

        boolean bBandera = true;
        for (int i = 0; i < iTotal_materias; i++) {
            String sMateria = request.getParameter("materia" + i);
            String sDatos[] = sMateria.split(":");
            Grupos grupo = new Grupos();
            grupo.setId_materia(Integer.parseInt(sDatos[0]));
            grupo.setId_modelo_ahorro(Integer.parseInt(sDatos[1]));
            grupo.setGestion(Integer.parseInt(sGestion));
            grupo.setPeriodo(Integer.parseInt(sPeriodo));
            grupo.setId_grupo(Integer.parseInt(sDatos[2]));

            grupo = this.mi.getDptoBuscarCupoRestanteGrupo(grupo);
            if (grupo.getCupo_actual() > 0) {
                Programas programacion = new Programas();
                programacion.setId_estudiante(datosEstudiante.getId_estudiante());
                programacion.setId_materia(Integer.parseInt(sDatos[0]));
                programacion.setId_grupo(Integer.parseInt(sDatos[2]));
                programacion.setId_modelo_ahorro(Integer.parseInt(sDatos[1]));
                programacion.setGestion(Integer.parseInt(sGestion));
                programacion.setPeriodo(Integer.parseInt(sPeriodo));
                programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion)); //Tipo_evaluacion de programacion Regular-Verano-Mesa
                programacion.setId_rol(cliente.getId_rol());         //CRCB
                programacion.setUlt_usuario(cliente.getId_usuario());
                programacion.setId_desconcentrado(datosEstudiante.getId_desconcentrado());
                this.mi.setEstProgramacionMateria(programacion);
            } else {
                bBandera = false;
            }
        }
        if (!bBandera) {
            modelo.addAttribute("mensaje", "Alguna de sus materias no fueron programadas por falta de plazas");
            return "Aviso";
        }
        //CAMBIANDO ESTADO DE PROGRAMACION aUTORIZACION
        Timestamp tFecha = new Timestamp(System.currentTimeMillis());
        Date dateFecha = new Date(tFecha.getTime());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String fechaSis = df.format(dateFecha);

        Libretas proauto = new Libretas();
        proauto.setId_estudiante(Integer.parseInt(sId_estudiante));
        proauto.setGestion(Integer.parseInt(sGestion));
        proauto.setPeriodo(Integer.parseInt(sPeriodo));
        proauto.setfec_actual(fechaSis);
        proauto.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        int iValor = this.mi.setBuscarProgramacionAutorizacion(proauto);

        if (iValor != 0) {
            Libretas camest = new Libretas();
            camest.setId_estudiante(Integer.parseInt(sId_estudiante));
            camest.setGestion(Integer.parseInt(sGestion));
            camest.setPeriodo(Integer.parseInt(sPeriodo));
            camest.setfec_actual(fechaSis);
            camest.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            this.mi.setCambioEstadoProgramacionAutorizacion(camest);
        }
        //
        // INICIO - DESDE AQUI LA IMPRESION DE LA PROGRAMACION
        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Listamos la programacion del estudiante
        datosEstudiante.setGestion(Integer.parseInt(sGestion));
        datosEstudiante.setPeriodo(Integer.parseInt(sPeriodo));
        if (("1".equals(sId_tipo_evaluacion)) || ("4".equals(sId_tipo_evaluacion))) {
            List lProgramacion = this.mi.getEstListarProgramacion(datosEstudiante);
            modelo.addAttribute("lProgramacion", lProgramacion);
        } else {
            if ("3".equals(sId_tipo_evaluacion)) {
                List lProgramacion = this.mi.getEstListarProgramacioncv(datosEstudiante);
                modelo.addAttribute("lProgramacion", lProgramacion);
            }
        }
        //Sacamos los datos del Estudiante
        datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
        modelo.addAttribute("datosEstudiante2", datosEstudiante);

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

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }
        // FIN - DESDE AQUI LA IMPRESION DE LA PROGRAMACION
        modelo.addAttribute("usuario", cliente.getNombres());
        return "inscripcionMaterias/autoridadautomatica/ImprimirProgramacion";
    }

    @RequestMapping(value = "/retiroAdicionMaterias/entrada.fautapo", method = RequestMethod.GET)
    public String retiroAdicionMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "retiroAdicionMaterias/autoridad/Entrada";
    }

    @RequestMapping(value = "/retiroAdicionMaterias/comprobarEntrada.fautapo", method = RequestMethod.POST)
    public String retiroAdicionMateriasComprobar(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "retiroAdicionMaterias/autoridad/Entrada";
        }
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        if ((sId_programa != null) && (sId_tipo_evaluacion != null) && (!"".equals(sId_tipo_evaluacion))) {

            //Buscamos el tipo Evaluacion para programar
            Libretas datosTipoEval = new Libretas();
            datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
            modelo.addAttribute("datosTipoEval", datosTipoEval);

            //Buscamos el programa
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(Integer.parseInt(sId_programa));
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            modelo.addAttribute("datosPrograma", datosPrograma);

            modelo.addAttribute("gestion", sGestion);
            modelo.addAttribute("periodo", sPeriodo);
            modelo.addAttribute("id_programa", sId_programa);
            modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);

            return "retiroAdicionMaterias/autoridad/BuscarEstudiantes";
        }

        // Comprobamos si es quien debe ingresar al modulo, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));

        //Listar Tipos Evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());

        return "retiroAdicionMaterias/autoridad/ComprobarEntrada";
    }

    @RequestMapping(value = "/retiroAdicionMaterias/comprobarEntrada1.fautapo", method = RequestMethod.POST)
    public String retiroAdicionMateriasComprobar1(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        if ((sId_programa != null) && (sId_tipo_evaluacion != null) && (!"".equals(sId_tipo_evaluacion))) {

            //Buscamos el tipo Evaluacion para programar
            Libretas datosTipoEval = new Libretas();
            datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
            modelo.addAttribute("datosTipoEval", datosTipoEval);

            //Buscamos el programa
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(Integer.parseInt(sId_programa));
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            modelo.addAttribute("datosPrograma", datosPrograma);

            modelo.addAttribute("gestion", sGestion);
            modelo.addAttribute("periodo", sPeriodo);
            modelo.addAttribute("id_programa", sId_programa);
            modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);

            return "retiroAdicionMaterias/autoridad/BuscarEstudiantes";
        }
        // Comprobamos si es quien debe ingresar al modulo, de acuerdo a su clave
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(cliente.getId_usuario());
        usuario.setClave(request.getParameter("clave" + request.getParameter("hora")));
        //Listar Tipos Evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);

        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());
        return "retiroAdicionMaterias/autoridad/ComprobarEntrada";
    }

    @RequestMapping(value = "/retiroAdicionMaterias/listarAccionProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String listarAccionProgramacionMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Estudiantes datosEstudiante;

        String tipobusqueda = request.getParameter("tipobusqueda");
        String valor = "";
        String sId_programa = "";
        String sId_estudiante = "";
        String sCi = "";
        String sNombres = "";
        //String sId_tipo_convalidacion="";
        String sId_tipo_evaluacion = "";
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");

        if (tipobusqueda == null) {
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = request.getParameter("id_estudiante");
            sCi = request.getParameter("ci");
            sNombres = request.getParameter("nombres");
            sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        } else {
            valor = request.getParameter("busqueda");
            sId_programa = request.getParameter("id_programa");
            sId_estudiante = tipobusqueda.equals("id_estudiante") ? valor : "";
            sCi = tipobusqueda.equals("ci") ? valor : "";
            sNombres = tipobusqueda.equals("nombre") ? valor : "";
            sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
            // sId_tipo_convalidacion = request.getParameter("id_tipo_convalidacion");
        }
        //Recuperando variables del jsp

        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_programa", sId_programa);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
        if ("".equals(sId_estudiante) && ("".equals(sNombres)) && ("".equals(sCi)) && ("".equals(sId_tipo_evaluacion)) && ("".equals(sId_programa))) {
            return "retiroAdicionMaterias/autoridad/BuscarEstudiantes";
        }

        //Buscamos el tipo Evaluacion para programar
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Buscamos el programa
        Programas datosProgramaI = new Programas();
        datosProgramaI.setId_programa(Integer.parseInt(sId_programa));
        datosProgramaI = this.mi.getPrgBuscarPrograma(datosProgramaI);
        modelo.addAttribute("datosPrograma", datosProgramaI);

        // Si la busqueda es por R.U.
        if (!"".equals(sId_estudiante)) {
            //Sacando los datos del estudiante    
            datosEstudiante = new Estudiantes();
            try {
                datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
            } catch (Exception e) {
                modelo.addAttribute("id_estudiante", datosEstudiante.getId_estudiante());
                modelo.addAttribute("mensaje", "El R.U. no es valido, introduzca un numero");
                return "retiroAdicionMaterias/autoridad/Aviso";
            }
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            datosEstudiante = this.mi.getEstBuscarEstudiantePrograma(datosEstudiante);
            modelo.addAttribute("datosEstudiante", datosEstudiante);
            if (datosEstudiante == null) {

                modelo.addAttribute("mensaje", "El estudiante con R.U. : " + sId_estudiante + " no esta registrado en el Programa : " + datosProgramaI.getPrograma() + ". Verifique.");
                return "retiroAdicionMaterias/autoridad/Aviso";
            }
            //Verificamos si tiene matricula para la gestion y periodo
            Estudiantes datosMatricula = new Estudiantes();
            Estudiantes datosMatriculax = new Estudiantes();
            Estudiantes datosMatriculaNuevo = new Estudiantes();

            datosMatricula.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatricula.setGestion(Integer.parseInt(sGestion));
            datosMatricula.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatricula = this.mi.getMtrBuscarMatricula(datosMatricula);

            datosMatriculax.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatriculax.setGestion(Integer.parseInt(sGestion));
            datosMatriculax.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatriculax.setId_programa(Integer.parseInt(sId_programa));

            datosMatriculaNuevo.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosMatriculaNuevo.setGestion(Integer.parseInt(sGestion));
            datosMatriculaNuevo.setPeriodo(Integer.parseInt(sPeriodo));
            datosMatriculaNuevo = this.mi.getMtrBuscarMatriculaNuevo(datosMatriculaNuevo);

            if (datosMatricula == null) {
                modelo.addAttribute("mensaje", "El estudiante con R.U. " + sId_estudiante + " no esta matriculado para la gestion " + sGestion + " y periodo " + sPeriodo);
                return "retiroAdicionMaterias/autoridad/Aviso";
            }
            if ("B".equals(datosMatricula.getId_estado())) {
                modelo.addAttribute("mensaje", " La matricula del estudiante con R.U. " + sId_estudiante + " esta bloqueada");
                return "retiroAdicionMaterias/autoridad/Aviso";
            }
            //Sacando los datos personales del Estudiante encontrado
            Personas datosPersona = new Personas();
            datosPersona.setId_persona(datosEstudiante.getId_persona());
            datosPersona = this.mi.getPrsBuscarPersona(datosPersona);

            Estudiantes datosClas = new Estudiantes();
            datosClas.setId_estudiante(Integer.parseInt(sId_estudiante));
            datosClas = this.mi.getBuscarTipoClasificacionEstudiante(datosClas);
            datosClas.setId_persona(datosEstudiante.getId_persona());

            int id_documento = this.mi.getBuscarPrsDocumentacionCompletaEstudiante(datosClas);
            int id_compromiso = this.mi.getMiEstListarCompromisosCant(datosMatriculax);
            int id_compromiso_carrera = this.mi.getBuscarCompromisosporCarrera(datosMatriculax);

            if ((Integer.parseInt(sId_programa) != 68) && (Integer.parseInt(sId_programa) != 69)) {
                if (id_compromiso_carrera == 0) {
                    if (id_compromiso == 0) {
                        if (id_documento == 0) {
                            if (datosMatriculaNuevo == null) {
                                if (Integer.parseInt(sId_tipo_evaluacion) != 3) {
                                    modelo.addAttribute("mensaje", "El estudiante con R.U. = " + sId_estudiante + " tiene deudas con Documentos de Admision Pasar por Registros e Inscripciones o se termino el periodo de Prorroga por Carreras");
                                    return "Aviso";
                                }
                            }
                        }
                    }
                }
            }

            modelo.addAttribute("datosPersona", datosPersona);

            //Sacando el programa en que esta el estudiante
            Programas datosPrograma = new Programas();
            datosPrograma.setId_programa(datosEstudiante.getId_programa());
            datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
            modelo.addAttribute("datosPrograma", datosPrograma);

            //Buscamos el periodo
            Programas buscarPeriodo = new Programas();
            buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
            buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);
            modelo.addAttribute("id_periodo", Integer.toString(buscarPeriodo.getId_periodo()));
            modelo.addAttribute("usuario", cliente.getNombres());
            return "retiroAdicionMaterias/autoridad/RetirarAdicionarCambiarMaterias";
        }

        //Si la busqueda es por CI
        if (!"".equals(sCi)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setDip(sCi);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesDipAccesos(datosEstudiante);
            //this.mi.getEstListarEstudiantesDipAccesos
            //this.mi.getEstListarEstudiantesDip
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            return "retiroAdicionMaterias/autoridad/ListarDatosEstudiantes";
        }

        //Si la busqueda es por nombre
        if (!"".equals(sNombres)) {
            datosEstudiante = new Estudiantes();
            datosEstudiante.setNombres(sNombres);
            datosEstudiante.setId_programa(Integer.parseInt(sId_programa));
            List lEstudiantes = this.mi.getEstListarEstudiantesNombres(datosEstudiante);
            //getEstListarEstudiantesNombresAccesos
            //getEstListarEstudiantesNombres
            modelo.addAttribute("lEstudiantes", lEstudiantes);
            return "retiroAdicionMaterias/autoridad/ListarDatosEstudiantes";
        }
        return "retiroAdicionMaterias/autoridad/RetirarAdicionarCambiarMaterias";
    }

    @RequestMapping(value = "/retiroAdicionMaterias/listarProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String listarProgramacionMateriasretiro(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        //Recuperando variables del jsp
        String sId_estudiante = request.getParameter("id_estudiante");
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_programa = request.getParameter("id_programa");
        String sAccion = request.getParameter("accion");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        modelo.addAttribute("accion", sAccion);
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);

        //Buscando el tipo_evaluacion Verano-Mesa-Regular
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Sacando el programa en que esta el estludiante
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(Integer.parseInt(sId_programa));
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);
        //Sacando los datos del estudiante    
        Estudiantes datosEstudiante = new Estudiantes();
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
            return "retiroAdicionMaterias/autoridad/Aviso";
        }
        //Verificamos si tiene matricula para la gestion y periodo
        Estudiantes datosMatricula = new Estudiantes();
        datosMatricula.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosMatricula.setGestion(Integer.parseInt(sGestion));
        datosMatricula.setPeriodo(Integer.parseInt(sPeriodo));
        datosMatricula = this.mi.getMtrBuscarMatricula(datosMatricula);
        if (datosMatricula == null) {
            modelo.addAttribute("mensaje", "El estudiante con R.U. " + sId_estudiante + " no esta matriculado para la gestion " + sGestion + " y periodo " + sPeriodo);
            return "retiroAdicionMaterias/autoridad/Aviso";
        }
        if ("B".equals(datosMatricula.getId_estado())) {
            modelo.addAttribute("mensaje", "La matricula del estudiante con R.U. " + sId_estudiante + " esta bloqueada");
            return "retiroAdicionMaterias/autoridad/Aviso";
        }
        System.out.println("ESTOY AKY 2------------------");
        //Sacando los datos personales del Estudiante encontrado
        Personas datosPersona = new Personas();
        datosPersona.setId_persona(datosEstudiante.getId_persona());
        datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
        modelo.addAttribute("datosPersona", datosPersona);

        //Buscamos el periodo
        Programas buscarPeriodo = new Programas();
        buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
        buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);
        modelo.addAttribute("id_periodo", Integer.toString(buscarPeriodo.getId_periodo()));

        //Sacando los parametros de programacion de prg_detalles
        Programas parametro = new Programas();
        parametro.setId_programa(datosEstudiante.getId_programa());
        parametro.setId_plan(datosEstudiante.getId_plan());
        parametro.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
        parametro.setId_tipo_programacion(1); //COMO AUTORIDAD
        parametro.setGestion(Integer.parseInt(sGestion));
        parametro.setPeriodo(Integer.parseInt(sPeriodo));
        parametro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion)); ///
        List lParametros = this.mi.getPrgBuscarDetalles(parametro);

        if (lParametros.size() == 0) {
            ////////////////////////
            String mensajeerror = null;

            Timestamp tFecha = new Timestamp(System.currentTimeMillis());
            Date dateFecha = new Date(tFecha.getTime());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String fechaSis = df.format(dateFecha);

            Libretas proautoa = new Libretas();
            proautoa.setId_estudiante(Integer.parseInt(sId_estudiante));
            proautoa.setGestion(Integer.parseInt(sGestion));
            proautoa.setPeriodo(Integer.parseInt(sPeriodo));
            proautoa.setfec_actual(fechaSis);
            proautoa.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            int iValor1 = this.mi.setBuscarProgramacionAutorizacion(proautoa);
            if (iValor1 != 1) {
                System.out.println("VALOR 1");
                String sMensaje = "Cerradas las Programaciones de acuerdo a Calendario Academico";
                //modelo.addAttribute("gestion", sGestion);
                //modelo.addAttribute("periodo", sPeriodo);
                modelo.addAttribute("id_programa", sId_programa);
                modelo.addAttribute("mensaje", sMensaje);
                modelo.addAttribute("usuario", cliente.getNombres());
                return "inscripcionMaterias/autoridad/ListarProgramacionMaterias";
            }
            if (iValor1 != 0) {
                if ("Adicion".equals(sAccion)) {
                    Materias programacion = new Materias();
                    programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                    programacion.setGestion(Integer.parseInt(sGestion));
                    programacion.setPeriodo(Integer.parseInt(sPeriodo));
                    programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
                    List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                    //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                    for (int i = 0; i < lMaterias.size(); i++) {
                        Materias materia = (Materias) lMaterias.get(i);
                        if (materia.getCupo_restante() > 0) {
                            programacion.setId_materia(materia.getId_materia());
                            programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                            materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));
                            lMaterias.set(i, materia);
                        }
                    }
                    modelo.addAttribute("lMaterias", lMaterias);
                    //modelo.addAttribute("gestion", sGestion);
                    //modelo.addAttribute("periodo", sPeriodo);
                    modelo.addAttribute("lParametros", lParametros);
                    return "retiroAdicionMaterias/autoridad/ListarProgramacionMaterias";

                }
                if ("Retiro".equals(sAccion)) {
                    Programas retiro = new Programas();
                    retiro.setId_estudiante(datosEstudiante.getId_estudiante());
                    retiro.setGestion(Integer.parseInt(sGestion));
                    retiro.setPeriodo(Integer.parseInt(sPeriodo));
                    retiro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  // Listar por Verano-Mesa-Regular
                    List lMateriasRetiro = this.mi.getEstListarProgramacionesEstudiante(retiro);
                    //modelo.addAttribute("gestion", sGestion);
                    //modelo.addAttribute("periodo", sPeriodo);
                    modelo.addAttribute("lParametros", lParametros);
                    modelo.addAttribute("lMateriasRetiro", lMateriasRetiro);
                    return "retiroAdicionMaterias/autoridad/ListarRetirarMaterias";
                }

                if ("Cambio de grupo".equals(sAccion)) {
                    Materias programacion = new Materias();
                    programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                    programacion.setGestion(Integer.parseInt(sGestion));
                    programacion.setPeriodo(Integer.parseInt(sPeriodo));
                    programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  //Listar si es para Verano.Mesa-REgular
                    List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                    //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                    for (int i = 0; i < lMaterias.size(); i++) {
                        Materias materia = (Materias) lMaterias.get(i);
                        if (materia.getCupo_restante() > 0) {
                            programacion.setId_materia(materia.getId_materia());
                            programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                            materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));
                            lMaterias.set(i, materia);
                        }
                    }
                    modelo.addAttribute("lMaterias", lMaterias);
                    //modelo.addAttribute("gestion", sGestion);
                    //modelo.addAttribute("periodo", sPeriodo);
                    modelo.addAttribute("lParametros", lParametros);
                    System.out.println("ESTOY AKY 3");
                    return "retiroAdicionMaterias/autoridad/ListarCambiarGrupoMaterias";
                }
            }
        } else {
            if ("Adicion".equals(sAccion)) {
                Materias programacion = new Materias();
                programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                programacion.setGestion(Integer.parseInt(sGestion));
                programacion.setPeriodo(Integer.parseInt(sPeriodo));
                programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
                List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                for (int i = 0; i < lMaterias.size(); i++) {
                    Materias materia = (Materias) lMaterias.get(i);
                    if (materia.getCupo_restante() > 0) {
                        programacion.setId_materia(materia.getId_materia());
                        programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                        materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));
                        lMaterias.set(i, materia);
                    }
                }
                modelo.addAttribute("lMaterias", lMaterias);
                //modelo.addAttribute("gestion", sGestion);
                //modelo.addAttribute("periodo", sPeriodo);
                modelo.addAttribute("lParametros", lParametros);
                return "retiroAdicionMaterias/autoridad/ListarProgramacionMaterias";

            }
            if ("Retiro".equals(sAccion)) {
                Programas retiro = new Programas();
                retiro.setId_estudiante(datosEstudiante.getId_estudiante());
                retiro.setGestion(Integer.parseInt(sGestion));
                retiro.setPeriodo(Integer.parseInt(sPeriodo));
                retiro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  // Listar por Verano-Mesa-Regular
                List lMateriasRetiro = this.mi.getEstListarProgramacionesEstudiante(retiro);
                modelo.addAttribute("gestion", sGestion);
                modelo.addAttribute("periodo", sPeriodo);
                modelo.addAttribute("lParametros", lParametros);
                modelo.addAttribute("lMateriasRetiro", lMateriasRetiro);
                modelo.addAttribute("usuario", cliente.getNombres());
                return "retiroAdicionMaterias/autoridad/ListarRetirarMaterias";
            }

            if ("Cambio de grupo".equals(sAccion)) {
                Materias programacion = new Materias();
                programacion.setId_estudiante(Integer.parseInt(sId_estudiante));
                programacion.setGestion(Integer.parseInt(sGestion));
                programacion.setPeriodo(Integer.parseInt(sPeriodo));
                programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  //Listar si es para Verano.Mesa-REgular
                List lMaterias = this.mi.getEstListarProgramacionMateriasReq(programacion);
                //List lMaterias = this.mi.getEstPrgListarProgramacionMateriasAut(programacion);
                for (int i = 0; i < lMaterias.size(); i++) {
                    Materias materia = (Materias) lMaterias.get(i);
                    if (materia.getCupo_restante() > 0) {
                        programacion.setId_materia(materia.getId_materia());
                        programacion.setId_modelo_ahorro(materia.getId_modelo_ahorro());
                        materia.setGrupos(this.mi.getDptoListarMateriaGrupo(programacion));
                        lMaterias.set(i, materia);
                    }
                }
                modelo.addAttribute("lMaterias", lMaterias);
                modelo.addAttribute("gestion", sGestion);
                modelo.addAttribute("periodo", sPeriodo);
                modelo.addAttribute("lParametros", lParametros);
                return "retiroAdicionMaterias/autoridad/ListarCambiarGrupoMaterias";
            }
        }
        return "retiroAdicionMaterias/autoridad/ProgramacionMateriasSalida1";
    }

    @RequestMapping(value = "/retiroAdicionMaterias/confirmarAccionProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String confirmarProgramacionMaterias11(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iNro_teoricas = 0;
        int iNro_laboratorios = 0;
        int iNro_normales = 0;
        String sNombre_materia = "";
        String sSigla = "", sCadena = "";
        List lMaterias = new ArrayList();
        String sAccion = request.getParameter("accion");
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_estudiante = request.getParameter("id_estudiante");
        String sId_periodo = request.getParameter("id_periodo");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);

        //Buscamos el tipo Evaluacion para programar
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Sacando los datos del estudiante    
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Sacando los datos personales del Estudiante encontrado
        Personas datosPersona = new Personas();
        datosPersona.setId_persona(datosEstudiante.getId_persona());
        datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
        modelo.addAttribute("datosPersona", datosPersona);

        //Sacando el programa en que esta el estudiante
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Buscamos el periodo
        Programas buscarPeriodo = new Programas();
        buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
        buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);
        modelo.addAttribute("id_periodo", Integer.toString(buscarPeriodo.getId_periodo()));

        //Sacando los parametros de progrmacion de prg_detalles
        Programas parametro = new Programas();
        parametro.setId_programa(datosEstudiante.getId_programa());
        parametro.setId_plan(datosEstudiante.getId_plan());
        parametro.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
        parametro.setId_tipo_programacion(1); //COMO AUTORIDAD
        parametro.setGestion(Integer.parseInt(sGestion));
        parametro.setPeriodo(Integer.parseInt(sPeriodo));
        parametro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        List lParametros = this.mi.getPrgBuscarDetalles(parametro);

        if (lParametros.size() == 0) {
            //////////////////////
            String mensajeerror = null;

            Timestamp tFecha = new Timestamp(System.currentTimeMillis());
            Date dateFecha = new Date(tFecha.getTime());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String fechaSis = df.format(dateFecha);

            Libretas proauto = new Libretas();
            proauto.setId_estudiante(Integer.parseInt(sId_estudiante));
            proauto.setGestion(Integer.parseInt(sGestion));
            proauto.setPeriodo(Integer.parseInt(sPeriodo));
            proauto.setfec_actual(fechaSis);
            proauto.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            int iValor = this.mi.setBuscarProgramacionAutorizacion(proauto);

            if (iValor != 1) {
                modelo.addAttribute("periodo", sPeriodo);
                modelo.addAttribute("gestion", sGestion);
                return "retiroAdicionMaterias/autoridad/Aviso";
                // return new ModelAndView("Aviso","mensaje","Cerradas las Programaciones de acuerdo a Calendario Academico");
            }
            //////////////////////
            // return new ModelAndView("Aviso","mensaje","No existe parametros de programacion");
        }
        modelo.addAttribute("lParametros", lParametros);

        int iMax_materias_teoricas = parametro.getMax_materias_teoricas();

        int iMax_materias_laboratorios = parametro.getMax_materias_laboratorios();
        float fCosto_materia_teorica = parametro.getCosto_materia_teorica();
        float fCosto_materia_laboratorio = parametro.getCosto_materia_laboratorio();

        //Recuperamos las materias seleccionadas
        String sValores[] = request.getParameterValues("materia");
        if (sValores == null) {
            modelo.addAttribute("periodo", sPeriodo);
            modelo.addAttribute("gestion", sGestion);
            modelo.addAttribute("mensaje", "No selecciono ninguna materia");
            modelo.addAttribute("accion", sAccion);
            return "retiroAdicionMaterias/autoridad/AvisoMateria";
        }
        if ("Retiro".equals(sAccion)) {
            for (int i = 0; i < sValores.length; i++) {
                if (sValores[i] != null) {
                    Programas aux = new Programas();
                    Materias materia_obj = new Materias();
                    String sDatos[] = sValores[i].split(":");
                    int iId_programacion = Integer.parseInt(sDatos[0]);
                    int iId_materia = Integer.parseInt(sDatos[1]);
                    int iId_modelo_ahorro = Integer.parseInt(sDatos[2]);
                    //  iId_modelo_ahorro = -1000000;
                    if ((iId_modelo_ahorro < 0) || (iId_modelo_ahorro == 0)) {
                        iNro_teoricas = iNro_teoricas + 1;
                        materia_obj.setId_materia(iId_materia);
                        materia_obj = this.mi.getMtrBuscarMateria(materia_obj);
                        sNombre_materia = materia_obj.getMateria();
                        sSigla = materia_obj.getSigla();
                    } else {
                        // iId_modelo_ahorro = Integer.parseInt(sDatos[2]);
                        aux.setId_modelo_ahorro(iId_modelo_ahorro);
                        //   aux.setId_modelo_ahorro(Convert.sDatos[2]);
                        aux = this.mi.getMdlBuscarMateriaAhorro(aux);
                        ///    sNombre_materia = aux.getModelo_ahorro();
                        sSigla = "--";
                        iNro_laboratorios = iNro_laboratorios + 1;
                    }
                    int sId_grupo = Integer.parseInt(sDatos[3]);
                    // String sId_grupo = request.getParameter("id_grupo:" + sValores[3]);
                    Grupos grupo_obj = new Grupos();
                    grupo_obj.setId_grupo(sId_grupo);
                    grupo_obj = this.mi.getGrpBuscarGrupo(grupo_obj);
                    aux.setId_materia(iId_materia);
                    aux.setMateria(sNombre_materia);
                    aux.setSigla(sSigla);
                    aux.setId_modelo_ahorro(iId_modelo_ahorro);
                    aux.setGrupo(grupo_obj.getGrupo());
                    aux.setId_grupo((sId_grupo));
                    aux.setId_programacion(iId_programacion);
                    lMaterias.add(aux);
                }
            }

            //Como todo esta bien, sumamos el total de materias
            int iTotal_materias = iNro_teoricas + iNro_laboratorios;
            modelo.addAttribute("total_materias", Integer.toString(iTotal_materias));
            modelo.addAttribute("lMaterias", lMaterias);
            modelo.addAttribute("gestion", sGestion);
            modelo.addAttribute("periodo", sPeriodo);
            modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("accion", sAccion);
            modelo.addAttribute("id_tipo_periodo", buscarPeriodo.getId_periodo());
            return "retiroAdicionMaterias/autoridad/ConfirmarAccionProgramacionMaterias";
        }
        if ("Adicion".equals(sAccion) || ("Cambio de grupo".equals(sAccion))) {
            //Listamos las materias que tienen choque de horario
            for (int i = 0; i < sValores.length; i++) {
                String id_grupo = request.getParameter("id_grupo:" + sValores[i]);
                try {
                    int iId_grupo = Integer.parseInt(id_grupo);
                } catch (Exception e) {
                    modelo.addAttribute("mensaje", "No selecciono el grupo de la materia. Revise por favor");
                    return "Error";
                }
                sCadena = sCadena + sValores[i] + ":" + id_grupo + "|";
                System.out.println(" ARMANDO LA CADENA -->" + sCadena);
            }
            Programas choque = new Programas();
            choque.setId_programa(datosEstudiante.getId_programa());
            choque.setId_plan(datosEstudiante.getId_plan());
            choque.setGestion(cliente.getGestion());
            choque.setPeriodo(cliente.getPeriodo());
            choque.setMaterias(sCadena);
            choque.setId_estudiante(datosEstudiante.getId_estudiante());

            for (int i = 0; i < sValores.length; i++) {
                if (sValores[i] != null) {
                    Programas aux = new Programas();
                    Materias materia_obj = new Materias();
                    String sDatos[] = sValores[i].split(":");
                    int iId_materia = Integer.parseInt(sDatos[0]);
                    int iId_modelo_ahorro = Integer.parseInt(sDatos[1]);
                    if ((iId_modelo_ahorro < 0) || (iId_modelo_ahorro == 0)) {
                        iNro_teoricas = iNro_teoricas + 1;
                        materia_obj.setId_materia(iId_materia);
                        materia_obj = this.mi.getMtrBuscarMateria(materia_obj);
                        sNombre_materia = materia_obj.getMateria();
                        sSigla = materia_obj.getSigla();
                    } else {
                        aux.setId_modelo_ahorro(iId_modelo_ahorro);
                        aux = this.mi.getMdlBuscarMateriaAhorro(aux);
                        sNombre_materia = aux.getModelo_ahorro();
                        sSigla = "--";
                        iNro_laboratorios = iNro_laboratorios + 1;
                    }
                    String sId_grupo = request.getParameter("id_grupo:" + sValores[i]);
                    Grupos grupo_obj = new Grupos();
                    grupo_obj.setId_grupo(Integer.parseInt(sId_grupo));
                    grupo_obj = this.mi.getGrpBuscarGrupo(grupo_obj);
                    aux.setId_materia(iId_materia);
                    aux.setMateria(sNombre_materia);
                    aux.setSigla(sSigla);
                    aux.setId_modelo_ahorro(iId_modelo_ahorro);
                    aux.setGrupo(grupo_obj.getGrupo());
                    aux.setId_grupo(Integer.parseInt(sId_grupo));
                    lMaterias.add(aux);
                }
            }
            //Como todo esta bien, sumamos el total de materias
            int iTotal_materias = iNro_teoricas + iNro_laboratorios;
            modelo.addAttribute("total_materias", Integer.toString(iTotal_materias));
            modelo.addAttribute("lMaterias", lMaterias);
            modelo.addAttribute("accion", sAccion);
            modelo.addAttribute("usuario", cliente.getNombres());
            //modelo.addAttribute("gestion",sGestion);
            //modelo.addAttribute("periodo",sPeriodo);
            return "retiroAdicionMaterias/autoridad/ConfirmarAccionProgramacionMaterias";
        }
        return "retiroAdicionMaterias/autoridad/ConfirmarAccionProgramacionMaterias";
    }

    @RequestMapping(value = "/retiroAdicionMaterias/registrarAccionProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String RegistrarAccionProgramacionMaterias1(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        //Definicion de variables
        String sCadena = "";
        String sMensaje = "";
        List lMaterias = new ArrayList();

        int iResultado;
        //Recuperamos datos del jsp
        String sId_estudiante = request.getParameter("id_estudiante");
        String sId_periodo = request.getParameter("id_periodo");
        int iTotal_materias = Integer.parseInt(request.getParameter("total_materias"));
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sAccion = request.getParameter("accion");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);

        //Sacando los datos del estudiante    
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);
        modelo.addAttribute("id_programa", Integer.toString(datosEstudiante.getId_programa()));

        //Buscamos el periodo
        Programas buscarPeriodo = new Programas();
        buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
        buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);

        boolean bBandera = true;

        //Recuperamos los datos de todas las  materias seleccionadas
        for (int i = 0; i < iTotal_materias; i++) {
            sCadena = sCadena + request.getParameter("materia" + i) + "|";
            System.out.println("IMPRIMIENDO LA CADENA -->" + sCadena);
        }
        //Definimos las entradas para los metodos
        Programas programacion = new Programas();
        programacion.setId_estudiante(datosEstudiante.getId_estudiante());
        programacion.setMaterias(sCadena);
        programacion.setGestion(Integer.parseInt(sGestion));
        programacion.setPeriodo(Integer.parseInt(sPeriodo));
        programacion.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));  //Verano-Mesa-Regular  Aumentado
        programacion.setId_rol(cliente.getId_rol());   //CRCB
        programacion.setUlt_usuario(cliente.getId_usuario());

        //Verificando la accion      
        if ("Retiro".equals(sAccion)) {
            lMaterias = this.mi.setEstPrgRetirarProgramacionesMaterias(programacion);
            if (lMaterias.size() > 0) {
                modelo.addAttribute("lMaterias", lMaterias);
                return "retiroAdicionMaterias/autoridad/ListarMateriasNoRegistradas";
            }
        }

        if ("Adicion".equals(sAccion)) {
            lMaterias = this.mi.setEstListarProgramarMaterias(programacion);
            if (lMaterias.size() > 0) {
                modelo.addAttribute("lMaterias", lMaterias);
                return "retiroAdicionMaterias/autoridad/ListarMateriasNoRegistradas";
            }
        }

        if ("Cambio de grupo".equals(sAccion)) {
            lMaterias = this.mi.setEstPrgRegistrarListarCambiarGrupos(programacion);
            if (lMaterias.size() > 0) {
                modelo.addAttribute("lMaterias", lMaterias);
                return "retiroAdicionMaterias/autoridad/ListarMateriasNoRegistradas";
            }
        }

        // INICIO - DESDE AQUI LA IMPRESION DE LA PROGRAMACION
        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Listamos la programacion del estudiante
        datosEstudiante.setGestion(Integer.parseInt(sGestion));
        datosEstudiante.setPeriodo(Integer.parseInt(sPeriodo));
        List lProgramacion = this.mi.getEstListarProgramacion(datosEstudiante);
        modelo.addAttribute("lProgramacion", lProgramacion);

        //Sacamos los datos del Estudiante
        datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
        modelo.addAttribute("datosEstudiante2", datosEstudiante);

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

        //Sacamos los datos de la institucion
        Instituciones datosInstitucion = new Instituciones();
        datosInstitucion.setId_institucion(1); //--------------------------ESTATICO
        datosInstitucion = this.mi.getBuscarInstitucion(datosInstitucion);
        if (datosInstitucion != null) {
            modelo.addAttribute("datosInstitucion", datosInstitucion);
        }

        // FIN - DESDE AQUI LA IMPRESION DE LA PROGRAMACION
        return "retiroAdicionMaterias/autoridad/ImprimirProgramacion";

    }

    @RequestMapping(value = "/reimprimirProgramacionEstudiante.fautapo", method = RequestMethod.GET)
    public String reimprimirProgramacionEstudiante(HttpServletRequest request, ModelMap modelo
    ) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        System.out.println("mirando el nombre ------darlin " + cliente.getNombres());

        return "reportesAcademicos/reimprimirProgramacionEstudiante/Entrada";
    }

    @RequestMapping(value = "/listarReimpresionProgramacionEstudiante.fautapo", method = RequestMethod.POST)
    public String listarReimpresionProgramacionEstudiante(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iId_estudiante = 0;
        int iGestion = 0;
        int iPeriodo = 0;

        String sId_estudiante = request.getParameter("id_estudiante");
        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sTodas = request.getParameter("todas");

        try {
            iId_estudiante = Integer.parseInt(sId_estudiante);
            iGestion = Integer.parseInt(sGestion);
            iPeriodo = Integer.parseInt(sPeriodo);
        } catch (Exception e) {
            Docentes docentes = new Docentes();
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "reportesAcademicos/reimprimirProgramacionEstudiante/Entrada";
        }

        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));

        //Sacamos los datos del Estudiante
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(iId_estudiante);
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);
        if (datosEstudiante == null) {
            modelo.addAttribute("mensaje", "El RU que ingreso no existe");
            return "Error";
        }
        //Sacamos los datos del Programa
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Listamos la programacion del estudiante
        datosEstudiante.setGestion(iGestion);
        datosEstudiante.setPeriodo(iPeriodo);

        if ("No".equals(sTodas)) {
            List lProgramacion = this.mi.getEstListarProgramacion(datosEstudiante);
            modelo.addAttribute("lProgramacion", lProgramacion);
            if (lProgramacion.size() == 0) {
                modelo.addAttribute("mensaje", "El estudiante con R.U: " + sId_estudiante + " no tiene materias programadas para la gestion " + sGestion + " y periodo " + sPeriodo);
                return "reportesAcademicos/reimprimirProgramacionEstudiante/Aviso";
            }

        }
        if ("Si".equals(sTodas)) {
            List lProgramacion = this.mi.getEstListarProgramacioncv(datosEstudiante);
            modelo.addAttribute("lProgramacion", lProgramacion);
            if (lProgramacion.size() == 0) {
                modelo.addAttribute("mensaje", "El estudiante con R.U: " + sId_estudiante + " no tiene materias programadas para la gestion " + sGestion + " y periodo " + sPeriodo);
                return "reportesAcademicos/reimprimirProgramacionEstudiante/Aviso";
            }

        }

        //Sacamos los datos del Estudiante
        datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);
        modelo.addAttribute("datosEstudiante2", datosEstudiante);

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
        modelo.addAttribute("nombres", cliente.getNombres());
        return "reportesAcademicos/reimprimirProgramacionEstudiante/ListarProgramacion";
    }

    @RequestMapping(value = "/inscripcionMaterias/confirmarProgramacionMaterias.fautapo", method = RequestMethod.POST)
    public String incripcionMateriasConfirmarProgramacionMaterias(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int iNro_teoricas = 0;
        int iNro_laboratorios = 0;
        int iNro_normales = 0;
        String sNombre_materia = "";
        String sSigla = "";

        String sGestion = request.getParameter("gestion");
        String sPeriodo = request.getParameter("periodo");
        String sId_estudiante = request.getParameter("id_estudiante");
        String sId_periodo = request.getParameter("id_periodo");
        String sId_tipo_evaluacion = request.getParameter("id_tipo_evaluacion");

        //Buscamos el tipo Evaluacion para programar
        Libretas datosTipoEval = new Libretas();
        datosTipoEval.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        datosTipoEval = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEval);
        modelo.addAttribute("datosTipoEval", datosTipoEval);

        //Sacando los datos del estudiante    
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(Integer.parseInt(sId_estudiante));
        datosEstudiante = this.mi.getEstBuscarEstudiante(datosEstudiante);
        modelo.addAttribute("datosEstudiante", datosEstudiante);

        //Sacando los datos personales del Estudiante encontrado
        Personas datosPersona = new Personas();
        datosPersona.setId_persona(datosEstudiante.getId_persona());
        datosPersona = this.mi.getPrsBuscarPersona(datosPersona);
        modelo.addAttribute("datosPersona", datosPersona);

        //Sacando el programa en que esta el estudiante
        Programas datosPrograma = new Programas();
        datosPrograma.setId_programa(datosEstudiante.getId_programa());
        datosPrograma = this.mi.getPrgBuscarPrograma(datosPrograma);
        modelo.addAttribute("datosPrograma", datosPrograma);

        //Buscamos el periodo
        Programas buscarPeriodo = new Programas();
        buscarPeriodo.setId_programa(datosEstudiante.getId_programa());
        buscarPeriodo = this.mi.getPrdBuscarPrgPeriodo(buscarPeriodo);
        modelo.addAttribute("id_periodo", Integer.toString(buscarPeriodo.getId_periodo()));

        //Sacando los parametros de progrmacion de prg_detalles
        Programas parametro = new Programas();
        parametro.setId_programa(datosEstudiante.getId_programa());
        parametro.setId_plan(datosEstudiante.getId_plan());
        parametro.setId_tipo_grado(datosEstudiante.getId_tipo_grado());
        parametro.setId_tipo_programacion(1); //COMO AUTORIDAD
        parametro.setGestion(Integer.parseInt(sGestion));
        parametro.setPeriodo(Integer.parseInt(sPeriodo));
        parametro.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
        List lParametros = this.mi.getPrgBuscarDetalles(parametro);

        if (lParametros.size() == 0) {
            //////////////////////
            String mensajeerror = null;

            Timestamp tFecha = new Timestamp(System.currentTimeMillis());
            Date dateFecha = new Date(tFecha.getTime());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String fechaSis = df.format(dateFecha);

            Libretas proauto = new Libretas();
            proauto.setId_estudiante(Integer.parseInt(sId_estudiante));
            proauto.setGestion(Integer.parseInt(sGestion));
            proauto.setPeriodo(Integer.parseInt(sPeriodo));
            proauto.setfec_actual(fechaSis);
            proauto.setId_tipo_evaluacion(Integer.parseInt(sId_tipo_evaluacion));
            int iValor = this.mi.setBuscarProgramacionAutorizacion(proauto);
            if (iValor != 1) {
                modelo.addAttribute("gestion", sGestion);
                modelo.addAttribute("periodo", sPeriodo);
                modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
                modelo.addAttribute("mensaje", "Cerradas las Programaciones de acuerdo a Calendario Academico");
                return "inscripcionMaterias/autoridad/AvisoBuscarEstudiante";
            }
            //////////////////////
            // return new ModelAndView("Aviso","mensaje","No existe parametros de programación");
        }
        modelo.addAttribute("lParametros", lParametros);

        int iMax_materias_teoricas = parametro.getMax_materias_teoricas();

        int iMax_materias_laboratorios = parametro.getMax_materias_laboratorios();
        float fCosto_materia_teorica = parametro.getCosto_materia_teorica();
        float fCosto_materia_laboratorio = parametro.getCosto_materia_laboratorio();

        //Recuperamos las materias seleccionadas
        String sValores[] = request.getParameterValues("materia");
        if (sValores == null) {
            modelo.addAttribute("mensaje", "No selecciono ninguna materia");
            return "Aviso";
        }

        List lMaterias = new ArrayList();

        for (int i = 0; i < sValores.length; i++) {
            if (sValores[i] != null) {
                Programas aux = new Programas();
                Materias materia_obj = new Materias();
                String sDatos[] = sValores[i].split(":");
                int iId_materia = Integer.parseInt(sDatos[0]);
                int iId_modelo_ahorro = Integer.parseInt(sDatos[1]);
                if ((iId_modelo_ahorro < 0) || (iId_modelo_ahorro == 0)) {
                    iNro_teoricas = iNro_teoricas + 1;
                    materia_obj.setId_materia(iId_materia);
                    materia_obj = this.mi.getMtrBuscarMateria(materia_obj);
                    sNombre_materia = materia_obj.getMateria();
                    sSigla = materia_obj.getSigla();
                } else {
                    aux.setId_modelo_ahorro(iId_modelo_ahorro);
                    aux = this.mi.getMdlBuscarMateriaAhorro(aux);
                    sNombre_materia = aux.getModelo_ahorro();
                    sSigla = "--";
                    iNro_laboratorios = iNro_laboratorios + 1;
                }
                String sId_grupo = request.getParameter("id_grupo:" + sValores[i]);
                Grupos grupo_obj = new Grupos();
                try {
                    grupo_obj.setId_grupo(Integer.parseInt(sId_grupo));
                } catch (Exception e) {
                    modelo.addAttribute("mensaje", "No selecciono el grupo de la materia. Revise por favor");
                    return "Error";

                }
                grupo_obj = this.mi.getGrpBuscarGrupo(grupo_obj);
                aux.setId_materia(iId_materia);
                aux.setMateria(sNombre_materia);
                aux.setSigla(sSigla);
                aux.setId_modelo_ahorro(iId_modelo_ahorro);
                aux.setGrupo(grupo_obj.getGrupo());
                aux.setId_grupo(Integer.parseInt(sId_grupo));
                lMaterias.add(aux);
            }
        }

        //Como todo esta bien, sumamos el total de materias
        int iTotal_materias = iNro_teoricas + iNro_laboratorios;
        modelo.addAttribute("total_materias", Integer.toString(iTotal_materias));
        modelo.addAttribute("lMaterias", lMaterias);
        modelo.addAttribute("gestion", sGestion);
        modelo.addAttribute("periodo", sPeriodo);
        modelo.addAttribute("id_tipo_evaluacion", sId_tipo_evaluacion);
        return "inscripcionMaterias/autoridad/ConfirmarProgramacionMaterias";
    }

}

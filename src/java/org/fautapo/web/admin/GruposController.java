/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.DepartamentoGrupos;
import org.fautapo.domain.Grupos;
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Materias;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.BuscarGruposModel;
import org.fautapo.model.ComprobarGrupoModel;
import org.fautapo.model.EliminargrupoModel;
import org.fautapo.model.GrupoEditModel;
import org.fautapo.model.GrupoElimarModel;
import org.fautapo.model.GrupoModel;
import org.fautapo.model.NuevoGrupoModel;
import org.fautapo.model.ItemModel;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.ParametrosGrupoModel;
import org.modelmapper.Mappers;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
public class GruposController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;
    @Autowired
    private HttpServletRequest request;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/grupos/entrada.fautapo", method = RequestMethod.GET)
    public String entrada(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "abmDptoGrupos/Entrada";
    }

    @RequestMapping(value = "/grupos/listarFacultades.fautapo", method = RequestMethod.POST)
    public String listarFacultades(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "abmDptoGrupos/Entrada";
        }
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        return "abmDptoGrupos/ListarFacultades";
    }

    @RequestMapping(value = "/grupos/listarGrupos.fautapo", method = RequestMethod.POST)
    public String listarGrupos(@ModelAttribute("model") BuscarGruposModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("cliente", cliente);

        //Sacamos los datos del plan
        Planes datosPrgPlan = modelMapper.map(model, Planes.class);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos el listado de los grupos
        Grupos grupo = modelMapper.map(model, Grupos.class);
        grupo.setId_plan(datosPrgPlan.getId_plan());
        grupo.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        modelo.addAttribute("lGrupos", this.mi.getPrgListarGrupos(grupo));

        //Sacamos los datos del programa
        Programas programa = modelMapper.map(model, Programas.class);
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
        modelo.addAttribute("id_departamento", cliente.getId_departamento());

        return "abmDptoGrupos/ListarGrupos";
    }

    @RequestMapping(value = "/grupos/nuevoRegistro.fautapo", method = RequestMethod.POST)
    public String nuevoRegistro(@ModelAttribute("model") NuevoGrupoModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
//Sacamos los datos del plan de estudios
        Planes datosPrgPlan = modelMapper.map(model, Planes.class);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);
        modelo.addAttribute("cliente", cliente);

        //Sacamos los datos del programa
        Programas programa = modelMapper.map(model, Programas.class);
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));

        //Listamos las materias del plan de estudios
        Planes plan = modelMapper.map(model, Planes.class);
        plan.setId_plan(datosPrgPlan.getId_plan());
        plan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        List lMaterias = this.mi.getPlnListarMaterias(plan);
        modelo.addAttribute("lMaterias", lMaterias);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos el formato de la fecha
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));
        GrupoModel grupo = modelMapper.map(model, GrupoModel.class);
        modelo.addAttribute("model", grupo);
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_departamento", cliente.getId_departamento());
        return "abmDptoGrupos/NuevoRegistro";
    }

    @RequestMapping(value = "/grupos/registrarNuevo.fautapo", method = RequestMethod.POST)
    public String registrarNuevo(@ModelAttribute("model") @Validated GrupoModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            Planes datosPrgPlan = modelMapper.map(model, Planes.class);
            datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
            modelo.addAttribute("datosPrgPlan", datosPrgPlan);

            //Sacamos los datos del programa
            Programas programa = modelMapper.map(model, Programas.class);
            modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
            if (model.getId_grupo() != null) {
                Grupos grupo = new Grupos();
                grupo.setId_materia(model.getId_materia());
                grupo.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
                grupo.setId_modelo_ahorro(-1000000);
                grupo.setGestion(model.getGestion());
                grupo.setPeriodo(model.getPeriodo());
                List lista = this.mi.getMtrListarGruposNoAsignados(grupo);
                List<ItemModel> listaggrupo = new ArrayList<>();
                for (int i = 0; i < lista.size(); i++) {
                    grupo = (Grupos) lista.get(i);
                    listaggrupo.add(new ItemModel(String.valueOf(grupo.getId_grupo()), grupo.getGrupo()));
                }
                modelo.addAttribute("lgrupo", listaggrupo);
            }

            //Listamos las materias del plan de estudios
            Planes plan = modelMapper.map(model, Planes.class);
            plan.setId_plan(datosPrgPlan.getId_plan());
            plan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
            List lMaterias = this.mi.getPlnListarMaterias(plan);
            modelo.addAttribute("lMaterias", lMaterias);

            //Buscamos Tipo Evaluacion
            Libretas datosTipoEvaluacion = new Libretas();
            datosTipoEvaluacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
            modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

            //Sacamos el formato de la fecha
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));
            modelo.addAttribute("gestion", model.getGestion());
            modelo.addAttribute("periodo", model.getPeriodo());
            modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
            modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
            modelo.addAttribute("id_programa", model.getId_programa());
            modelo.addAttribute("id_departamento", model.getId_departamento());
            modelo.addAttribute("cliente", cliente.getId_rol());
            return "abmDptoGrupos/NuevoRegistro";
        }
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_materia", model.getId_materia());
        modelo.addAttribute("id_grupo", model.getId_grupo());
        modelo.addAttribute("cupo_max", model.getCupo_max());
        modelo.addAttribute("horas", model.getHoras());
        modelo.addAttribute("nro_resolucion", model.getNro_resolucion());
        modelo.addAttribute("fec_resolucion", model.getFec_resolucion());

        //Sacamos los datos de la materia
        Materias materia = modelMapper.map(model, Materias.class);
        materia = this.mi.getMtrBuscarMateria(materia);
        Mappers.Configure(modelMapper);
        DepartamentoGrupos grupos = modelMapper.map(model, DepartamentoGrupos.class);
        grupos.setId_rol(this.GetUsuario().getId_rol());
        grupos.setUlt_usuario(this.GetUsuario().getId_usuario());
        Integer id = mi.RegistrarDepartamentosGrupo(grupos);
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());

        //Sacamos los datos del plan
        Planes datosPrgPlan = modelMapper.map(model, Planes.class);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos el listado de los grupos
        Grupos grupo = modelMapper.map(model, Grupos.class);
        grupo.setId_plan(datosPrgPlan.getId_plan());
        grupo.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        modelo.addAttribute("lGrupos", this.mi.getPrgListarGrupos(grupo));

        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
        modelo.addAttribute("id_rol", cliente.getId_rol());
        modelo.addAttribute("id_departamento", model.getId_departamento());

        return "abmDptoGrupos/ListarGrupos";
    }

    @RequestMapping(value = "/ListarMtrGruposNoAsignadosAjax.fautapo", method = RequestMethod.POST, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<ItemModel>> ListarMtrGruposNoAsignadosAjax(@RequestBody ParametrosGrupoModel model) {
        Grupos grupo = new Grupos();
        grupo.setId_materia(model.getId_materia());
        grupo.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        grupo.setId_modelo_ahorro(-1000000);
        grupo.setGestion(model.getGestion());
        grupo.setPeriodo(model.getPeriodo());
        List lista = this.mi.getMtrListarGruposNoAsignados(grupo);

        List<ItemModel> listaggrupo = new ArrayList<>();
        for (int i = 0; i < lista.size(); i++) {
            grupo = (Grupos) lista.get(i);
            listaggrupo.add(new ItemModel(String.valueOf(grupo.getId_grupo()), grupo.getGrupo()));
        }
        return new ResponseEntity<List<ItemModel>>(listaggrupo, HttpStatus.OK);
    }

    @RequestMapping(value = "/grupos/modificaRegistro.fautapo", method = RequestMethod.POST)
    public String modificarRegistro(@ModelAttribute("model") NuevoGrupoModel model, ModelMap modelo) {

        //Sacamos los datos del plan
        Planes datosPrgPlan = modelMapper.map(model, Planes.class);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos los datos del programa
        Programas programa = modelMapper.map(model, Programas.class);
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));

        //Listamos las materias del plan de estudios
        Planes plan = modelMapper.map(model, Planes.class);
        plan.setId_plan(datosPrgPlan.getId_plan());
        plan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        List lMaterias = this.mi.getPlnListarMaterias(plan);
        modelo.addAttribute("lMaterias", lMaterias);

        //Sacamos el formato de la fecha del sistema
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        //Sacamos los datos del grupo
        Grupos grupo = modelMapper.map(model, Grupos.class);
        grupo = this.mi.getMiDptoBuscarGrupo(grupo);
        modelo.addAttribute("grupo", grupo);
        Mappers.Configure(modelMapper);
        GrupoEditModel grupomodel = modelMapper.map(grupo, GrupoEditModel.class);
        grupomodel.setId_programa(model.getId_programa());
        grupomodel.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        grupomodel.setId_prg_plan(model.getId_prg_plan());
        grupomodel.setGestion(model.getGestion());
        grupomodel.setPeriodo(model.getPeriodo());
        grupomodel.setId_dpto_grupo(model.getId_dpto_grupo());
        grupomodel.setFec_resolucion(new SimpleDateFormat("dd/MM/yyyy").format(grupo.getFec_resolucion() == null ? new Date() : grupo.getFec_resolucion()));;
        modelo.addAttribute("model", grupomodel);
        //Listamos los grupos sin asignacion de cupo
        if (grupomodel.getId_grupo() != null) {
            Grupos grupos = new Grupos();
            grupos.setId_materia(grupomodel.getId_materia());
            grupos.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            grupos.setId_modelo_ahorro(-1000000);
            grupos.setGestion(model.getGestion());
            grupos.setPeriodo(model.getPeriodo());
            List lista = this.mi.getMtrListarGruposNoAsignadosCompletos(grupos);
            List<ItemModel> listaggrupo = new ArrayList<>();
            for (int i = 0; i < lista.size(); i++) {
                grupo = (Grupos) lista.get(i);
                listaggrupo.add(new ItemModel(String.valueOf(grupo.getId_grupo()), grupo.getGrupo()));
            }
            modelo.addAttribute("lgrupo", listaggrupo);
            modelo.addAttribute("gestion", model.getGestion());
            modelo.addAttribute("periodo", model.getPeriodo());
            modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
            modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
            modelo.addAttribute("id_programa", model.getId_programa());
            modelo.addAttribute("id_departamento", model.getId_departamento());
        }
        return "abmDptoGrupos/ModificaRegistro";
    }

    @RequestMapping(value = "/grupos/ComprobarGrupo.fautapo", method = RequestMethod.POST, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Boolean> ComprobarGrupoAjax(@RequestBody ComprobarGrupoModel model) {
        boolean existe = false;
        //Sacamos los datos de la materia
        ParametrosBusqueda busqueda = new ParametrosBusqueda();
        busqueda.setId_grupo(model.getId_grupo());
        busqueda.setId_materia(model.getId_materia());
        busqueda.setGestion(model.getGestion());
        busqueda.setPeriodo(model.getPeriodo());
        if (this.mi.ExisteGrupoPrograma(busqueda)) {
            existe = true;
        } else {
            existe = false;
        }
        return new ResponseEntity<Boolean>(existe, HttpStatus.OK);
    }

    @RequestMapping(value = "/grupos/registrarModificacion.fautapo", method = RequestMethod.POST)
    public String registrarModificacion(@ModelAttribute("model") @Validated GrupoEditModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            //Sacamos los datos del plan
            Planes datosPrgPlan = modelMapper.map(model, Planes.class);
            datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
            modelo.addAttribute("datosPrgPlan", datosPrgPlan);

            //Buscamos Tipo Evaluacion
            Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
            datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
            modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

            //Sacamos los datos del programa
            Programas programa = modelMapper.map(model, Programas.class);
            modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));

            //Listamos las materias del plan de estudios
            Planes plan = modelMapper.map(model, Planes.class);
            plan.setId_plan(datosPrgPlan.getId_plan());
            plan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
            List lMaterias = this.mi.getPlnListarMaterias(plan);
            modelo.addAttribute("lMaterias", lMaterias);

            //Sacamos el formato de la fecha del sistema
            Abm formatoFecha = new Abm();
            formatoFecha.setCampo("formato_fecha");
            formatoFecha.setCodigo("dibrap");
            modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));
            //Listamos los grupos sin asignacion de cupo
            if (model.getId_grupo() != null) {
                Grupos grupos = new Grupos();
                grupos.setId_materia(model.getId_materia());
                grupos.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
                grupos.setId_modelo_ahorro(-1000000);
                grupos.setGestion(model.getGestion());
                grupos.setPeriodo(model.getPeriodo());
                List lista = this.mi.getMtrListarGruposNoAsignadosCompletos(grupos);
                List<ItemModel> listaggrupo = new ArrayList<>();
                for (int i = 0; i < lista.size(); i++) {
                    Grupos grupo = (Grupos) lista.get(i);
                    listaggrupo.add(new ItemModel(String.valueOf(grupo.getId_grupo()), grupo.getGrupo()));
                }
                modelo.addAttribute("lgrupo", listaggrupo);
            }
            return "abmDptoGrupos/ModificaRegistro";
        }
        //Sacamos los datos de la materia
        Materias materia = new Materias();
        materia.setId_materia(model.getId_materia());
        materia = this.mi.getMtrBuscarMateria(materia);
        Mappers.Configure(modelMapper);
        DepartamentoGrupos grupos = modelMapper.map(model, DepartamentoGrupos.class);
        grupos.setId_departamento(materia.getId_departamento());
        grupos.setId_rol(this.GetUsuario().getId_rol());
        grupos.setUlt_usuario(this.GetUsuario().getId_usuario());
        this.mi.ActualizarDepartamentosGrupo(grupos);
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());

        //Sacamos los datos del plan
        Planes datosPrgPlan = modelMapper.map(model, Planes.class);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Sacamos el listado de los grupos
        Grupos grupo = modelMapper.map(model, Grupos.class);
        grupo.setId_plan(datosPrgPlan.getId_plan());
        grupo.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        modelo.addAttribute("lGrupos", this.mi.getPrgListarGrupos(grupo));

        //Sacamos los datos del programa
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
        modelo.addAttribute("id_departamento", model.getId_departamento());

        return "abmDptoGrupos/ListarGrupos";
    }

    @RequestMapping(value = "/grupos/confirmarBorrado.fautapo", method = RequestMethod.POST)
    public String confirmarBorrado(@ModelAttribute("model") EliminargrupoModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        //Sacamos los datos del grupo
        Grupos grupo = modelMapper.map(model, Grupos.class);
        grupo = this.mi.getMiDptoBuscarGrupo(grupo);
        GrupoEditModel grupos = modelMapper.map(grupo, GrupoEditModel.class);

        //Sacamos los datos de la materia
        Materias materia = new Materias();
        materia.setId_materia(grupo.getId_materia());
        modelo.addAttribute("materia", this.mi.getMtrBuscarMateria(materia));
        modelo.addAttribute("grupito", this.mi.getGrpBuscarGrupo(grupo));
        int id_materia = materia.getId_materia();
        grupos.setId_materia(id_materia);
        grupos.setFec_resolucion(new SimpleDateFormat("dd/MM/yyyy").format(grupo.getFec_resolucion() == null ? new Date() : grupo.getFec_resolucion()));
        grupos.setId_programa(model.getId_programa());
        grupos.setId_prg_plan(model.getId_prg_plan());
        modelo.addAttribute("model", grupos);
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("cupo_actual", grupo.getCupo_actual());
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
        //Sacamos los datos del plan
        Planes datosPrgPlan = modelMapper.map(model, Planes.class);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Buscamos Tipo Evaluacion
        Libretas datosTipoEvaluacion = modelMapper.map(model, Libretas.class);
        datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
        modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

        //Buscamos Tipo Evaluacion
        // Libretas datosTipoEvaluacion = new Libretas();
        datosTipoEvaluacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        //   modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        modelo.addAttribute("id_departamento", model.getId_departamento());
        return "abmDptoGrupos/ConfirmarBorrado";
    }

    @RequestMapping(value = "/grupos/registrarBorrado.fautapo", method = RequestMethod.POST)
    public String registrarBorrado(@ModelAttribute("model") GrupoElimarModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        //Sacamos los datos de la materia
        Materias materia = new Materias();
        materia.setId_materia(model.getId_materia());
        materia = this.mi.getMtrBuscarMateria(materia);
        DepartamentoGrupos grupos = new DepartamentoGrupos();
        grupos.setId_grupo(model.getId_grupo());
        grupos.setId_materia(model.getId_materia());
        grupos.setId_departamento(materia.getId_departamento());
        grupos.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        grupos.setGestion(model.getGestion());
        grupos.setPeriodo(model.getPeriodo());
        grupos.setId_dpto_grupo(model.getId_dpto_grupo());
        grupos.setId_estado("X");
        grupos.setId_rol(this.GetUsuario().getId_rol());
        grupos.setUlt_usuario(this.GetUsuario().getUlt_usuario());
        grupos.setFec_resolucion(new Date());
        if (mi.EliminarGrupo(grupos)) {
            modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
            modelo.addAttribute("id_programa", model.getId_programa());
            modelo.addAttribute("gestion", model.getGestion());
            modelo.addAttribute("periodo", model.getPeriodo());
            modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());

            //Sacamos los datos del plan
            Planes datosPrgPlan = new Planes();
            datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
            datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
            modelo.addAttribute("datosPrgPlan", datosPrgPlan);

            //Buscamos Tipo Evaluacion
            Libretas datosTipoEvaluacion = new Libretas();
            datosTipoEvaluacion.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            datosTipoEvaluacion = this.mi.getTpsBuscarTipoEvaluacion(datosTipoEvaluacion);
            modelo.addAttribute("datosTipoEvaluacion", datosTipoEvaluacion);

            //Sacamos el listado de los grupos
            Grupos grupo = new Grupos();
            grupo.setId_programa(model.getId_programa());
            grupo.setId_plan(datosPrgPlan.getId_plan());
            grupo.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
            grupo.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
            grupo.setGestion(model.getGestion());
            grupo.setPeriodo(model.getPeriodo());
            modelo.addAttribute("lGrupos", this.mi.getPrgListarGrupos(grupo));

            //Sacamos los datos del programa
            Programas programa = new Programas();
            programa.setId_programa(model.getId_programa());
            modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
            modelo.addAttribute("id_departamento", model.getId_departamento());
            return "abmDptoGrupos/ListarGrupos";
        } else {
            return "abmDptoGrupos/Error";
        }
    }
}

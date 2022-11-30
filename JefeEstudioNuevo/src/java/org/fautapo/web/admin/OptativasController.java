/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.MateriasOptativas;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.domain.Planes;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.EliminarMateriaOptativa;
import org.fautapo.model.ListViewModel;
import org.fautapo.model.MateriasEditarOptativasModel;
import org.fautapo.model.MateriasOptativasModel;
import org.fautapo.model.MessageResultModel;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.PasswordClaveModel;
import org.fautapo.util.Convert;
import org.modelmapper.ModelMapper;
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
public class OptativasController {

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

    @RequestMapping(value = "/EntradaMateriasOptativas.fautapo", method = RequestMethod.GET)
    public String EntradaOptativas(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "verMateriasOptativas/Entrada";
    }

    @RequestMapping(value = "/listarMateriasOptaticas.fautapo", method = RequestMethod.POST)
    public String listarMateriasOptaticas(@ModelAttribute("model") @Validated PasswordClaveModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "verMateriasOptativas/Entrada";
        }
        modelo.addAttribute("cliente", cliente);
        Facultades facultad = new Facultades();
        facultad.setId_universidad(cliente.getId_universidad());
        modelo.addAttribute("lFacultades", this.mi.getUnvListarFacultades(facultad));

        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("usuario", cliente.getNombres());

        return "verMateriasOptativas/ListarMateriasOptativas";
    }

    @RequestMapping(value = "/listarOptativas.fautapo", method = RequestMethod.POST)
    public String listarOptativas(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String[] id_planes = Convert.ToString(request, "id_plan").split("-");
        String id_plan = id_planes[0];
        String id_prg_plan = id_planes[1];
        int id_programa = Convert.ToInteger(request, "id_programa");
        int limit = 100;
        String condicion = Convert.ToString(request, "_condicion").equals("") ? "todo" : Convert.ToString(request, "_condicion");
        String filtrar = Convert.ToString(request, "_campo");
        String buscarelemento = Convert.ToString(request, "_filtro");
        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(id_programa);
        buscar.setCondicion(condicion);
        buscar.setFiltro(filtrar);
        buscar.setBuscar(buscarelemento);
        buscar.setLimit(limit);
        List<MateriasOptativas> listaMenciones = mi.getListarMateriasOptativas(buscar);//mi.GetListarMencionesProgramas(buscar);
        List<ListViewModel> campos = new ArrayList<>();
        campos.add(new ListViewModel("", "Ninguno"));
        campos.add(new ListViewModel("R.U.", "Registro Universitario"));
        campos.add(new ListViewModel("programa", "Carrera"));
        campos.add(new ListViewModel("plan", "Plan de Estudio"));
        campos.add(new ListViewModel("materia", "Materia"));
        campos.add(new ListViewModel("nombres", "Nombre del Estudiante"));
        List<ListViewModel> condiciones = new ArrayList<>();
        condiciones.add(new ListViewModel("todo", "Ninguno"));
        condiciones.add(new ListViewModel("incluye", "incluye"));
        condiciones.add(new ListViewModel("igual", "="));
        condiciones.add(new ListViewModel("mayor", ">"));
        condiciones.add(new ListViewModel("menor", "<"));
        condiciones.add(new ListViewModel("mayorigual", ">="));
        condiciones.add(new ListViewModel("menorigual", "<="));
        modelo.addAttribute("listaNombresCampos", campos);
        modelo.addAttribute("listarCondiciones", condiciones);
        modelo.addAttribute("campo", filtrar);
        modelo.addAttribute("condicion", condicion);
        modelo.addAttribute("filtro", buscarelemento);
        modelo.addAttribute("id_programa", id_programa);
        modelo.addAttribute("listaRegistros", listaMenciones);
        modelo.addAttribute("id_plan", id_plan);
        modelo.addAttribute("id_prg_plan", id_prg_plan);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "verMateriasOptativas/listarOptativas";
    }

    //@Request/nuevoRegistroMencion.fautap/o
    @RequestMapping(value = "/nuevoRegistroMateriaOptativa.fautapo", method = RequestMethod.POST)
    public String NuevoRegistroMateriaOptativa(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int id_programa = Convert.ToInteger(request, "id_programa");
        int id_prg_plan = Convert.ToInteger(request, "id_prg_plan");
        String id_plan = Convert.ToString(request, "id_plan");
        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(id_programa);
        String programa = mi.GetProgramaMencion(buscar);
        MateriasOptativasModel model = new MateriasOptativasModel();
        model.setId_programa(id_programa);
        model.setId_prg_plan(id_prg_plan);
        model.setId_plan(id_plan);

        //Sacamos los datos del plan
        Planes datosPrgPlan = new Planes();
        datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        Planes datosPlan = new Planes();
        datosPlan.setId_programa(datosPrgPlan.getId_programa());
        datosPlan.setId_plan(datosPrgPlan.getId_plan());
        datosPlan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
        List<Planes> lElectivasPlanDeEstudios = this.mi.getListarMateriasElectivasOptativasPlan(datosPlan);
        modelo.addAttribute("lElectivasPlanDeEstudios", lElectivasPlanDeEstudios);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("formulario", model);
        modelo.addAttribute("programa", programa);
        modelo.addAttribute("id_programa",id_programa);
        modelo.addAttribute("id_prg_plan",id_prg_plan);
        modelo.addAttribute("id_plan",id_plan);
        return "verMateriasOptativas/NuevoRegistroMateriaOptativa";
    }

    @RequestMapping(value = "/RegistrarMateriaOptastivaEstudiante.fautapo", method = RequestMethod.POST)
    public String RegistrarMateriaOptastivaEstudiante(@ModelAttribute("formulario") @Validated MateriasOptativasModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            ParametrosBusqueda buscar = new ParametrosBusqueda();
            buscar.setId_programa(model.getId_programa());
            String programa = mi.GetProgramaMencion(buscar);
            //Sacamos los datos del plan
            Planes datosPrgPlan = new Planes();
            datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
            datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
            Planes datosPlan = new Planes();
            datosPlan.setId_programa(datosPrgPlan.getId_programa());
            datosPlan.setId_plan(datosPrgPlan.getId_plan());
            datosPlan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
            List<Planes> lElectivasPlanDeEstudios = this.mi.getListarMateriasElectivasOptativasPlan(datosPlan);
            modelo.addAttribute("lElectivasPlanDeEstudios", lElectivasPlanDeEstudios);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("programa", programa);
            return "verMateriasOptativas/NuevoRegistroMateriaOptativa";
        }

        MateriasOptativas optativa = new MateriasOptativas();
        optativa.setId_programa(model.getId_programa());
        optativa.setId_estudiante(model.getId_estudiante());
        optativa.setId_plan(model.getId_plan());
        optativa.setId_materia(model.getId_materia());
        optativa.setId_rol(cliente.getId_rol());
        optativa.setUlt_usuario(cliente.getId_usuario());
        mi.RegistrarNuevaOptativa(optativa);

        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(model.getId_programa());
        buscar.setCondicion("igual");
        buscar.setFiltro("R.U.");
        buscar.setBuscar(optativa.getId_estudiante() + "");
        buscar.setLimit(100);
        List<MateriasOptativas> listaMenciones = mi.getListarMateriasOptativas(buscar);
        List<ListViewModel> campos = new ArrayList<>();
        campos.add(new ListViewModel("", "Ninguno"));
        campos.add(new ListViewModel("R.U.", "Registro Universitario"));
        campos.add(new ListViewModel("programa", "Carrera"));
        campos.add(new ListViewModel("plan", "Plan de Estudio"));
        campos.add(new ListViewModel("materia", "Materia"));
        campos.add(new ListViewModel("nombres", "Nombre del Estudiante"));
        List<ListViewModel> condiciones = new ArrayList<>();
        condiciones.add(new ListViewModel("todo", "Ninguno"));
        condiciones.add(new ListViewModel("incluye", "incluye"));
        condiciones.add(new ListViewModel("igual", "="));
        condiciones.add(new ListViewModel("mayor", ">"));
        condiciones.add(new ListViewModel("menor", "<"));
        condiciones.add(new ListViewModel("mayorigual", ">="));
        condiciones.add(new ListViewModel("menorigual", "<="));
        modelo.addAttribute("listaNombresCampos", campos);
        modelo.addAttribute("listarCondiciones", condiciones);
        modelo.addAttribute("campo", "R.U.");
        modelo.addAttribute("condicion", "igual");
        modelo.addAttribute("filtro", model.getId_estudiante() + "");
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("listaRegistros", listaMenciones);
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("usuairo", cliente.getNombres());
        return "verMateriasOptativas/listarOptativas";
    }

    @RequestMapping(value = "/editarRegistroMateriaOptativa.fautapo", method = RequestMethod.POST)
    public String EditarMateriaOptativa(@ModelAttribute("formulario") MateriasEditarOptativasModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(model.getId_programa());
        String programa = mi.GetProgramaMencion(buscar);
        if (model.getId_plan() != null) {
            Planes datosPrgPlan = new Planes();
            datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
            datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
            Planes datosPlan = new Planes();
            datosPlan.setId_programa(datosPrgPlan.getId_programa());
            datosPlan.setId_plan(datosPrgPlan.getId_plan());
            datosPlan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
            List<Planes> lElectivasPlanDeEstudios = this.mi.getListarMateriasElectivasOptativasPlan(datosPlan);
            modelo.addAttribute("lElectivasPlanDeEstudios", lElectivasPlanDeEstudios);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("programa", programa);
        //modelo.addAttribute("planes", planes);
        modelo.addAttribute("formulario", model);
        modelo.addAttribute("id_programa",model.getId_programa());
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        return "verMateriasOptativas/EditarMateriaOptativa";
    }

    @RequestMapping(value = "/EditarMateriaOptastivaEstudiante.fautapo", method = RequestMethod.POST)
    public String EditarMateriaOptastivaEstudiante(@ModelAttribute("formulario") @Validated MateriasEditarOptativasModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            ParametrosBusqueda buscar = new ParametrosBusqueda();
            buscar.setId_programa(model.getId_programa());
            String programa = mi.GetProgramaMencion(buscar);
            //Sacamos los datos del plan
            Planes datosPrgPlan = new Planes();
            datosPrgPlan.setId_prg_plan(model.getId_prg_plan());
            datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
            Planes datosPlan = new Planes();
            datosPlan.setId_programa(datosPrgPlan.getId_programa());
            datosPlan.setId_plan(datosPrgPlan.getId_plan());
            datosPlan.setId_tipo_grado(datosPrgPlan.getId_tipo_grado());
            List<Planes> lElectivasPlanDeEstudios = this.mi.getListarMateriasElectivasOptativasPlan(datosPlan);
            modelo.addAttribute("lElectivasPlanDeEstudios", lElectivasPlanDeEstudios);
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("programa", programa);
            return "verMateriasOptativas/NuevoRegistroMateriaOptativa";
        }

        MateriasOptativas optativa = new MateriasOptativas();
        optativa.setId_est_materiaoptativa(model.getId_est_materiaoptativa());
        optativa.setId_materia(model.getId_materia());
        mi.EditarMateriaOptativa(optativa);

        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(model.getId_programa());
        buscar.setCondicion("igual");
        buscar.setFiltro("R.U.");
        buscar.setBuscar(model.getId_estudiante() + "");
        buscar.setLimit(100);
        List<MateriasOptativas> listaMenciones = mi.getListarMateriasOptativas(buscar);
        List<ListViewModel> campos = new ArrayList<>();
        campos.add(new ListViewModel("", "Ninguno"));
        campos.add(new ListViewModel("R.U.", "Registro Universitario"));
        campos.add(new ListViewModel("programa", "Carrera"));
        campos.add(new ListViewModel("plan", "Plan de Estudio"));
        campos.add(new ListViewModel("materia", "Materia"));
        campos.add(new ListViewModel("nombres", "Nombre del Estudiante"));
        List<ListViewModel> condiciones = new ArrayList<>();
        condiciones.add(new ListViewModel("todo", "Ninguno"));
        condiciones.add(new ListViewModel("incluye", "incluye"));
        condiciones.add(new ListViewModel("igual", "="));
        condiciones.add(new ListViewModel("mayor", ">"));
        condiciones.add(new ListViewModel("menor", "<"));
        condiciones.add(new ListViewModel("mayorigual", ">="));
        condiciones.add(new ListViewModel("menorigual", "<="));
        modelo.addAttribute("listaNombresCampos", campos);
        modelo.addAttribute("listarCondiciones", condiciones);
        modelo.addAttribute("campo", "R.U.");
        modelo.addAttribute("condicion", "igual");
        modelo.addAttribute("filtro", model.getId_estudiante() + "");
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("listaRegistros", listaMenciones);
        modelo.addAttribute("id_plan", model.getId_plan());
        modelo.addAttribute("id_prg_plan", model.getId_prg_plan());
        modelo.addAttribute("usuario", cliente.getNombres());
        return "verMateriasOptativas/listarOptativas";
    }

    @RequestMapping(value = "/AjaxEliminarMateriaOptativa.fautapo", method = RequestMethod.POST, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MessageResultModel> AjaxEliminarMateriaOptativa(@RequestBody EliminarMateriaOptativa model) {

        MessageResultModel result = new MessageResultModel();
        try {
            mi.EliminarMateriaOptativa(model.getId_est_materiaoptativa());
            result.setStatus(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            result.setStatus(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}

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
import org.fautapo.domain.Menciones;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.EstudianteModel;
import org.fautapo.model.JsonMencionModel;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.ListViewModel;
import org.fautapo.model.MencionEliminarModel;
import org.fautapo.model.MencionModel;
import org.fautapo.model.MessageResultModel;
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
public class MencionesController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private HttpServletRequest request1;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/EntradaMenciones.fautapo", method = RequestMethod.GET)
    public String EntradaMenciones(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("model", model);
        return "administrarMenciones/Entrada";
    }

    @RequestMapping(value = "/listarProgramasMenciones.fautapo", method = RequestMethod.POST)
    public String handleRequest(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            return "administrarMenciones/Entrada";
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request1.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", cliente.getGestion());
        modelo.addAttribute("id_programa", model.getId_programa());
        return "administrarMenciones/listarProgramasMenciones";
    }

    @RequestMapping(value = "/listarMenciones.fautapo", method = RequestMethod.POST)
    public String ListarMencionesProgramas(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        int id_programa = Convert.ToInteger(request, "id_programa");
        int limit = 100;
        String condicion = Convert.ToString(request, "_condicion").equals("") ? "todo" : Convert.ToString(request, "_condicion");
        String filtrar = Convert.ToString(request.getParameter("_campo"));
        String buscarelemento = Convert.ToString(request, "_filtro");
        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(id_programa);
        buscar.setCondicion(condicion);
        buscar.setFiltro(filtrar);
        buscar.setBuscar(buscarelemento);
        buscar.setLimit(limit);
        List<Menciones> listaMenciones = mi.GetListarMencionesProgramas(buscar);
        List<ListViewModel> campos = new ArrayList<>();
        campos.add(new ListViewModel("", "Ninguno"));
        campos.add(new ListViewModel("R.U.", "Registro Universitario"));
        campos.add(new ListViewModel("programa", "Carrera"));
        campos.add(new ListViewModel("plan", "Plan de Estudio"));
        campos.add(new ListViewModel("mencion", "Mencion Academica"));
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
        modelo.addAttribute("id_programa", cliente.getId_programa());
        modelo.addAttribute("listaRegistros", listaMenciones);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "administrarMenciones/listarMenciones";
    }

    @RequestMapping(value = "/nuevoRegistroMencion.fautapo", method = RequestMethod.POST)
    public String NuevoRegistroMencion(@ModelAttribute("model") MencionModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(model.getId_programa());
        String programa = mi.GetProgramaMencion(buscar);
        List<String> planes = mi.GetProgramaPlanesMencion(buscar);
        if (model.getId_plan() != null) {
            ParametrosBusqueda buscarplan = new ParametrosBusqueda();
            buscarplan.setId_programa(model.getId_programa());
            buscarplan.setId_plan(model.getId_plan());
            List<Menciones> menciones = mi.GetListarMencion(buscarplan);
            modelo.addAttribute("lmenciones", menciones);
        }
        // MencionModel model = new MencionModel();
        //modelo.setId_programa(id_programa);
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("formulario", model);
        modelo.addAttribute("programa", programa);
        modelo.addAttribute("planes", planes);
        modelo.addAttribute("id_programa", model.getId_programa());
        return "administrarMenciones/NuevoRegistroMencion";
    }

    @RequestMapping(value = "/AjaxListarEstudiantesMencion.fautapo", method = RequestMethod.GET, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<EstudianteModel>> AjaxListarEstudiantesMencion(@ModelAttribute("id_programa") Integer id_programa, @ModelAttribute("buscar") String buscar) {
        ParametrosBusqueda parametro = new ParametrosBusqueda();
        parametro.setId_programa(id_programa);
        parametro.setBuscar(buscar);
        List<EstudianteModel> listaEstudiante = new ArrayList<>();
        mi.GetListarMencionesEstudiantes(parametro).stream().forEach(p -> {
            EstudianteModel e = new EstudianteModel();
            e.setId_estudiante(p.getId_estudiante());
            e.setNombre_completo(p.getNombre_completo());
            listaEstudiante.add(e);
        });
        if (listaEstudiante.isEmpty()) {
            return new ResponseEntity<>(listaEstudiante, HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(listaEstudiante, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/AjaxListarMenciones.fautapo", method = RequestMethod.GET, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<JsonMencionModel>> AjaxListarMenciones(@ModelAttribute("id_programa") Integer id_programa, @ModelAttribute("id_plan") String id_plan) {
        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(id_programa);
        buscar.setId_plan(id_plan);
        List<JsonMencionModel> menciones = new ArrayList<>();
        mi.GetListarMencion(buscar).forEach(p -> {
            JsonMencionModel mencion = new JsonMencionModel();
            mencion.setId_mencion(p.getId_mencion());
            mencion.setMencion(p.getMencion());
            menciones.add(mencion);
        });

        if (menciones.isEmpty()) {
            return new ResponseEntity<>(menciones, HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(menciones, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/RegistrarMencionEstudiante.fautapo", method = RequestMethod.POST)
    public String RegistrarMencionEstudiante(@ModelAttribute("formulario") @Validated MencionModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            ParametrosBusqueda buscar = new ParametrosBusqueda();
            buscar.setId_programa(model.getId_programa());
            String programa = mi.GetProgramaMencion(buscar);
            List<String> planes = mi.GetProgramaPlanesMencion(buscar);
            if (model.getId_plan() != null) {
                ParametrosBusqueda buscarplan = new ParametrosBusqueda();
                buscarplan.setId_programa(model.getId_programa());
                buscarplan.setId_plan(model.getId_plan());
                List<Menciones> menciones = mi.GetListarMencion(buscarplan);
                modelo.addAttribute("lmenciones", menciones);
            }
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("formulario", model);
            modelo.addAttribute("programa", programa);
            modelo.addAttribute("planes", planes);
            modelo.addAttribute("id_programa", model.getId_programa());
            return "administrarMenciones/NuevoRegistroMencion";
        }

        Menciones mencion = new Menciones();
        mencion.setId_estudiante(model.getId_estudiante());
        mencion.setId_programa(model.getId_programa());
        mencion.setId_plan(model.getId_plan());
        mencion.setId_mencion(model.getId_mencion());
        mencion.setId_rol(this.GetUsuario().getId_rol());
        mencion.setUlt_usuario(this.GetUsuario().getUlt_usuario());
        mi.RegistrarNuevaMencion(mencion);
        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(model.getId_programa());
        buscar.setCondicion("igual");
        buscar.setFiltro("R.U.");
        buscar.setBuscar(mencion.getId_estudiante() + "");
        buscar.setLimit(100);
        List<Menciones> listaMenciones = mi.GetListarMencionesProgramas(buscar);
        List<ListViewModel> campos = new ArrayList<>();
        campos.add(new ListViewModel("", "Ninguno"));
        campos.add(new ListViewModel("R.U.", "Registro Universitario"));
        campos.add(new ListViewModel("programa", "Carrera"));
        campos.add(new ListViewModel("plan", "Plan de Estudio"));
        campos.add(new ListViewModel("mencion", "Mencion Academica"));
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
        modelo.addAttribute("usuario", cliente.getNombres());
        return "administrarMenciones/listarMenciones";
    }

    @RequestMapping(value = "/AjaxEliminarMenciones.fautapo", method = RequestMethod.POST, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MessageResultModel> AjaxEliminarMenciones(@RequestBody MencionEliminarModel model) {

        Menciones mencion = new Menciones();
        mencion.setId_programa(model.getId_programa());
        mencion.setId_estudiante(model.getId_estudiante());
        mencion.setId_plan(model.getId_plan());
        mencion.setId_mencion(model.getId_mencion());
        MessageResultModel result = new MessageResultModel();
        try {
            mi.EliminarMencion(mencion);
            result.setStatus(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            result.setStatus(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @RequestMapping(value = "/editarRegistroMencion.fautapo", method = RequestMethod.POST)
    public String EditarMenciones(@ModelAttribute("formulario") MencionModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();

        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(model.getId_programa());
        String programa = mi.GetProgramaMencion(buscar);
        List<String> planes = mi.GetProgramaPlanesMencion(buscar);
        if (model.getId_plan() != null) {
            ParametrosBusqueda buscarplan = new ParametrosBusqueda();
            buscarplan.setId_programa(model.getId_programa());
            buscarplan.setId_plan(model.getId_plan());
            List<Menciones> menciones = mi.GetListarMencion(buscarplan);
            modelo.addAttribute("lmenciones", menciones);
        }
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("programa", programa);
        modelo.addAttribute("planes", planes);
        modelo.addAttribute("formulario", model);
        modelo.addAttribute("id_programa", model.getId_programa());
        return "administrarMenciones/EditarRegistroMencion";
    }

    @RequestMapping(value = "/registrarMencionEstudiante.fautapo", method = RequestMethod.POST)
    public String registrarMencionEstudiante(@ModelAttribute("formulario") @Validated MencionModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            ParametrosBusqueda buscar = new ParametrosBusqueda();
            buscar.setId_programa(model.getId_programa());
            String programa = mi.GetProgramaMencion(buscar);
            List<String> planes = mi.GetProgramaPlanesMencion(buscar);
            if (model.getId_plan() != null) {
                ParametrosBusqueda buscarplan = new ParametrosBusqueda();
                buscarplan.setId_programa(model.getId_programa());
                buscarplan.setId_plan(model.getId_plan());
                List<Menciones> menciones = mi.GetListarMencion(buscarplan);
                modelo.addAttribute("lmenciones", menciones);
            }
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("programa", programa);
            modelo.addAttribute("planes", planes);
            return "administrarMenciones/EditarRegistroMencion";
        }

        Menciones mencion = new Menciones();
        mencion.setId_programa(model.getId_programa());
        mencion.setId_estudiante(model.getId_estudiante());
        mencion.setId_plan(model.getId_plan());
        mencion.setId_mencion(model.getId_mencion());
        mencion.setUlt_usuario(this.GetUsuario().getUlt_usuario());
        mi.EditarMencion(mencion);
        ParametrosBusqueda buscar = new ParametrosBusqueda();
        buscar.setId_programa(model.getId_programa());
        buscar.setCondicion("igual");
        buscar.setFiltro("R.U.");
        buscar.setBuscar(mencion.getId_estudiante() + "");
        buscar.setLimit(100);
        List<Menciones> listaMenciones = mi.GetListarMencionesProgramas(buscar);
        List<ListViewModel> campos = new ArrayList<>();
        campos.add(new ListViewModel("", "Ninguno"));
        campos.add(new ListViewModel("R.U.", "Registro Universitario"));
        campos.add(new ListViewModel("programa", "Carrera"));
        campos.add(new ListViewModel("plan", "Plan de Estudio"));
        campos.add(new ListViewModel("mencion", "Mencion Academica"));
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
        modelo.addAttribute("usuario", cliente.getNombres());
        return "administrarMenciones/listarMenciones";
    }
}

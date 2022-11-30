/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.fautapo.web.cuenta;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.EstudianteUsuario;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.usuarios.EstudianteUsuarioModel;
import org.fautapo.model.usuarios.EstudianteUsuarioPasswordRecoveryModel;
import org.fautapo.model.usuarios.MessageResult;
import org.fautapo.model.usuarios.MessageResultPersonaModel;
import org.fautapo.model.usuarios.ParametroBusquedaUsuarioModel;
import org.fautapo.model.usuarios.ParametroEncriptacionModel;
import org.fautapo.model.usuarios.PersonaItem;
import org.fautapo.model.usuarios.UsuarioDocenteModel;
import org.fautapo.model.usuarios.UsuarioDocentePasswordRecoveryModel;
import org.fautapo.model.usuarios.UsuarioModel;
import org.fautapo.model.usuarios.UsuarioPasswordRecoveryModel;
import org.fautapo.util.Convert;
import org.fautapo.util.ListViewItem;
import org.fautapo.util.Util;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 *
 * @author Usuario
 */
@Controller
public class AccesosController {

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

    @RequestMapping(value = "/usuarios/entrada.fautapo", method = RequestMethod.GET)
    public String entrada(Model modelo) {
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", this.GetUsuario().getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "administrarUsuarios/Entrada";
    }

    @RequestMapping(value = "/usuarios/listarUsuarios.fautapo", method = RequestMethod.GET)
    public String listarUsuarios(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", this.GetUsuario().getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "administrarUsuarios/Entrada";
        }
        ParametroBusquedaUsuarioModel usermodel = new ParametroBusquedaUsuarioModel();
        usermodel.setPagina(Convert.ToInteger(request, "pagina") == 0 ? 1 : Convert.ToInteger(request, "pagina"));
        usermodel.setNombreUsuario("");
        usermodel.setNro_pagina(50);
        usermodel.setId_usuario(0);

        Usuarios usuario = modelMapper.map(usermodel, Usuarios.class);
        List lUsuarios = this.mi.getListarUsuarios(usuario);
        modelo.addAttribute("result", null);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", usermodel);
        return "administrarUsuarios/ListarUsuarios";
    }

    @RequestMapping(value = "/usuarios/retornarlistarUsuarios.fautapo", method = RequestMethod.GET)
    public String retornarlistarUsuarios(ModelMap modelo) {
        ParametroBusquedaUsuarioModel usermodel = new ParametroBusquedaUsuarioModel();
        usermodel.setPagina(1);
        usermodel.setNombreUsuario("");
        usermodel.setNro_pagina(50);
        usermodel.setId_usuario(0);
        String status = request.getParameter("status");
        String message = request.getParameter("message");
        MessageResult result = new MessageResult();
        result.setMessage(message);
        result.setStatus(status);
        modelo.addAttribute("result", result);
        Usuarios usuario = modelMapper.map(usermodel, Usuarios.class);
        List lUsuarios = this.mi.getListarUsuarios(usuario);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", usermodel);
        return "administrarUsuarios/ListarUsuarios";
    }

    @RequestMapping(value = "/usuarios/listarUsuariosFiltrar.fautapo", method = RequestMethod.GET)
    public String listarUsuariosFiltrar(@ModelAttribute("model") ParametroBusquedaUsuarioModel model, ModelMap modelo) {
        Usuarios usuario = modelMapper.map(model, Usuarios.class);
        List lUsuarios = this.mi.getListarUsuarios(usuario);

        modelo.addAttribute("result", null);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", model);
        return "administrarUsuarios/ListarUsuarios";
    }

    @RequestMapping(value = "/usuarios/SeleccionarMetodoEncriptacion.fautapo", method = RequestMethod.GET)
    public String SeleccionarMetodoEncriptacion(@ModelAttribute("model") ParametroEncriptacionModel model, ModelMap modelo) {
        List<ListViewItem> encriptacion = new ArrayList<>();
        encriptacion.add(new ListViewItem("", "NINGUNO"));
        encriptacion.add(new ListViewItem("MD5", "ENCRIPTACION MD5"));
        encriptacion.add(new ListViewItem("HASH", "ENCRIPTACION HASH"));
        modelo.addAttribute("encriptacion", encriptacion);
        modelo.addAttribute("model", model);
        return "administrarUsuarios/SeleccionarEncriptacion";
    }

    @RequestMapping(value = "/usuarios/ConfirmarBorrado.fautapo", method = RequestMethod.GET)
    public String ConfirmarBorrado(@ModelAttribute("model") ParametroEncriptacionModel model, ModelMap modelo) {
        modelo.addAttribute("model", model);
        modelo.addAttribute("ruta", "usuarios/RegistrarEliminarUsuario.fautapo");
        return "administrarUsuarios/ConfirmarBorrado";
    }

    @RequestMapping(value = "/usuarios/ListarPersonasAjax.fautapo", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MessageResultPersonaModel> ListarPersonasAjax(@ModelAttribute("buscar") String buscar) {
        MessageResultPersonaModel result = new MessageResultPersonaModel();
        List<PersonaItem> lista = this.mi.GetListaPersonasHabilitadas(buscar).stream().map(element -> modelMapper.map(element, PersonaItem.class)).collect(Collectors.toList());
        if (lista.isEmpty()) {
            result.setStatus("Error");
            result.setMessage("No se encuentra lo que busca");
            return new ResponseEntity<>(result, HttpStatus.OK);
        } else {
            result.setStatus("OK");
            result.setMessage("No se encuentra lo que busca");
            result.setItems(lista);
            return new ResponseEntity<>(result, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/usuarios/FormularioRegistroUsuario.fautapo", method = RequestMethod.POST)
    public String FormularioRegistroUsuario(@ModelAttribute("model") @Validated ParametroEncriptacionModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            List<ListViewItem> encriptacion = new ArrayList<>();
            encriptacion.add(new ListViewItem("", "NINGUNO"));
            encriptacion.add(new ListViewItem("MD5", "ENCRIPTACION MD5"));
            encriptacion.add(new ListViewItem("HASH", "ENCRIPTACION HASH"));
            modelo.addAttribute("encriptacion", encriptacion);
            modelo.addAttribute("model", model);
            return "administrarUsuarios/SeleccionarEncriptacion";
        }
        UsuarioModel usuario = new UsuarioModel();
        UsuarioPasswordRecoveryModel usuariomodel = new UsuarioPasswordRecoveryModel();
        if (model.getId_usuario() == null) {
            usuario.setTipoEncriptacion(model.getTipoEncriptacion());
            usuario.setTipo("Administrativo");
            modelo.addAttribute("model", usuario);
            modelo.addAttribute("ruta", "usuarios/RegistrarNuevoUsuario.fautapo");
            return "administrarUsuarios/NuevoUsuario";
        } else {
            Usuarios datosUsuario = new Usuarios();
            datosUsuario.setId_usuario(model.getId_usuario());
            datosUsuario = this.mi.getBuscarUsuario(datosUsuario);
            usuariomodel = modelMapper.map(datosUsuario, UsuarioPasswordRecoveryModel.class);
            usuariomodel.setTipoEncriptacion(model.getTipoEncriptacion());
            if (!model.getTipoEncriptacion().equals("MD5")) {
                usuariomodel.setConfirmar_apodo(datosUsuario.getApodo());
            }
            usuariomodel.setTipo("Administrativo");
            modelo.addAttribute("model", usuariomodel);
            modelo.addAttribute("ruta", "usuarios/RegistrarEditarUsuario.fautapo");
            return "administrarUsuarios/EditarUsuario";
        }
    }

    @RequestMapping(value = "/usuarios/RegistrarNuevoUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarNuevoUsuario(@ModelAttribute("model") @Validated UsuarioModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("model", model);
            modelo.addAttribute("ruta", "usuarios/RegistrarNuevoUsuario.fautapo");
            return "administrarUsuarios/NuevoUsuario";
        }
        Usuarios usuario = modelMapper.map(model, Usuarios.class);
        usuario.setApodo(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getApodo() + "fautapo") : model.getApodo());
        usuario.setClave(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_clave() + "modeloinformacional") : bcryptEncoder.encode(model.getConfirmar_clave()));
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        Integer iResultado = this.mi.setRegistrarUsuario(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se grabo correctamente el registro del usuario");
            return "redirect:/usuarios/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/usuarios/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/usuarios/RegistrarEditarUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarEditarUsuario(@ModelAttribute("model") @Validated UsuarioPasswordRecoveryModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("model", model);
            modelo.addAttribute("ruta", "usuarios/RegistrarEditarUsuario.fautapo");
            return "administrarUsuarios/EditarUsuario";
        }
        Usuarios usuario = modelMapper.map(model, Usuarios.class);
        usuario.setApodo(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_apodo() + "fautapo") : model.getConfirmar_apodo());
        usuario.setClave(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_clave() + "modeloinformacional") : bcryptEncoder.encode(model.getConfirmar_clave()));
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        Integer iResultado = this.mi.setRegistrarUsuario(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se Actualizo correctamente el registro del usuario");
            return "redirect:/usuarios/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/usuarios/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/usuarios/RegistrarEliminarUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarEliminarUsuario(@ModelAttribute("model") @Validated UsuarioModel model, BindingResult result, ModelMap modelo) {
        Usuarios usuario = modelMapper.map(model, Usuarios.class);
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        Integer iResultado = this.mi.setEliminarUsuario(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se elimino correctamente el registro del usuario");
            return "redirect:/usuarios/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/usuarios/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/docente/entrada.fautapo", method = RequestMethod.GET)
    public String entradadocente(Model modelo) {
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", this.GetUsuario().getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "administrarDocente/Entrada";
    }

    @RequestMapping(value = "/docente/listarUsuarios.fautapo", method = RequestMethod.GET)
    public String listarUsuariosdocente(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", this.GetUsuario().getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "administrarDocente/Entrada";
        }
        ParametroBusquedaUsuarioModel usermodel = new ParametroBusquedaUsuarioModel();
        usermodel.setPagina(Convert.ToInteger(request, "pagina") == 0 ? 1 : Convert.ToInteger(request, "pagina"));
        usermodel.setNombreUsuario("");
        usermodel.setNro_pagina(50);
        usermodel.setId_usuario(0);

        Docentes usuario = modelMapper.map(usermodel, Docentes.class);
        List lUsuarios = this.mi.getListarDocentes(usuario);
        modelo.addAttribute("result", null);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", usermodel);
        return "administrarDocente/ListarUsuarios";
    }

    @RequestMapping(value = "/docente/retornarlistarUsuarios.fautapo", method = RequestMethod.GET)
    public String retornarlistarUsuariosdocente(ModelMap modelo) {
        ParametroBusquedaUsuarioModel usermodel = new ParametroBusquedaUsuarioModel();
        usermodel.setPagina(1);
        usermodel.setNombreUsuario("");
        usermodel.setNro_pagina(50);
        usermodel.setId_usuario(0);
        String status = request.getParameter("status");
        String message = request.getParameter("message");
        MessageResult result = new MessageResult();
        result.setMessage(message);
        result.setStatus(status);
        modelo.addAttribute("result", result);
        Docentes usuario = modelMapper.map(usermodel, Docentes.class);
        List lUsuarios = this.mi.getListarDocentes(usuario);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", usermodel);
        return "administrarDocente/ListarUsuarios";
    }

    @RequestMapping(value = "/docente/listarUsuariosFiltrar.fautapo", method = RequestMethod.GET)
    public String listarUsuariosFiltrardocente(@ModelAttribute("model") ParametroBusquedaUsuarioModel model, ModelMap modelo) {
        Docentes usuario = modelMapper.map(model, Docentes.class);
        List lUsuarios = this.mi.getListarDocentes(usuario);

        modelo.addAttribute("result", null);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", model);
        return "administrarDocente/ListarUsuarios";
    }

    @RequestMapping(value = "/docente/ConfirmarBorrado.fautapo", method = RequestMethod.GET)
    public String ConfirmarBorradodocente(@ModelAttribute("model") ParametroBusquedaUsuarioModel model, ModelMap modelo) {
        modelo.addAttribute("model", model);
        modelo.addAttribute("ruta", "docente/RegistrarEliminarUsuario.fautapo");
        return "administrarDocente/ConfirmarBorrado";
    }

    @RequestMapping(value = "/docente/ListarPersonasAjax.fautapo", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MessageResultPersonaModel> ListarPersonasdocenteAjax(@ModelAttribute("buscar") String buscar) {
        MessageResultPersonaModel result = new MessageResultPersonaModel();
        List<PersonaItem> lista = this.mi.GetListaPersonasHabilitadas(buscar).stream().map(element -> modelMapper.map(element, PersonaItem.class)).collect(Collectors.toList());
        if (lista.isEmpty()) {
            result.setStatus("Error");
            result.setMessage("No se encuentra lo que busca");
            return new ResponseEntity<>(result, HttpStatus.OK);
        } else {
            result.setStatus("OK");
            result.setMessage("No se encuentra lo que busca");
            result.setItems(lista);
            return new ResponseEntity<>(result, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/docente/FormularioRegistroDocente.fautapo", method = RequestMethod.GET)
    public String FormularioRegistroDocente(@ModelAttribute("model") ParametroBusquedaUsuarioModel model, ModelMap modelo) {
        UsuarioDocenteModel usuario = new UsuarioDocenteModel();
        UsuarioDocentePasswordRecoveryModel usuariomodel = new UsuarioDocentePasswordRecoveryModel();
        if (model.getId_docente() == null) {
            usuario.setTipoEncriptacion("HASH");
            usuario.setTipoUsuario("Docente");
            modelo.addAttribute("model", usuario);
            modelo.addAttribute("ruta", "docente/RegistrarNuevoUsuario.fautapo");
            return "administrarDocente/NuevoUsuario";
        } else {
            Docentes datosUsuario = new Docentes();
            datosUsuario.setId_docente(model.getId_docente());
            datosUsuario = this.mi.getBuscarDocente(datosUsuario);
            usuariomodel = modelMapper.map(datosUsuario, UsuarioDocentePasswordRecoveryModel.class);
            usuariomodel.setTipoEncriptacion("HASH");
            usuariomodel.setConfirmar_apodo(datosUsuario.getApodo());
            usuariomodel.setTipoUsuario("Docente");
            modelo.addAttribute("model", usuariomodel);
            modelo.addAttribute("ruta", "docente/RegistrarEditarUsuario.fautapo");
            return "administrarDocente/EditarUsuario";
        }
    }

    @RequestMapping(value = "/docente/RegistrarNuevoUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarNuevoUsuariodocente(@ModelAttribute("model") @Validated UsuarioDocenteModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("model", model);
            modelo.addAttribute("ruta", "docente/RegistrarNuevoUsuario.fautapo");
            return "administrarDocente/NuevoUsuario";
        }
        Docentes usuario = modelMapper.map(model, Docentes.class);
        usuario.setApodo(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getApodo() + "fautapo") : model.getApodo());
        usuario.setClave(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_clave() + "modeloinformacional") : bcryptEncoder.encode(model.getConfirmar_clave()));
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        usuario.setId_rol(this.GetUsuario().getId_rol());
        Integer iResultado = this.mi.setRegistrarDocente(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se grabo correctamente el registro del usuario");
            return "redirect:/docente/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/docente/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/docente/RegistrarEditarUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarEditarUsuariodocente(@ModelAttribute("model") @Validated UsuarioDocentePasswordRecoveryModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("model", model);
            modelo.addAttribute("ruta", "docente/RegistrarEditarUsuario.fautapo");
            return "administrarDocente/EditarUsuario";
        }
        Docentes usuario = modelMapper.map(model, Docentes.class);
        usuario.setApodo(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_apodo() + "fautapo") : model.getConfirmar_apodo());
        usuario.setClave(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_clave() + "modeloinformacional") : bcryptEncoder.encode(model.getConfirmar_clave()));
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        usuario.setId_rol(this.GetUsuario().getId_rol());
        Integer iResultado = this.mi.setRegistrarDocente(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se Actualizo correctamente el registro del usuario");
            return "redirect:/docente/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/docente/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/docente/RegistrarEliminarUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarEliminarUsuariodocente(@ModelAttribute("model") UsuarioDocenteModel model, ModelMap modelo) {
        Docentes usuario = modelMapper.map(model, Docentes.class);
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        Integer iResultado = this.mi.setEliminarDocente(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se elimino correctamente el registro del usuario");
            return "redirect:/docente/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/docente/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/estudiante/entrada.fautapo", method = RequestMethod.GET)
    public String entradaestudiante(Model modelo) {
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", this.GetUsuario().getNombres());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "administrarEstudiante/Entrada";
    }

    @RequestMapping(value = "/estudiante/listarUsuarios.fautapo", method = RequestMethod.GET)
    public String listarUsuariosestudiante(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", this.GetUsuario().getNombres());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "administrarEstudiante/Entrada";
        }
        ParametroBusquedaUsuarioModel usermodel = new ParametroBusquedaUsuarioModel();
        usermodel.setPagina(Convert.ToInteger(request, "pagina") == 0 ? 1 : Convert.ToInteger(request, "pagina"));
        usermodel.setNombreUsuario("");
        usermodel.setNro_pagina(50);
        usermodel.setId_usuario(0);

        EstudianteUsuario usuario = modelMapper.map(usermodel, EstudianteUsuario.class);
        List lUsuarios = this.mi.getListarEstudiantes(usuario);
        modelo.addAttribute("result", null);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", usermodel);
        return "administrarEstudiante/ListarUsuarios";
    }

    @RequestMapping(value = "/estudiante/retornarlistarUsuarios.fautapo", method = RequestMethod.GET)
    public String retornarlistarUsuariosestudiante(ModelMap modelo) {
        ParametroBusquedaUsuarioModel usermodel = new ParametroBusquedaUsuarioModel();
        usermodel.setPagina(1);
        usermodel.setNombreUsuario("");
        usermodel.setNro_pagina(50);
        usermodel.setId_usuario(0);
        String status = request.getParameter("status");
        String message = request.getParameter("message");
        MessageResult result = new MessageResult();
        result.setMessage(message);
        result.setStatus(status);
        modelo.addAttribute("result", result);
        EstudianteUsuario usuario = modelMapper.map(usermodel, EstudianteUsuario.class);
        List lUsuarios = this.mi.getListarEstudiantes(usuario);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", usermodel);
        return "administrarEstudiante/ListarUsuarios";
    }

    @RequestMapping(value = "/estudiante/listarUsuariosFiltrar.fautapo", method = RequestMethod.GET)
    public String listarUsuariosFiltrarestudiante(@ModelAttribute("model") ParametroBusquedaUsuarioModel model, ModelMap modelo) {
        EstudianteUsuario usuario = modelMapper.map(model, EstudianteUsuario.class);
        List lUsuarios = this.mi.getListarEstudiantes(usuario);

        modelo.addAttribute("result", null);
        modelo.addAttribute("lUsuarios", lUsuarios);
        modelo.addAttribute("size", Integer.toString(lUsuarios.size()));
        modelo.addAttribute("model", model);
        return "administrarEstudiante/ListarUsuarios";
    }

    @RequestMapping(value = "/estudiante/ConfirmarBorrado.fautapo", method = RequestMethod.GET)
    public String ConfirmarBorradoestudiante(@ModelAttribute("model") ParametroBusquedaUsuarioModel model, ModelMap modelo) {
        modelo.addAttribute("model", model);
        modelo.addAttribute("ruta", "estudiante/RegistrarEliminarUsuario.fautapo");
        return "administrarEstudiante/ConfirmarBorrado";
    }

    @RequestMapping(value = "/estudiante/ListarPersonasAjax.fautapo", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MessageResultPersonaModel> ListarPersonasestudianteAjax(@ModelAttribute("buscar") String buscar) {
        MessageResultPersonaModel result = new MessageResultPersonaModel();
        List<PersonaItem> lista = this.mi.GetListaPersonasHabilitadas(buscar).stream().map(element -> modelMapper.map(element, PersonaItem.class)).collect(Collectors.toList());
        if (lista.isEmpty()) {
            result.setStatus("Error");
            result.setMessage("No se encuentra lo que busca");
            return new ResponseEntity<>(result, HttpStatus.OK);
        } else {
            result.setStatus("OK");
            result.setMessage("No se encuentra lo que busca");
            result.setItems(lista);
            return new ResponseEntity<>(result, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/estudiante/FormularioRegistroEstudiante.fautapo", method = RequestMethod.GET)
    public String FormularioRegistroEstudiante(@ModelAttribute("model") ParametroBusquedaUsuarioModel model, ModelMap modelo) {
        EstudianteUsuarioModel usuario = new EstudianteUsuarioModel();
        EstudianteUsuarioPasswordRecoveryModel usuariomodel = new EstudianteUsuarioPasswordRecoveryModel();
        if (model.getId_usuario_estudiante() == null) {
            usuario.setTipoEncriptacion("HASH");
            usuario.setTipoUsuario("Estudiante");
            modelo.addAttribute("model", usuario);
            modelo.addAttribute("ruta", "estudiante/RegistrarNuevoUsuario.fautapo");
            return "administrarEstudiante/NuevoUsuario";
        } else {
            EstudianteUsuario datosUsuario = new EstudianteUsuario();
            datosUsuario.setId_usuario_estudiante(model.getId_usuario_estudiante());
            datosUsuario = this.mi.getBuscarEstudianteUsuario(datosUsuario);
            usuariomodel = modelMapper.map(datosUsuario, EstudianteUsuarioPasswordRecoveryModel.class);
            usuariomodel.setTipoEncriptacion("HASH");
            usuariomodel.setConfirmar_correo(datosUsuario.getCorreo());
            usuariomodel.setTipoUsuario("Estudiante");
            modelo.addAttribute("model", usuariomodel);
            modelo.addAttribute("ruta", "estudiante/RegistrarEditarUsuario.fautapo");
            return "administrarEstudiante/EditarUsuario";
        }
    }

    @RequestMapping(value = "/estudiante/RegistrarNuevoUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarNuevoUsuarioestudiante(@ModelAttribute("model") @Validated EstudianteUsuarioModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("model", model);
            modelo.addAttribute("ruta", "estudiante/RegistrarNuevoUsuario.fautapo");
            return "administrarEstudiante/NuevoUsuario";
        }
        EstudianteUsuario usuario = modelMapper.map(model, EstudianteUsuario.class);
        usuario.setCorreo(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getCorreo() + "fautapo") : model.getCorreo());
        usuario.setClave(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_clave() + "modeloinformacional") : bcryptEncoder.encode(model.getConfirmar_clave()));
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        usuario.setId_rol(this.GetUsuario().getId_rol());
        Integer iResultado = this.mi.setRegistrarUsuarioEstudiante(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se grabo correctamente el registro del usuario");
            return "redirect:/estudiante/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/estudiante/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/estudiante/RegistrarEditarUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarEditarUsuarioestudiante(@ModelAttribute("model") @Validated EstudianteUsuarioPasswordRecoveryModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("model", model);
            modelo.addAttribute("ruta", "estudiante/RegistrarEditarUsuario.fautapo");
            return "administrarEstudiante/EditarUsuario";
        }
        EstudianteUsuario usuario = modelMapper.map(model, EstudianteUsuario.class);
        usuario.setCorreo(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_correo() + "fautapo") : model.getConfirmar_correo());
        usuario.setClave(model.getTipoEncriptacion().equals("MD5") ? Util.MD5(model.getConfirmar_clave() + "modeloinformacional") : bcryptEncoder.encode(model.getConfirmar_clave()));
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        usuario.setId_rol(this.GetUsuario().getId_rol());
        Integer iResultado = this.mi.setRegistrarUsuarioEstudiante(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se Actualizo correctamente el registro del usuario");
            return "redirect:/estudiante/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo el registro del usuario");
            return "redirect:/estudiante/retornarlistarUsuarios.fautapo" + request;
        }
    }

    @RequestMapping(value = "/estudiante/RegistrarEliminarUsuario.fautapo", method = RequestMethod.POST)
    public String RegistrarEliminarUsuarioestudiante(@ModelAttribute("model") EstudianteUsuarioModel model, ModelMap modelo) {
        EstudianteUsuario usuario = modelMapper.map(model, EstudianteUsuario.class);
        usuario.setUlt_usuario(this.GetUsuario().getId_usuario());
        Integer iResultado = this.mi.setEliminarEstudiante(usuario);
        if (iResultado != 0) {
            String request = "?status=" + Util.encodeValue("alert-success") + "&" + "message=" + Util.encodeValue("Se elimino correctamente el registro del usuario");
            return "redirect:/estudiante/retornarlistarUsuarios.fautapo" + request;
        } else {
            String request = "?status=" + Util.encodeValue("alert-danger") + "&" + "message=" + Util.encodeValue("No se realizo la eliminacion del usuario");
            return "redirect:/estudiante/retornarlistarUsuarios.fautapo" + request;
        }
    }
}

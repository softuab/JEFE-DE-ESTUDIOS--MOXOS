/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.cuenta;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Roles;
import org.fautapo.domain.Tokens;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.PasswordRecoveryModel;
import org.fautapo.model.RecoveryPasswordModel;
import org.fautapo.model.TokenRecovery;
import org.fautapo.service.EmailService;
import org.fautapo.util.Mail;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class CuentaController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;
    @Autowired
    private EmailService emailservice;
    @Autowired
    private HttpServletRequest request;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping("/login.fautapo")
    public String loginPage(@RequestParam(value = "error", required = false) Integer errorCode, Model model, HttpServletRequest servletRequest) {
        if (errorCode != null) {
            if (errorCode.equals(1)) {
                model.addAttribute("authenticationError", true);
            } else if (errorCode.equals(2)) {
                String login = servletRequest.getParameter("j_username");
                model.addAttribute("reCaptchaError", true);
                model.addAttribute("login", login);
            }
        }
        return "login/LoginEntrada";
    }

    @RequestMapping(value = "/authentication.fautapo", method = RequestMethod.POST)
    public String loginPost(HttpSession session, Authentication authentication) {

        String client_id = (String) session.getAttribute("client_id");

        return "/user/menu";
    }

    @RequestMapping(value = "/recovery.fautapo", method = RequestMethod.POST)
    public String recovery() {
        return "/user/menu";
    }

    @RequestMapping(value = "/ExisteUsuario.fautapo", method = RequestMethod.GET, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<String> ExisteUsuario(@ModelAttribute("model") @Validated RecoveryPasswordModel model, BindingResult result) {
        String msg = "none";
        if (result.hasErrors()) {
            msg = "";
            msg = result.getFieldErrors().stream().map((p) -> (p.getDefaultMessage() + "<br/>")).reduce(msg, String::concat);
            return new ResponseEntity<>("{\"status\" : \"" + msg + "\"}", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("{\"status\" : \"" + msg + "\"}", HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/Recovery.fautapo", method = RequestMethod.GET)
    public String Recovery(@ModelAttribute("model") RecoveryPasswordModel model, ModelMap modelo) throws IOException, FileNotFoundException, MessagingException {
        Usuarios usuariospersona = mi.getUsuarioadministrativo(model.getCorreo());
        String tokens = UUID.randomUUID().toString();
        Tokens token = new Tokens();
        token.setExpiryDate(30);
        token.setId_persona(usuariospersona.getId_usuario());
        token.setId_estado("A");
        token.setToken(tokens.toUpperCase());
        token.setTipo("P");
        Mail mail = new Mail();
        mail.setFrom("administrativo@uabjb.edu.bo");
        mail.setTo(model.getCorreo());
        mail.setSubject("RECUPERA TU CONTRASEÑA");
        modelo.addAttribute("nombrecompleto", usuariospersona.getNombre_completo());
        modelo.addAttribute("token", tokens);
        mail.setModel(modelo);
        if (emailservice.sendEmail(mail)) {
            mi.setGenerarToken(token);
            modelo.put("nombrecompleto", usuariospersona.getNombre_completo());
            TokenRecovery modeltoken = new TokenRecovery();
            modeltoken.setId_usr_adm(usuariospersona.getId_usuario());
            modeltoken.setNombre_completo(usuariospersona.getNombre_completo());
            modelo.addAttribute("model", modeltoken);
            return "login/recovery/CodigoVerificacion";
        } else {
            modelo.addAttribute("model", model);
            modelo.addAttribute("mensaje", "No se logro enviar el correo de recuperacion intente nuevamente");
            return "login/recovery/error";
        }
    }

    @RequestMapping(value = "/Recovery.fautapo", method = RequestMethod.POST)
    public String Recovery(@ModelAttribute("model") @Validated TokenRecovery model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("nombrecompleto", model.getNombre_completo());
            return "login/recovery/CodigoVerificacion";
        } else {
            modelo.put("id_usr_adm", model.getId_usr_adm());
            return "login/recovery/CambioPinDocente";
        }
    }

    @RequestMapping(value = "/RegistrarNuevoPinDocente.fautapo", method = RequestMethod.POST)
    public String RegistrarNuevoPinDocente(@ModelAttribute("model") PasswordRecoveryModel model, ModelMap modelo) {
        modelo.addAttribute("id_usr_adm", model.getId_usr_adm());
        modelo.addAttribute("nueva_clave", model.getNueva_clave());
        modelo.addAttribute("conf_nueva_clave", model.getConf_nueva_clave());
        int nrocarac = model.getNueva_clave().length();
        int valor = 6;
        if (("".equals(model.getNueva_clave())) && ("".equals(model.getConf_nueva_clave()))) {
            return "login/recovery/CambioPinDocente";
        }
        if (nrocarac >= valor) {
            if (model.getNueva_clave().trim().equals(model.getConf_nueva_clave().trim())) {
                Usuarios persona = new Usuarios();
                persona.setId_usuario(model.getId_usr_adm());
                persona.setClave(bcryptEncoder.encode(model.getNueva_clave().trim()));
                persona.setId_rol(10);
                persona.setUlt_usuario(model.getId_usr_adm());
                int iValor = this.mi.setCambioPinAdministrativo(persona);
                //return new ModelAndView("cambiopindocente/CambioPinDocenteSalida2", modelo);
                if (iValor == 1) {
                    modelo.addAttribute("mensaje", "Se realizo el cambio de clave");
                    return "login/recovery/Confirmacion";
                } else {
                    modelo.addAttribute("mensaje", "No se realizo el cambio de clave. Intentelo de nuevo");
                    return "login/recovery/Confirmacion";
                }
            } else {
                String mensaje = "No coincide la confirmacion de la clave";
                modelo.put("mensaje", mensaje);
                return "login/recovery/error";
            }
        } else {
            String mensaje = "Digite un minimo de 6 caracteres";
            modelo.addAttribute("mensaje", mensaje);
            return "login/recovery/error";
        }
    }

    @RequestMapping("/Logout.fautapo")
    public String Logout() {
        request.getSession().removeAttribute("__sess_cliente");
        request.getSession().invalidate();
        return "redirect:/login.fautapo";
    }

    @RequestMapping("/ElegirRol.fautapo")
    public String ElegirRol(ModelMap modelo) {
        modelo.addAttribute("cliente", this.GetUsuario());
        return "login/ElegirRol";
    }

    @RequestMapping(value = "/CambiarRol.fautapo", method = RequestMethod.POST)
    public String CambiarRol(@ModelAttribute("id_rol") Integer id_rol, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        Roles rol = new Roles();
        rol.setId_rol(id_rol);
        rol.setId_usuario(cliente.getId_usuario());
        rol = this.mi.getBuscarRolCliente(rol);
        cliente.setId_rol(rol.getId_rol());
        cliente.setRol(rol.getRol());
        cliente.setId_universidad(rol.getId_universidad());
        cliente.setId_facultad(rol.getId_facultad());
        cliente.setId_programa(rol.getId_programa());
        cliente.setId_departamento(rol.getId_departamento());
        cliente.setId_ubicacion_organica(rol.getId_ubicacion_organica());
        cliente.setId_almacen(rol.getId_almacen());
        cliente.setFiltro(rol.getFiltro());
        cliente.setPermiso(rol.getPermiso());
        //Sacamos el listado de almacenes

        cliente.setAlmacenes(this.mi.getListarAlmacenesCliente(rol));
        if (cliente.getAlmacenes().size() > 0) {
            Roles aux = (Roles) cliente.getAlmacenes().get(0);
            cliente.setId_almacen(aux.getId_almacen());
            cliente.setPermiso(aux.getPermiso());
            cliente.setAlmacen(aux.getAlmacen());
        }
        if (cliente.getAlmacenes().size() == 0) {
            cliente.setAlmacen("");
        }
        // Este es para el MI si o si
        Accesos acceso = new Accesos();
        acceso.setAsignarAccesos(cliente, this.mi);
        request.getSession().setAttribute("__sess_acceso", acceso); // Subimos los 'accesos' a la sesion
        request.getSession().setAttribute("__sess_cliente", cliente);
        //Fin para el MI  

        return "redirect:/index.fautapo";
    }
}

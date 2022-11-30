/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.LoginPasswordChangeModel;
import org.fautapo.model.ParametroEntradaModel;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
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
public class AccesoController {

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

    @RequestMapping(value = "/verificarUsuario.fautapo", method = RequestMethod.GET)
    public String verificarUsuario(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("simagen", cliente.getImagen());

        ParametroEntradaModel parameter = new ParametroEntradaModel();
        parameter.setBoton("Buscar");
        modelo.addAttribute("model", parameter);

        return "administrarClaves/VerificarUsuario";
    }

    @RequestMapping(value = "/verificarUsuario.fautapo", method = RequestMethod.POST)
    public String verificarUsuario(@ModelAttribute("model") @Validated ParametroEntradaModel model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("simagen", cliente.getImagen());
            return "administrarClaves/VerificarUsuario";
        }

        modelo.addAttribute("nombres", cliente.getNombres());
        return "administrarClaves/RecomendacionesClave";
    }

    @RequestMapping(value = "/registrarClave.fautapo", method = RequestMethod.GET)
    public String RegistrarClave(ModelMap modelo) {
        LoginPasswordChangeModel model = new LoginPasswordChangeModel();
        modelo.addAttribute("nombres", this.GetUsuario().getNombres());
        modelo.addAttribute("model", model);
        return "administrarClaves/RegistrarClave";
    }

    @RequestMapping(value = "/registrarClave.fautapo", method = RequestMethod.POST)
    public String RegistrarClave(@ModelAttribute("model") @Validated LoginPasswordChangeModel model, BindingResult result, ModelMap modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", this.GetUsuario().getNombres());
            return "administrarClaves/RegistrarClave";
        }

        modelo.put("nombres", this.GetUsuario().getNombres());
        Usuarios usuario = new Usuarios();
        usuario.setId_usuario(this.GetUsuario().getId_usuario());
        usuario.setClave(bcryptEncoder.encode(model.getConf_nueva_clave()));
        int iResultado = this.mi.setRegistrarNuevaClave(usuario);
        if (iResultado == 0) {
            modelo.addAttribute("mensaje", "La nueva clave no se registro");
            return "Error";
        } else {
            this.GetUsuario().setClave(usuario.getClave());
            request.getSession().setAttribute("__sess_cliente", this.GetUsuario());
            modelo.addAttribute("mensaje", "La clave fue registrada correctamente");
            return "administrarClaves/Aviso";
        }
    }
}

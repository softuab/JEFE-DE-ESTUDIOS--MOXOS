/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.ParametroPlanesMateriaModel;
import org.fautapo.model.ParametrosAreasEntradaModel;
import org.fautapo.util.ListViewItem;
import org.fautapo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
public class AreasConocimientosController {
    
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
    
    @RequestMapping(value = "/areaconocimiento/Entrada.fautapo", method = RequestMethod.GET)
    public String handleRequest(HttpServletRequest request, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosAreasEntradaModel model = new ParametrosAreasEntradaModel();
        model.setId_departamento(cliente.getId_departamento());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("model", model);
        return "AdministrarAreas/Entrada";
    }
    
    @RequestMapping(value = "/ListarAreasDeConocimiento.fautapo", method = RequestMethod.POST)
    public String ListarAreasDeConocimiento(@ModelAttribute("model") @Validated ParametrosAreasEntradaModel model, BindingResult result, Model modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("model", model);
            return "AdministrarAreas/Entrada";
        }
        Accesos acceso = (Accesos) request.getSession().getAttribute("__sess_acceso");
        List<ListViewItem> planes = mi.GetListaPlanes(cliente.getId_programa());
        ParametroPlanesMateriaModel modelplan = new ParametroPlanesMateriaModel();
        modelplan.setId_facultad(cliente.getId_facultad() > 0 ? cliente.getId_facultad() : -1);
        modelplan.setId_programa(cliente.getId_programa() > 0 ? cliente.getId_programa() : -1);
        modelplan.setAcceso(acceso.getAcceso());
        modelo.addAttribute("planes", planes);
        modelo.addAttribute("model", modelplan);
        modelo.addAttribute("cliente", cliente);
        return "AdministrarAreas/listarProgramasPlanes";
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.Enlaces;
import org.fautapo.domain.MenuEntity;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.domain.TreeMenuEntity;
import org.fautapo.domain.logic.MiFacade;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class AdminController {

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

    @RequestMapping("/index.fautapo")
    public String Index(ModelMap modelo) {
        List<TreeMenuEntity> enlaces = new ArrayList<TreeMenuEntity>();
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("snombre", cliente.getNombres().substring(0, 10) + "...");
        modelo.addAttribute("simagen", cliente.getImagen());
        ParametrosBusqueda Buscar = new ParametrosBusqueda();
        Buscar.setId_docente(cliente.getId_usuario());
        Buscar.setGestion(cliente.getGestion());
        List<Docentes> listarnotificaciones = mi.GetListaNotificacionDocente(Buscar);
        int cantidad = 0;
        if (!listarnotificaciones.isEmpty()) {
            cantidad = listarnotificaciones.size();
            modelo.addAttribute("cantidadnotificacion", cantidad);
            modelo.addAttribute("notificaciones", listarnotificaciones);
        } else {
            modelo.addAttribute("cantidadnotificacion", cantidad);
            modelo.addAttribute("notificaciones", null);
        }
        Enlaces enlace = new Enlaces();
        enlace.setId_rol(cliente.getId_rol());
        List listaEnlaces = this.mi.getListarEnlaces(enlace);
        int fil = listaEnlaces.size();
        for (int i = 0; i < listaEnlaces.size(); i++) {
            TreeMenuEntity menues = new TreeMenuEntity();
            Enlaces aux = (Enlaces) listaEnlaces.get(i);
            menues.setIdObject(aux.getId_enlace());
            menues.setIdNivel(aux.getNivel());
            menues.setIdParent(aux.getId_enlace_padre());
            menues.setController(aux.getRuta());
            menues.setAction(aux.getImagen());
            menues.setNameModule(aux.getEnlace());
            enlaces.add(menues);
        }
        modelo.addAttribute("fil", GetMenus(TreeMenuEntity.GenerarMenu(enlaces)));
        modelo.addAttribute("listaEnlazces", String.valueOf(fil - 1));
        modelo.addAttribute("correo", cliente.getCorreo());
        modelo.addAttribute("celular", cliente.getCelular());
        modelo.addAttribute("cliente", (Clientes) request.getSession().getAttribute("__sess_cliente"));
        return "menu/Menu";
    }

    private String GetMenus(List<MenuEntity> menu) {
        String li = "";
        for (int i = 0; i < menu.size(); i++) {
            if (menu.get(i).getNivel() == 0 && menu.get(i).getMenus().isEmpty()) {
                li += "<li> <a class='app-menu__item active' href='#'> <i class='app-menu__icon fas fa-chart-network'></i><span class='app-menu__label'>" + menu.get(i).getModule() + "</span>";
            } else {
                if (menu.get(i).getNivel() == 0 && !menu.get(i).getMenus().isEmpty()) {
                    li += "<li class='treeview'> <a class='app-menu__item'  href='#' data-toggle='treeview' > <i class='app-menu__icon fab fa-wpforms'></i><span class='app-menu__label'>" + menu.get(i).getModule() + "</span><i class='treeview-indicator fa fa-angle-right'></i>";
                }
            }
            if (menu.get(i).getNivel() != 0 && !menu.get(i).getMenus().isEmpty()) {
                li += "<li> <a class='treeview-item'  href='#' data-url='." + menu.get(i).getController() + "'> <i class='icon fas fa-chevron-circle-right'></i>" + menu.get(i).getModule();
            } else {
                if (menu.get(i).getNivel() != 0 && menu.get(i).getMenus().isEmpty()) {
                    li += "<li> <a class='treeview-item' href='#' data-url='." + menu.get(i).getController() + "'> <i class='icon fas fa-chevron-circle-right'></i>" + menu.get(i).getModule();
                }
            }
            if (!menu.get(i).getMenus().isEmpty()) {
                li += "</a>";
                li += " <ul class='treeview-menu'>";
                li += GetMenus(menu.get(i).getMenus()) + "</ul></li>";
            } else {
                li += "</a></li>";
            }
        }
        return li.replaceAll(".NINGUNO", "");
    }

    @RequestMapping("/VerCuerpo.fautapo")
    public String VerCuerpo(ModelMap modelo) {
        String sId_rol, sVisita;
        Clientes cliente = this.GetUsuario();
        sId_rol = Integer.toString(cliente.getId_rol());
        modelo.addAttribute("snombre", cliente.getNombres());
        modelo.addAttribute("simagen", cliente.getImagen());
        if (sId_rol == null) {
            sVisita = "Si";
        } else {
            sVisita = "No";
        }
        modelo.addAttribute("sVisita", sVisita);
        //Listar Tableros 
        List lRolesNoticias = this.mi.getListarRolesNoticias();
        modelo.addAttribute("lRolesNoticias", lRolesNoticias);
        List lNoticias = this.mi.getListarNoticias();
        modelo.addAttribute("lNoticias", lNoticias);
        return "verCuerpo/VerCuerpo"; //enviar "modelo" a "menu.jsp"

    }
    
  /*  @RequestMapping("/verificarUsuario.fautapo")
     public String verificarUsuario(ModelMap modelo){
       
     }*/
    
}

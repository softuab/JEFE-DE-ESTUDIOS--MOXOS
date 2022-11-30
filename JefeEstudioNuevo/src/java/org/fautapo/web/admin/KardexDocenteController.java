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
import org.fautapo.domain.Libretas;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.Usuarios;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.util.ListViewItem;
import org.fautapo.util.Util;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class KardexDocenteController {

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

    @RequestMapping(value = "/EntradaProcesoDocumentacionDocentes.fautapo", method = RequestMethod.GET)
    public String handleRequest(HttpServletRequest request, Model modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("model", model);
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        return "AdministrarDocumentos/EntradaDocumentacion";
    }

    @RequestMapping(value = "/ListarProgramasPlanesDocumentacion.fautapo", method = RequestMethod.POST)
    public String listarFacultades(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, Model modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("model", model);
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            return "AdministrarDocumentos/EntradaDocumentacion";
        }
        int id_facultad = cliente.getId_facultad();
        //Sacamos el listado de las facultades
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        modelo.addAttribute("lFacultades", lFacultades);

        //Sacamos el listado de los programas
        List lProgramas = this.mi.getUnvListarProgramas(datosUniversidad);
        modelo.addAttribute("lProgramas", lProgramas);

        //Sacamos el listado de los planes
        List lPlanes = this.mi.getUnvListarPlanes(datosUniversidad);
        Accesos acceso = ((Accesos) request.getSession().getAttribute("__sess_acceso"));
        List<ListViewItem> listplanes = new ArrayList<>();
        for (Object plan : acceso.getListaPlanes()) {
            Planes f = (Planes) plan;
            listplanes.add(new ListViewItem(f.getId_plan(), f.getTipo_grado().toUpperCase() + " - " + f.getId_plan().toUpperCase()));
        }
        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        List<ListViewItem> listevaluaciones = new ArrayList<>();
        for (Object evaluacion : lTiposEvaluaciones) {
            Libretas f = (Libretas) evaluacion;
            listevaluaciones.add(new ListViewItem(String.valueOf(f.getId_tipo_evaluacion()), f.getTipo_evaluacion().toUpperCase()));
        }
        modelo.addAttribute("lPlanes", lPlanes);
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
        modelo.addAttribute("planes", Util.GetStructureList(listplanes, ""));
        modelo.addAttribute("evaluaciones", Util.GetStructureList(listevaluaciones, ""));
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        return "AdministrarDocumentos/ListarProgramasPlanes";
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.fautapo.web.dibRap;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Enlaces;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.ParametrosDipRapListarModel;
import org.fautapo.model.ParametrosDipRapModel;
import org.fautapo.service.EmailService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
public class DipRapController {

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

    @RequestMapping("/dibRap.fautapo")
    public String handleRequest(@ModelAttribute("model") ParametrosDipRapModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sId_tabla = model.getT();
        String sPermiso = model.getP();
        Abm tabla = new Abm();
        tabla.setId_tabla(Integer.parseInt(sId_tabla));
        tabla = this.mi.getBuscarTabla(tabla);
        if (tabla == null) {
            modelo.addAttribute("mensaje", "No existe esta dirección");
            return "Error";
        }
        String sId_enlace = model.getE();
        modelo.addAttribute("id_enlace", sId_enlace);
        modelo.addAttribute("tabla", tabla);
        modelo.addAttribute("cliente", cliente);
        if (sPermiso.indexOf("c") > -1) {
            return "dibRap/Entrada";
        }
        sPermiso = sPermiso + "&f=";
        if (null != model.getF()) {
            sPermiso = sPermiso + request.getParameter("f");
        }
        sPermiso = sPermiso + "&a=";
        if (null != model.getA()) {
            sPermiso = sPermiso + request.getParameter("a");
        }
        return "redirect:/dibRap/listarDatos.fautapo?t=" + sId_tabla + "&e=" + sId_enlace + "&p=" + sPermiso;
    }

    @RequestMapping(value = "/dibRap/listarDatos.fautapo", method = RequestMethod.GET)
    public String ListarDatos(@ModelAttribute("model") ParametrosDipRapListarModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);
        String sId_tabla = model.getT();   // id_tabla
        String sPermiso = model.getP();   // Permiso
        int sNro_pagina = model.getN(); // Paginacion
        String s_f = isNullOrBlank(request.getParameter("_f")) ? "" : request.getParameter("_f"); //
        String s_order = request.getParameter("_order"); //
        String s_order_ant = request.getParameter("_order_ant"); //

        String sCampo = request.getParameter("_campo");     //
        String sCondicion = isNullOrBlank(request.getParameter("_condicion")) ? "" : request.getParameter("_condicion"); // Condicion (filtro)
        String sFiltro = request.getParameter("_filtro");    //
        String sBotoncillo = request.getParameter("_botoncillo");
        String sId_enlace = model.getE(); // id_enlace

        Abm tabla = new Abm();
        tabla.setId_tabla(Integer.parseInt(sId_tabla));
        tabla = this.mi.getBuscarTabla(tabla);
        if (tabla == null) {
            modelo.addAttribute("mensaje", "No existe esta dirección");
            return "Error";
        }
        modelo.addAttribute("id_enlace", sId_enlace);
        modelo.addAttribute("permiso", sPermiso);

        if ((!"".equals(sFiltro)) && ("filtro".equals(sBotoncillo))) {
            if (" like ".equals(sCondicion)) {
                tabla.setCondicion("UPPER( " + sCampo + " )" + sCondicion + "UPPER('%" + sFiltro + "%')");
            } else {
                tabla.setCondicion("UPPER( " + sCampo + " )" + sCondicion + "UPPER('" + sFiltro + "')");
            }
        } else {
            tabla.setCondicion("");
        }
        //tabla.setCondicion((sFiltro == null)? "" : sFiltro);
        if ("todo".equals(sBotoncillo)) {
            s_f = "";
            sFiltro = "";
            sCampo = "";
            sCondicion = "";
        }
        if (!"".equals(s_f)) {
            if (!"".equals(tabla.getCondicion())) {
                tabla.setCondicion(" AND " + tabla.getCondicion());
            }
            tabla.setCondicion(s_f + tabla.getCondicion());
        }

        if (sNro_pagina == 0) {
            sNro_pagina = 1;
        }
        tabla.setPagina(sNro_pagina);

        tabla.setPermiso("l");
        List listaNombresCampos;
        List listaRegistros;
        String totalRegistros_Paginas[] = new String[3];

        String sId_actividad = model.getA();
        if (!"".equals(sId_actividad)) {  // Variable viene desde huaica
            tabla.setColumnas(Integer.parseInt(sId_actividad));  // columnas <- id_actividad
            listaNombresCampos = this.mi.getListarCamposTablaActividad(tabla);
            if (isNullOrBlank(s_order)) {
                s_order = ((Abm) listaNombresCampos.get(0)).getCampo();
            } else if (s_order.equals(s_order_ant)) {
                s_order = s_order + " DESC";
            }
            tabla.setCampo(s_order);
            listaRegistros = this.mi.getEjecutarListado3(tabla);
            modelo.addAttribute("id_actividad", sId_actividad);
        } else {  // dibRap clásico

            // Inicio Combustible
            //buscar enlace en "_dib_enl_campos"
            Enlaces enlace = new Enlaces();
            enlace.setId_enlace(Integer.parseInt(sId_enlace));
            enlace = this.mi.getEnlBuscarEnlace(enlace);
            if (enlace != null) {
                tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
                listaNombresCampos = this.mi.getEnlListarCamposTabla(tabla);
                if (isNullOrBlank(s_order)) {
                    s_order = ((Abm) listaNombresCampos.get(0)).getCampo();
                } else if (s_order.equals(s_order_ant)) {
                    s_order = s_order + " DESC";
                }
                tabla.setCampo(s_order);
                listaRegistros = this.mi.getEnlEjecutarListado(tabla);
            } // Fin Combustible
            else {
                totalRegistros_Paginas = this.mi.getDibContadorClasico(tabla).split("#~~#");
                listaNombresCampos = this.mi.getListarCamposTabla(tabla);
                if (isNullOrBlank(s_order)) {
                    s_order = ((Abm) listaNombresCampos.get(0)).getCampo();
                } else if (s_order.equals(s_order_ant)) {
                    s_order = s_order + " DESC";
                }
                tabla.setCampo(s_order);
                listaRegistros = this.mi.getEjecutarListado2(tabla);
            }
        }

        tabla.setPermiso("p");
        List listaLlavesPrimarias = this.mi.getListarCamposTabla(tabla);
        List listaValoresPrimarios = this.mi.getListarRegistros(tabla);
        modelo.addAttribute("listaValoresPrimarios", listaValoresPrimarios);

        modelo.addAttribute("totalRegistros", totalRegistros_Paginas[0]);
        modelo.addAttribute("totalPaginas", totalRegistros_Paginas[1]);
        modelo.addAttribute("paginacion", totalRegistros_Paginas[2]);
        modelo.addAttribute("listaNombresCampos", listaNombresCampos);
        modelo.addAttribute("listaRegistros", listaRegistros);
        modelo.addAttribute("nro_campos", Integer.toString(listaNombresCampos.size()));
        String matrizDatos[][] = new String[listaRegistros.size()][listaNombresCampos.size()];
        for (int j = 0; j < listaRegistros.size(); j++) {
            Abm fila = (Abm) listaRegistros.get(j);
            String campos[] = fila.getValores().split("#~~#");  // Separador de campos
            for (int i = 0; i < campos.length; i++) {
                matrizDatos[j][i] = campos[i];
            }
        }
        if ("0".equals(totalRegistros_Paginas[0])) {
            tabla.setCondicion("");
            sFiltro = "";
            sCampo = "";
            sCondicion = "";
        }
        modelo.addAttribute("tabla", tabla);
        modelo.addAttribute("filtro", sFiltro);
        modelo.addAttribute("campo", sCampo);
        modelo.addAttribute("condicion", sCondicion);
        modelo.addAttribute("matrizDatos", matrizDatos);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "dibRap/ListarDatos";
    }

    @RequestMapping(value = "/dibRap/listarDatos.fautapo", method = RequestMethod.POST)
    public String ListarDatos1(@ModelAttribute("model") ParametrosDipRapListarModel model, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        modelo.addAttribute("cliente", cliente);

        String sId_tabla = model.getT();   // id_tabla
        String sPermiso = model.getP();   // Permiso
        int sNro_pagina = model.getN(); // Paginacion
        String s_f = isNullOrBlank(request.getParameter("_f")) ? "" : request.getParameter("_f"); //
        String s_order = request.getParameter("_order"); //
        String s_order_ant = request.getParameter("_order_ant"); //

        String sCampo = request.getParameter("_campo");     //
        String sCondicion = isNullOrBlank(request.getParameter("_condicion")) ? "" : request.getParameter("_condicion"); // Condicion (filtro)
        String sFiltro = request.getParameter("_filtro");    //
        String sBotoncillo = request.getParameter("_botoncillo");
        String sId_enlace = model.getE(); // id_enlace

        Abm tabla = new Abm();
        tabla.setId_tabla(Integer.parseInt(sId_tabla));
        tabla = this.mi.getBuscarTabla(tabla);
        if (tabla == null) {
            modelo.addAttribute("mensaje", "No existe esta dirección");
            return "Error";
        }
        modelo.addAttribute("id_enlace", sId_enlace);
        modelo.addAttribute("permiso", sPermiso);

        if ((!"".equals(sFiltro)) && ("filtro".equals(sBotoncillo))) {
            if (" like ".equals(sCondicion)) {
                tabla.setCondicion("UPPER( " + sCampo + " )" + sCondicion + "UPPER('%" + sFiltro + "%')");
            } else {
                tabla.setCondicion("UPPER( " + sCampo + " )" + sCondicion + "UPPER('" + sFiltro + "')");
            }
        } else {
            tabla.setCondicion("");
        }
        //tabla.setCondicion((sFiltro == null)? "" : sFiltro);
        if ("todo".equals(sBotoncillo)) {
            s_f = "";
            sFiltro = "";
            sCampo = "";
            sCondicion = "";
        }
        if (!"".equals(s_f)) {
            if (!"".equals(tabla.getCondicion())) {
                tabla.setCondicion(" AND " + tabla.getCondicion());
            }
            tabla.setCondicion(s_f + tabla.getCondicion());
        }

        if (sNro_pagina == 0) {
            sNro_pagina = 1;
        }
        tabla.setPagina(sNro_pagina);

        tabla.setPermiso("l");
        List listaNombresCampos;
        List listaRegistros;
        String totalRegistros_Paginas[] = new String[3];

        String sId_actividad = model.getA();
        if (!"".equals(sId_actividad)) {  // Variable viene desde huaica
            tabla.setColumnas(Integer.parseInt(sId_actividad));  // columnas <- id_actividad
            listaNombresCampos = this.mi.getListarCamposTablaActividad(tabla);
            if (isNullOrBlank(s_order)) {
                s_order = ((Abm) listaNombresCampos.get(0)).getCampo();
            } else if (s_order.equals(s_order_ant)) {
                s_order = s_order + " DESC";
            }
            tabla.setCampo(s_order);
            listaRegistros = this.mi.getEjecutarListado3(tabla);
            modelo.addAttribute("id_actividad", sId_actividad);
        } else {  // dibRap clásico

            // Inicio Combustible
            //buscar enlace en "_dib_enl_campos"
            Enlaces enlace = new Enlaces();
            enlace.setId_enlace(Integer.parseInt(sId_enlace));
            enlace = this.mi.getEnlBuscarEnlace(enlace);
            if (enlace != null) {
                tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
                listaNombresCampos = this.mi.getEnlListarCamposTabla(tabla);
                if (isNullOrBlank(s_order)) {
                    s_order = ((Abm) listaNombresCampos.get(0)).getCampo();
                } else if (s_order.equals(s_order_ant)) {
                    s_order = s_order + " DESC";
                }
                tabla.setCampo(s_order);
                listaRegistros = this.mi.getEnlEjecutarListado(tabla);
            } // Fin Combustible
            else {
                totalRegistros_Paginas = this.mi.getDibContadorClasico(tabla).split("#~~#");
                listaNombresCampos = this.mi.getListarCamposTabla(tabla);
                if (isNullOrBlank(s_order)) {
                    s_order = ((Abm) listaNombresCampos.get(0)).getCampo();
                } else if (s_order.equals(s_order_ant)) {
                    s_order = s_order + " DESC";
                }
                tabla.setCampo(s_order);
                listaRegistros = this.mi.getEjecutarListado2(tabla);
            }
        }

        tabla.setPermiso("p");
        List listaLlavesPrimarias = this.mi.getListarCamposTabla(tabla);
        List listaValoresPrimarios = this.mi.getListarRegistros(tabla);
        modelo.addAttribute("listaValoresPrimarios", listaValoresPrimarios);

        modelo.addAttribute("totalRegistros", totalRegistros_Paginas[0]);
        modelo.addAttribute("totalPaginas", totalRegistros_Paginas[1]);
        modelo.addAttribute("paginacion", totalRegistros_Paginas[2]);
        modelo.addAttribute("listaNombresCampos", listaNombresCampos);
        modelo.addAttribute("listaRegistros", listaRegistros);
        modelo.addAttribute("nro_campos", Integer.toString(listaNombresCampos.size()));
        String matrizDatos[][] = new String[listaRegistros.size()][listaNombresCampos.size()];
        for (int j = 0; j < listaRegistros.size(); j++) {
            Abm fila = (Abm) listaRegistros.get(j);
            String campos[] = fila.getValores().split("#~~#");  // Separador de campos
            for (int i = 0; i < campos.length; i++) {
                matrizDatos[j][i] = campos[i];
            }
        }
        if ("0".equals(totalRegistros_Paginas[0])) {
            tabla.setCondicion("");
            sFiltro = "";
            sCampo = "";
            sCondicion = "";
        }
        modelo.addAttribute("tabla", tabla);
        modelo.addAttribute("filtro", sFiltro);
        modelo.addAttribute("campo", sCampo);
        modelo.addAttribute("condicion", sCondicion);
        modelo.addAttribute("matrizDatos", matrizDatos);
        modelo.addAttribute("usuario", cliente.getNombres());
        return "dibRap/ListarDatos";
    }

    @RequestMapping(value = "/dibRap/nuevoRegistro.fautapo", method = RequestMethod.POST)
    public String NuevoRegistro(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        String sId_enlace = request.getParameter("e");
        modelo.addAttribute("id_enlace", sId_enlace);
        String sPermiso = request.getParameter("p"); // Permiso
        modelo.addAttribute("permiso", sPermiso);
        String sFiltro = request.getParameter("f"); // Condicion (filtro)
        modelo.addAttribute("condicion", sFiltro);
        int iId_tabla = Integer.parseInt(request.getParameter("t"));
        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        if (tabla == null) {
            modelo.addAttribute("mensaje", "No existe esta dirección");
            return "Error";
        }
        modelo.addAttribute("tabla", tabla);
        tabla.setPermiso("a");
        List listaCampos = null;
        // Inicio Combustible
        //buscar enlace en "_dib_enl_campos"
        Enlaces enlace = new Enlaces();
        enlace.setId_enlace(Integer.parseInt(sId_enlace));
        enlace = this.mi.getEnlBuscarEnlace(enlace);
        if (enlace != null) {
            tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
            listaCampos = this.mi.getEnlListarCamposTabla(tabla);
        } // Fin Combustible
        else {
            listaCampos = this.mi.getListarCamposTabla(tabla);
        }

        if (listaCampos.size() == 0) {
            modelo.addAttribute("mensaje", "La relación '" + tabla.getTabla() + "' no permite agregar datos");
            return "Error";
        }
        String sObligatorios = "";
        for (int i = 0; i < listaCampos.size(); i++) {
            Abm aux = (Abm) listaCampos.get(i);
            if (aux.getPermiso().indexOf("o") > -1) {
                aux.setPermiso("o");
                sObligatorios = sObligatorios + ";" + aux.getCampo();
            } else {
                aux.setPermiso("");
            }
            Abm foranea = (Abm) this.mi.getBuscarForanea(aux);
            if (foranea != null) {
                if ("".equals(aux.getCampo_padre())) {
                    aux.setCampo_padre("''");
                }
                aux.setCondicion(foranea.getCondicion());
//        foranea.setCondicion(("".equals(sFiltro))? foranea.getCondicion() : sFiltro);
                foranea.setCampo(foranea.getId_campo_foraneo() + "#~~#" + foranea.getCampo_foraneo() + "#~~#" + aux.getCampo_padre());
                try {
                    aux.setCombo(this.mi.getListarCombos(foranea));
                } catch (Exception e) {
                    foranea.setCondicion(aux.getCondicion());
                    aux.setCombo(this.mi.getListarCombos(foranea));
                }
            }
            aux.setPagina(1);
            listaCampos.set(i, aux);
        }
        if (!"".equals(sObligatorios)) {
            modelo.addAttribute("obligatorios", sObligatorios.substring(1));
        }
        modelo.addAttribute("listaCampos", listaCampos);
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));
        modelo.addAttribute("usuario", cliente.getNombres());

        return "dibRap/NuevoRegistro";
    }

    public static boolean isNullOrBlank(String param) {
        return param == null || param.trim().length() == 0;
    }

    @RequestMapping(value = "/cambioPinEstudiante/entrada.fautapo", method = RequestMethod.GET)
    public String cambioPinEstudiante(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        //Sacamos los datos de la session

        String sNombres = cliente.getNombres();
        int iGestion = cliente.getGestion();
        int iPeriodo = cliente.getPeriodo();
        int iId_estudiante = cliente.getId_usuario();
        int iId_rol = cliente.getId_rol();
        String sMensaje = "";
        String sClave = request.getParameter("clave" + request.getParameter("hora"));
        System.out.println("sClave-------->  " + sClave);
        String sBandera = request.getParameter("bandera");

        modelo.addAttribute("nombres", sNombres);
        modelo.addAttribute("gestion", Integer.toString(iGestion));
        modelo.addAttribute("periodo", Integer.toString(iPeriodo));

        if (("".equals(sClave)) || (sClave == null)) {
            return "cambioPinEstudiante/estudiante/Entrada";
        }

        Estudiantes datosMatricula = new Estudiantes();
        datosMatricula.setId_estudiante(iId_estudiante);
        datosMatricula.setGestion(iGestion);
        datosMatricula.setPeriodo(iPeriodo);
        Estudiantes buscarMatricula = this.mi.getMtrBuscarMatricula(datosMatricula);
        if (buscarMatricula == null) {
            modelo.addAttribute("mensaje", "No esta matriculado para el periodo acad&eacute;mico" + Integer.toString(iPeriodo) + "/" + Integer.toString(iGestion));
            return "Aviso";
        }

        String sClaveEstudiante = buscarMatricula.getClave();
        System.out.println("LA clave del estudiante -->" + sClaveEstudiante);

        /*if ("".equals(request.getParameter("bandera")) || (request.getParameter("bandera") == null)) {
      if (!sClave.equals(sClaveEstudiante)) {
        sMensaje = "Clave incorrecta";
        modelo.addAttribute("mensaje",sMensaje);
        return new ModelAndView("Error",modelo);
      }
         */
        //Comprobamos la entrada
        Estudiantes datosEstudiante = new Estudiantes();
        datosEstudiante.setId_estudiante(iId_estudiante);
        datosEstudiante.setClave(sClave);
        Estudiantes datosClave = this.mi.getComprobarEstudiante(datosEstudiante);
        if (datosClave == null) {
            sMensaje = "El Estudiante no tiene acceso para la gestion academica " + Integer.toString(iPeriodo) + "/" + Integer.toString(iGestion);
            modelo.addAttribute("mensaje", sMensaje);
            return "cambioPinEstudiante/estudiante/Aviso";
        }

        datosEstudiante = this.mi.getEstBuscarEstudiantePrs(datosEstudiante);

        modelo.addAttribute("datosEstudiante", datosEstudiante);
        modelo.addAttribute("id_estudiante", Integer.toString(iId_estudiante));
        return "cambioPinEstudiante/estudiante/Recomendaciones";
    }

    @RequestMapping(value = "/dibRap/modificaRegistro.fautapo", method = RequestMethod.POST)
    public String ModificaRegistro(ModelMap modelo) {
        int iId_tabla = Integer.parseInt(request.getParameter("t")); //id_tabla
        String sValoresPrimarios = request.getParameter("c"); //Llave Primaria
        String sPermiso = request.getParameter("p"); // Permiso
        String sFiltro = request.getParameter("f"); // Condicion (filtro)

        modelo.addAttribute("id_enlace", request.getParameter("e"));
        modelo.addAttribute("permiso", sPermiso);
        modelo.addAttribute("condicion", sFiltro);
        //LA TABLA A USARSE
        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        modelo.addAttribute("tabla", tabla);
        tabla.setPermiso("p");
        List listaLlavesPrimarias = this.mi.getListarCamposTabla(tabla);
        String vValoresPrimarios[] = sValoresPrimarios.split("#~~#");
        String sCondicion = "";
        for (int i = 0; i < listaLlavesPrimarias.size(); i++) {
            Abm campo = (Abm) listaLlavesPrimarias.get(i);
            sCondicion = sCondicion + campo.getCampo() + " = '" + vValoresPrimarios[i] + "' AND ";
        }
        tabla.setCondicion(sCondicion.substring(0, sCondicion.length() - 4));
        tabla.setCampo("");

        List listaCampos = null;
        List listaRegistros = null;
        String sId_actividad = request.getParameter("a");
        //PERMISO PARA SACAR CAMPOS DE MODIFICACION
        tabla.setPermiso("lm");
        if (!"".equals(sId_actividad)) {  // Variable viene desde huaica
            tabla.setColumnas(Integer.parseInt(sId_actividad));  // columnas <- id_actividad
            listaCampos = this.mi.getListarCamposTablaActividad(tabla);
            listaRegistros = this.mi.getListarRegistrosActividad(tabla);
            modelo.addAttribute("id_actividad", sId_actividad);
        } else {  // dibRap clásico
            // Inicio Combustible
            //buscar enlace en "_dib_enl_campos"
            Enlaces enlace = new Enlaces();
            enlace.setId_enlace(Integer.parseInt(request.getParameter("e")));
            enlace = this.mi.getEnlBuscarEnlace(enlace);
            if (enlace != null) {
                tabla.setColumnas(enlace.getId_enlace());  // columnas <- id_enlace
                listaCampos = this.mi.getEnlListarCamposTabla(tabla);
                listaRegistros = this.mi.getEnlListarRegistros(tabla);
            } // Fin Combustible
            else {
                //tabla.setPermiso("m");
                listaCampos = this.mi.getListarCamposTabla(tabla);
                listaRegistros = this.mi.getListarRegistros(tabla);
            }
        }

        modelo.addAttribute("listaCampos", listaCampos);
        Abm fila = (Abm) listaRegistros.get(0);

        fila.setValores(fila.getValores().replace("\\\"", "\""));
        fila.setValores(fila.getValores().replace("\\'", "'"));
        String matrizDatos[] = fila.getValores().split("#~~#");
        modelo.addAttribute("matrizDatos", matrizDatos);
        String sObligatorios = "";
        for (int i = 0; i < listaCampos.size(); i++) {
            Abm aux = (Abm) listaCampos.get(i);
            if (aux.getPermiso().indexOf("o") > -1) {
                sObligatorios = sObligatorios + ";" + aux.getCampo();
            }
            //aux.setValores(matrizDatos[i]);
            Abm foranea = this.mi.getBuscarForanea(aux);
            if (foranea != null) {
                if ("".equals(aux.getCampo_padre())) {
                    aux.setCampo_padre("''");
                }
                aux.setCondicion(foranea.getCondicion());
                if (aux.getPermiso().indexOf("m") == -1) {
                    foranea.setCondicion(foranea.getId_campo_foraneo() + " = '" + matrizDatos[i] + "'");
//	} else {
//          foranea.setCondicion(("".equals(sFiltro))? foranea.getCondicion() : sFiltro);
                }
                foranea.setCampo(foranea.getId_campo_foraneo() + "#~~#" + foranea.getCampo_foraneo() + "#~~#" + aux.getCampo_padre());
                try {
                    aux.setCombo(this.mi.getListarCombos(foranea));
                } catch (Exception e) {
                    foranea.setCondicion(aux.getCondicion());
                    aux.setCombo(this.mi.getListarCombos(foranea));
                }
            }
            listaCampos.set(i, aux);
        }
        modelo.addAttribute("listaCampos", listaCampos);
        modelo.addAttribute("valoresPrimarios", sValoresPrimarios);
        Abm formatoFecha = new Abm();
        formatoFecha.setCampo("formato_fecha");
        formatoFecha.setCodigo("dibrap");
        modelo.addAttribute("formatoFecha", this.mi.getDibBuscarParametro(formatoFecha));

        if (!"".equals(sObligatorios)) {
            modelo.addAttribute("obligatorios", sObligatorios.substring(1));
        }
        modelo.addAttribute("usuario", this.GetUsuario().getNombres());
        return "dibRap/ModificaRegistro";
    }

    @RequestMapping(value = "/dibRap/confirmarNuevo.fautapo", method = RequestMethod.POST)
    public String confirmarNuevo(ModelMap modelo) {
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        String sId_enlace = request.getParameter("e");
        modelo.addAttribute("id_enlace", sId_enlace);
        String sPermiso = request.getParameter("p"); // Permiso
        modelo.addAttribute("permiso", sPermiso);
        String sFiltro = request.getParameter("f"); // Condicion (filtro)
        modelo.addAttribute("condicion", sFiltro);
        int iId_tabla = Integer.parseInt(request.getParameter("t"));
        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        modelo.addAttribute("tabla", tabla);
        tabla.setPermiso("a");
        List listaCampos = null;
        // Inicio Combustible
        //buscar enlace en "_dib_enl_campos"
        Enlaces enlace = new Enlaces();
        enlace.setId_enlace(Integer.parseInt(sId_enlace));
        enlace = this.mi.getEnlBuscarEnlace(enlace);
        if (enlace != null) {
            tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
            listaCampos = this.mi.getEnlListarCamposTabla(tabla);
        } // Fin Combustible
        else {
            listaCampos = this.mi.getListarCamposTabla(tabla);
        }

        for (int i = 0; i < listaCampos.size(); i++) {
            Abm abm = (Abm) listaCampos.get(i);
            if (!"".equals(request.getParameter(abm.getCampo()))) {
                abm.setValores(request.getParameter(abm.getCampo()).replace("\\\"", "\""));
                abm.setValores(abm.getValores().replace("\\'", "'"));
            } else {
                abm.setValores("<NULL>");
            }
            if ((Abm) this.mi.getBuscarForanea(abm) != null) {
                abm.setCombo(listaCampos);
                String id = request.getParameter(abm.getCampo());
                abm.setDetalle(request.getParameter(abm.getCampo() + id).replace("\\\"", "\""));
                abm.setDetalle(abm.getDetalle().replace("\\'", "'"));
            }
            listaCampos.set(i, abm);
        }
        modelo.addAttribute("listaCampos", listaCampos);
        modelo.addAttribute("usuario", this.GetUsuario().getNombres());
        return "dibRap/ConfirmarNuevo";
    }

    @RequestMapping(value = "/dibRap/confirmarBorrado.fautapo", method = RequestMethod.POST)
    public String ConfirmarBorrado(ModelMap modelo) {
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        int iId_tabla = Integer.parseInt(request.getParameter("t"));
        String sId_enlace = request.getParameter("e");
        modelo.addAttribute("id_enlace", sId_enlace);
        String sPermiso = request.getParameter("p"); // Permiso
        modelo.addAttribute("permiso", sPermiso);
        String sFiltro = request.getParameter("f"); // Condicion (filtro)
        modelo.addAttribute("condicion", sFiltro);
        String sValoresPrimarios = request.getParameter("c");
        modelo.addAttribute("valoresPrimarios", sValoresPrimarios);
        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        modelo.addAttribute("tabla", tabla);
        tabla.setPermiso("p");
        List listaLlavesPrimarias = this.mi.getListarCamposTabla(tabla);
        String vValoresPrimarios[] = sValoresPrimarios.split("#~~#");
        String sCondicion = "";
        for (int i = 0; i < listaLlavesPrimarias.size(); i++) {
            Abm campo = (Abm) listaLlavesPrimarias.get(i);
            sCondicion = sCondicion + campo.getCampo() + " = '" + vValoresPrimarios[i] + "' AND ";
        }
        tabla.setCondicion(sCondicion.substring(0, sCondicion.length() - 4));
        //PERMISO PARA SACAR CAMPOS DE LISTADO
        tabla.setPermiso("l");
        tabla.setCampo("");
        List listaCampos;
        List listaRegistros;

        String sId_actividad = request.getParameter("a");
        if (!"".equals(sId_actividad)) {  // Variable viene desde huaica
            tabla.setColumnas(Integer.parseInt(sId_actividad));  // columnas <- id_actividad
            listaCampos = this.mi.getListarCamposTablaActividad(tabla);
            listaRegistros = this.mi.getListarRegistrosActividad(tabla);
            modelo.addAttribute("id_actividad", sId_actividad);
        } else {  // dibRap clásico
            // Inicio Combustible
            //buscar enlace en "_dib_enl_campos"
            Enlaces enlace = new Enlaces();
            enlace.setId_enlace(Integer.parseInt(sId_enlace));
            enlace = this.mi.getEnlBuscarEnlace(enlace);
            if (enlace != null) {
                tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
                listaCampos = this.mi.getEnlListarCamposTabla(tabla);
                listaRegistros = this.mi.getEnlListarRegistros(tabla);
            } // Fin Combustible
            else {
                listaCampos = this.mi.getListarCamposTabla(tabla);
                listaRegistros = this.mi.getListarRegistros(tabla);
            }
        }

        modelo.addAttribute("listaCampos", listaCampos);
        Abm fila = (Abm) listaRegistros.get(0);
        fila.setValores(fila.getValores().replace("\\\"", "\""));
        fila.setValores(fila.getValores().replace("\\'", "'"));
        String matrizDatos[] = fila.getValores().split("#~~#");
        for (int i = 0; i < listaCampos.size(); i++) {
            Abm foranea = (Abm) listaCampos.get(i);
            foranea = (Abm) this.mi.getBuscarForanea(foranea);
            if (foranea != null) {
                foranea.setTabla(foranea.getTabla_foranea());
                foranea.setCampo_padre(foranea.getId_campo_foraneo());
                String tipo_dato = ((Abm) this.mi.getBuscarCampoTabla(foranea)).getTipo_dato();
                foranea.setCondicion(foranea.getId_campo_foraneo() + " = '" + matrizDatos[i] + "'");
                foranea.setCampo(foranea.getId_campo_foraneo() + "#~~#" + foranea.getCampo_foraneo() + "#~~#''");
                foranea = (Abm) (this.mi.getListarCombos(foranea)).get(1);
                foranea.setCampo(foranea.getCampo().replace("\\\"", "\""));
                matrizDatos[i] = foranea.getCampo().replace("\\'", "'");
            }
        }
        modelo.addAttribute("matrizDatos", matrizDatos);
        modelo.addAttribute("usuario", this.GetUsuario().getNombres());
        return "dibRap/ConfirmarBorrado";
    }

    @RequestMapping(value = "/dibRap/registrarBorrado.fautapo", method = RequestMethod.POST)
    public String registrarBorrado(ModelMap modelo) {
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        String sId_enlace = request.getParameter("e");
        modelo.put("id_enlace", sId_enlace);
        String sPermiso = request.getParameter("p"); // Permiso
        modelo.put("permiso", sPermiso);
        String sFiltro = request.getParameter("f"); // Condicion (filtro)
        modelo.put("condicion", sFiltro);
        int iId_tabla = Integer.parseInt(request.getParameter("t"));
        String sValoresPrimarios = request.getParameter("c");

        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        modelo.put("tabla", tabla);

        // Contar DEPENDIENTES
        tabla.setCondicion(sValoresPrimarios);
        if (this.mi.getContarDependientes(tabla) > 0) {
            modelo.addAttribute("mensaje", "No se puede eliminar este registro, porque existen otros que dependen de él");
            return "Error";
        }

        String sql = "UPDATE " + tabla.getTabla() + " SET id_estado = 'X', ult_usuario = " + cliente.getId_usuario() + " WHERE ";
        tabla.setPermiso("p");
        List listaLlavesPrimarias = this.mi.getListarCamposTabla(tabla);
        String vValoresPrimarios[] = sValoresPrimarios.split("#~~#");
        for (int i = 0; i < listaLlavesPrimarias.size(); i++) {
            Abm campo = (Abm) listaLlavesPrimarias.get(i);
            //sql = sql + campo.getCampo() + " = '" + vValoresPrimarios[i] + "'::" + campo.getTipo_dato() + " AND ";
            sql = sql + campo.getCampo() + " = " + (campo.getTipo_dato().indexOf("fecha") > -1 ? "_cadena_fecha('" : "'") + vValoresPrimarios[i] + (campo.getTipo_dato().indexOf("fecha") > -1 ? "')" : "'::" + campo.getTipo_dato()) + " AND ";
        }
        sql = sql.substring(0, sql.length() - 4);
        tabla.setSql(sql);
        try {
            this.mi.setEjecutarConsulta(tabla);
            modelo.put("mensaje", "La transacción se registró correctamente");
        } catch (Exception e) {
            // No es lo adecuado, pero suma
            String mensajes[] = ((String[]) (e.getCause().getMessage().split("SQLException: ERROR: ")))[1].split("Detail:");

            System.out.println("dibRap - " + mensajes[0]);
            //String problema = "Hubo un error al realizar la transacción en la relación '" + tabla.getTabla() + "'.<br/><br/>" + mensajes[0];
            String problema = mensajes[0];
            if (mensajes.length > 1) {
                System.out.println("dibRap - DETALLE:" + mensajes[1]);
                problema += "<br> DETALLE:" + mensajes[1] + "<hr/>SQL='" + sql + "'";
            }
            modelo.addAttribute("mensaje", problema);
            return "Error";
        }
        return "dibRap/Aviso";
    }

    @RequestMapping(value = "/dibRap/registrarNuevo.fautapo", method = RequestMethod.POST)
    public String registrarNuevo(ModelMap modelo) {
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        String sId_enlace = request.getParameter("e");
        modelo.put("id_enlace", sId_enlace);
        String sPermiso = request.getParameter("p"); // Permiso
        modelo.put("permiso", sPermiso);
        String sFiltro = request.getParameter("f"); // Condicion (filtro)
        modelo.put("condicion", sFiltro);
        int iId_tabla = Integer.parseInt(request.getParameter("t"));
        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        modelo.put("tabla", tabla);
        tabla.setPermiso("a");
        List listaCampos = null;
        // Inicio Combustible
        //buscar enlace en "_dib_enl_campos"
        Enlaces enlace = new Enlaces();
        enlace.setId_enlace(Integer.parseInt(sId_enlace));
        enlace = this.mi.getEnlBuscarEnlace(enlace);
        if (enlace != null) {
            tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
            listaCampos = this.mi.getEnlListarCamposTabla(tabla);
        } // Fin Combustible
        else {
            listaCampos = this.mi.getListarCamposTabla(tabla);
        }

        String sql = "INSERT INTO " + tabla.getTabla() + "(";
        String campos = "";
        String valores = "";
        for (int i = 0; i < listaCampos.size(); i++) {
            Abm abm = (Abm) listaCampos.get(i);
            if (!"<NULL>".equals(request.getParameter(abm.getCampo()))) {
                campos = campos + abm.getCampo() + ", ";
                valores = valores + (abm.getTipo_dato().indexOf("fecha") > -1 ? "_cadena_fecha('" : "'") + request.getParameter(abm.getCampo()) + (abm.getTipo_dato().indexOf("fecha") > -1 ? "')" : "'::" + abm.getTipo_dato()) + ", ";
            }
        }
        sql = sql + campos + "ult_usuario) values(";
        sql = sql + valores + cliente.getId_usuario() + ");";

        tabla.setSql(sql);
        try {
            this.mi.setEjecutarConsulta(tabla);
            modelo.put("mensaje", "Los datos se registraron correctamente");
        } catch (Exception e) {
            // No es lo adecuado, pero suma
            String mensajes[] = ((String[]) (e.getCause().getMessage().split("SQLException: ERROR: ")))[1].split("Detail:");

            System.out.println("dibRap - " + mensajes[0]);
            //String problema = "Hubo un error al realizar la transacción en la relación '" + tabla.getTabla() + "'.<br/><br/>" + mensajes[0];
            String problema = mensajes[0];
            if (mensajes.length > 1) {
                System.out.println("dibRap - DETALLE:" + mensajes[1]);
                problema += "<br> DETALLE:" + mensajes[1] + "<hr/>SQL='" + sql + "'";
            }
            modelo.addAttribute("mensaje", problema);
            return "Error";
        }
        return "dibRap/Aviso";
    }

    @RequestMapping(value = "/usuarios/entrada.fautapo", method = RequestMethod.GET)
    public String Usuarios(ModelMap modelo) {

        //Sacamos los datos de la session
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        if (cliente == null) {
            modelo.addAttribute("mensaje", "Su sesion ha terminado. Vuelva a la pagina inicial e ingrese de nuevo.");
            return "Aviso";
        }
        return "administrarUsuarios/Entrada";
    }

    @RequestMapping(value = "/dibRap/confirmarModificacion.fautapo", method = RequestMethod.POST)
    public String ConfirmarModificacion(ModelMap modelo) {
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        String sPermiso = request.getParameter("p");
        String sId_enlace = request.getParameter("e");
        modelo.put("id_enlace", sId_enlace);
        modelo.put("permiso", sPermiso);
        String sFiltro = request.getParameter("f"); // Condicion (filtro)
        modelo.put("condicion", sFiltro);
        int iId_tabla = Integer.parseInt(request.getParameter("t"));
        String sValoresPrimarios = request.getParameter("c");
        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        modelo.put("tabla", tabla);

        List listaCampos;
        String sId_actividad = request.getParameter("a");
        tabla.setPermiso("lm");
        if (!"".equals(sId_actividad)) {  // Variable viene desde huaica
            tabla.setColumnas(Integer.parseInt(sId_actividad));  // columnas <- id_actividad
            listaCampos = this.mi.getListarCamposTablaActividad(tabla);
            modelo.put("id_actividad", sId_actividad);
        } else {  // dibRap clásico
            // Inicio Combustible
            //buscar enlace en "_dib_enl_campos"
            Enlaces enlace = new Enlaces();
            enlace.setId_enlace(Integer.parseInt(sId_enlace));
            enlace = this.mi.getEnlBuscarEnlace(enlace);
            if (enlace != null) {
                tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
                listaCampos = this.mi.getEnlListarCamposTabla(tabla);
            } // Fin Combustible
            else {
                tabla.setPermiso("m");
                listaCampos = this.mi.getListarCamposTabla(tabla);
            }
        }

        for (int i = 0; i < listaCampos.size(); i++) {
            Abm abm = (Abm) listaCampos.get(i);
            abm.setValores(request.getParameter(abm.getCampo()).replace("\\\"", "\""));
            abm.setValores(abm.getValores().replace("\\'", "'"));
            if ((Abm) this.mi.getBuscarForanea(abm) != null) {
                abm.setCombo(listaCampos);
                String id = request.getParameter(abm.getCampo());
                if (abm.getPermiso().indexOf("m") == -1) {
                    abm.setDetalle(request.getParameter(abm.getCampo()));
                } else {
                    abm.setDetalle(request.getParameter(abm.getCampo() + id).replace("\\\"", "\""));
                    abm.setDetalle(abm.getDetalle().replace("\\'", "'"));
                }
            }
            listaCampos.set(i, abm);
        }
        modelo.put("valoresPrimarios", sValoresPrimarios);
        modelo.put("listaCampos", listaCampos);
        return "dibRap/ConfirmarModificacion";
    }

    @RequestMapping(value = "/dibRap/registrarModificacion.fautapo", method = RequestMethod.POST)
    public String RegistrarModificacion(ModelMap modelo) {
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        String sId_enlace = request.getParameter("e");
        String sPermiso = request.getParameter("p");
        modelo.put("id_enlace", sId_enlace);
        modelo.put("permiso", sPermiso);
        String sFiltro = request.getParameter("f"); // Condicion (filtro)
        modelo.put("condicion", sFiltro);
        int iId_tabla = Integer.parseInt(request.getParameter("t"));
        String sValoresPrimarios = request.getParameter("c");

        Abm tabla = new Abm();
        tabla.setId_tabla(iId_tabla);
        tabla = this.mi.getBuscarTabla(tabla);
        modelo.put("tabla", tabla);

        List listaCampos;
        tabla.setPermiso("m");
        String sId_actividad = request.getParameter("a");
        if (!"".equals(sId_actividad)) {  // Variable viene desde huaica
            tabla.setColumnas(Integer.parseInt(sId_actividad));  // columnas <- id_actividad
            listaCampos = this.mi.getListarCamposTablaActividad(tabla);
            modelo.put("id_actividad", sId_actividad);
        } else {  // dibRap clásico
            // Inicio Combustible
            //buscar enlace en "_dib_enl_campos"
            Enlaces enlace = new Enlaces();
            enlace.setId_enlace(Integer.parseInt(sId_enlace));
            enlace = this.mi.getEnlBuscarEnlace(enlace);
            if (enlace != null) {
                tabla.setColumnas(Integer.parseInt(sId_enlace));  // columnas <- id_enlace
                listaCampos = this.mi.getEnlListarCamposTabla(tabla);
            } // Fin Combustible
            else {
                listaCampos = this.mi.getListarCamposTabla(tabla);
            }
        }

        modelo.put("listaCampos", listaCampos);
        String sql = "UPDATE " + tabla.getTabla() + " SET ";
        for (int i = 0; i < listaCampos.size(); i++) {
            Abm campo = (Abm) listaCampos.get(i);
            sql = sql + campo.getCampo() + " = " + (campo.getTipo_dato().indexOf("fecha") > -1 ? "_cadena_fecha('" : "'") + request.getParameter(campo.getCampo()).replace("'", "''") + (campo.getTipo_dato().indexOf("fecha") > -1 ? "')" : "'::" + campo.getTipo_dato()) + ", ";
        }
        sql = sql + "ult_usuario = " + cliente.getId_usuario() + " WHERE id_estado = 'A'";
        tabla.setPermiso("p");
        List listaLlavesPrimarias = this.mi.getListarCamposTabla(tabla);
        //modelo.put("listaLlavesPrimarias", listaLlavesPrimarias);
        String vValoresPrimarios[] = sValoresPrimarios.split("#~~#");
        for (int i = 0; i < listaLlavesPrimarias.size(); i++) {
            Abm campo = (Abm) listaLlavesPrimarias.get(i);
//          foranea.setCondicion(("".equals(sFiltro))? foranea.getCondicion() : sFiltro);
            sql = sql + " AND " + campo.getCampo() + " = " + (campo.getTipo_dato().indexOf("fecha") > -1 ? "_cadena_fecha('" : "'") + vValoresPrimarios[i] + (campo.getTipo_dato().indexOf("fecha") > -1 ? "')" : "'::" + campo.getTipo_dato());
        }
        tabla.setSql(sql);

        System.out.println("DIB - SQL: " + sql);

        try {
            this.mi.setEjecutarConsulta(tabla);
            modelo.put("mensaje", "Los datos se registraron correctamente");
        } catch (Exception e) {
            // No es lo adecuado, pero suma
            String mensajes[] = ((String[]) (e.getCause().getMessage().split("SQLException: ERROR: ")))[1].split("Detail:");

            System.out.println("dibRap - " + mensajes[0]);
            //String problema = "Hubo un error al realizar la transacción en la relación '" + tabla.getTabla() + "'.<br/><br/>" + mensajes[0];
            String problema = mensajes[0];
            if (mensajes.length > 1) {
                System.out.println("dibRap - DETALLE:" + mensajes[1]);
                problema += "<br> DETALLE:" + mensajes[1] + "<hr/>SQL='" + sql + "'";
            }
            modelo.addAttribute("mensaje", problema);
            return "Error";
        }
        return "dibRap/Aviso";
    }
}

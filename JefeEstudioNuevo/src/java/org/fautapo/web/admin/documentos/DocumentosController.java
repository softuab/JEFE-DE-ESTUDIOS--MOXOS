/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin.documentos;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.PersonaKardex;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.ParametrosDocumentosEntrada;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.programa.ArchivosModel;
import org.fautapo.model.programa.MessageResultProgramaModel;
import org.fautapo.model.programa.ParametroBusquedaDocenteModel;
import org.fautapo.model.programa.ProgramaItem;
import org.fautapo.util.Convert;
import static org.fautapo.util.Directorio.DIRECTORIO_CARNET;
import static org.fautapo.util.Directorio.DIRECTORIO_CURSOSREALIZADOS;
import static org.fautapo.util.Directorio.DIRECTORIO_FORMACIONACADEMICA;
import static org.fautapo.util.Directorio.DIRECTORIO_IDIOMAS;
import static org.fautapo.util.Directorio.DIRECTORIO_LIBRETAMILITAR;
import static org.fautapo.util.Directorio.DIRECTORIO_TITULOPOSGRADOEDUCACIONSUPERIOR;
import static org.fautapo.util.Directorio.DIRECTORIO_TITULOPROVISIONNACIONAL;
import org.fautapo.util.IText;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
public class DocumentosController {

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

    @RequestMapping(value = "/Documentos/entrada.fautapo", method = RequestMethod.GET)
    public String Entrada(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("model", model);
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        return "documentos/Entrada";
    }

    @RequestMapping(value = "/Documentos/verProgramaPlanAsignacion.fautapo", method = RequestMethod.GET)
    public String ListarProgramasPlan(@ModelAttribute("model") @Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("model", model);
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            return "documentos/Entrada";
        }
        Universidades datosUniversidad = new Universidades();
        datosUniversidad.setId_universidad(cliente.getId_universidad());
        List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
        List<Programas> lProgramas = new ArrayList<>();
        ParametrosDocumentosEntrada modelprograma = new ParametrosDocumentosEntrada();
        modelprograma.setGestion(model.getGestion());
        modelprograma.setPeriodo(model.getPeriodo());
        modelo.addAttribute("lFacultades", lFacultades);
        modelo.addAttribute("lProgramas", lProgramas);
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("usuario", cliente.getNombres());
        modelo.addAttribute("model", modelprograma);
        return "documentos/verProgramaPlanAsignacion";
    }

    @RequestMapping(value = "/Documentos/ListarProgramasAjax.fautapo", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MessageResultProgramaModel> ListarProgramasAjax(@ModelAttribute("id_facultad") Integer id_facultad) {
        MessageResultProgramaModel result = new MessageResultProgramaModel();
        List<ProgramaItem> lista = mi.getProgramasporFacultad(id_facultad);
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

    @RequestMapping(value = "/Documentos/verListaDocentesDesignados.fautapo", method = RequestMethod.GET)
    public String verListaDocentesDesignados(@ModelAttribute("model") @Validated ParametrosDocumentosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            Universidades datosUniversidad = new Universidades();
            datosUniversidad.setId_universidad(cliente.getId_universidad());
            List lFacultades = this.mi.getUnvListarFacultades(datosUniversidad);
            List<Programas> lProgramas = new ArrayList<>();
            modelo.addAttribute("lFacultades", lFacultades);
            modelo.addAttribute("lProgramas", lProgramas);
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("usuario", cliente.getNombres());
            modelo.addAttribute("model", model);
            return "documentos/verProgramaPlanAsignacion";
        }
        ParametroBusquedaDocenteModel usermodel = new ParametroBusquedaDocenteModel();
        usermodel.setPagina(Convert.ToInteger(request, "pagina") == 0 ? 1 : Convert.ToInteger(request, "pagina"));
        usermodel.setNombre_completo("");
        usermodel.setNro_pagina(50);
        usermodel.setGestion(model.getGestion());
        usermodel.setPeriodo(model.getPeriodo());
        usermodel.setId_programa(model.getId_programa());
        usermodel.setId_docente(0);
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        programa = mi.getPrgBuscarPrograma(programa);

        Asignaciones asignacion = modelMapper.map(usermodel, Asignaciones.class);
        List lDocentes = this.mi.getDocenteDesignadosCarrera(asignacion);
        modelo.addAttribute("result", null);
        modelo.addAttribute("lDocentes", lDocentes);
        modelo.addAttribute("programa", programa);
        modelo.addAttribute("size", Integer.toString(lDocentes.size()));
        modelo.addAttribute("model", usermodel);
        return "documentos/listaDocentesDesignados";
    }

    @RequestMapping(value = "/Documentos/listarDocentesFiltrar.fautapo", method = RequestMethod.GET)
    public String listarDocentesFiltrar(@ModelAttribute("model") ParametroBusquedaDocenteModel model, ModelMap modelo) {
        Asignaciones asignacion = modelMapper.map(model, Asignaciones.class);
        List lDocentes = this.mi.getDocenteDesignadosCarrera(asignacion);
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        programa = mi.getPrgBuscarPrograma(programa);
        modelo.addAttribute("result", null);
        modelo.addAttribute("lDocentes", lDocentes);
        modelo.addAttribute("programa", programa);
        modelo.addAttribute("size", Integer.toString(lDocentes.size()));
        modelo.addAttribute("model", model);
        return "documentos/listaDocentesDesignados";
    }

    @RequestMapping(value = "/Documentos/DescargarDocumentosCarrera.fautapo", method = RequestMethod.GET)
    public void DescargarDocumentos(HttpServletResponse response, @ModelAttribute("model") ParametroBusquedaDocenteModel model) throws Exception {
        List<InputStream> inputPdfList = new ArrayList<InputStream>();
        List<File> fileimages = new ArrayList<File>();
        Programas programa = new Programas();
        programa.setId_programa(model.getId_programa());
        programa = mi.getPrgBuscarPrograma(programa);
        Asignaciones asignacion = modelMapper.map(model, Asignaciones.class);
        List<PersonaKardex> kardexcarrera = this.mi.GetPersonaDocumentosExportarCarrera(asignacion);
        for (PersonaKardex persona : kardexcarrera) {
            List<PersonaKardex> personas = mi.GetPersonaDocumentosAnexosExportar(persona.getId_persona_kardex());
            if (!persona.getImagelibretamilitar().equals("image.png")) {
                if (persona.getImagelibretamilitar().contains("application/pdf")) {
                    String[] ruta = persona.getImagelibretamilitar().split(";");
                    inputPdfList.add(new FileInputStream(DIRECTORIO_LIBRETAMILITAR.key() + File.separator + ruta[1]));
                } else {
                    if (!persona.getImagelibretamilitar().equals("")) {
                        String[] ruta = persona.getImagelibretamilitar().split(";");
                        fileimages.add(new File(DIRECTORIO_LIBRETAMILITAR.key() + File.separator + ruta[1]));
                    }
                }
            }
            if (!persona.getImagecarnetidentidad().equals("image.png")) {
                if (persona.getImagecarnetidentidad().contains("application/pdf")) {
                    String[] ruta = persona.getImagecarnetidentidad().split(";");
                    inputPdfList.add(new FileInputStream(DIRECTORIO_CARNET.key() + File.separator + ruta[1]));
                } else {
                    if (!persona.getImagecarnetidentidad().equals("")) {
                        String[] ruta = persona.getImagecarnetidentidad().split(";");
                        fileimages.add(new File(DIRECTORIO_CARNET.key() + File.separator + ruta[1]));
                    }
                }
            }
            if (!persona.getImagetituloposgrado().equals("image.png")) {
                if (persona.getImagetituloposgrado().contains("application/pdf")) {
                    String[] ruta = persona.getImagetituloposgrado().split(";");
                    inputPdfList.add(new FileInputStream(DIRECTORIO_TITULOPOSGRADOEDUCACIONSUPERIOR.key() + File.separator + ruta[1]));
                } else {
                    if (!persona.getImagetituloposgrado().equals("")) {
                        String[] ruta = persona.getImagetituloposgrado().split(";");
                        fileimages.add(new File(DIRECTORIO_TITULOPOSGRADOEDUCACIONSUPERIOR.key() + File.separator + ruta[1]));
                    }
                }
            }
            if (!persona.getImagen().equals("image.png")) {
                if (persona.getImagen().contains("application/pdf")) {
                    String[] ruta = persona.getImagen().split(";");
                    inputPdfList.add(new FileInputStream(DIRECTORIO_TITULOPROVISIONNACIONAL.key() + File.separator + ruta[1]));
                } else {
                    if (!persona.getImagen().equals("")) {
                        String[] ruta = persona.getImagen().split(";");
                        fileimages.add(new File(DIRECTORIO_TITULOPROVISIONNACIONAL.key() + File.separator + ruta[1]));
                    }
                }
            }
            if (!personas.isEmpty()) {
                ArchivosModel formacion = GetFilesBytes(personas.stream().filter(p -> p.getTipo_documento().equals("FA")).map(p -> p.getRuta()).collect(Collectors.toList()), DIRECTORIO_FORMACIONACADEMICA.key());
                ArchivosModel idioma = GetFilesBytes(personas.stream().filter(p -> p.getTipo_documento().equals("ID")).map(p -> p.getRuta()).collect(Collectors.toList()), DIRECTORIO_IDIOMAS.key());
                ArchivosModel cursos = GetFilesBytes(personas.stream().filter(p -> p.getTipo_documento().equals("CU")).map(p -> p.getRuta()).collect(Collectors.toList()), DIRECTORIO_CURSOSREALIZADOS.key());
                inputPdfList.addAll(formacion.getPdfFiles());
                inputPdfList.addAll(idioma.getPdfFiles());
                inputPdfList.addAll(cursos.getPdfFiles());
                fileimages.addAll(formacion.getImagesFiles());
                fileimages.addAll(idioma.getImagesFiles());
                fileimages.addAll(cursos.getImagesFiles());
            }
        }
        IText.CombinarPDF(inputPdfList, fileimages, response, "DOC_" + programa.getPrograma().replace(" ", "_"));
    }

    @RequestMapping(value = "/Documentos/DescargarDocumentos.fautapo", method = RequestMethod.GET)
    public void DescargarDocumentos(HttpServletResponse response, @ModelAttribute("id_persona") Integer id_persona, @ModelAttribute("dip") String dip) throws Exception {
        // Descarga la ruta del archivo 
        List<InputStream> inputPdfList = new ArrayList<InputStream>();
        List<File> fileimages = new ArrayList<File>();
        PersonaKardex persona = mi.GetPersonaDocumentosExportar(id_persona);
        List<PersonaKardex> personas = mi.GetPersonaDocumentosAnexosExportar(id_persona);
        if (!persona.getImagelibretamilitar().equals("image.png")) {
            if (persona.getImagelibretamilitar().contains("application/pdf")) {
                String[] ruta = persona.getImagelibretamilitar().split(";");
                inputPdfList.add(new FileInputStream(DIRECTORIO_LIBRETAMILITAR.key() + File.separator + ruta[1]));
            } else {
                String[] ruta = persona.getImagelibretamilitar().split(";");
                fileimages.add(new File(DIRECTORIO_LIBRETAMILITAR.key() + File.separator + ruta[1]));
            }
        }
        if (!persona.getImagecarnetidentidad().equals("image.png")) {
            if (persona.getImagecarnetidentidad().contains("application/pdf")) {
                String[] ruta = persona.getImagecarnetidentidad().split(";");
                inputPdfList.add(new FileInputStream(DIRECTORIO_CARNET.key() + File.separator + ruta[1]));
            } else {
                String[] ruta = persona.getImagecarnetidentidad().split(";");
                fileimages.add(new File(DIRECTORIO_CARNET.key() + File.separator + ruta[1]));
            }
        }
        if (!persona.getImagetituloposgrado().equals("image.png")) {
            if (persona.getImagetituloposgrado().contains("application/pdf")) {
                String[] ruta = persona.getImagetituloposgrado().split(";");
                inputPdfList.add(new FileInputStream(DIRECTORIO_TITULOPOSGRADOEDUCACIONSUPERIOR.key() + File.separator + ruta[1]));
            } else {
                String[] ruta = persona.getImagetituloposgrado().split(";");
                fileimages.add(new File(DIRECTORIO_TITULOPOSGRADOEDUCACIONSUPERIOR.key() + File.separator + ruta[1]));
            }
        }
        if (!persona.getImagen().equals("image.png")) {
            if (persona.getImagen().contains("application/pdf")) {
                String[] ruta = persona.getImagen().split(";");
                inputPdfList.add(new FileInputStream(DIRECTORIO_TITULOPROVISIONNACIONAL.key() + File.separator + ruta[1]));
            } else {
                String[] ruta = persona.getImagen().split(";");
                fileimages.add(new File(DIRECTORIO_TITULOPROVISIONNACIONAL.key() + File.separator + ruta[1]));
            }
        }
        if (!personas.isEmpty()) {
            ArchivosModel formacion = GetFilesBytes(personas.stream().filter(p -> p.getTipo_documento().equals("FA")).map(p -> p.getRuta()).collect(Collectors.toList()), DIRECTORIO_FORMACIONACADEMICA.key());
            ArchivosModel idioma = GetFilesBytes(personas.stream().filter(p -> p.getTipo_documento().equals("ID")).map(p -> p.getRuta()).collect(Collectors.toList()), DIRECTORIO_IDIOMAS.key());
            ArchivosModel cursos = GetFilesBytes(personas.stream().filter(p -> p.getTipo_documento().equals("CU")).map(p -> p.getRuta()).collect(Collectors.toList()), DIRECTORIO_CURSOSREALIZADOS.key());
            inputPdfList.addAll(formacion.getPdfFiles());
            inputPdfList.addAll(idioma.getPdfFiles());
            inputPdfList.addAll(cursos.getPdfFiles());
            fileimages.addAll(formacion.getImagesFiles());
            fileimages.addAll(idioma.getImagesFiles());
            fileimages.addAll(cursos.getImagesFiles());
        }
        IText.CombinarPDF(inputPdfList, fileimages, response, "DOC_" + dip);
    }

    private ArchivosModel GetFilesBytes(List<String> urls, String Directorio) throws FileNotFoundException {
        ArchivosModel model = new ArchivosModel();
        List<InputStream> inputPdfList = new ArrayList<InputStream>();
        List<File> fileimages = new ArrayList<File>();
        for (String url : urls) {
            if (!url.equals("image.png")) {
                if (url.contains("application/pdf")) {
                    String[] ruta = url.split(";");
                    inputPdfList.add(new FileInputStream(Directorio + File.separator + ruta[1]));
                } else {
                    if (!url.equals("")) {
                        String[] ruta = url.split(";");
                        fileimages.add(new File(Directorio + File.separator + ruta[1]));
                    }
                }
            }
        }
        model.setImagesFiles(fileimages);
        model.setPdfFiles(inputPdfList);
        return model;
    }
}

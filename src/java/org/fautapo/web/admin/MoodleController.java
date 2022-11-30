/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.admin;

import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.CursosMoodle;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.model.BuscarDetalleMoodleModel;
import org.fautapo.model.BuscarGruposModel;
import org.fautapo.model.InformeMoodleModel;
import org.fautapo.model.ParametrosEntrada;
import org.fautapo.model.Result;
import org.fautapo.model.ResultDetalle;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.lang3.StringUtils;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.model.ComprobarGrupoModel;
import org.fautapo.model.Detalles;
import org.fautapo.model.ResultDetalleVisita;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class MoodleController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BCryptPasswordEncoder bcrytEncoder;
    @Autowired
    private HttpServletRequest request;

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @RequestMapping(value = "/EntradaMoodleSeguimiento.fautapo", method = RequestMethod.GET)
    public String entrada(ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        ParametrosEntrada model = new ParametrosEntrada();
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
        modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
        modelo.addAttribute("clave", cliente.getClave());
        modelo.addAttribute("simagen", this.GetUsuario().getImagen());
        modelo.addAttribute("model", model);
        return "moodle/Entrada";
    }

    @RequestMapping(value = "/moodle/listarFacultades.fautapo", method = RequestMethod.POST)
    public String listarFacultades(@ModelAttribute("model")@Validated ParametrosEntrada model, BindingResult result, ModelMap modelo) {
        Clientes cliente = this.GetUsuario();
        if (result.hasErrors()) {
            modelo.addAttribute("nombres", cliente.getNombres());
            modelo.addAttribute("gestion", Integer.toString(cliente.getGestion()));
            modelo.addAttribute("periodo", Integer.toString(cliente.getPeriodo()));
            modelo.addAttribute("clave", cliente.getClave());
            modelo.addAttribute("simagen", this.GetUsuario().getImagen());
            modelo.addAttribute("model", model);
            return "moodle/Entrada";
        }
        modelo.addAttribute("cliente", cliente);
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        //Listando los tipos_evaluaciones
        List lTiposEvaluaciones = this.mi.getTpsListarTiposEvaluaciones();
        modelo.addAttribute("lTiposEvaluaciones", lTiposEvaluaciones);
        modelo.addAttribute("nombres", cliente.getNombres());
        modelo.addAttribute("acceso", (Accesos) request.getSession().getAttribute("__sess_acceso"));
        return "moodle/listarFacultades";
    }

    @RequestMapping(value = "/moodle/listarCursosMoodle.fautapo", method = RequestMethod.POST)
    public String listarGrupos(@ModelAttribute("model") BuscarGruposModel model, ModelMap modelo) {
        modelo.addAttribute("id_programa", model.getId_programa());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        modelo.addAttribute("id_tipo_evaluacion", model.getId_tipo_evaluacion());
        //sacamos los cursos del moodle
        RestTemplate rt = new RestTemplate();
        CursosMoodle cursos = new CursosMoodle();
        cursos.setGestion(model.getGestion());
        cursos.setPeriodo(model.getPeriodo());
        cursos.setId_tipo_evaluacion(model.getId_tipo_evaluacion());
        cursos.setId_programa(model.getId_programa());
        List<CursosMoodle> detallecurso = this.mi.GetListaCursosMoodlePorPrograma(cursos);
        List<InformeMoodleModel> detalleinforme = new ArrayList<>();
        String id_cursos = "";
        String id_usuario = "";
        List<CursosMoodle> ids_cursos = detallecurso.stream().filter(distinctByKey(p -> p.getId_moodle_cursos())).collect(Collectors.toList());
        List<CursosMoodle> ids_usuarios = detallecurso.stream().filter(distinctByKey(p -> p.getId_moodle())).collect(Collectors.toList());
        int j = 0;
        for (CursosMoodle c : ids_cursos) {
            if (c.getId_cursos_moodle() != -2) {
                id_cursos += "cursoid[" + j + "]=" + c.getId_moodle_cursos() + "&";
                j++;
            }
        }
        j = 0;
        for (CursosMoodle c : ids_usuarios) {
            if (c.getId_moodle() != -2) {
                id_usuario += "userid[" + j + "]=" + c.getId_moodle() + "&";
                j++;
            }
        }
        id_cursos = StringUtils.chop(id_cursos);
        id_usuario = StringUtils.chop(id_usuario);
        String url = "http://192.168.100.150/moodle/GetVisitasDetalle?" + id_cursos + "&" + id_usuario;
        URI urls = URI.create(url);
        ResultDetalleVisita DetalleVisita = rt.getForObject(urls, ResultDetalleVisita.class);
        for (CursosMoodle c : detallecurso) {
            InformeMoodleModel i = new InformeMoodleModel();
            i.setNombres(c.getNombres());
            i.setSigla(c.getSigla());
            i.setDip(c.getDip());
            i.setMaterias(c.getMaterias());
            i.setGrupo(c.getGrupo());
            i.setOfertaacademica(c.getOferta());
            i.setMatriculados(c.getCantidad());
            Result totalRecursos = rt.getForObject("http://192.168.100.150/moodle/GetTotalRecursos/" + c.getId_moodle_cursos(), Result.class);
            Result cantiadadmatriculados = rt.getForObject("http://192.168.100.150/moodle/GetMatriculadosCurso/" + c.getId_moodle_cursos(), Result.class);
            int id = Integer.parseInt(c.getId_moodle_cursos());
            int cantiadadvisitas = DetalleVisita.getValue().stream().filter(p -> p.getCurso() == id).mapToInt(p -> p.getCantidad()).sum();
            Result cantiadadPlanificarCursos = rt.getForObject("http://192.168.100.150/moodle/GetPlanificarCursos/" + c.getId_moodle_cursos(), Result.class);
            i.setMatriculadomoodle(cantiadadmatriculados.getValue());
            i.setUsoplataforma(cantiadadvisitas);
            i.setContenido(totalRecursos.getValue());
            i.setPlanifi_clase_moodle(cantiadadPlanificarCursos.getMensaje());
            i.setId_moodle_cursos(Long.parseLong(c.getId_moodle_cursos()));
            i.setId_moodle(c.getId_moodle());
            detalleinforme.add(i);
        }
        modelo.addAttribute("detallecurso", detalleinforme.stream().sorted(Comparator.comparing(InformeMoodleModel::getNombres)).collect(Collectors.toList()));
        String htmluso = "";
        int mayor = detalleinforme.stream().mapToInt(p -> p.getUsoplataforma()).max().getAsInt();
        for (InformeMoodleModel i : detalleinforme.stream().sorted(Comparator.comparing(InformeMoodleModel::getUsoplataforma).reversed()).collect(Collectors.toList())) {
            int porcentaje = Math.round((i.getUsoplataforma() * 100) / mayor);
            htmluso += "<div class='row'><div class='col'><label>" + i.getSigla() + "-" + i.getMaterias() + " " + i.getGrupo() + " / " + i.getNombres() + "(" + i.getUsoplataforma() + ") </label><div class='progress'><div class='progress-bar progress-bar-striped ' role='progressbar' style='width: " + porcentaje + "%; background: " + getRandomColor() + "' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'></div></div></div></div>";
        }
        modelo.addAttribute("detallecursoporuso", htmluso);
        String htmlrecurso = "";
        int mayorrecurso = detalleinforme.stream().mapToInt(p -> p.getContenido()).max().getAsInt();
        for (InformeMoodleModel i : detalleinforme.stream().sorted(Comparator.comparing(InformeMoodleModel::getContenido).reversed()).collect(Collectors.toList())) {
            int porcentaje = Math.round((i.getContenido() * 100) / mayorrecurso);
            htmlrecurso += "<div class='row'><div class='col'><label>" + i.getSigla() + "-" + i.getMaterias() + " " + i.getGrupo() + " / " + i.getNombres() + "(" + i.getContenido() + ") </label><div class='progress'><div class='progress-bar progress-bar-striped ' role='progressbar' style='width: " + porcentaje + "%; background: " + getRandomColor() + "' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'></div></div></div></div>";
        }
        modelo.addAttribute("detallecursoporcontenido", htmlrecurso);

        int si = (int) detalleinforme.stream().filter(p -> "SI".equals(p.getOfertaacademica())).count();
        int no = (int) detalleinforme.stream().filter(p -> "NO".equals(p.getOfertaacademica())).count();
        modelo.addAttribute("SI", si);
        modelo.addAttribute("NO", no);
        //Sacamos los datos del plan
        Planes datosPrgPlan = modelMapper.map(model, Planes.class);
        datosPrgPlan = this.mi.getBuscarPrgPlan2(datosPrgPlan);
        modelo.addAttribute("datosPrgPlan", datosPrgPlan);

        //Sacamos los datos del programa
        Programas programa = modelMapper.map(model, Programas.class);
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
        modelo.addAttribute("usuario", this.GetUsuario().getNombres());
        return "moodle/ListarCursosMoodle";
    }

    @RequestMapping(value = "/moodle/ObtenerDetalleCursos.fautapo", method = RequestMethod.POST)
    public String ObtenerDetalleCursos(@ModelAttribute("model") BuscarDetalleMoodleModel model, ModelMap modelo) {
        RestTemplate rt = new RestTemplate();
        Result cantiadadmatriculados = rt.getForObject("http://192.168.100.150/moodle/GetMatriculadosCurso/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadrecursosPedagogicos = rt.getForObject("http://192.168.100.150/moodle/GetRecursoPedagogico/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadcuestionarioPedagogicos = rt.getForObject("http://192.168.100.150/moodle/GetCuestionarioPedagogicos/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadNumeroEncuestasPedagogicos = rt.getForObject("http://192.168.100.150/moodle/GetNumeroEncuestasPedagogicos/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadtareasPedagogicos = rt.getForObject("http://192.168.100.150/moodle/GetTareasPedagogicos/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadenlacesPedagogicos = rt.getForObject("http://192.168.100.150/moodle/GetEnlacesPedagogicos/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadetiquetasPedagogicos = rt.getForObject("http://192.168.100.150/moodle/GetEtiquetasPedagogicos/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadnumeroMettPedagogicos = rt.getForObject("http://192.168.100.150/moodle/GetNumeroMeetPedagogicos/" + model.getId_moodle_cursos(), Result.class);
        Result cantiadadPlanificarCursos = rt.getForObject("http://192.168.100.150/moodle/GetPlanificarCursos/" + model.getId_moodle_cursos(), Result.class);
        ResultDetalle DetalleCursos = rt.getForObject("http://192.168.100.150/moodle/GetDetalleRecursos/" + model.getId_moodle_cursos(), ResultDetalle.class);
        modelo.addAttribute("cantiadadmatriculados", cantiadadmatriculados.getValue());
        modelo.addAttribute("cantiadadrecursosPedagogicos", cantiadadrecursosPedagogicos.getValue());
        modelo.addAttribute("cantiadadcuestionarioPedagogicos", cantiadadcuestionarioPedagogicos.getValue());
        modelo.addAttribute("cantiadadNumeroEncuestasPedagogicos", cantiadadNumeroEncuestasPedagogicos.getValue());
        modelo.addAttribute("cantiadadtareasPedagogicos", cantiadadtareasPedagogicos.getValue());
        modelo.addAttribute("cantiadadenlacesPedagogicos", cantiadadenlacesPedagogicos.getValue());
        modelo.addAttribute("cantiadadetiquetasPedagogicos", cantiadadetiquetasPedagogicos.getValue());
        modelo.addAttribute("cantiadadnumeroMettPedagogicos", cantiadadnumeroMettPedagogicos.getValue());
        modelo.addAttribute("cantiadadPlanificarCursos", cantiadadPlanificarCursos.getMensaje());
        modelo.addAttribute("DetalleCursos", DetalleCursos.getValue());
        modelo.addAttribute("sigla", model.getSigla());
        modelo.addAttribute("materias", model.getMaterias());
        modelo.addAttribute("nombres", model.getNombres());
        modelo.addAttribute("grupo", model.getGrupo());
        modelo.addAttribute("gestion", model.getGestion());
        modelo.addAttribute("periodo", model.getPeriodo());
        //Sacamos los datos del programa
        Programas programa = modelMapper.map(model, Programas.class);
        modelo.addAttribute("programa", this.mi.getPrgBuscarPrograma(programa));
        modelo.addAttribute("usuario", this.GetUsuario().getNombres());
        return "moodle/DetalleCursos";
    }

    @RequestMapping(value = "/moodle/GetDetalleCursoMoodleDocente.fautapo", method = RequestMethod.GET, consumes = "application/json", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<Detalles>> GetDetalleCursoMoodleDocente(@ModelAttribute("id_moodle_cursos") String id_moodle_cursos, ModelMap modelo) {
        RestTemplate rt = new RestTemplate();
        ResultDetalle DetalleCursos = rt.getForObject("http://192.168.100.150/moodle/GetDetalleRecursos/" + id_moodle_cursos, ResultDetalle.class);
        return new ResponseEntity<>(DetalleCursos.getValue(), HttpStatus.OK);
    }

    private <T> Predicate<T> distinctByKey(
            Function<? super T, ?> keyExtractor) {
        Map<Object, Boolean> seen = new ConcurrentHashMap<>();
        return t -> seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
    }

    private String getRandomColor() {
        String letters = "0123456789ABCDEF";
        String color = "#";
        StringBuffer captchaStrBuffer = new StringBuffer();
        java.util.Random rnd = new java.util.Random();
        while (captchaStrBuffer.length() < 6) {
            int index = (int) (rnd.nextFloat() * letters.length());
            captchaStrBuffer.append(letters.substring(index, index + 1));
        }
        return color + captchaStrBuffer.toString();
    }
}

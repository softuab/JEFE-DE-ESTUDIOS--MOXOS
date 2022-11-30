/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.Upload;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.IOException;
import java.util.List;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.logic.MiFacade;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CargarImagenesController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private HttpServletRequest request;

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }

    private Clientes GetUsuario() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        Clientes cliente = (Clientes) attr.getRequest().getSession().getAttribute("__sess_cliente");
        return cliente;
    }

    @ResponseBody
    @RequestMapping(value = "CargarImagenes.fautapo", method = RequestMethod.POST)
    public String CargarImagenes(@RequestParam("filedocente") MultipartFile multipartfile) throws IOException {
        int iResultado = 0;
        Clientes cliente = this.GetUsuario();
        int iId_docente = cliente.getId_usuario();
        String sNombre = String.format("%010d", iId_docente) + multipartfile.getContentType().replaceAll("image/", ".");
        String sAdjunto = multipartfile.getContentType();
        Docentes docente = new Docentes();
        docente.setId_docente(iId_docente);
        List<Docentes> docentes = this.mi.getDetallefotoadjunto(docente);
        if (docentes.isEmpty()) {
            Docentes datosAdjunto = new Docentes();
            datosAdjunto.setId_docente(iId_docente);
            datosAdjunto.setAdjunto(sAdjunto);
            datosAdjunto.setNombre_archivo(sNombre);
            datosAdjunto.setId_estado("I");
            datosAdjunto.setId_rol(cliente.getId_rol());
            datosAdjunto.setUlt_usuario(cliente.getId_usuario());
            iResultado = this.mi.setRegistrarDocenteAdjuntos(datosAdjunto);
            if (iResultado == 1) {
                String rootPath = System.getProperty("catalina.home") + File.separator + "docadjuntos" + File.separator + String.format("%010d", iId_docente) + multipartfile.getContentType().replaceAll("image/", ".");
                byte[] bytes = multipartfile.getBytes();
                Path path = Paths.get(rootPath);
                Files.write(path, bytes);
                return "ok";
            } else {
                return "Ocurrio un problema al cargar la imagen vuelva a intentar";
            }
        } else {
            Docentes datosAdjunto = docentes.stream().findFirst().get();
            datosAdjunto.setId_docente(iId_docente);
            datosAdjunto.setAdjunto(sAdjunto);
            datosAdjunto.setNombre_archivo(sNombre);
            datosAdjunto.setId_estado("I");
            datosAdjunto.setId_rol(cliente.getId_rol());
            datosAdjunto.setUlt_usuario(cliente.getId_usuario());
            iResultado = this.mi.setActualizarDocenteAdjuntos(datosAdjunto);
            if (iResultado == 1) {
                String rootPath = System.getProperty("catalina.home") + File.separator + "docadjuntos" + File.separator + String.format("%010d", iId_docente) + multipartfile.getContentType().replaceAll("image/", ".");
                byte[] bytes = multipartfile.getBytes();
                Path path = Paths.get(rootPath);
                Files.write(path, bytes);
                return "ok";
            } else {
                return "Ocurrio un problema al cargar la imagen vuelva a intentar";
            }
        }
    }
}

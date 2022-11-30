/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.fautapo.domain.logic.MiFacade;
import java.security.Principal;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import org.apache.tomcat.util.codec.binary.Base64;
import org.fautapo.domain.Accesos;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.Roles;
import org.fautapo.util.RemoteIpHostHelper;
import static org.fautapo.util.Util.resize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    @Qualifier("mi")
    private MiFacade mi;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String userName = "";
        String ip = null; // IP del cliente
        String host = null; // Host del cliente
        if (authentication.getPrincipal() instanceof Principal) {
            userName = ((Principal) authentication.getPrincipal()).getName();
        } else {
            User userSpringSecu = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            userName = userSpringSecu.getUsername();
        }
        host = request.getRemoteHost();
        Clientes cliente = this.mi.getBuscarConexionAdministrativo(userName);
        try {
            cliente.setImagen(getImagen());
        } catch (IOException ex) {
        }
        if (cliente.getId_rol() == 1) { // es Administrativo
            Roles rol = new Roles();
            rol.setId_usuario(cliente.getId_usuario());
            List<Roles> roles = this.mi.getListarRolesCliente(cliente.getId_usuario());
            cliente.setRoles(roles);
            if (cliente.getRoles().isEmpty()) {  // expiraron sus roles
                response.sendRedirect(request.getContextPath() + "/login.fautapo?error=3");
            }
            Roles aux = (Roles) cliente.getRoles().get(0);
            cliente.setId_rol(aux.getId_rol());
            cliente.setRol(aux.getRol());
        }
        Cookie c = new Cookie("userid", String.valueOf(cliente.getId_usuario()));
        ip = RemoteIpHostHelper.getRemoteIpFrom(request);
        String UserAgent = RemoteIpHostHelper.getUserAgent(request);
        String ubicacion = request.getParameter("ubicacion");
        request.getSession().setAttribute("_ubicacion", ubicacion);
        request.getSession().setAttribute("_tipo_usuario", "Docente");
        request.getSession().setAttribute("_so_browser", UserAgent);
        request.getSession().setAttribute("_ip_address", ip);
        request.getSession().setAttribute("userName", cliente.getNombres());
        request.getSession().setAttribute("__sess_cliente", cliente); // Subimos 'cliente' a la sesion 
        response.addCookie(c);
        if (cliente.getRoles().size() > 1 || cliente.getRoles() != null) { // tiene mas de 1 rol
            response.sendRedirect(request.getContextPath() + "/ElegirRol.fautapo");
        } else {
            Roles rol = new Roles();
            rol.setId_usuario(cliente.getId_usuario());
            rol.setId_rol(cliente.getId_rol());
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
            cliente.setAlmacen("");
            //Sacamos el listado de almacenes
            cliente.setAlmacenes(this.mi.getListarAlmacenesCliente(rol));
            if (cliente.getAlmacenes().size() == 1) {
                Roles aux = (Roles) cliente.getAlmacenes().get(0);
                cliente.setId_almacen(aux.getId_almacen());
                cliente.setPermiso(aux.getPermiso());
                cliente.setAlmacen(aux.getAlmacen());
            }
            // Este es para el MI si o si
            Accesos acceso = new Accesos();
            acceso.setAsignarAccesos(cliente, this.mi);
            request.getSession().setAttribute("__sess_acceso", acceso); // Subimos los 'accesos' a la sesion
            //Fin para el MI
            request.getSession().setAttribute("__sess_cliente", cliente); // Subimos 'cliente' a la sesion
            if (cliente.getAlmacenes().size() > 1) { // tiene mas de 1 rol
                response.sendRedirect(request.getContextPath() + "/elegirAlmacen.fautapo");
            }
            response.sendRedirect(request.getContextPath() + "/index.fautapo");
        }
    }

    private String getImagen() throws IOException {
        String imagen = "";

        String scontentype = "image/png";
        String rootPath = System.getProperty("catalina.home") + File.separator + "docadjuntos" + File.separator + "nulo.png";

        File fnew = new File(rootPath);
        BufferedImage originalImage = ImageIO.read(fnew);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(resize(originalImage, 70, 70), "png", baos);
        byte[] imageInByte = baos.toByteArray();
        imagen = "data:" + scontentype + ";base64," + Base64.encodeBase64String(imageInByte);
        return imagen;
    }
}

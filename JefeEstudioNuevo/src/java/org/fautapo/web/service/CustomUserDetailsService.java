/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.web.service;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.fautapo.domain.Roles;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.logic.MiFacade;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    @Qualifier("mi")
    private MiFacade mi;
    @Autowired
    private HttpServletRequest request;

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Clientes cliente = this.mi.getBuscarConexionAdministrativo(username);

        if ((cliente == null) || (cliente.getId_rol() != 1)) {
            throw new UsernameNotFoundException("No se econtro al usuario: " + username);
        } else {
            List<GrantedAuthority> roles = new ArrayList<>();
            Roles rol = new Roles();
            rol.setId_usuario(cliente.getId_rol());
            List<Roles> usuariosroles = this.mi.getListarRolesCliente(rol);
            usuariosroles.forEach(usuariorol -> {
                roles.add(new SimpleGrantedAuthority(usuariorol.getRol()));
            });
            return new User(cliente.getCorreo(), cliente.getClave(), roles);
        }

    }
}

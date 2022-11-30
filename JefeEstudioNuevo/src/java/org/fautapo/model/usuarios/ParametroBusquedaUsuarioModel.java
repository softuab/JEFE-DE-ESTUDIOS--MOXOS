/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model.usuarios;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParametroBusquedaUsuarioModel {

    private Integer pagina;
    private Integer nro_pagina;
    private Integer id_usuario;
    private Integer id_persona;
    private Integer id_docente;
    private Integer id_usuario_estudiante;
    private String nombreUsuario;
    private String accion;
}

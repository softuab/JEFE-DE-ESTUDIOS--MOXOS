/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EstudianteUsuario {

    private Integer id_usuario_estudiante;
    private Integer id_persona;
    private String id_estado;
    private String correo;
    private String clave;
    private String celular;
    private Integer id_rol;
    private Date fec_registro;
    private Date fec_modificacion;
    private String observacion;
    private String ip;
    private String dispositivo;
    private Date ultima_conexion;
    private String ubicacion;
    private Integer ult_usuario;
    private String nombre_completo;
    private String nombreUsuario; 
    private Integer nro_pagina;
    private int pagina;
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model.programa;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParametroBusquedaDocenteModel {

    private Integer pagina;
    private Integer nro_pagina;
    private Integer id_persona;
    private Integer gestion;
    private Integer periodo;
    private Integer id_programa;
    private Integer id_docente;
    private String nombre_completo;
    private String accion;
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BuscarConvalidacionModel {

    private Integer id_estudiante;
    private Integer id_tipo_convalidacion;
    private Integer id_programa;
    private Integer periodo;
    private Integer gestion;
    private String nombres;
    private String ci;
    private String[] id_materia_conv;
    private String resolucion;
    private Integer id_universidad;
    private Integer id_facultad;
    private String plan_origen;
    private Integer id_tipo_materia;
    private String sigla_origen;
    private String materia_origen;
    private String similitud;
    private String nota_origen;
    private Integer id_tipo_admision;
    
}

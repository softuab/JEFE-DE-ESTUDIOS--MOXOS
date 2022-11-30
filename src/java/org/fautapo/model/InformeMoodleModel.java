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
public class InformeMoodleModel {
    private Integer id_moodle;
    private long id_moodle_cursos;
    private String dip;
    private String nombres;
    private String sigla;
    private String materias;
    private String grupo;
    private String ofertaacademica;
    private Integer matriculados;
    private Integer matriculadomoodle;
    private Integer usoplataforma;
    private Integer contenido;
    private String planifi_clase_moodle; 
  
}

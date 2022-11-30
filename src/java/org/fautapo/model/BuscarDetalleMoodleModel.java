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
public class BuscarDetalleMoodleModel {

    private Integer id_moodle;
    private Integer id_moodle_cursos;
    private Integer id_programa;
    private Integer gestion;
    private Integer periodo;
    private String sigla;
    private String materias;
    private String grupo;
    private String nombres;
}

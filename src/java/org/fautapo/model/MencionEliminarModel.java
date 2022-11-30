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
public class MencionEliminarModel {

    private Integer id_estudiante;
    private Integer id_programa;
    private String id_plan;
    private Integer id_mencion;
    private String csrfToken;
}

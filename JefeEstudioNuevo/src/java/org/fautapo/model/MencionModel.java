/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MencionModel {

    private Integer id_programa;
    @NotNull(message = "Debe seleccionar el estudiante")
    private Integer id_estudiante;
    private String nombre_estudiante;
    @NotNull(message = "Debe seleccionar el plan de de estudio")
    private String id_plan;
    @NotNull(message = "Debe seleccionar la mencion")
    private Integer id_mencion;

}
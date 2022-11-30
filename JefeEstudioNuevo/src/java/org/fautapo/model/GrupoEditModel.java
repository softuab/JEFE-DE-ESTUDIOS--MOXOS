/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.ValidDate;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class GrupoEditModel {

    private Integer id_dpto_grupo;
    private Integer id_programa;
    private Integer id_prg_plan;
    private Integer id_tipo_evaluacion;
    private Integer gestion;
    private Integer periodo;
    private Integer id_materia_actual;
    @NotNull(message = "Debe seleccionar la materia")
    private Integer id_materia;
    @NotNull(message = "Debe seleccionar el grupo")
    private Integer id_grupo;
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    private Integer cupo_max;
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    private Integer horas;
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    private String nro_resolucion;
    @NotBlank(message = "La fecha de resolucion es obligatorio")
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    @ValidDate(message = "la fecha de resolucion no tiene el formato correcto(dia/mes/año)")
    private String fec_resolucion;
}

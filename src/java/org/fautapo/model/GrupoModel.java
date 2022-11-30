/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.ExisteGrupo;
import org.fautapo.validation.ValidDate;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
@ExisteGrupo(materia = "id_materia", evaluacion = "id_tipo_evaluacion", gestion = "gestion", periodo = "periodo", grupo = "id_grupo", message = "Para el funcionamiento de un ciclo paralelo debe remitir la solicitud a vicerrectorado de pregrado justificando con numero de estudiantes y carga horaria del docente")
public class GrupoModel {
    private Integer id_programa;
    private Integer id_prg_plan;
    private Integer id_tipo_evaluacion;
    private Integer gestion;
    private Integer periodo;
    @NotNull(message = "Debe seleccionar la materia")
    private Integer id_materia;
    @NotNull(message = "Debe seleccionar el grupo")
    private Integer id_grupo;
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    private Integer cupo_max;
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    private Integer horas;
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    private Integer nro_resolucion;
    @NotBlank(message = "La fecha de resolucion es obligatorio")
    @NotNull(message = "Debe Introducir el cupo maximo de alumnos")
    @ValidDate(message = "la fecha de resolucion no tiene el formato correcto(dia/mes/año)")
    private String fec_resolucion;
    private Integer id_departamento;

}

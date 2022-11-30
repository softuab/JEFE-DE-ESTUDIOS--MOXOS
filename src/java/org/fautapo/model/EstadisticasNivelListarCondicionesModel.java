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

public class EstadisticasNivelListarCondicionesModel {

    @NotNull(message = "Debe selecionar el plan")
    private Integer id_prg_plan;
    @NotNull(message = "Debe seleccionar el Tipo de Evaluacion")
    private Integer id_tipo_evaluacion;
    @NotNull(message = "Debe introducir el nivel academico")
    private Integer nivel_academico;
    @NotNull(message = "Debe Introducir una gestion valida Ejem:2021")
    private Integer gestion;
    @NotNull(message = "Debe Introducir un periodo valido  Ejem: 1 o 2")
    private Integer periodo;

}

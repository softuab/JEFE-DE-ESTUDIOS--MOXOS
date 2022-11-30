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
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class PromedioMayorNota {

    @NotNull(message = "Debe selecionar el plan")
    private Integer id_prg_plan;
    @NotNull(message = "Debe seleccionar el Tipo de Evaluacion")
    private Integer id_tipo_evaluacion;
    private Integer gestion;
    private Integer periodo;
    private Integer id_programa;
    private Integer id_materia;
}

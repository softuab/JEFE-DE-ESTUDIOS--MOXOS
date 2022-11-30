/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.VerificarClave;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class ParametrosDocumentosEntrada {

    private Integer id_prg_plan;
    private Integer id_tipo_evaluacion;
    @NotNull(message = "Debe selecionar su facultad")
    private Integer id_facultad;
    @NotNull(message = "Debe selecionar su programa")
    private Integer id_programa;
    private Integer id_departamento;
    private Integer periodo;
    private Integer gestion; 
}

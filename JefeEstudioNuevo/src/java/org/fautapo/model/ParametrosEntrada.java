/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.VerificarClave;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class ParametrosEntrada {

    private Integer id_prg_plan;
    private Integer id_tipo_evaluacion;
    private Integer id_facultad;
    private Integer id_programa;
    private Integer id_departamento;
    private Integer periodo;
    private Integer gestion;
    @NotBlank(message = "Debe Introducir su Contraseña")
    @VerificarClave(message = "Contraseña Incorrecta")
    private String clave;

}

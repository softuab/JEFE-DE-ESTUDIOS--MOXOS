/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model.usuarios;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class ParametroEncriptacionModel {

    @NotBlank(message = "Debe seleccionar el tipo de encriptacion")
    private String tipoEncriptacion;
    private Integer id_usuario;
    private Integer id_persona;
    private String accion;
}

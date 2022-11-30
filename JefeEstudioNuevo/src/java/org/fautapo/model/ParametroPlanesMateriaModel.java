/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class ParametroPlanesMateriaModel {

    private Integer id_facultad;
    private Integer id_programa;
    private String acceso;
    @NotBlank(message = "Debe seleccionar el plan")
    private String id_plan;
}

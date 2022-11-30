/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.VerificarClave;

@Getter
@Setter
public class BuscarGruposModel {
    private Integer id_programa;
    private Integer id_tipo_evaluacion;
    @VerificarClave(message = "Elija una opcion")
    private Integer id_prg_plan;
    private Integer gestion;
    private Integer periodo;
}

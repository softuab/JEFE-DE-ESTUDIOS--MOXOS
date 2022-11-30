/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LibretasCierreModel extends LibretasModel {

    private Integer id_facultad;
    private Integer id_departamento;
    private Integer Id_tipo_evaluacion;
    private Integer gestion;
    private Integer periodo;
}

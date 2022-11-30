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
public class BuscarPlanesConvalidacionModel extends BuscarPlanesModel {

    private Integer gestion;
    private Integer periodo;
    private String id_tipo_convalidacion;
}

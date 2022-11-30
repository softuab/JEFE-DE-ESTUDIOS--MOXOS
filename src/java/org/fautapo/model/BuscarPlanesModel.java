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
public class BuscarPlanesModel extends PlanesModel {

    private String tipobusqueda;
    private Integer id_estudiante;
    private String ci;
    private String nombres;
    private String busqueda;
}

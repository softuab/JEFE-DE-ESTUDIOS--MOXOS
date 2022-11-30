/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ListarHistorial {

    private Integer id_programa;
    private Integer id_estudiante;
    private Integer gestion;
    private Integer periodo;
    private String ci;
    private String nombres;
    private String tipobusqueda;
}

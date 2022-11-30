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
public class ComprobarGrupoModel {
    private Integer id_materia;
    private Integer id_grupo;
    private Integer gestion;
    private Integer periodo;
    private String csrfToken;
}

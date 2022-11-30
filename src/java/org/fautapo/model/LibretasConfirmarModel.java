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
public class LibretasConfirmarModel extends LibretasModel {

    private Integer id_modelo_ahorro;
    private Integer id_docente;
    private Integer id_grupo;
    private String nombreDocente;
    private String boton;
    private Integer id_fase;
    private Integer Id_tipo_evaluacion;
    private Integer id_asignacion;
    private Integer id_materia;
    private Integer id_prg_plan;
}

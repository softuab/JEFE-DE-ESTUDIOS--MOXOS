/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MateriasOptativas {

    private Integer id_est_materiaoptativa;
    private Integer id_estudiante;
    private String nombres;
    private String programa;
    private String id_plan;
    private String materia;
    private Integer id_programa;
    private Integer id_materia;
    private Integer id_rol;
    private Integer ult_usuario;
}

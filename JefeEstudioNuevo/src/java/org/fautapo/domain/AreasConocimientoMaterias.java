/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AreasConocimientoMaterias {

    private Integer id_areas_materias;
    private Integer id_materia;
    private String area;
    private String id_estado;
    private Date fec_registro;
    private Date fec_modificacion;
    private Integer ult_usuario;
    private String tipo;
    private String ciclo_materia;
    private String materia;
    private String sigla;
    private String id_plan;
    private Integer id_departamento;
}

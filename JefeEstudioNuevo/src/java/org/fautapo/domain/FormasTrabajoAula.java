/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;

/**
 *
 * @author DBMENESESJ
 */
public class FormasTrabajoAula {

    private int id_prg_a_formas_trabajo_aula;
    private String sigla_formas;
    private String formas;
    private String id_estado;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;
    private int id_dct_programa_analitico;

    public int getId_dct_programa_analitico() {
        return id_dct_programa_analitico;
    }

    public void setId_dct_programa_analitico(int id_dct_programa_analitico) {
        this.id_dct_programa_analitico = id_dct_programa_analitico;
    }
    
    

    public int getId_prg_a_formas_trabajo_aula() {
        return id_prg_a_formas_trabajo_aula;
    }

    public void setId_prg_a_formas_trabajo_aula(int id_prg_a_formas_trabajo_aula) {
        this.id_prg_a_formas_trabajo_aula = id_prg_a_formas_trabajo_aula;
    }

    public String getSigla_formas() {
        return sigla_formas;
    }

    public void setSigla_formas(String sigla_formas) {
        this.sigla_formas = sigla_formas;
    }

    public String getFormas() {
        return formas;
    }

    public void setFormas(String formas) {
        this.formas = formas;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public Date getFec_registro() {
        return fec_registro;
    }

    public void setFec_registro(Date fec_registro) {
        this.fec_registro = fec_registro;
    }

    public Date getFec_modificacion() {
        return fec_modificacion;
    }

    public void setFec_modificacion(Date fec_modificacion) {
        this.fec_modificacion = fec_modificacion;
    }

    public int getUlt_usuario() {
        return ult_usuario;
    }

    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }
    
    
}

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
public class FormasDistribucion {

    private int id_prg_a_formas_distribucion;
    private int id_prg_a_distribucion;
    private int id_prg_a_formas;
    private int horas;
    private String id_estado;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;
    private DistribucionTiempos distribucionTiempos;
    private FormasOrganizacion formas;
    private int id_dct_programa_analitico;

    public int getId_dct_programa_analitico() {
        return id_dct_programa_analitico;
    }

    public void setId_dct_programa_analitico(int id_dct_programa_analitico) {
        this.id_dct_programa_analitico = id_dct_programa_analitico;
    }

    public DistribucionTiempos getDistribucionTiempos() {
        return distribucionTiempos;
    }

    public void setDistribucionTiempos(DistribucionTiempos distribucionTiempos) {
        this.distribucionTiempos = distribucionTiempos;
    }

    public FormasOrganizacion getFormas() {
        return formas;
    }

    public void setFormas(FormasOrganizacion formas) {
        this.formas = formas;
    }

    public int getId_prg_a_formas_distribucion() {
        return id_prg_a_formas_distribucion;
    }

    public void setId_prg_a_formas_distribucion(int id_prg_a_formas_distribucion) {
        this.id_prg_a_formas_distribucion = id_prg_a_formas_distribucion;
    }

    public int getId_prg_a_distribucion() {
        return id_prg_a_distribucion;
    }

    public void setId_prg_a_distribucion(int id_prg_a_distribucion) {
        this.id_prg_a_distribucion = id_prg_a_distribucion;
    }

    public int getId_prg_a_formas() {
        return id_prg_a_formas;
    }

    public void setId_prg_a_formas(int id_prg_a_formas) {
        this.id_prg_a_formas = id_prg_a_formas;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
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

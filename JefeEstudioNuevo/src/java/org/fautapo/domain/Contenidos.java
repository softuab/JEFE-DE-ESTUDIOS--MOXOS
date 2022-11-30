/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;

/**
 *
 * @author FNZABALETAA
 */
public class Contenidos {

    private int id_prg_a_contenido;
    private int id_dct_programa_analitico;
    private String contenido;
    private String objetivo_instructivo;
    private String conocimientos;
    private String habilidades;
    private String valores;
    private String id_estado;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;

    public int getId_prg_a_contenido() {
        return id_prg_a_contenido;
    }

    public void setId_prg_a_contenido(int id_prg_a_contenido) {
        this.id_prg_a_contenido = id_prg_a_contenido;
    }

    public int getId_dct_programa_analitico() {
        return id_dct_programa_analitico;
    }

    public void setId_dct_programa_analitico(int id_dct_programa_analitico) {
        this.id_dct_programa_analitico = id_dct_programa_analitico;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    
    public String getObjetivo_instructivo() {
        return objetivo_instructivo;
    }

    public void setObjetivo_instructivo(String objetivo_instructivo) {
        this.objetivo_instructivo = objetivo_instructivo;
    }

    public String getConocimientos() {
        return conocimientos;
    }

    public void setConocimientos(String conocimientos) {
        this.conocimientos = conocimientos;
    }

    public String getHabilidades() {
        return habilidades;
    }

    public void setHabilidades(String habilidades) {
        this.habilidades = habilidades;
    }

    public String getValores() {
        return valores;
    }

    public void setValores(String valores) {
        this.valores = valores;
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

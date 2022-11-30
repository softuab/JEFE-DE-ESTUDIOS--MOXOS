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
public class BiBliografia {


    private int id_prg_a_bibliografia;
    private int id_dct_programa_analitico;
    private String autor;
    private String titulo;
    private String lugar_edicion;
    private String anio;
    private String paginas;
    private String ubicacion;
    private String id_estado;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;
    /**
     * @return the id_prg_a_bibliografia
     */
    public int getId_prg_a_bibliografia() {
        return id_prg_a_bibliografia;
    }

    /**
     * @param id_prg_a_bibliografia the id_prg_a_bibliografia to set
     */
    public void setId_prg_a_bibliografia(int id_prg_a_bibliografia) {
        this.id_prg_a_bibliografia = id_prg_a_bibliografia;
    }

    /**
     * @return the id_dct_programa_analitico
     */
    public int getId_dct_programa_analitico() {
        return id_dct_programa_analitico;
    }

    /**
     * @param id_dct_programa_analitico the id_dct_programa_analitico to set
     */
    public void setId_dct_programa_analitico(int id_dct_programa_analitico) {
        this.id_dct_programa_analitico = id_dct_programa_analitico;
    }

    /**
     * @return the autor
     */
    public String getAutor() {
        return autor;
    }

    /**
     * @param autor the autor to set
     */
    public void setAutor(String autor) {
        this.autor = autor;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the lugar_edicion
     */
    public String getLugar_edicion() {
        return lugar_edicion;
    }

    /**
     * @param lugar_edicion the lugar_edicion to set
     */
    public void setLugar_edicion(String lugar_edicion) {
        this.lugar_edicion = lugar_edicion;
    }

    /**
     * @return the anio
     */
    public String getAnio() {
        return anio;
    }

    /**
     * @param anio the anio to set
     */
    public void setAnio(String anio) {
        this.anio = anio;
    }

    /**
     * @return the paginas
     */
    public String getPaginas() {
        return paginas;
    }

    /**
     * @param paginas the paginas to set
     */
    public void setPaginas(String paginas) {
        this.paginas = paginas;
    }

    /**
     * @return the ubicacion
     */
    public String getUbicacion() {
        return ubicacion;
    }

    /**
     * @param ubicacion the ubicacion to set
     */
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    /**
     * @return the id_estado
     */
    public String getId_estado() {
        return id_estado;
    }

    /**
     * @param id_estado the id_estado to set
     */
    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    /**
     * @return the fec_registro
     */
    public Date getFec_registro() {
        return fec_registro;
    }

    /**
     * @param fec_registro the fec_registro to set
     */
    public void setFec_registro(Date fec_registro) {
        this.fec_registro = fec_registro;
    }

    /**
     * @return the fec_modificacion
     */
    public Date getFec_modificacion() {
        return fec_modificacion;
    }

    /**
     * @param fec_modificacion the fec_modificacion to set
     */
    public void setFec_modificacion(Date fec_modificacion) {
        this.fec_modificacion = fec_modificacion;
    }

    /**
     * @return the ult_usuario
     */
    public int getUlt_usuario() {
        return ult_usuario;
    }

    /**
     * @param ult_usuario the ult_usuario to set
     */
    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }
}

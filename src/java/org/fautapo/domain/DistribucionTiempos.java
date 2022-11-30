/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;
import java.util.List;

public class DistribucionTiempos {

    private int id_prg_a_distribucion;
    private int id_dct_programa_analitico;
    private int id_prg_a_contenido;
    private String id_estado;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;
    private int id_prg_a_formas_trabajo_aula;
    private Contenidos contenidos;
    private FormasTrabajoAula formatrabajoaula;
    private List<FormasDistribucion> formasdistribucion;
    private int totalhoras;
    private int subtotaltotalhoras;

    public int getId_prg_a_distribucion() {
        return id_prg_a_distribucion;
    }

    public void setId_prg_a_distribucion(int id_prg_a_distribucion) {
        this.id_prg_a_distribucion = id_prg_a_distribucion;
    }

    public int getId_dct_programa_analitico() {
        return id_dct_programa_analitico;
    }

    public void setId_dct_programa_analitico(int id_dct_programa_analitico) {
        this.id_dct_programa_analitico = id_dct_programa_analitico;
    }

    public int getId_prg_a_contenido() {
        return id_prg_a_contenido;
    }

    public void setId_prg_a_contenido(int id_prg_a_contenido) {
        this.id_prg_a_contenido = id_prg_a_contenido;
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

    public int getId_prg_a_formas_trabajo_aula() {
        return id_prg_a_formas_trabajo_aula;
    }

    public void setId_prg_a_formas_trabajo_aula(int id_prg_a_formas_trabajo_aula) {
        this.id_prg_a_formas_trabajo_aula = id_prg_a_formas_trabajo_aula;
    }

    public Contenidos getContenidos() {
        return contenidos;
    }

    public void setContenidos(Contenidos contenidos) {
        this.contenidos = contenidos;
    }

    public FormasTrabajoAula getFormatrabajoaula() {
        return formatrabajoaula;
    }

    public void setFormatrabajoaula(FormasTrabajoAula formatrabajoaula) {
        this.formatrabajoaula = formatrabajoaula;
    }

    public List<FormasDistribucion> getFormasdistribucion() {
        return formasdistribucion;
    }

    public void setFormasdistribucion(List<FormasDistribucion> formasdistribucion) {
        this.formasdistribucion = formasdistribucion;
    }

    public int getTotalhoras() {
        if (formasdistribucion != null) {
            totalhoras = formasdistribucion.stream().mapToInt(p -> p.getHoras()).sum();
            return totalhoras;
        } else {
            return 0;
        }
    }

    public int getSubtotaltotalhoras(int id) {
        subtotaltotalhoras = formasdistribucion.stream().filter(p -> p.getId_prg_a_formas() == id).mapToInt(p -> p.getHoras()).sum();
        return subtotaltotalhoras;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;

/**
 *
 * @author hp
 */
public class DepartamentoGrupos {

    private int id_dpto_grupo;
    private int id_grupo;
    private int id_materia;
    private int id_modelo_ahorro;
    private int id_departamento;
    private int id_tipo_evaluacion;
    private String id_estado;
    private int gestion;
    private int periodo;
    private int cupo_actual;
    private int cupo_max;
    private double horas;
    private int nro_resolucion;
    private Date fec_resolucion;
    private Date fec_registro;
    private Date fec_modificacion;
    private int id_rol;
    private int ult_usuario;
    private int id_grupos_permitidos;

    public int getId_dpto_grupo() {
        return id_dpto_grupo;
    }

    public void setId_dpto_grupo(int id_dpto_grupo) {
        this.id_dpto_grupo = id_dpto_grupo;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public int getId_modelo_ahorro() {
        return id_modelo_ahorro;
    }

    public void setId_modelo_ahorro(int id_modelo_ahorro) {
        this.id_modelo_ahorro = id_modelo_ahorro;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getId_tipo_evaluacion() {
        return id_tipo_evaluacion;
    }

    public void setId_tipo_evaluacion(int id_tipo_evaluacion) {
        this.id_tipo_evaluacion = id_tipo_evaluacion;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public int getGestion() {
        return gestion;
    }

    public void setGestion(int gestion) {
        this.gestion = gestion;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public int getCupo_actual() {
        return cupo_actual;
    }

    public void setCupo_actual(int cupo_actual) {
        this.cupo_actual = cupo_actual;
    }

    public int getCupo_max() {
        return cupo_max;
    }

    public void setCupo_max(int cupo_max) {
        this.cupo_max = cupo_max;
    }

    public double getHoras() {
        return horas;
    }

    public void setHoras(double horas) {
        this.horas = horas;
    }

    public int getNro_resolucion() {
        return nro_resolucion;
    }

    public void setNro_resolucion(int nro_resolucion) {
        this.nro_resolucion = nro_resolucion;
    }

    public Date getFec_resolucion() {
        return fec_resolucion;
    }

    public void setFec_resolucion(Date fec_resolucion) {
        this.fec_resolucion = fec_resolucion;
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

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getUlt_usuario() {
        return ult_usuario;
    }

    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }

    public int getId_grupos_permitidos() {
        return id_grupos_permitidos;
    }

    public void setId_grupos_permitidos(int id_grupos_permitidos) {
        this.id_grupos_permitidos = id_grupos_permitidos;
    }

}

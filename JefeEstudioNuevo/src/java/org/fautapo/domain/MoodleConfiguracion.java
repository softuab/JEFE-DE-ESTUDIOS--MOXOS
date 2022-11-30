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
public class MoodleConfiguracion {

    private long id_condiguracion_moodle;
    private String moodle_host;
    private String moodle_key;
    private int moodle_rol_teacher;
    private int moodle_rol_student;
    private String moodle_detalle;
    private String id_estado;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;

    public void setId_condiguracion_moodle(long id_condiguracion_moodle) {
        this.id_condiguracion_moodle = id_condiguracion_moodle;
    }

    public void setMoodle_host(String moodle_host) {
        this.moodle_host = moodle_host;
    }

    public void setMoodle_key(String moodle_key) {
        this.moodle_key = moodle_key;
    }

    public void setMoodle_rol_teacher(int moodle_rol_teacher) {
        this.moodle_rol_teacher = moodle_rol_teacher;
    }

    public void setMoodle_rol_student(int moodle_rol_student) {
        this.moodle_rol_student = moodle_rol_student;
    }

    public void setMoodle_detalle(String moodle_detalle) {
        this.moodle_detalle = moodle_detalle;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public void setFec_registro(Date fec_registro) {
        this.fec_registro = fec_registro;
    }

    public void setFec_modificacion(Date fec_modificacion) {
        this.fec_modificacion = fec_modificacion;
    }

    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }

    public long getId_condiguracion_moodle() {
        return id_condiguracion_moodle;
    }

    public String getMoodle_host() {
        return moodle_host;
    }

    public String getMoodle_key() {
        return moodle_key;
    }

    public int getMoodle_rol_teacher() {
        return moodle_rol_teacher;
    }

    public int getMoodle_rol_student() {
        return moodle_rol_student;
    }

    public String getMoodle_detalle() {
        return moodle_detalle;
    }

    public String getId_estado() {
        return id_estado;
    }

    public Date getFec_registro() {
        return fec_registro;
    }

    public Date getFec_modificacion() {
        return fec_modificacion;
    }

    public int getUlt_usuario() {
        return ult_usuario;
    }
    
    
}

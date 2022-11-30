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
public class PersonaFormacionAcademica {

    private int id_formacion;
    private int id_persona_kardex;
    private String expedido;
    private Date fechaemision;
    private int id_nivelestudio;
    private int id_profesiones;
    private String descripcion;
    private String url_formacion;
    private String tipotitulo;
    private String numerotitulo;
    private Boolean eseducacionsuperor;
    private String id_estado;
    private Boolean aprobado;
    private String nivelestudio;
    private String detalle_profesion;   
    private String UUID;
    private String imageBase64;

    public String getUUID() {
        return UUID;
    }

    public void setUUID(String UUID) {
        this.UUID = UUID;
    }

    public String getImageBase64() {
        return imageBase64;
    }

    public void setImageBase64(String imageBase64) {
        this.imageBase64 = imageBase64;
    }

    public String getNivelestudio() {
        return nivelestudio;
    }

    public void setNivelestudio(String nivelestudio) {
        this.nivelestudio = nivelestudio;
    }

    public String getDetalle_profesion() {
        return detalle_profesion;
    }

    public void setDetalle_profesion(String detalle_profesion) {
        this.detalle_profesion = detalle_profesion;
    }

    public int getId_formacion() {
        return id_formacion;
    }

    public void setId_formacion(int id_formacion) {
        this.id_formacion = id_formacion;
    }

    public int getId_persona_kardex() {
        return id_persona_kardex;
    }

    public void setId_persona_kardex(int id_persona_kardex) {
        this.id_persona_kardex = id_persona_kardex;
    }

    public String getExpedido() {
        return expedido;
    }

    public void setExpedido(String expedido) {
        this.expedido = expedido;
    }

    public Date getFechaemision() {
        return fechaemision;
    }

    public void setFechaemision(Date fechaemision) {
        this.fechaemision = fechaemision;
    }

    public int getId_nivelestudio() {
        return id_nivelestudio;
    }

    public void setId_nivelestudio(int id_nivelestudio) {
        this.id_nivelestudio = id_nivelestudio;
    }

    public int getId_profesiones() {
        return id_profesiones;
    }

    public void setId_profesiones(int id_profesiones) {
        this.id_profesiones = id_profesiones;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUrl_formacion() {
        return url_formacion;
    }

    public void setUrl_formacion(String url_formacion) {
        this.url_formacion = url_formacion;
    }

    public String getTipotitulo() {
        return tipotitulo;
    }

    public void setTipotitulo(String tipotitulo) {
        this.tipotitulo = tipotitulo;
    }

    public String getNumerotitulo() {
        return numerotitulo;
    }

    public void setNumerotitulo(String numerotitulo) {
        this.numerotitulo = numerotitulo;
    }

    public Boolean getEseducacionsuperor() {
        return eseducacionsuperor;
    }

    public void setEseducacionsuperor(Boolean eseducacionsuperor) {
        this.eseducacionsuperor = eseducacionsuperor;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public Boolean getAprobado() {
        return aprobado;
    }

    public void setAprobado(Boolean aprobado) {
        this.aprobado = aprobado;
    }

}

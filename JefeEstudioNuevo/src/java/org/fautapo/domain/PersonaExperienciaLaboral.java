/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;

public class PersonaExperienciaLaboral {

    private int id_experiencia_laboral;
    private int id_persona_kardex;
    private String institucion;
    private String detalle;
    private String cargoocupado;
    private String refrencia;
    private String calificacion;
    private String url_experiencia;
    private Date inicio;
    private Date fin;
    private String gestion;
    private String tipo_experiencia_laboral;
    private String id_estado;
    private Boolean aprobado;    
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

    public int getId_experiencia_laboral() {
        return id_experiencia_laboral;
    }

    public void setId_experiencia_laboral(int id_experiencia_laboral) {
        this.id_experiencia_laboral = id_experiencia_laboral;
    }

    public int getId_persona_kardex() {
        return id_persona_kardex;
    }

    public void setId_persona_kardex(int id_persona_kardex) {
        this.id_persona_kardex = id_persona_kardex;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getCargoocupado() {
        return cargoocupado;
    }

    public void setCargoocupado(String cargoocupado) {
        this.cargoocupado = cargoocupado;
    }

    public String getRefrencia() {
        return refrencia;
    }

    public void setRefrencia(String refrencia) {
        this.refrencia = refrencia;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    public String getUrl_experiencia() {
        return url_experiencia;
    }

    public void setUrl_experiencia(String url_experiencia) {
        this.url_experiencia = url_experiencia;
    }

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getFin() {
        return fin;
    }

    public void setFin(Date fin) {
        this.fin = fin;
    }

    public String getGestion() {
        return gestion;
    }

    public void setGestion(String gestion) {
        this.gestion = gestion;
    }

    public String getTipo_experiencia_laboral() {
        return tipo_experiencia_laboral;
    }

    public void setTipo_experiencia_laboral(String tipo_experiencia_laboral) {
        this.tipo_experiencia_laboral = tipo_experiencia_laboral;
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

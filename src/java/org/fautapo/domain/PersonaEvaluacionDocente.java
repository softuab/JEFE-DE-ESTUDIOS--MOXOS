/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

/**
 *
 * @author FNZABALETAA
 */
public class PersonaEvaluacionDocente {

    private int id_evaluacion_docente;
    private int id_persona_kardex;
    private String gestion;
    private String periodo;
    private String asignatura;
    private String puntaje;
    private String url_certificado_evaluacion;
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
    public int getId_evaluacion_docente() {
        return id_evaluacion_docente;
    }

    public void setId_evaluacion_docente(int id_evaluacion_docente) {
        this.id_evaluacion_docente = id_evaluacion_docente;
    }

    public int getId_persona_kardex() {
        return id_persona_kardex;
    }

    public void setId_persona_kardex(int id_persona_kardex) {
        this.id_persona_kardex = id_persona_kardex;
    }

    public String getGestion() {
        return gestion;
    }

    public void setGestion(String gestion) {
        this.gestion = gestion;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public String getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(String puntaje) {
        this.puntaje = puntaje;
    }

    public String getUrl_certificado_evaluacion() {
        return url_certificado_evaluacion;
    }

    public void setUrl_certificado_evaluacion(String url_certificado_evaluacion) {
        this.url_certificado_evaluacion = url_certificado_evaluacion;
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

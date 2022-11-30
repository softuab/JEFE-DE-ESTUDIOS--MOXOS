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
public class PersonaCursosRealizados {

    private int id_persona_kardex;
    private int id_cursos_realizados;
    private String expedido_institucion;
    private Date fechapresentacion;
    private String nrotitulo;
    private String detalle;
    private String url_cursos;
    private String horas_academicas;
    private String tipo_eventos;
    private String duracion;
    private String id_estado;
    private Boolean aprobado;
    private String UUID;
    private String imageBase64;
    private String tipoorganizacion;

    public String getTipoorganizacion() {
        return tipoorganizacion;
    }

    public void setTipoorganizacion(String tipoorganizacion) {
        this.tipoorganizacion = tipoorganizacion;
    }

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

    public int getId_persona_kardex() {
        return id_persona_kardex;
    }

    public void setId_persona_kardex(int id_persona_kardex) {
        this.id_persona_kardex = id_persona_kardex;
    }

    public int getId_cursos_realizados() {
        return id_cursos_realizados;
    }

    public void setId_cursos_realizados(int id_cursos_realizados) {
        this.id_cursos_realizados = id_cursos_realizados;
    }

    public String getExpedido_institucion() {
        return expedido_institucion;
    }

    public void setExpedido_institucion(String expedido_institucion) {
        this.expedido_institucion = expedido_institucion;
    }

    public Date getFechapresentacion() {
        return fechapresentacion;
    }

    public void setFechapresentacion(Date fechapresentacion) {
        this.fechapresentacion = fechapresentacion;
    }

    public String getNrotitulo() {
        return nrotitulo;
    }

    public void setNrotitulo(String nrotitulo) {
        this.nrotitulo = nrotitulo;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getUrl_cursos() {
        return url_cursos;
    }

    public void setUrl_cursos(String url_cursos) {
        this.url_cursos = url_cursos;
    }

    public String getHoras_academicas() {
        return horas_academicas;
    }

    public void setHoras_academicas(String horas_academicas) {
        this.horas_academicas = horas_academicas;
    }

    public String getTipo_eventos() {
        return tipo_eventos;
    }

    public void setTipo_eventos(String tipo_eventos) {
        this.tipo_eventos = tipo_eventos;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
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

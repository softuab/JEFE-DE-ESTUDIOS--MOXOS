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
public class PersonaProduccionCientifica {

    private int id_produccion_cientifica;
    private int id_persona_kardex;
    private String categoria;
    private String nombre_producto;
    private Date fecha_certificacion;
    private String url_portada_libro;
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

    public int getId_produccion_cientifica() {
        return id_produccion_cientifica;
    }

    public void setId_produccion_cientifica(int id_produccion_cientifica) {
        this.id_produccion_cientifica = id_produccion_cientifica;
    }

    public int getId_persona_kardex() {
        return id_persona_kardex;
    }

    public void setId_persona_kardex(int id_persona_kardex) {
        this.id_persona_kardex = id_persona_kardex;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public Date getFecha_certificacion() {
        return fecha_certificacion;
    }

    public void setFecha_certificacion(Date fecha_certificacion) {
        this.fecha_certificacion = fecha_certificacion;
    }

    public String getUrl_portada_libro() {
        return url_portada_libro;
    }

    public void setUrl_portada_libro(String url_portada_libro) {
        this.url_portada_libro = url_portada_libro;
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

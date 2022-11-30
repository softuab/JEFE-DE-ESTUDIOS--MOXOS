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
public class PersonaIdioma {

    private int id_idioma;
    private String descripcion_idioma;
    private Boolean lee;
    private Boolean escribe;
    private int id_persona_kardex;
    private String url_idioma;
    private Boolean aprobado;
    private String UUID;
    private String imageBase64;

    public String getImageBase64() {
        return imageBase64;
    }

    public void setImageBase64(String imageBase64) {
        this.imageBase64 = imageBase64;
    }

    public String getUUID() {
        return UUID;
    }

    public void setUUID(String UUID) {
        this.UUID = UUID;
    }

    public int getId_idioma() {
        return id_idioma;
    }

    public void setId_idioma(int id_idioma) {
        this.id_idioma = id_idioma;
    }

    public String getDescripcion_idioma() {
        return descripcion_idioma;
    }

    public void setDescripcion_idioma(String descripcion_idioma) {
        this.descripcion_idioma = descripcion_idioma;
    }

    public Boolean getLee() {
        return lee;
    }

    public void setLee(Boolean lee) {
        this.lee = lee;
    }

    public Boolean getEscribe() {
        return escribe;
    }

    public void setEscribe(Boolean escribe) {
        this.escribe = escribe;
    }

    public int getId_persona_kardex() {
        return id_persona_kardex;
    }

    public void setId_persona_kardex(int id_persona_kardex) {
        this.id_persona_kardex = id_persona_kardex;
    }

    public String getUrl_idioma() {
        return url_idioma;
    }

    public void setUrl_idioma(String url_idioma) {
        this.url_idioma = url_idioma;
    }

    public Boolean getAprobado() {
        return aprobado;
    }

    public void setAprobado(Boolean aprobado) {
        this.aprobado = aprobado;
    }

}

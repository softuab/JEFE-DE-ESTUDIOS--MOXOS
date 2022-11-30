/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author FNZABALETAA
 */
public class Tokens {

    public Tokens() {
    }

    private int id_password_reset_token;
    private Date expiry_date;
    private String token;
    private String id_estado;
    private int id_persona;
    private String tipo;

    public int getId_password_reset_token() {
        return id_password_reset_token;
    }

    public void setId_password_reset_token(int id_password_reset_token) {
        this.id_password_reset_token = id_password_reset_token;
    }

    public Date getExpiry_date() {
        return expiry_date;
    }

    public void setExpiry_date(Date expiry_date) {
        this.expiry_date = expiry_date;
    }

    public void setExpiryDate(int minutes) {
        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE, minutes);
        this.expiry_date = now.getTime();
    }

    public boolean isExpired() {
        return new Date().after(this.expiry_date);
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

}

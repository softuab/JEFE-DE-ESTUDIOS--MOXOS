/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;
import java.util.List;
import java.util.Map;

public class Mail {

    private String from;
    private String to;
    private String subject;
    private Map model;

    public Mail() {

    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Map getModel() {
        return model;
    }

    public void setModel(Map model) {
        this.model = model;
    }
}
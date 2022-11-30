/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

/**
 *
 * @author hp
 */
public class ItemModel {

    public ItemModel() {
    }

    private String value;
    private String display;

    public ItemModel(String value, String display) {
        this.value = value;
        this.display = display;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }
}

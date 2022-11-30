/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

/**
 *
 * @author FNZABALETAA
 */
public class ListViewItem {

    private String id;
    private String value;
    private Boolean select;
    private String format;

    public ListViewItem() {
    }

    public ListViewItem(String id, String value) {
        this.id = id;
        this.value = value;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getFormat() {
        if (select) {
            format = "<option selected value='" + this.id + "'>" + this.value + "</option>";
        } else {
            format = "<option value='" + this.id + "'>" + this.value + "</option>";
        }
        return format;
    }

    public void setSelect(Boolean select) {
        this.select = select;
    }

}

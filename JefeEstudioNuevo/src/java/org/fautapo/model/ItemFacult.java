/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.fautapo.model;

/**
 *
 * @author Usuario
 */
public class ItemFacult {

    public ItemFacult() {
    }

    private int id_facultad;
    private int id_programa;
    private String programa;

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }
    

    public int getId_facultad() {
        return id_facultad;
    }

    public void setId_facultad(int id_facultad) {
        this.id_facultad = id_facultad;
    }

    public int getId_programa() {
        return id_programa;
    }

    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
    }

}

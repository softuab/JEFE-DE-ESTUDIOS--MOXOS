package org.fautapo.domain;


public class Menciones extends Programas {

    /* Private Fields */
    private int id_mencion;
    private String id_plan;
    private String mencion;
    private int id_estudiante;
    private String nombres;
    private String programa;

    /* JavaBeans Properties */

    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public int getId_mencion() {
        return id_mencion;
    }

    public void setId_mencion(int id_mencion) {
        this.id_mencion = id_mencion;
    }

    public String getId_plan() {
        return id_plan;
    }

    public void setId_plan(String id_plan) {
        this.id_plan = id_plan;
    }

    public String getMencion() {
        return mencion;
    }

    public void setMencion(String mencion) {
        this.mencion = mencion;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.ArrayList;
import java.util.List;
import java.lang.Math;
import org.fautapo.util.Matematicas;

/**
 *
 * @author FNZABALETAA
 */
public class NotasEstudiante {

    private int Id;
    private String tiponota;
    private double parametropodenracion;
    private int cantidad;
    private List<Double> notas;
    private double promedio;
    private double ponderacion;

    public NotasEstudiante() {
    }

    public NotasEstudiante(String tipoevaluacion, double parametropodenracion,int Id ) {
        this.tiponota = tipoevaluacion;
        this.parametropodenracion = parametropodenracion; 
        this.Id = Id;
        notas = new ArrayList<>();
    }

    public double getParametropodenracion() {
        return parametropodenracion;
    }
    
    public void Add(double nota)
    {
        notas.add(nota);
    }
    public int getId() {
        return Id;
    }

    public String getTipoevaluacion() {
        return tiponota;
    }

    public List<Double> getNotas() {
        return notas;
    }

    public void setNotas(List<Double> notas) {
        this.notas = notas;
    }

    public int getCantidad() {
        cantidad = notas.size();
        return cantidad;
    }

    public double getPromedio() {
        promedio = notas.stream().mapToDouble(p -> p).average().getAsDouble();
        return promedio;
    }

    public double getPonderacion() {
        ponderacion = (getPromedio() * this.parametropodenracion) / 100;
        return  ponderacion;
    }
}

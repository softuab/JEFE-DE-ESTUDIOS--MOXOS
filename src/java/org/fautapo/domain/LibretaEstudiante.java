/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.fautapo.util.Matematicas;

/**
 *
 * @author FNZABALETAA
 */
public class LibretaEstudiante {

    private final double NotaMinimaSegundaInstacia = 51;
    private int ru;
    private String nombrecompleto;
    private List<NotasEstudiante> notas;
    private double notafinal;
    private String observaciones;
    private double notaminimasegundacarrera;

    public double getNotaminimasegundacarrera() {
        return notaminimasegundacarrera;
    }

    public void setNotaminimasegundacarrera(double notaminimasegundacarrera) {
        this.notaminimasegundacarrera = notaminimasegundacarrera;
    }

    public LibretaEstudiante() {
        notas = new ArrayList<>();
    }

    public int getRu() {
        return ru;
    }

    public void Add(NotasEstudiante nota) {
        notas.add(nota);
    }

    public void setRu(int ru) {
        this.ru = ru;
    }

    public String getNombrecompleto() {
        return nombrecompleto;
    }

    public void setNombrecompleto(String nombrecompleto) {
        this.nombrecompleto = nombrecompleto;
    }

    public NotasEstudiante getNotas(int index) {
        if (notas.stream().filter(p -> p.getId() == index).count() != 0) {
            NotasEstudiante nota = notas.stream().filter(p -> p.getId() == index).findFirst().get();
            return nota;
        } else {
            return null;
        }

    }
    public double GetNotaPonderacionSegundaInstacia() {
        NotasEstudiante segundainstacia = notas.stream().filter(p -> p.getId() == 6).count() == 0 ? null : getNotas(6);
        NotasEstudiante examenfinal = notas.stream().filter(p -> p.getId() == 5).count() == 0 ? null : getNotas(5);

        if (segundainstacia != null) {
            if (segundainstacia.getPromedio() >= NotaMinimaSegundaInstacia) {
                return Matematicas.Redondear((segundainstacia.getPromedio() * examenfinal.getParametropodenracion()) / 100, 2);
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    public void setNotas(List<NotasEstudiante> notas) {
        this.notas = notas;
    }

    public double getNotafinal() {

        NotasEstudiante segundainstacia = notas.stream().filter(p -> p.getId() == 6).count() == 0 ? null : getNotas(6);
        NotasEstudiante examenfinal = notas.stream().filter(p -> p.getId() == 5).count() == 0 ? null : getNotas(5);
        NotasEstudiante campoafectivo = notas.stream().filter(p -> p.getId() == 8).count() == 0 ? null : getNotas(8);
        NotasEstudiante parciales = notas.stream().filter(p -> p.getId() == 3).count() == 0 ? null : getNotas(3);

        double notasinfinal = 0;

        if (parciales != null) {
            notasinfinal = campoafectivo == null ? getNotas(4).getPonderacion() + getNotas(3).getPonderacion() : getNotas(4).getPonderacion() + getNotas(3).getPonderacion() + getNotas(8).getPonderacion();
        } else {
            notasinfinal = campoafectivo == null ? 0 : getNotas(8).getPonderacion();
        }
        double notaexemenfinal = examenfinal.getPonderacion();

        if (segundainstacia != null) {
            if (GetNotaPonderacionSegundaInstacia() != 0) {
                notafinal = notasinfinal + GetNotaPonderacionSegundaInstacia() >= 51 ? 51 : notasinfinal + GetNotaPonderacionSegundaInstacia();
            } else {
                notafinal = notasinfinal + notaexemenfinal;
            }
        } else {
            notafinal = notasinfinal + notaexemenfinal;
        }
        return Matematicas.Redondear(notafinal, 2);
    }

    public String getObservaciones() {
        observaciones = Matematicas.Redondear(notafinal, 0) >= 51 ? "APROBADO" : "REPROBADO";
        return observaciones;
    }
}

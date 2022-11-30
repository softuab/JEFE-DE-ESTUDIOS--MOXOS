/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import com.itextpdf.text.Image;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BarcodePDF417;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfTemplate;

/**
 *
 * @author FNZABALETAA
 */
public class LibretasDocente {

    private String docente;
    private String carrera;
    private String facultad;
    private String asignatura;
    private String nivelacademico;
    private String evaluacion;
    private String periodo;
    private String gestion;
    private String grupo;
    private String tipoevaluacion;
    private String observaciones;
    private String lugarimpresion;
    private String nombreinstitucion;
    private String tipoperiodo;
    private int id_fase;

    public String getTipoperiodo() {
        return tipoperiodo;
    }

    public void setTipoperiodo(String tipoperiodo) {
        this.tipoperiodo = tipoperiodo;
    }

    public String getLugarimpresion() {
        return lugarimpresion;
    }

    public void setLugarimpresion(String lugarimpresion) {
        this.lugarimpresion = lugarimpresion;
    }

    public String getNombreinstitucion() {
        return nombreinstitucion;
    }

    public void setNombreinstitucion(String nombreinstitucion) {
        this.nombreinstitucion = nombreinstitucion;
    }
    private double aprobados;
    private double reprobados;
    private double total;
    private Date fechaimpresion;

    public String getTipoevaluacion() {
        return tipoevaluacion;
    }

    public void setTipoevaluacion(String tipoevaluacion) {
        this.tipoevaluacion = tipoevaluacion;
    }

    private List<LibretaEstudiante> planillaestudiantes = new ArrayList<>();

    public String getDocente() {
        return docente;
    }

    public void Add(LibretaEstudiante obj) {
        planillaestudiantes.add(obj);
    }

    public void setDocente(String docente) {
        this.docente = docente;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public String getNivelacademico() {
        return nivelacademico;
    }

    public void setNivelacademico(String nivelacademico) {
        this.nivelacademico = nivelacademico;
    }

    public String getEvaluacion() {
        return evaluacion;
    }

    public void setEvaluacion(String evaluacion) {
        this.evaluacion = evaluacion;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getGestion() {
        return gestion;
    }

    public void setGestion(String gestion) {
        this.gestion = gestion;
    }

    public String getGrupo() {
        return grupo;
    }

    public Image GetBarcode(PdfContentByte cb, float mh, float mw) throws BadElementException {
        BarcodePDF417 pf = new BarcodePDF417();
        pf.setText(this.getDocente()+"|"+this.getAsignatura()+"|"+this.getCarrera()+"|"+this.getFacultad()+"|"+this.getGestion()+"|"+this.getPeriodo()+"|"+this.getGrupo());
        Rectangle size = pf.getBarcodeSize();
        PdfTemplate template = cb.createTemplate(mw * size.getWidth(), mh * size.getHeight());
        pf.placeBarcode(template, BaseColor.BLACK, mh, mw);
        return Image.getInstance(template);
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public double getAprobados() {

        long result = planillaestudiantes.stream().filter(p -> p.getObservaciones().equals("APROBADO")).count();
        aprobados = result;
        return aprobados;
    }

    public double getReprobados() {

        long result = planillaestudiantes.stream().filter(p -> p.getObservaciones().equals("REPROBADO")).count();
        reprobados = result;
        return reprobados;
    }

    public double getTotal() {
        total = reprobados + aprobados;
        return total;
    }

    public Date getFechaimpresion() {
        Calendar fecha = new GregorianCalendar();
        int ano = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int minuto = fecha.get(Calendar.MINUTE);
        int segundo = fecha.get(Calendar.SECOND);
        fechaimpresion = new Date(ano, mes, dia, hora, minuto, segundo);
        return fechaimpresion;
    }

    public List<LibretaEstudiante> getPlanillaestudiantes() {
        return planillaestudiantes;
    }

    public void setPlanillaestudiantes(List<LibretaEstudiante> planillaestudiantes) {
        this.planillaestudiantes = planillaestudiantes;
    }

    public int getId_fase() {
        return id_fase;
    }

    public void setId_fase(int id_fase) {
        this.id_fase = id_fase;
    }

}

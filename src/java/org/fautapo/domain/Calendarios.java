package org.fautapo.domain;

import java.util.Date;
import org.fautapo.domain.Departamentos;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public class Calendarios extends Departamentos {

    /* Private Fields */
    private int id_programa;
    private String tabla;
    private String fec_inicio;
    private String fec_fin;
    private int id_docente;
    private String tipo_evaluacion;
    private String programa;
    private String tipo_nota;
    private int nro_tipo_nota;
    private Date fecha_inicio;
    private Date fecha_limite;

    /* JavaBeans Properties */
    public int getId_docente() {
        return id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public String getTipo_evaluacion() {
        return tipo_evaluacion;
    }

    public void setTipo_evaluacion(String tipo_evaluacion) {
        this.tipo_evaluacion = tipo_evaluacion;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public String getTipo_nota() {
        return tipo_nota;
    }

    public void setTipo_nota(String tipo_nota) {
        this.tipo_nota = tipo_nota;
    }

    public int getNro_tipo_nota() {
        return nro_tipo_nota;
    }

    public void setNro_tipo_nota(int nro_tipo_nota) {
        this.nro_tipo_nota = nro_tipo_nota;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_limite() {
        return fecha_limite;
    }

    public void setFecha_limite(Date fecha_limite) {
        this.fecha_limite = fecha_limite;
    }

    public int getId_programa() {
        return id_programa;
    }

    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
    }

    public String getTabla() {
        return tabla;
    }

    public void setTabla(String tabla) {
        this.tabla = tabla;
    }

    public String getFec_inicio() {
        return fec_inicio;
    }

    public void setFec_inicio(String fec_inicio) {
        this.fec_inicio = fec_inicio;
    }

    public String getFec_fin() {
        return fec_fin;
    }

    public void setFec_fin(String fec_fin) {
        this.fec_fin = fec_fin;
    }

}

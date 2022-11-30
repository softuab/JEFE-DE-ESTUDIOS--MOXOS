package org.fautapo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.fautapo.domain.Grupos;
import org.fautapo.domain.Personas;

public class Libretas extends Grupos {

    /* Private Fields */
    private int id_fase;
    private String fase;
    private String descripcion;
    private int cantidad;
    private int ponderacion;
    private int id_tipo_nota;
    private String tipo_nota;
    private int id_evaluacion;
    private int id_tipo_evaluacion;
    private String tipo_evaluacion;
    private int id_tipo_grado;
    private int padre;
    private int id_tipo_docente;
    private int id_modelo_fase;
    private double nota;
    private List notas;
    private List notafinalfase;
    private List faseponderaciones;
    private List ponderaciones;
    private List notafinal;
    private int id_docente;
    private int ponderacionmodelofase;
    private float ponderacionmodelofase1;
    private float ponderacion1;
    private float nota_ponderada;
    private String observacion;
    private float nota_semi;
    private String nombres;
    private String nombre;
    private int nro_nota;
    private double nota_aprobacion;
    private int id_rol;
    private int id_departamento;
    private int id_persona;

    private int id_estudiante;
    private int periodo;
    private int gestion;
    private String cod_l;
    private String cod_n;
    private String nota_literal;
    private int id_nota;
    private int id_modelo_ahorro;
    private List lbr_tipos_notas;
    private int id_prg_grado_academico;
    private int id_grado_academico;
    private String grado_academico;
    private int id_lbr_tipo_nota;
    private boolean habilitado;
    private int id_lbr_fase;
    private List materias;
    private int nro_asignaciones;
    private int id_libreta;
    private int id_matricula;
    private String literal;
    private int numero;
    private boolean bandera;
    private double nota_final;
    private double nota_final_ponderada;
    private String sigla;
    private int nivel_academico;
    private String materia;
    private String fec_actual;
    private int nro_tipo_nota;
    private String fecha_inicio;
    private String fecha_limite;
    private String paterno;
    private String materno;
    private String dip;
    private String id_plan;
    private String grupo;
    private int permitidomodificar;
    private String ip;
    private String ubicacion;
    private String detalle_dispositivo;

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getDetalle_dispositivo() {
        return detalle_dispositivo;
    }

    public void setDetalle_dispositivo(String detalle_dispositivo) {
        this.detalle_dispositivo = detalle_dispositivo;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPermitidomodificar() {
        return permitidomodificar;
    }

    public void setPermitidomodificar(int permitidomodificar) {
        this.permitidomodificar = permitidomodificar;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    /* JavaBeans Properties */
    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public String getdip() {
        return dip;
    }

    public void setdip(String dip) {
        this.dip = dip;
    }

    public String getId_plan() {
        return id_plan;
    }

    public void setId_plan(String id_plan) {
        this.id_plan = id_plan;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_limite() {
        return fecha_limite;
    }

    public void setFecha_limite(String fecha_limite) {
        this.fecha_limite = fecha_limite;
    }

    public String getfec_actual() {
        return this.fec_actual;
    }

    public void setfec_actual(String fec_actual) {
        this.fec_actual = fec_actual;
    }

    public int getnro_tipo_nota() {
        return this.nro_tipo_nota;
    }

    public void setnro_tipo_nota(int nro_tipo_nota) {
        this.nro_tipo_nota = nro_tipo_nota;
    }

    public String getSigla() {
        return this.sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public int getNivel_academico() {
        return this.nivel_academico;
    }

    public void setNivel_academico(int nivel_academico) {
        this.nivel_academico = nivel_academico;
    }

    public String getMateria() {
        return this.materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public double getNota_final_ponderada() {
        return this.nota_final_ponderada;
    }

    public void setNota_final_ponderada(int nota_final_ponderada) {
        this.nota_final_ponderada = nota_final_ponderada;
    }

    public int getId_fase() {
        return this.id_fase;
    }

    public void setId_fase(int id_fase) {
        this.id_fase = id_fase;
    }

    public String getFase() {
        return this.fase;
    }

    public void setFase(String fase) {
        this.fase = fase;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPonderacion() {
        return this.ponderacion;
    }

    public void setPonderacion(int ponderacion) {
        this.ponderacion = ponderacion;
    }

    public int getId_tipo_nota() {
        return this.id_tipo_nota;
    }

    public void setId_tipo_nota(int id_tipo_nota) {
        this.id_tipo_nota = id_tipo_nota;
    }

    public String getTipo_nota() {
        return this.tipo_nota;
    }

    public void setTipo_nota(String tipo_nota) {
        this.tipo_nota = tipo_nota;
    }

    public int getId_evaluacion() {
        return this.id_evaluacion;
    }

    public void setId_evaluacion(int id_evaluacion) {
        this.id_evaluacion = id_evaluacion;
    }

    public int getId_tipo_evaluacion() {
        return this.id_tipo_evaluacion;
    }

    public void setId_tipo_evaluacion(int id_tipo_evaluacion) {
        this.id_tipo_evaluacion = id_tipo_evaluacion;
    }

    public String getTipo_evaluacion() {
        return this.tipo_evaluacion;
    }

    public void setTipo_evaluacion(String tipo_evaluacion) {
        this.tipo_evaluacion = tipo_evaluacion;
    }

    public int getId_tipo_grado() {
        return this.id_tipo_grado;
    }

    public void setId_tipo_grado(int id_tipo_grado) {
        this.id_tipo_grado = id_tipo_grado;
    }

    public int getPadre() {
        return this.padre;
    }

    public void setPadre(int padre) {
        this.padre = padre;
    }

    public int getId_tipo_docente() {
        return this.id_tipo_docente;
    }

    public void setId_tipo_docente(int id_tipo_docente) {
        this.id_tipo_docente = id_tipo_docente;
    }

    public int getId_modelo_fase() {
        return this.id_modelo_fase;
    }

    public void setId_modelo_fase(int id_modelo_fase) {
        this.id_modelo_fase = id_modelo_fase;
    }

    public double getNota() {
        return this.nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public List getNotas() {
        return notas;
    }

    public void setNotas(List notas) {
        this.notas = notas;
    }

    public List getNotafinalfase() {
        return notafinalfase;
    }

    public void setNotafinalfase(List notafinalfase) {
        this.notafinalfase = notafinalfase;
    }

    public List getFaseponderaciones() {
        return faseponderaciones;
    }

    public void setFaseponderaciones(List faseponderaciones) {
        this.faseponderaciones = faseponderaciones;
    }

    public List getPonderaciones() {
        return ponderaciones;
    }

    public void setPonderaciones(List ponderaciones) {
        this.ponderaciones = ponderaciones;
    }

    public List getNotafinal() {
        return notafinal;
    }

    public void setNotafinal(List notafinal) {
        this.notafinal = notafinal;
    }

    public int getId_docente() {
        return this.id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public int getPonderacionmodelofase() {
        return this.ponderacionmodelofase;
    }

    public void setPonderacionmodelofase(int ponderacionmodelofase) {
        this.ponderacionmodelofase = ponderacionmodelofase;
    }

    public float getPonderacionmodelofase1() {
        return ponderacionmodelofase1;
    }

    public void setPonderacionmodelofase1(float ponderacionmodelofase1) {
        this.ponderacionmodelofase1 = ponderacionmodelofase1;
    }

    public float getPonderacion1() {
        return ponderacion1;
    }

    public void setPonderacion1(float ponderacion1) {
        this.ponderacion1 = ponderacion1;
    }

    public float getNota_ponderada() {
        return nota_ponderada;
    }

    public void setNota_ponderada(float nota_ponderada) {
        this.nota_ponderada = nota_ponderada;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public float getNota_semi() {
        return nota_semi;
    }

    public void setNota_semi(float nota_semi) {
        this.nota_semi = nota_semi;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public int getNro_nota() {
        return this.nro_nota;
    }

    public void setNro_nota(int nro_nota) {
        this.nro_nota = nro_nota;
    }

    public double getNota_aprobacion() {
        return this.nota_aprobacion;
    }

    public void setNota_aprobacion(double nota_aprobacion) {
        this.nota_aprobacion = nota_aprobacion;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public int getGestion() {
        return gestion;
    }

    public void setGestion(int gestion) {
        this.gestion = gestion;
    }

    public String getCod_l() {
        return cod_l;
    }

    public void setCod_l(String cod_l) {
        this.cod_l = cod_l;
    }

    public String getCod_n() {
        return cod_n;
    }

    public void setCod_n(String cod_n) {
        this.cod_n = cod_n;
    }

    public String getNota_literal() {
        return nota_literal;
    }

    public void setNota_literal(String nota_literal) {
        this.nota_literal = nota_literal;
    }

    public int getId_nota() {
        return id_nota;
    }

    public void setId_nota(int id_nota) {
        this.id_nota = id_nota;
    }

    public List getLbr_tipos_notas() {
        return lbr_tipos_notas;
    }

    public void setLbr_tipos_notas(List lbr_tipos_notas) {
        this.lbr_tipos_notas = lbr_tipos_notas;
    }

    public int getId_modelo_ahorro() {
        return id_modelo_ahorro;
    }

    public void setId_modelo_ahorro(int id_modelo_ahorro) {
        this.id_modelo_ahorro = id_modelo_ahorro;
    }

    public int getId_grado_academico() {
        return id_grado_academico;
    }

    public void setId_grado_academico(int id_grado_academico) {
        this.id_grado_academico = id_grado_academico;
    }

    public int getId_prg_grado_academico() {
        return id_prg_grado_academico;
    }

    public void setId_prg_grado_academico(int id_prg_grado_academico) {
        this.id_prg_grado_academico = id_prg_grado_academico;
    }

    public String getGrado_academico() {
        return grado_academico;
    }

    public void setGrado_academico(String grado_academico) {
        this.grado_academico = grado_academico;
    }

    public int getId_lbr_tipo_nota() {
        return id_lbr_tipo_nota;
    }

    public void setId_lbr_tipo_nota(int id_lbr_tipo_nota) {
        this.id_lbr_tipo_nota = id_lbr_tipo_nota;
    }

    public boolean getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }

    public int getId_lbr_fase() {
        return id_lbr_fase;
    }

    public void setId_lbr_fase(int id_lbr_fase) {
        this.id_lbr_fase = id_lbr_fase;
    }

    public List getMaterias() {
        return materias;
    }

    public void setMaterias(List materias) {
        this.materias = materias;
    }

    public int getNro_asignaciones() {
        return nro_asignaciones;
    }

    public void setNro_asignaciones(int nro_asignaciones) {
        this.nro_asignaciones = nro_asignaciones;
    }

    public int getId_libreta() {
        return id_libreta;
    }

    public void setId_libreta(int id_libreta) {
        this.id_libreta = id_libreta;
    }

    public int getId_matricula() {
        return id_matricula;
    }

    public void setId_matricula(int id_matricula) {
        this.id_matricula = id_matricula;
    }

    public String getLiteral() {
        return this.literal;
    }

    public void setLiteral(String literal) {
        this.literal = literal;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public boolean getBandera() {
        return bandera;
    }

    public void setBandera(boolean bandera) {
        this.bandera = bandera;
    }

    public double getNota_final() {
        return nota_final;
    }

    public void setNota_final(double nota_final) {
        this.nota_final = nota_final;
    }

}

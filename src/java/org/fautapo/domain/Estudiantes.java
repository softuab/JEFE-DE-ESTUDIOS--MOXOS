package org.fautapo.domain;

import org.fautapo.domain.Personas;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.lang.String;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-06
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-06
 */
public class Estudiantes extends Personas {

    /* Private Fields */
    private int id_estudiante;
    private int id_programa;
    private String id_plan;
    private String fec_inicio;
    private String fec_fin;
    private int id_grado;
    private int id_tipo_grado;
    private String tipo_grado;
    private int id_tipo_estudiante;
    private String programa;
    private int id_tipo_admision;
    private Date fec_inscripcion;
    private Date fec_egreso;
    private int id_matricula;
    private String rol;
    private int id_tipo_documento;
    private String tipo_documento;
    private int id_tipo_clasificacion;
    private String tipo_clasificacion;
    private int id_grupo;
    private String grupo;
    private int id_materia;
    private String materia;
    private String sigla;
    private boolean vigente;
    private int id_tipo_graduacion;
    private String tipo_graduacion;
    private String tipo_admision;
    private int id_facultad;
    private String facultad;
    private int id_est_adjunto;
    private String nombre_archivo;
    private String adjunto;
    private int cantidad;
    private int aprobados;
    private int reprobados;
    private int abandonos;
    private String tipo_sexo;
    private String nacionalidad;
    private String tipo_estudiante;
    private String departamento;
    private int plan;
    private int notaa;
    private int notar;
    private int notaab;
    private int id_regularizacion;
    private int id_tipo_regularizacion;
    private String tipo_regularizacion;
    private int id_perfil;
    private double costo;
    private int id_tipo_evaluacion;
    private int id_modelo_ahorro;
    private int id_programacion;
    private String tipo_evaluacion;
    private String periodogestion;
    private int nivel_academico;
    private int id_programa_ant;
    private String fecha_ini;
    private String fecha_fin;
    private int id_est_clasificacion;
    private int id_tipo_descuento;
    private int id_clf_tipo_documento;
    private int id_est_deuda;
    private int id_tipo_deuda;
    private String tipo_deuda;
    private boolean regularizado;
    private boolean cancelado;
    private float promedio;
    private String modalidad_beca;
    private Date fecha_i;
    private Date fecha_f;
    private String carga_horaria;
    private int id_ubicacion_organica;
    private int cant_materias;
    private List estudiantes;
    private int ins_sede;
    private int id_tipo_materia;
    private Integer id_desconcentrado;

    //Aumentado d
    private Date fec_ingreso;
    private int id_persona;
    private String nombres;
    private String transaccion;
    //Aumentado d

    //Aumentado CODE
    private int id_sede;
    private int id_concepto;
    private String sede;
    private int nro_certificado;
    private int gestion_certificado;
    private String nrocertificado_gestion;
    private String nro_transaccion;
    private int id_notas_certificados;
    //private String facultad;
    private String carrera;
    private String nivel;
    private int nivel2;
    private String Plan;
    private String planes;
    private String periodo_academico;
    private int ru;
    private int ci;
    private String estudiante;
    private String obs;
    private int reimpresiones;
    //Aumentado notas CODE
    public int id_certificados_generados;
    public String nro_certificado2;
    //public String nro_certificado_generado;
    //public String sigla;
    //public String nivel;
    public String asignatura;
    public double numeral;
    public String literal;
    //public String tipo_evaluacion;
    public String observacion;
    public String id_estado;
    private String sede_desconcentrada;

    public String getSede_desconcentrada() {
        return sede_desconcentrada;
    }

    public void setSede_desconcentrada(String sede_desconcentrada) {
        this.sede_desconcentrada = sede_desconcentrada;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public Integer getId_desconcentrado() {
        return id_desconcentrado;
    }

    public void setId_desconcentrado(Integer id_desconcentrado) {
        this.id_desconcentrado = id_desconcentrado;
    }

    public int getid_sede() {
        return id_sede;
    }

    public void setid_sede(int id_sede) {
        this.id_sede = id_sede;
    }

    public int getid_concepto() {
        return id_concepto;
    }

    public void setid_concepto(int id_concepto) {
        this.id_concepto = id_concepto;
    }

    public int getid_notas_certificados() {
        return id_notas_certificados;
    }

    public void setid_notas_certificados(int id_notas_certificados) {
        this.id_notas_certificados = id_notas_certificados;
    }

    /*public int nro_certificado_generado() { return nro_certificado_generado; }
  public void setnro_certificado_generado(int nro_certificado_generado) { this.nro_certificado_generado = nro_certificado_generado; }*/
    public String getSede() {
        return sede;
    }

    public void setsede(String sede) {
        this.sede = sede;
    }

    public int getnro_certificado() {
        return nro_certificado;
    }

    public void setnro_certificado(int nro_certificado) {
        this.nro_certificado = nro_certificado;
    }

    public int getgestion_certificado() {
        return gestion_certificado;
    }

    public void setgestion_certificado(int gestion_certificado) {
        this.gestion_certificado = gestion_certificado;
    }

    public String getNrocertificado_gestion() {
        return nrocertificado_gestion;
    }

    public void setNrocertificado_gestion(String nrocertificado_gestion) {
        this.nrocertificado_gestion = nrocertificado_gestion;
    }

    public String getnro_transaccion() {
        return nro_transaccion;
    }

    public void setnro_transaccion(String nro_transaccion) {
        this.nro_transaccion = nro_transaccion;
    }
    //public String getfacultad() { return facultad; }
    //public void setfacultad(String facultad) { this.facultad = facultad; }

    public String getcarrera() {
        return carrera;
    }

    public void setcarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getnivel() {
        return nivel;
    }

    public void setnivel(String nivel) {
        this.nivel = nivel;
    }

    public int getnivel2() {
        return nivel2;
    }

    public void setnivel2(int nivel2) {
        this.nivel2 = nivel2;
    }

    public String getplanes() {
        return Plan;
    }

    public void setplanes(String Plan) {
        this.Plan = Plan;
    }

    public String getPlanes2() {
        return planes;
    }

    public void setPlanes2(String planes) {
        this.planes = planes;
    }

    public String getperiodo_academico() {
        return periodo_academico;
    }

    public void setperiodo_academico(String periodo_academico) {
        this.periodo_academico = periodo_academico;
    }

    public int getru() {
        return ru;
    }

    public void setRu(int ru) {
        this.ru = ru;
    }

    public int getci() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getestudiante() {
        return estudiante;
    }

    public void setestudiante(String estudiante) {
        this.estudiante = estudiante;
    }

    public String getobs() {
        return obs;
    }

    public void setobs(String obs) {
        this.obs = obs;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public int getreimpresiones() {
        return reimpresiones;
    }

    public void setreimpresiones(int reimpresiones) {
        this.reimpresiones = reimpresiones;
    }

    public int getid_certificados_generados() {
        return id_certificados_generados;
    }

    public void setid_certificados_generados(int id_certificados_generados) {
        this.id_certificados_generados = id_certificados_generados;
    }

    public String getNro_certificado2() {
        return nro_certificado2;
    }

    public void setNro_certificado2(String nro_certificado2) {
        this.nro_certificado2 = nro_certificado2;
    }

    public String getasignatura() {
        return asignatura;
    }

    public void setasignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public double getnumeral() {
        return numeral;
    }

    public void setnumeral(double numeral) {
        this.numeral = numeral;
    }

    public String getliteral() {
        return literal;
    }

    public void setliteral(String literal) {
        this.literal = literal;
    }

    //Aumentado CODE
    public int getIns_sede() {
        return ins_sede;
    }

    public void setIns_sede(int ins_sede) {
        this.ins_sede = ins_sede;
    }

    public String getTransaccion() {
        return transaccion;
    }

    public void setTransaccion(String transaccion) {
        this.transaccion = transaccion;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public Date getFec_ingreso() {
        return fec_ingreso;
    }

    public void setFec_ingreso(Date fec_ingreso) {
        this.fec_ingreso = fec_ingreso;
    }

    /* JavaBeans Properties */
    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public String getId_plan() {
        return id_plan;
    }

    public void setId_plan(String id_plan) {
        this.id_plan = id_plan;
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

    public int getId_grado() {
        return id_grado;
    }

    public void setId_grado(int id_grado) {
        this.id_grado = id_grado;
    }

    public int getId_programa() {
        return id_programa;
    }

    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
    }

    public int getId_tipo_admision() {
        return id_tipo_admision;
    }

    public void setId_tipo_admision(int id_tipo_admision) {
        this.id_tipo_admision = id_tipo_admision;
    }

    public Date getFec_inscripcion() {
        return fec_inscripcion;
    }

    public void setFec_inscripcion(Date fec_inscripcion) {
        this.fec_inscripcion = fec_inscripcion;
    }

    public Date getFec_egreso() {
        return fec_egreso;
    }

    public void setFec_egreso(Date fec_egreso) {
        this.fec_egreso = fec_egreso;
    }

    public int getId_tipo_grado() {
        return id_tipo_grado;
    }

    public void setId_tipo_grado(int id_tipo_grado) {
        this.id_tipo_grado = id_tipo_grado;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public int getId_matricula() {
        return id_matricula;
    }

    public void setId_matricula(int id_matricula) {
        this.id_matricula = id_matricula;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getTipo_grado() {
        return tipo_grado;
    }

    public void setTipo_grado(String tipo_grado) {
        this.tipo_grado = tipo_grado;
    }

    public int getId_tipo_estudiante() {
        return id_tipo_estudiante;
    }

    public void setId_tipo_estudiante(int id_tipo_estudiante) {
        this.id_tipo_estudiante = id_tipo_estudiante;
    }

    public int getId_tipo_documento() {
        return id_tipo_documento;
    }

    public void setId_tipo_documento(int id_tipo_documento) {
        this.id_tipo_documento = id_tipo_documento;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public int getId_tipo_clasificacion() {
        return id_tipo_clasificacion;
    }

    public void setId_tipo_clasificacion(int id_tipo_clasificacion) {
        this.id_tipo_clasificacion = id_tipo_clasificacion;
    }

    public String getTipo_clasificacion() {
        return tipo_clasificacion;
    }

    public void setTipo_clasificacion(String tipo_clasificacion) {
        this.tipo_clasificacion = tipo_clasificacion;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public boolean getVigente() {
        return vigente;
    }

    public void setVigente(boolean vigente) {
        this.vigente = vigente;
    }

    public int getId_tipo_graduacion() {
        return id_tipo_graduacion;
    }

    public void setId_tipo_graduacion(int id_tipo_graduacion) {
        this.id_tipo_graduacion = id_tipo_graduacion;
    }

    public String getTipo_graduacion() {
        return tipo_graduacion;
    }

    public void setTipo_graduacion(String tipo_graduacion) {
        this.tipo_graduacion = tipo_graduacion;
    }

    public String getTipo_admision() {
        return tipo_admision;
    }

    public void setTipo_admision(String tipo_admision) {
        this.tipo_admision = tipo_admision;
    }

    public int getId_facultad() {
        return id_facultad;
    }

    public void setId_facultad(int id_facultad) {
        this.id_facultad = id_facultad;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }

    public int getId_est_adjunto() {
        return id_est_adjunto;
    }

    public void setId_est_adjunto(int id_est_adjunto) {
        this.id_est_adjunto = id_est_adjunto;
    }

    public String getNombre_archivo() {
        return nombre_archivo;
    }

    public void setNombre_archivo(String nombre_archivo) {
        this.nombre_archivo = nombre_archivo;
    }

    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getAprobados() {
        return aprobados;
    }

    public void setAprobados(int aprobados) {
        this.aprobados = aprobados;
    }

    public int getReprobados() {
        return reprobados;
    }

    public void setReprobados(int reprobados) {
        this.reprobados = reprobados;
    }

    public int getAbandonos() {
        return abandonos;
    }

    public void setAbandonos(int abandonos) {
        this.abandonos = abandonos;
    }

    public String getTipo_sexo() {
        return tipo_sexo;
    }

    public void setTipo_sexo(String tipo_sexo) {
        this.tipo_sexo = tipo_sexo;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getTipo_estudiante() {
        return tipo_estudiante;
    }

    public void setTipo_estudiante(String tipo_estudiante) {
        this.tipo_estudiante = tipo_estudiante;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public int getPlan() {
        return plan;
    }

    public void setPlan(int plan) {
        this.plan = plan;
    }

    public int getNotaa() {
        return notaa;
    }

    public void setNotaa(int notaa) {
        this.notaa = notaa;
    }

    public int getNotar() {
        return notar;
    }

    public void setNotar(int notar) {
        this.notar = notar;
    }

    public int getNotaab() {
        return notaab;
    }

    public void setNotaab(int notaab) {
        this.notaab = notaab;
    }

    public int getId_tipo_regularizacion() {
        return id_tipo_regularizacion;
    }

    public void setId_tipo_regularizacion(int id_tipo_regularizacion) {
        this.id_tipo_regularizacion = id_tipo_regularizacion;
    }

    public int getId_regularizacion() {
        return id_regularizacion;
    }

    public void setId_regularizacion(int id_regularizacion) {
        this.id_regularizacion = id_regularizacion;
    }

    public String getTipo_regularizacion() {
        return tipo_regularizacion;
    }

    public void setTipo_regularizacion(String tipo_regularizacion) {
        this.tipo_regularizacion = tipo_regularizacion;
    }

    public int getId_perfil() {
        return id_perfil;
    }

    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getId_tipo_evaluacion() {
        return id_tipo_evaluacion;
    }

    public void setId_tipo_evaluacion(int id_tipo_evaluacion) {
        this.id_tipo_evaluacion = id_tipo_evaluacion;
    }

    public int getId_modelo_ahorro() {
        return id_modelo_ahorro;
    }

    public void setId_modelo_ahorro(int id_modelo_ahorro) {
        this.id_modelo_ahorro = id_modelo_ahorro;
    }

    public int getId_programacion() {
        return id_programacion;
    }

    public void setId_programacion(int id_programacion) {
        this.id_programacion = id_programacion;
    }

    public String getTipo_evaluacion() {
        return this.tipo_evaluacion;
    }

    public void setTipo_evaluacion(String tipo_evaluacion) {
        this.tipo_evaluacion = tipo_evaluacion;
    }

    public String getperiodogestion() {
        return this.periodogestion;
    }

    public void setperiodogestion(String periodogestion) {
        this.periodogestion = periodogestion;
    }

    public int getNivel_academico() {
        return nivel_academico;
    }

    public void setNivel_academico(int nivel_academico) {
        this.nivel_academico = nivel_academico;
    }

    public int getId_programa_ant() {
        return id_programa_ant;
    }

    public void setId_programa_ant(int id_programa_ant) {
        this.id_programa_ant = id_programa_ant;
    }

    public String getFecha_ini() {
        return fecha_ini;
    }

    public void setFecha_ini(String fecha_ini) {
        this.fecha_ini = fecha_ini;
    }

    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public int getId_est_clasificacion() {
        return id_est_clasificacion;
    }

    public void setId_est_clasificacion(int id_est_clasificacion) {
        this.id_est_clasificacion = id_est_clasificacion;
    }

    public int getId_tipo_descuento() {
        return id_tipo_descuento;
    }

    public void setId_tipo_descuento(int id_tipo_descuento) {
        this.id_tipo_descuento = id_tipo_descuento;
    }

    public int getId_clf_tipo_documento() {
        return id_clf_tipo_documento;
    }

    public void setiId_clf_tipo_documento(int id_clf_tipo_documento) {
        this.id_clf_tipo_documento = id_clf_tipo_documento;
    }

    public int getId_est_deuda() {
        return id_est_deuda;
    }

    public void setId_est_deuda(int id_est_deuda) {
        this.id_est_deuda = id_est_deuda;
    }

    public int getId_tipo_deuda() {
        return id_tipo_deuda;
    }

    public void setId_tipo_deuda(int id_tipo_deuda) {
        this.id_tipo_deuda = id_tipo_deuda;
    }

    public String getTipo_deuda() {
        return tipo_deuda;
    }

    public void setTipo_deuda(String tipo_deuda) {
        this.tipo_deuda = tipo_deuda;
    }

    public boolean getRegularizado() {
        return regularizado;
    }

    public void setRegularizado(boolean regularizado) {
        this.regularizado = regularizado;
    }

    public boolean getCancelado() {
        return cancelado;
    }

    public void setCancelado(boolean cancelado) {
        this.cancelado = cancelado;
    }

//ADICIONADO POR LA UAP
    public float getPromedio() {
        return promedio;
    }

    public void setPromedio(float promedio) {
        this.promedio = promedio;
    }

    public String getModalidad_beca() {
        return modalidad_beca;
    }

    public void setModalidad_beca(String modalidad_beca) {
        this.modalidad_beca = modalidad_beca;
    }

    public String getCarga_horaria() {
        return carga_horaria;
    }

    public void setCarga_horaria(String carga_horaria) {
        this.carga_horaria = carga_horaria;
    }

    public Date getFecha_i() {
        return fecha_i;
    }

    public void setFecha_i(Date fecha_i) {
        this.fecha_i = fecha_i;
    }

    public Date getFecha_f() {
        return fecha_f;
    }

    public void setFecha_f(Date fecha_f) {
        this.fecha_f = fecha_f;
    }

    public int getId_ubicacion_organica() {
        return id_ubicacion_organica;
    }

    public void setId_ubicacion_organica(int id_ubicacion_organica) {
        this.id_ubicacion_organica = id_ubicacion_organica;
    }

    public int getCant_materias() {
        return cant_materias;
    }

    public void setCant_materias(int cant_materias) {
        this.cant_materias = cant_materias;
    }

    public List getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(List estudiantes) {
        this.estudiantes = estudiantes;
    }

    public int getId_tipo_materia() {
        return id_tipo_materia;
    }

    public void setId_tipo_materia(int id_tipo_materia) {
        this.id_tipo_materia = id_tipo_materia;
    }

}

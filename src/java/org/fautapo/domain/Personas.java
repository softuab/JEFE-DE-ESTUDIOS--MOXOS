package org.fautapo.domain;

import java.io.Serializable;
import java.util.Date;
//import org.fautapo.domain.Localidades;

public class Personas extends Localidades {

  /* Private Fields */
  private int     id_persona;
  private int     id_estado_civil;
  private int     id_tipo_estado_civil;
  private int     id_tipo_sexo;
  private int     id_sexo;
  private String  dip;
  private String  paterno;
  private String  materno;
  private String  nombres;
  private String    fec_nacimiento;
  private String  direccion;
  private String  telefono;  
  private String  correo;
  private String  tipo_sanguineo;  
  private String  estado_civil;
  private int     id_colegio;
  private int     gestion_egreso;
  private int     id_calificacion;
  private String  nombre_completo;
  private String  celular;
  private String  tipo_empresa_telefonica;
  private int     id_tipo_empresa_telefonica;
  
  //MI
  private int      id_pais;   
  private int      id_departamento;   
  private int      id_provincia;   
  private int      id_localidad;   
  private String   pais;   
  private String   departamento;   
  private String   provincia;   
  private String   localidad;   
  private String   tipo_sexo;    
  private String   tipo_estado_civil;    
  private int      id_tipo_estudiante;
  private String   tipo_estudiante;    
  private int      id_tipo_graduacion;
  private String   tipo_graduacion;    
  private int      id_tipo_institucion;
  private String   tipo_institucion;    
  private String   colegio;    
  private int      id_tipo_turno;
  private String   tipo_turno;    
  private int      id_tipo_problema;
  private String   tipo_problema;    
  private int      id_rol;    
  private int      id_institucion;   
  private String   titulo;     
  private int      anio_titulacion;   
  private int      nro_hijos;  
  private String   nro_seguro_medico;      
  private String   id_plan;      
  private int      nro_dependientes;    
  private int      anio_egreso;    
  private int      id_tipo_clasificacion;  
  private String   tipo_clasificacion;  
  private int      id_tipo_clasificacion_inicial;  
  private String   tipo_clasificacion_inicial;  
  private int      id_tipo_documento;  
  private String   tipo_documento;
  private String   observacion;
  private String   numero;
  private int      id_tipo_compromiso;
  private String   tipo_compromiso;    
  private String   fec_vencimiento;   
  private int      id_clasificacion; 
  private int      id_documento; 
  private int      id_prs_colegio; 
  
  private int      id_item; 
  private String   cargo; 
  private String   ubicacion_organica; 
  private String   institucion;    
  private boolean  presento;    
  
  private int      id_compromiso;
  private boolean  vigente;    
  private boolean  prorroga;    
  private boolean  compromiso;     
  private Date    fec_nacimiento2;
  private int      id_clf_tipo_documento;
  private String   patron;
  private int pagina;    
  /* JavaBeans Properties */
  
  public int getId_persona() { return id_persona; }
  public void setId_persona(int id_persona) { this.id_persona = id_persona; }
  
  public int getId_estado_civil() { return id_estado_civil; }
  public void setId_estado_civil(int id_estado_civil) { this.id_estado_civil = id_estado_civil; }
  
  public int getId_sexo() { return id_sexo; }
  public void setId_sexo(int id_sexo) { this.id_sexo = id_sexo; }
  
 public int getId_tipo_estado_civil() { return id_tipo_estado_civil; }
  public void setId_tipo_estado_civil(int id_tipo_estado_civil) { this.id_tipo_estado_civil = id_tipo_estado_civil; }
  
  public int getId_tipo_sexo() { return id_tipo_sexo; }
  public void setId_tipo_sexo(int id_tipo_sexo) { this.id_tipo_sexo = id_tipo_sexo; } 
  
  
  public String getDip() { return dip; }
  public void setDip(String dip) { this.dip = dip; }
  
  public String getNombres() { return nombres; }
  public void setNombres(String nombres) { this.nombres = nombres; }

  public String getPaterno() { return paterno; }
  public void setPaterno(String paterno) { this.paterno = paterno; }

  public String getMaterno() { return materno; }
  public void setMaterno(String materno) { this.materno = materno; }
  
  public String getFec_nacimiento() { return fec_nacimiento; }
  public void setFec_nacimiento(String fec_nacimiento) { this.fec_nacimiento = fec_nacimiento; }  
  
  public String getDireccion() { return direccion; }
  public void setDireccion(String direccion) { this.direccion = direccion; }
  
  public String getTelefono() { return telefono; }
  public void setTelefono(String telefono) { this.telefono = telefono; }
  
  public String getCorreo() { return correo; }
  public void setCorreo(String correo) { this.correo = correo; }
  
  public String getTipo_sanguineo() { return tipo_sanguineo; }
  public void setTipo_sanguineo(String tipo_sanguineo) { this.tipo_sanguineo = tipo_sanguineo; }
  
  public String getEstado_civil() { return estado_civil; }
  public void setEstado_civil(String estado_civil) { this.estado_civil = estado_civil; }
  
  public int getGestion_egreso() { return gestion_egreso; }
  public void setGestion_egreso(int gestion_egreso) { this.gestion_egreso = gestion_egreso; } 

  public int getId_colegio() { return id_colegio; }
  public void setId_colegio(int id_colegio) { this.id_colegio = id_colegio; } 

  public int getId_calificacion() { return id_calificacion; }
  public void setId_calificacion(int id_calificacion) { this.id_calificacion = id_calificacion; }
  
  public String getNombre_completo() { return nombre_completo; }
  public void setNombre_completo(String nombre_completo) { this.nombre_completo = nombre_completo; }
  
  public String getCelular() { return celular; }
  public void setCelular(String celular) { this.celular = celular; }      

  public String getTipo_empresa_telefonica() { return tipo_empresa_telefonica; }
  public void setTipo_empresa_telefonica(String tipo_empresa_telefonica) { this.tipo_empresa_telefonica = tipo_empresa_telefonica; }      

  public int getId_tipo_empresa_telefonica() { return id_tipo_empresa_telefonica; }
  public void setId_tipo_empresa_telefonica(int id_tipo_empresa_telefonica) { this.id_tipo_empresa_telefonica = id_tipo_empresa_telefonica; }
  
  //MI
  public int getId_pais() { return id_pais; }
  public void setId_pais(int id_pais) { this.id_pais = id_pais; } 
  
  public String getPais() { return pais; }
  public void setPais(String pais) { this.pais = pais; }      
  
  public int getId_departamento() { return id_departamento; }
  public void setId_departamento(int id_departamento) { this.id_departamento = id_departamento; }
  
  public String getDepartamento() { return departamento; }
  public void setDepartamento(String departamento) { this.departamento = departamento; }      
  
  public int getId_provincia() { return id_provincia; }
  public void setId_provincia(int id_provincia) { this.id_provincia = id_provincia; }
  
  public String getProvincia() { return provincia; }
  public void setProvincia(String provincia) { this.provincia = provincia; }      
  
  public int getId_localidad() { return id_localidad; }
  public void setId_localidad(int id_localidad) { this.id_localidad = id_localidad; }
  
  public String getLocalidad() { return localidad; }
  public void setLocalidad(String localidad) { this.localidad = localidad; }      
  
  public String getTipo_sexo() { return tipo_sexo; }
  public void setTipo_sexo(String tipo_sexo) { this.tipo_sexo = tipo_sexo; }      
  
  public String getTipo_estado_civil() { return tipo_estado_civil; }
  public void setTipo_estado_civil(String tipo_estado_civil) { this.tipo_estado_civil = tipo_estado_civil; }      
  
  public int getId_tipo_estudiante() { return id_tipo_estudiante; }
  public void setId_tipo_estudiante(int id_tipo_estudiante) { this.id_tipo_estudiante = id_tipo_estudiante; }
  
  public String getTipo_estudiante() { return tipo_estudiante; }
  public void setTipo_estudiante(String tipo_estudiante) { this.tipo_estudiante = tipo_estudiante; }      
  
  public int getId_tipo_graduacion() { return id_tipo_graduacion; }
  public void setId_tipo_graduacion(int id_tipo_graduacion) { this.id_tipo_graduacion = id_tipo_graduacion; }
  
  public String getTipo_graduacion() { return tipo_graduacion; }
  public void setTipo_graduacion(String tipo_graduacion) { this.tipo_graduacion = tipo_graduacion; }      
  
  public int getId_tipo_institucion() { return id_tipo_institucion; }
  public void setId_tipo_institucion(int id_tipo_institucion) { this.id_tipo_institucion = id_tipo_institucion; }
  
  public String getTipo_institucion() { return tipo_institucion; }
  public void setTipo_institucion(String tipo_institucion) { this.tipo_institucion = tipo_institucion; }      
  
  
  public String getColegio() { return colegio; }
  public void setColegio(String colegio) { this.colegio = colegio; }      
  
  public int getId_tipo_turno() { return id_tipo_turno; }
  public void setId_tipo_turno(int id_tipo_turno) { this.id_tipo_turno = id_tipo_turno; }
  
  public String getTipo_turno() { return tipo_turno; }
  public void setTipo_turno(String tipo_turno) { this.tipo_turno = tipo_turno; }      
  
  public int getId_tipo_problema() { return id_tipo_problema; }
  public void setId_tipo_problema(int id_tipo_problema) { this.id_tipo_problema = id_tipo_problema; }
  
  public String getTipo_problema() { return tipo_problema; }
  public void setTipo_problema(String tipo_problema) { this.tipo_problema = tipo_problema; }      
  
  public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }
  
  public int getId_institucion() { return id_institucion; }
  public void setId_institucion(int id_institucion) { this.id_institucion = id_institucion; }

  public String getId_plan() { return id_plan; }
  public void setId_plan(String id_plan) { this.id_plan = id_plan; }
  
  public int getAnio_titulacion() { return anio_titulacion; }
  public void setAnio_titulacion(int anio_titulacion) { this.anio_titulacion = anio_titulacion; }
  
  public int getNro_hijos() { return nro_hijos; }
  public void setNro_hijos(int nro_hijos) { this.nro_hijos = nro_hijos; }
  
  public int getNro_dependientes() { return nro_dependientes; }
  public void setNro_dependientes(int nro_dependientes) { this.nro_dependientes = nro_dependientes; }
  
  public String getNro_seguro_medico() { return nro_seguro_medico; }
  public void setNro_seguro_medico(String nro_seguro_medico) { this.nro_seguro_medico = nro_seguro_medico; }
  
  public int getAnio_egreso() { return anio_egreso; }
  public void setAnio_egreso(int anio_egreso) { this.anio_egreso = anio_egreso; }
  
  public int getId_tipo_clasificacion() { return id_tipo_clasificacion; }
  public void setId_tipo_clasificacion(int id_tipo_clasificacion) { this.id_tipo_clasificacion = id_tipo_clasificacion; }
  
  public String getTipo_clasificacion() { return tipo_clasificacion; }
  public void setTipo_clasificacion(String tipo_clasificacion) { this.tipo_clasificacion = tipo_clasificacion; }
  
  public int getId_tipo_clasificacion_inicial() { return id_tipo_clasificacion_inicial; }
  public void setId_tipo_clasificacion_inicial(int id_tipo_clasificacion_inicial) { this.id_tipo_clasificacion_inicial = id_tipo_clasificacion_inicial; }
  
  public String getTipo_clasificacion_inicial() { return tipo_clasificacion_inicial; }
  public void setTipo_clasificacion_inicial(String tipo_clasificacion_inicial) { this.tipo_clasificacion_inicial = tipo_clasificacion_inicial; }
  
  public String getTitulo() { return titulo; }
  public void setTitulo(String titulo) { this.titulo = titulo; }

  public int getId_tipo_documento() { return id_tipo_documento; }
  public void setId_tipo_documento(int id_tipo_documento) { this.id_tipo_documento = id_tipo_documento; }
  
  public String getTipo_documento() { return tipo_documento; }
  public void setTipo_documento(String tipo_documento) { this.tipo_documento = tipo_documento; }
 
  public String getObservacion() { return observacion; }
  public void setObservacion(String observacion) { this.observacion = observacion;}
  
  public String getNumero() { return numero; }
  public void setNumero(String numero) { this.numero = numero;}

  public int getId_tipo_compromiso() { return id_tipo_compromiso; }
  public void setId_tipo_compromiso(int id_tipo_compromiso) { this.id_tipo_compromiso = id_tipo_compromiso; }
  
  public String getTipo_compromiso() { return tipo_compromiso; }
  public void setTipo_compromiso(String tipo_compromiso) { this.tipo_compromiso = tipo_compromiso; }      
  
  public String getFec_vencimiento() { return fec_vencimiento; }
  public void setFec_vencimiento(String fec_vencimiento) { this.fec_vencimiento = fec_vencimiento; }      
  
  public int getId_clasificacion() { return id_clasificacion; }
  public void setId_clasificacion(int id_clasificacion) { this.id_clasificacion = id_clasificacion; }
  
  public int getId_documento() { return id_documento; }
  public void setId_documento(int id_documento) { this.id_documento = id_documento; }
  
  public int getId_prs_colegio() { return id_prs_colegio; }
  public void setId_prs_colegio(int id_prs_colegio) { this.id_prs_colegio = id_prs_colegio; }
  
  public int getId_item() { return id_item; }
  public void setId_item(int id_item) { this.id_item = id_item; }
  
  public String getCargo() { return cargo; }
  public void setCargo(String cargo) { this.cargo = cargo; }      
  
  public String getUbicacion_organica() { return ubicacion_organica; }
  public void setUbicacion_organica(String ubicacion_organica) { this.ubicacion_organica = ubicacion_organica; }      
  
  public String getInstitucion() { return institucion; }
  public void setInstitucion(String institucion) { this.institucion = institucion; }      
  
  public boolean getPresento() { return presento; }
  public void setPresento(boolean presento) { this.presento = presento; }
  
  public int getId_compromiso() { return id_compromiso; }
  public void setId_compromiso(int id_compromiso) { this.id_compromiso = id_compromiso; }

  public boolean getVigente() { return vigente; }
  public void setVigente(boolean vigente) { this.vigente = vigente; }
  
  public boolean getProrroga() { return prorroga; }
  public void setProrroga(boolean prorroga) { this.prorroga = prorroga; }
  
  public boolean getCompromiso() { return compromiso; }
  public void setCompromiso(boolean compromiso) { this.compromiso = compromiso; }
  
  public Date getFec_nacimiento2() { return fec_nacimiento2; }
  public void setFec_nacimiento2(Date fec_nacimiento2) { this.fec_nacimiento2 = fec_nacimiento2; }

  public int getId_clf_tipo_documento() { return id_clf_tipo_documento; }
  public void setId_clf_tipo_documento(int id_clf_tipo_documento) { this.id_clf_tipo_documento = id_clf_tipo_documento; }
  
  public String getPatron() { return patron; }
  public void setPatron(String patron) { this.patron = patron; }      

  public int getPagina() { return pagina; }
  public void setPagina(int pagina) { this.pagina = pagina; }

}
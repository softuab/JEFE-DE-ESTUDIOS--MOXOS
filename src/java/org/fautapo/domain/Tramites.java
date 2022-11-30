package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;
import java.sql.Time;

public class Tramites extends Campos {

  /* Private Fields */
  private int    id_dato;
  private String valores;
  private String primarios;
  private String campos;
  private String tabla_foranea;
  private String id_campo_foraneo;
  private String campo_foraneo;
  private List   tuplas;
  private int    resultado;
  private int    id_tipo_proveido;
  private String tipo_proveido;   
  private int    para;
  private int    de;
  private int    id_tramite;
  private String proveido;
  private int    id_actividad_actual;
  private int id_tipo_documento;
  private String tipo_documento;
  private String nombre_completo;
  private List   usuarios;
  private String usuario;
  private int    id_actividad_minima;
  private String imagen;
  private Date   fechaini;
  private Date   fechafin;
  private String cargo;
  private int    nro_total_tramites;
  private int    nro_tramites_hoy;
  private int    nro_tramites_semanal;
  private int    nro_tramites_anteriores;
  private int    retrocedido;
  private String dias;
  private int    dia;
  private int    horas;
  private int    minutos;
  private int    segundos;
  private int    milisegundos;
  private String usuario_de; 
  private String usuario_para;
  private String etiqueta;
  private Date   fec_registro;
  private int    pagina;
  private String fecha_ini;
  private String fecha_fin;
  private int    cantidad;
  
  private int    min;
  private int    max;
  private String correlativo2;
  private int    gestion;
  
  private String valor;

  /* JavaBeans Properties */

  public int getId_dato() { return id_dato; }
  public void setId_dato(int id_dato) { this.id_dato = id_dato; }

  public String getValores() { return this.valores;}
  public void setValores(String valores) { this.valores = valores;}

  public String getPrimarios() { return primarios; }
  public void setPrimarios(String primarios) { this.primarios = primarios; }

  public String getCampos() { return campos; }
  public void setCampos(String campos) { this.campos = campos; }

  public String getTabla_foranea() { return this.tabla_foranea;}
  public void setTabla_foranea(String tabla_foranea) { this.tabla_foranea = tabla_foranea;}

  public String getId_campo_foraneo() { return this.id_campo_foraneo; }
  public void setId_campo_foraneo(String id_campo_foraneo) { this.id_campo_foraneo = id_campo_foraneo; }

  public String getCampo_foraneo() { return this.campo_foraneo; }
  public void setCampo_foraneo(String campo_foraneo) { this.campo_foraneo = campo_foraneo; }

  public List getTuplas() { return tuplas; }
  public void setTuplas(List tuplas) { this.tuplas = tuplas; }

  public int  getResultado() {return resultado;}
  public void setResultado(int resultado) {this.resultado = resultado;}

  public int getId_tipo_proveido() { return id_tipo_proveido; }
  public void setId_tipo_proveido(int id_tipo_proveido) { this.id_tipo_proveido = id_tipo_proveido; }
  
  public String getTipo_proveido() { return tipo_proveido;  }
  public void setTipo_proveido(String tipo_proveido) {this.tipo_proveido = tipo_proveido; }  

  public int getPara() { return para; }
  public void setPara(int para) { this.para = para; }

  public int getDe() { return de; }
  public void setDe(int de) { this.de = de; }

  public int getId_tramite() { return id_tramite; }
  public void setId_tramite(int id_tramite) { this.id_tramite = id_tramite; }

  public String getProveido() { return proveido; }
  public void setProveido(String proveido) { this.proveido = proveido; }

  public int getId_actividad_actual() { return id_actividad_actual; }
  public void setId_actividad_actual(int id_actividad_actual) { this.id_actividad_actual = id_actividad_actual; }

  public int getId_tipo_documento() { return id_tipo_documento; }
  public void setId_tipo_documento(int id_tipo_documento) { this.id_tipo_documento = id_tipo_documento; }

  public String getTipo_documento() { return tipo_documento; }
  public void setTipo_documento(String tipo_documento) { this.tipo_documento = tipo_documento; }

  public String getNombre_completo() { return nombre_completo; }
  public void setNombre_completo(String nombre_completo) {this.nombre_completo = nombre_completo; } 

  public List getUsuarios() { return usuarios; }
  public void setUsuarios(List usuarios) { this.usuarios = usuarios; }

  public String getUsuario() { return usuario; } 
  public void setUsuario(String usuario) { this.usuario = usuario; }

  public int getId_actividad_minima() { return id_actividad_minima; }
  public void setId_actividad_minima(int id_actividad_minima) { this.id_actividad_minima = id_actividad_minima; }

  public String getImagen() { return imagen; }
  public void setImagen(String imagen) { this.imagen = imagen; }

  public Date getFechaini() { return fechaini; }
  public void setFechaini(Date fechaini) { this.fechaini = fechaini; }

  public Date getFechafin() { return fechafin; }
  public void setFechafin(Date fechafin) { this.fechafin = fechafin; }

  public String getCargo() { return cargo; }
  public void setCargo(String cargo) { this.cargo = cargo; }

  public int getNro_total_tramites() { return nro_total_tramites; }
  public void setNro_total_tramites(int nro_total_tramites) { this.nro_total_tramites = nro_total_tramites; }
  
  public int getNro_tramites_hoy() { return nro_tramites_hoy; }
  public void setNro_tramites_hoy(int nro_tramites_hoy) { this.nro_tramites_hoy = nro_tramites_hoy; }

  public int getNro_tramites_semanal() { return nro_tramites_semanal; }
  public void setNro_tramites_semanal(int nro_tramites_semanal) { this.nro_tramites_semanal = nro_tramites_semanal; }
  
  public int getNro_tramites_anteriores() { return nro_tramites_anteriores; }
  public void setNro_tramites_anteriores(int nro_tramites_anteriores) { this.nro_tramites_anteriores = nro_tramites_anteriores; }

  public int getRetrocedido() { return this.retrocedido; }
  public void setRetrocedido(int retrocedido) { this.retrocedido = retrocedido; }

  public String getDias() { return dias; }
  public void setDias(String dias) { this.dias = dias; }

  public int getDia() { return dia; }
  public void setDia(int dia) { this.dia = dia; }
  
  public int getHoras() { return horas; }
  public void setHoras(int horas) { this.horas = horas; }
  
  public int getMinutos() { return minutos; }
  public void setMinutos(int minutos) { this.minutos = minutos; }
  
  public int getSegundos() { return segundos; }
  public void setSegundos(int segundos) { this.segundos = segundos; }
  
  public int getMilisegundos() { return milisegundos; }
  public void setMilisegundos(int milisegundos) { this.milisegundos = milisegundos; }

  public String getUsuario_de() { return usuario_de; }
  public void setUsuario_de(String usuario_de) { this.usuario_de = usuario_de; } 
  
  public String getUsuario_para() { return usuario_para; }
  public void setUsuario_para(String usuario_para) { this.usuario_para = usuario_para; }   

  public String getEtiqueta() { return etiqueta; }
  public void setEtiqueta(String etiqueta) { this.etiqueta = etiqueta; }

  public Date getFec_registro() { return fec_registro; }
  public void setFec_registro(Date fec_registro) { this.fec_registro = fec_registro; }

  public int getPagina() { return pagina; }
  public void setPagina(int pagina) { this.pagina = pagina; }

  public String getFecha_ini() { return fecha_ini; }
  public void setFecha_ini(String fecha_ini) { this.fecha_ini = fecha_ini; }

  public String getFecha_fin() { return fecha_fin; }
  public void setFecha_fin(String fecha_fin) { this.fecha_fin = fecha_fin; }
  
  public int getCantidad() { return cantidad; }
  public void setCantidad(int cantidad) { this.cantidad = cantidad; }
  
  public int getMin() { return min; }
  public void setMin(int min) { this.min = min; }
  
  public int getMax() { return max; }
  public void setMax(int max) { this.max = max; } 

  public String getCorrelativo2() { return correlativo2; }
  public void setCorrelativo2(String correlativo2) { this.correlativo2 = correlativo2; }

  public int getGestion() { return gestion; }
  public void setGestion(int gestion) { this.gestion = gestion; }

  public String  getValor() { return valor; }
  public void setValor(String valor) { this.valor = valor; }


}
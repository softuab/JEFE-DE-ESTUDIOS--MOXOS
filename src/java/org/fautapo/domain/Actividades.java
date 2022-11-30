package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;

public class Actividades extends Principal {

  /* Private Fields */
  private int     id_proceso;   
  private String  proceso;
  private int     id_actividad;
  private String  actividad;
  private int     id_rol;
  private String  rol;
  private int     duracion;
  private int     orden;
  private int     id_tipo_actuacion;
  private String  tipo_actuacion;
  private String  actuacion;
  private int     id_ubicacion_organica;
  private String  ubicacion_organica;
  private boolean alerta;
  private boolean puente;
  private int     correlativo;     
  private int     id_tipo_alerta;
  private String  tipo_alerta;
  private int     id_tipo_proceso;   
  private String  tipo_proceso;   
  private int     id_ubicacion_organica_padre;
  private String  ruta;
  private int     id_tipo_duracion;   
  private String  tipo_duracion;
  private boolean fin_flujo;
  
  private int     id_form;
  private String  form;
  private String  codigo_proceso;
  
  /* JavaBeans Properties */

  public int getId_proceso() { return id_proceso; }
  public void setId_proceso(int id_proceso) { this.id_proceso = id_proceso; }

  public String getProceso() { return proceso; }
  public void setProceso(String proceso) { this.proceso = proceso; }

  public int getId_actividad() { return id_actividad; }
  public void setId_actividad(int id_actividad) { this.id_actividad = id_actividad; }

  public String getActividad() { return actividad; }
  public void setActividad(String actividad) { this.actividad = actividad; }

  public int getId_rol() { return this.id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }

  public String getRol() { return rol; }
  public void setRol(String rol) { this.rol = rol; }

  public int getDuracion() { return duracion; }
  public void setDuracion(int duracion) { this.duracion = duracion; }

  public int getOrden() { return orden; }
  public void setOrden(int orden) { this.orden = orden; }

  public int getId_tipo_actuacion() { return id_tipo_actuacion; }
  public void setId_tipo_actuacion(int id_tipo_actuacion) { this.id_tipo_actuacion = id_tipo_actuacion; }

  public String getTipo_actuacion() { return tipo_actuacion; }
  public void setTipo_actuacion(String tipo_actuacion) {this.tipo_actuacion = tipo_actuacion; }
 
  public String getActuacion() { return actuacion;  }
  public void setActuacion(String actuacion) {this.actuacion = actuacion; }  

  public int getId_ubicacion_organica() { return id_ubicacion_organica; }
  public void setId_ubicacion_organica(int id_ubicacion_organica) { this.id_ubicacion_organica = id_ubicacion_organica; }

  public String getUbicacion_organica() { return ubicacion_organica; }
  public void setUbicacion_organica(String ubicacion_organica) { this.ubicacion_organica = ubicacion_organica; }

  public boolean getAlerta() { return alerta; }
  public void setAlerta(boolean alerta) { this.alerta = alerta; }

  public boolean getPuente() { return puente; }
  public void setPuente(boolean puente) { this.puente = puente; }

  public int getCorrelativo() { return correlativo; }
  public void setCorrelativo(int correlativo) { this.correlativo = correlativo; }

  public int getId_tipo_alerta() { return id_tipo_alerta; }
  public void setId_tipo_alerta(int id_tipo_alerta) { this.id_tipo_alerta = id_tipo_alerta; }
  
  public String getTipo_alerta() { return tipo_alerta; }
  public void setTipo_alerta(String tipo_alerta) { this.tipo_alerta = tipo_alerta; }

  public int getId_tipo_proceso() { return id_tipo_proceso; }
  public void setId_tipo_proceso(int id_tipo_proceso) { this.id_tipo_proceso = id_tipo_proceso; }
  
  public String getTipo_proceso() { return tipo_proceso; }
  public void setTipo_proceso(String tipo_proceso) { this.tipo_proceso = tipo_proceso; }

  public int getId_ubicacion_organica_padre() { return id_ubicacion_organica_padre; }
  public void setId_ubicacion_organica_padre(int id_ubicacion_organica_padre) { this.id_ubicacion_organica_padre = id_ubicacion_organica_padre; }

  public String getRuta() { return ruta; }
  public void setRuta(String ruta) { this.ruta = ruta; }

  public int getId_tipo_duracion() { return id_tipo_duracion; }
  public void setId_tipo_duracion(int id_tipo_duracion) { this.id_tipo_duracion = id_tipo_duracion; }
  
  public String getTipo_duracion() { return tipo_duracion; }
  public void setTipo_duracion(String tipo_duracion) { this.tipo_duracion = tipo_duracion; }

  public boolean getFin_flujo() { return fin_flujo; }
  public void setFin_flujo(boolean fin_flujo) { this.fin_flujo = fin_flujo; }
  
  public int getId_form() { return id_form; }
  public void setId_form(int id_form) { this.id_form = id_form; }

  public String getForm() { return form; }
  public void setForm(String form) { this.form = form; }

  public String getCodigo_proceso() { return codigo_proceso; }
  public void setCodigo_proceso(String codigo_proceso) { this.codigo_proceso = codigo_proceso; }

}
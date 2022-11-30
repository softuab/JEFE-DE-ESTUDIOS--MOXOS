package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;

public class Tableros extends Personas {

  /* Private Fields */
  private int    id_tipo_tablero;
  private String tipo_tablero;
  private int    id_tipo_aviso;
  private String tipo_aviso;
  private int    id_tablero;
  private String noticia;
  private String mensaje;
  private int    id_rol;
  private String rol;

  /* JavaBeans Properties */
  public int getId_tipo_tablero() { return id_tipo_tablero; }
  public void setId_tipo_tablero(int id_tipo_tablero) { this.id_tipo_tablero = id_tipo_tablero; }

  public String getTipo_tablero() { return tipo_tablero; }
  public void setTipo_tablero(String tipo_tablero) { this.tipo_tablero = tipo_tablero; }

  public int getId_tipo_aviso() { return id_tipo_aviso; }
  public void setId_tipo_aviso(int id_tipo_aviso) { this.id_tipo_aviso = id_tipo_aviso; }
  
  public String getTipo_aviso() { return tipo_aviso; }
  public void setTipo_aviso(String tipo_aviso) { this.tipo_aviso = tipo_aviso; }
  
  public int getId_tablero() { return id_tablero; }
  public void setId_tablero(int id_tablero) { this.id_tablero = id_tablero; }

  public String getNoticia() { return noticia; }
  public void setNoticia(String noticia) { this.noticia = noticia; }
  
  public String getMensaje() { return mensaje; }
  public void setMensaje(String mensaje) { this.mensaje = mensaje; }
  
  public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; } 

  public String getRol() { return rol; }
  public void setRol(String rol) { this.rol = rol; }

}
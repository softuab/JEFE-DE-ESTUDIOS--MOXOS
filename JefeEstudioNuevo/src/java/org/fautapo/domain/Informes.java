package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;

public class Informes extends Campos {

  /* Private Fields */
  private int    id_informe;
  private String informe;
  private String descripcion;
  private String contenido;
  private int    id_tramite;   
  private String valor;
  
  /* JavaBeans Properties */
  public int getId_informe() { return id_informe; }
  public void setId_informe(int id_informe) { this.id_informe = id_informe; }

  public String getInforme() { return informe;  }
  public void setInforme(String informe) {this.informe = informe; }

  public String getDescripcion() { return descripcion;  }
  public void setDescripcion(String descripcion) {this.descripcion = descripcion; }

  public String getContenido() { return contenido;  }
  public void setContenido(String contenido) {this.contenido = contenido; }

  public int getId_tramite() { return id_tramite; }
  public void setId_tramite(int id_tramite) { this.id_tramite = id_tramite; }

  public String getValor() { return valor; }
  public void setValor(String valor) { this.valor = valor; }

}
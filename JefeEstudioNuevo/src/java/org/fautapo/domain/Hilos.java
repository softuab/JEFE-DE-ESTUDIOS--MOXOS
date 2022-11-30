package org.fautapo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Hilos extends Adjuntos {
  /* Private Fields */

  private int     id_hilo;
  private String  hilo;
  private int     id_tipo_hilo;
  private String  tipo_hilo;
  private int     id_destinatario;
  private String  destinatario;
  private int     id_duenio;
  private boolean privado;
  private String  asunto;
  private String  imagen;
  private Date    fec_registro;
  private Date    fecha;
  private String  fecha1; 
  private int     id_tipo_segmento;
  private String  tipo_segmento;
  private String  id_estado;
  private int     id_remitente;
  private String  remitente;
  private int     nro_mensajes;
  private int     nro_mensajes_nuevos;
  private String  segmento;
  private int     id_segmento;
  private String  adjunto;
  private List    lista;
  private String  nombre_archivo;  

  public int getId_hilo() { return id_hilo; }
  public void setId_hilo(int id_hilo) { this.id_hilo = id_hilo; }

  public String getHilo() { return hilo; }
  public void setHilo(String hilo) { this.hilo = hilo; }

  public int getId_tipo_hilo() { return id_tipo_hilo; }
  public void setId_tipo_hilo(int id_tipo_hilo) { this.id_tipo_hilo = id_tipo_hilo; }

  public String getTipo_hilo() { return tipo_hilo; }
  public void setTipo_hilo(String tipo_hilo) { this.tipo_hilo = tipo_hilo; }
 
  public int getId_destinatario() { return id_destinatario; }
  public void setId_destinatario(int id_destinatario) { this.id_destinatario = id_destinatario; }

  public String getDestinatario() { return destinatario; }
  public void setDestinatario(String destinatario) { this.destinatario = destinatario; }
 
  public int getId_duenio() { return id_duenio; }
  public void setId_duenio(int id_duenio) { this.id_duenio = id_duenio; }
 
  public boolean getPrivado() { return privado; }
  public void setPrivado(boolean privado) { this.privado = privado; }
 
  public String getAsunto() { return asunto; }
  public void setAsunto(String asunto) { this.asunto = asunto; }

  public String getImagen() { return imagen; }
  public void setImagen(String imagen) { this.imagen = imagen; }

  public Date getFec_registro() { return fec_registro; }
  public void setFec_registro(Date fec_registro) { this.fec_registro = fec_registro; }

  public Date getFecha() { return fecha; }
  public void setFecha(Date fecha) { this.fecha = fecha; }

  public String getFecha1() { return fecha1; }
  public void setFecha1(String fecha1) { this.fecha1 = fecha1; }

  public int getId_tipo_segmento() { return id_tipo_segmento; }
  public void setId_tipo_segmento(int id_tipo_segmento) { this.id_tipo_segmento = id_tipo_segmento; }

  public String getTipo_segmento() { return tipo_segmento; }
  public void setTipo_segmento(String tipo_segmento) { this.tipo_segmento = tipo_segmento; }

  public String getId_estado() { return id_estado; }
  public void setId_estado(String id_estado) { this.id_estado = id_estado; }

  public int getId_remitente() { return id_remitente; }
  public void setId_remitente(int id_remitente) { this.id_remitente = id_remitente; }

  public String getRemitente() { return remitente; }
  public void setRemitente(String remitente) { this.remitente = remitente; }

  public int getNro_mensajes() { return nro_mensajes; }
  public void setNro_mensajes(int nro_mensajes) { this.nro_mensajes = nro_mensajes; }

  public int getNro_mensajes_nuevos() { return nro_mensajes_nuevos; }
  public void setNro_mensajes_nuevos(int nro_mensajes_nuevos) { this.nro_mensajes_nuevos = nro_mensajes_nuevos; }

  public String getSegmento() { return segmento; }
  public void setSegmento(String segmento) { this.segmento = segmento; }

  public int getId_segmento() { return id_segmento; }
  public void setId_segmento(int id_segmento) { this.id_segmento = id_segmento; }

  public String getAdjunto() { return adjunto; }
  public void setAdjunto(String adjunto) { this.adjunto = adjunto; }

  public List getLista() { return lista; }
  public void setLista(List lista) { this.lista = lista; }

  public String getNombre_archivo() { return nombre_archivo; }
  public void setNombre_archivo(String nombre_archivo) { this.nombre_archivo = nombre_archivo; }

}
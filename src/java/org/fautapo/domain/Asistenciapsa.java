package org.fautapo.domain; 

import java.io.Serializable;
import java.util.Date;
import org.fautapo.domain.Principal; 
import org.fautapo.domain.Postulantes; 

public class Asistenciapsa extends Postulantes {

  /* Private Fields */
  private int id_asistencia;
  private int id_postulante;
  private Date fec_inicio2 ;
  private String fecha ;
  private String hora;
  private String lugar;
  private int nro_maquinas;
  private boolean asistencia;
  private int id_rol;
private int ult_usuario;  

    public Date getFec_inicio2() { return fec_inicio2; }
  public void setFec_inicio2(Date fec_inicio2) { this.fec_inicio2 = fec_inicio2; }
  /* JavaBeans Properties */
public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }
  public int getId_asistencia() {
    return id_asistencia; 
  }
  public void setId_asistencia(int id_asistencia) { 
    this.id_asistencia = id_asistencia; 
  }
  
  public int getId_postulante() {
    return id_postulante; 
  }
  public void setId_postulante(int id_postulante) { 
    this.id_postulante = id_postulante; 
  }
 
  
  public String getFecha() { 
    return fecha;
  }
  public void setFecha(String fecha) { 
    this.fecha = fecha; 
  }
  
  public String getHora() {
    return hora; 
  }
  public void setHora(String hora) { 
    this.hora = hora; 
  }
 public String getLugar() {
    return lugar; 
  }
  public void setLugar(String lugar) { 
    this.lugar = lugar; 
  }
 
  public int getNro_maquinas() {
    return nro_maquinas; 
  }
  public void setNro_maquinas(int nro_maquinas) { 
    this.nro_maquinas = nro_maquinas; 
  }
public boolean getAsistencia() {
    return asistencia; 
  }
  public void setAsistencia(boolean asistencia) { 
    this.asistencia = asistencia; 
  }
   public int getUlt_usuario() {
    return ult_usuario; 
  }
  public void setUlt_usuario(int ult_usuario) { 
    this.ult_usuario = ult_usuario; 
  }
}


package org.fautapo.domain;

import org.fautapo.domain.Estudiantes;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.lang.String;
import org.fautapo.domain.Asistenciapsa;


/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-06
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-06
*/

public class Postulantes extends Estudiantes {

  /* Private Fields */

  private int    id_postulante;
  private int    id_rol;
  private int    id_persona;
  private String observacion;
  private String numero;
  private int    id_programacion;
  private List   postulantes;
  private int    id_pst_prs_colegio;
  private Date   fec_nacimiento2;
  private int     inscritos;
  private int     habilitados;
    private String     dip;
  private int     inhabilitados;
  private int     pre_habilitados;
  private int     pre_inhabilitados; 
  private int     psa_habilitados;
  private int     psa_inhabilitados;  
  private int     especial_habilitados;
  private int     especial_inhabilitados; 
  //aumentado para el cntrol por sede
  private int ins_sede;
  // para asistencia de postulantes
  private int num;
   
     public int getNum() { return this.num; }
  public void setNum(int num) { this.num = num; }  
  
  public String getDip() { return this.dip; }
  public void setDip(String dip) { this.dip = dip; }  
  private int id_asistencia;
  
  private Date fec_inicio2 ;
  private String fecha ;
  private String hora;
  private String lugar;
  private int nro_maquinas;
  private boolean asistencia;
   public Date getFec_inicio2() { return fec_inicio2; }
  public void setFec_inicio2(Date fec_inicio2) { this.fec_inicio2 = fec_inicio2; }
  /* JavaBeans Properties */

  public int getId_asistencia() {
    return id_asistencia; 
  }
  public void setId_asistencia(int id_asistencia) { 
    this.id_asistencia = id_asistencia; 
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
  

  /* JavaBeans Properties */
  public int getIns_sede() { return ins_sede; }
  public void setIns_sede(int ins_sede) { this.ins_sede = ins_sede;}

  public int getId_postulante() { return id_postulante; }
  public void setId_postulante(int id_postulante) { this.id_postulante = id_postulante;}
  
  public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }
  
  public int getId_persona() { return id_persona; }
  public void setId_persona(int id_persona) { this.id_persona = id_persona;}
  
  
  public String getObservacion() { return observacion; }
  public void setObservacion(String observacion) { this.observacion = observacion;}
  
  public String getNumero() { return numero; }
  public void setNumero(String numero) { this.numero = numero;}
  
  public int getId_programacion() { return id_programacion; }
  public void setId_programacion(int id_programacion) { this.id_programacion = id_programacion;}
  
  public List getPostulantes() { return postulantes; }
  public void setPostulantes(List postulantes) { this.postulantes = postulantes;}
  
  public int getId_pst_prs_colegio() { return id_pst_prs_colegio; }
  public void setId_pst_prs_colegio(int id_pst_prs_colegio) { this.id_pst_prs_colegio = id_pst_prs_colegio; }

  public Date getFec_nacimiento2() { return fec_nacimiento2; }
  public void setFec_nacimiento2(Date fec_nacimiento2) { this.fec_nacimiento2 = fec_nacimiento2; }

  public int getInscritos() { return inscritos; }
  public void setInscritos(int inscritos) { this.inscritos = inscritos;}
  
  public int getHabilitados() { return habilitados; }
  public void setHabilitados(int habilitados) { this.habilitados = habilitados;}
  
  public int getInhabilitados() { return inhabilitados; }
  public void setInhabilitados(int inhabilitados) { this.inhabilitados = inhabilitados;}
  
  public int getPre_habilitados() { return pre_habilitados; }
  public void setPre_habilitados(int pre_habilitados) { this.pre_habilitados = pre_habilitados;}
  
  public int getPre_inhabilitados() { return pre_inhabilitados; }
  public void setPre_inhabilitados(int pre_inhabilitados) { this.pre_inhabilitados = pre_inhabilitados;}
  
  public int getPsa_habilitados() { return psa_habilitados; }
  public void setPsa_habilitados(int psa_habilitados) { this.psa_habilitados = psa_habilitados;}
  
  public int getPsa_inhabilitados() { return psa_inhabilitados; }
  public void setPsa_inhabilitados(int psa_inhabilitados) { this.psa_inhabilitados = psa_inhabilitados;}
  
  public int geteEpecial_habilitados() { return especial_habilitados; }
  public void setEspecial_habilitados(int especial_habilitados) { this.especial_habilitados = especial_habilitados;}
  
  public int getEspecial_inhabilitados() { return especial_inhabilitados; }
  public void setEspecial_inhabilitados(int especial_inhabilitados) { this.especial_inhabilitados = especial_inhabilitados;}
  
  
  

}

package org.fautapo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Curriculum extends Personas {

  public Curriculum() {
    id_curriculum = 0;
    id_rubro = 0;
    id_persona = 0;
    id_sub_rubro = 0;
    ult_usuario = 0;
    desde = 0;
    hasta = 0;
    pagina = 0;
    rubro = "";
    sub_rubro = "";
    id_estado = "";
    detalle = "";
    del = "1000-01-01";
    al = "1000-01-01";
  }

  private int id_curriculum;
  private int id_rubro;
  private int id_persona;
  private int id_sub_rubro;
  private int ult_usuario;
  private int desde;
  private int hasta;
  private int pagina;
  private String rubro;
  private String sub_rubro;
  private String id_estado;
  private String detalle;
  private String del;
  private String al;
  
  private int id_dct_adjunto;
  private int id_docente;
  private String nombre_archivo;
  private String adjunto;
  
  

  public int getId_curriculum(){return id_curriculum;}
  public void setId_curriculum(int id_curriculum){this.id_curriculum = id_curriculum;}

  public int getId_rubro(){return id_rubro;}
  public void setId_rubro(int id_rubro){this.id_rubro = id_rubro;}

  public int getId_persona(){return id_persona;}
  public void setId_persona(int id_persona){this.id_persona = id_persona;}

  public int getId_sub_rubro(){return id_sub_rubro;}
  public void setId_sub_rubro(int id_sub_rubro){this.id_sub_rubro = id_sub_rubro;}

  public int getUlt_usuario(){return ult_usuario;}
  public void setUlt_usuario(int ult_usuario){this.ult_usuario = ult_usuario;}

  public int getDesde(){return desde;}
  public void setDesde(int desde){this.desde = desde;}

  public int getHasta(){return hasta;}
  public void setHasta(int hasta){this.hasta = hasta;}

  public int getPagina(){return pagina;}
  public void setPagina(int pagina){this.pagina = pagina;}

  public String getRubro(){return rubro;}
  public void setRubro(String rubro){this.rubro = rubro;}

  public String getSub_rubro(){return sub_rubro;}
  public void setSub_rubro(String sub_rubro){this.sub_rubro = sub_rubro;}

  public String getId_estado(){return id_estado;}
  public void setId_estado(String id_estado){this.id_estado = id_estado;}

  public String getDetalle(){return detalle;}
  public void setDetalle(String detalle){this.detalle = detalle;}

  public String getDel(){return del;}
  public void setDel(String del){ if(del=="") del = "1000-01-01"; this.del = del;}

  public String getAl(){return al;}
  public void setAl(String al){if(al=="") al = "1000-01-01"; this.al = al;}
  
  public String hoy(){
      Date dFecha_actual = new Date();
      String sDia = Integer.toString(dFecha_actual.getDate());
      String sMes = Integer.toString(dFecha_actual.getMonth() + 1);
      String sAnio = Integer.toString(dFecha_actual.getYear() + 1900);
      if(sDia.length() == 1) sDia = "0" + sDia;
      if(sMes.length() == 1) sMes = "0" + sMes;
      String sFecha = sDia + "/" + sMes + "/" + sAnio;
      return sFecha;
  }
  
  
  public int getId_dct_adjunto() { return id_dct_adjunto; }
  public void setId_dct_adjunto(int id_dct_adjunto) { this.id_dct_adjunto = id_dct_adjunto; }
  
  public int getId_docente() { return id_docente; }
  public void setId_docente(int id_docente) { this.id_docente = id_docente; }
  
  public String getNombre_archivo() { return nombre_archivo; }
  public void setNombre_archivo(String nombre_archivo) { this.nombre_archivo = nombre_archivo; }
  
  public String getAdjunto() { return adjunto; }
  public void setAdjunto(String adjunto) { this.adjunto = adjunto; }
  
}

    
   

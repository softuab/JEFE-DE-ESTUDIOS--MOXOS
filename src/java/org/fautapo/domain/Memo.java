package org.fautapo.domain; 

import java.io.Serializable;
import java.util.Date;
import org.fautapo.domain.Principal; 
import org.fautapo.domain.Asignaciones; 

public class Memo extends Asignaciones {

  /* Private Fields */
  private int id_memo;
  
  private int id_asignacion;
  //private int id_estado;
  private int nro_memo;
 

private int ult_usuario;  
    
  /* JavaBeans Properties */

  public int getId_memo() {
    return id_memo; 
  }
  public void setId_memo(int id_memo) { 
    this.id_memo = id_memo; 
  }
  
 
  public int getNro_memo() { 
    return nro_memo;
  }
  public void setNro_memo(int nro_memo) { 
    this.nro_memo = nro_memo; 
  }

 
  
  public int getId_asignacion() {
    return id_asignacion; 
  }
  public void setId_asignacion(int id_asignacion) { 
    this.id_asignacion = id_asignacion; 
  }
 
  public int getUlt_usuario() {
    return ult_usuario; 
  }
  public void setUlt_usuario(int ult_usuario) { 
    this.ult_usuario = ult_usuario; 
  }
  
}


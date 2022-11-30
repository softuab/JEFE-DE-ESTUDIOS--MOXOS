package org.fautapo.domain; 

import java.io.Serializable;
import java.util.Date;
import org.fautapo.domain.Principal; 

public class Paises extends Principal {

  /* Private Fields */
  private int id_pais;
  private String pais;
  private String nacionalidad;  
    
  /* JavaBeans Properties */

  public int getId_pais() {
    return id_pais; 
  }
  public void setId_pais(int id_pais) { 
    this.id_pais = id_pais; 
  }
  
  public String getPais() { 
    return pais;
  }
  public void setPais(String pais) { 
    this.pais = pais; 
  }

  public String getNacionalidad() { 
    return nacionalidad;
  }
  public void setNacionalidad(String nacionalidad) { 
    this.nacionalidad = nacionalidad; 
  }
  
}


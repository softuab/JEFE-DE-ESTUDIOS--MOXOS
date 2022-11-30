package org.fautapo.domain; 

import java.io.Serializable;
import java.util.Date;
import org.fautapo.domain.Provincias; 

public class Localidades extends Provincias {

  /* Private Fields */
  private int    id_localidad;
  private String localidad;
    
  /* JavaBeans Properties */

  public int getId_localidad() { 
    return id_localidad; 
  }
  public void setId_localidad(int id_localidad) { 
    this.id_localidad = id_localidad; 
  }
  
  public String getLocalidad() { 
    return localidad;
  }
  public void setLocalidad(String localidad) { 
    this.localidad = localidad; 
  }
  
}


package org.fautapo.domain; 

import java.io.Serializable;
import java.util.Date;
import org.fautapo.domain.Pdepartamentos; 

public class Provincias extends Pdepartamentos {

  /* Private Fields */
  private int    id_provincia;
  private String provincia;
    
  /* JavaBeans Properties */

  public int getId_provincia() { 
    return id_provincia; 
  }
  public void setId_provincia(int id_provincia) { 
    this.id_provincia = id_provincia; 
  }
  
  public String getProvincia() { 
    return provincia;
  }
  public void setProvincia(String provincia) { 
    this.provincia = provincia; 
  }
  
}


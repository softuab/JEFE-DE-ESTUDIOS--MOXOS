package org.fautapo.domain; 

import java.io.Serializable;
import java.util.Date;
import org.fautapo.domain.Paises; 

public class Pdepartamentos extends Paises {

  /* Private Fields */
  private int id_departamento;
  private String departamento;
    
  /* JavaBeans Properties */

  public int getId_departamento() { return id_departamento;}
  public void setId_departamento(int id_departamento) {this.id_departamento = id_departamento; }
  
  public String getDepartamento() {return departamento;}
  public void setDepartamento(String departamento) {this.departamento = departamento;}  
  
}


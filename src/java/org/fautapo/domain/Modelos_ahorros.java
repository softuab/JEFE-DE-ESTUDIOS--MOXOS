package org.fautapo.domain;

import java.io.Serializable;
import org.fautapo.domain.Materias;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-07
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-07
*/

public class Modelos_ahorros extends Materias {

  /* Private Fields */
  private int    id_modelo_ahorro;
  private String modelo_ahorro;
  private int    ponderacion_modelo;
  private int    ponderacion_materia;
  private double nota_aprobacion;
  private String pago;
  private String id_plan;
  private int    id_programa;
private int id_fase_resolucion;
  /* JavaBeans Properties */
 public int getId_fase_resolucion() { return this.id_fase_resolucion; }
  public void setId_fase_resolucion(int id_fase_resolucion) { this.id_fase_resolucion = id_fase_resolucion; }  
  
  public int getId_modelo_ahorro() { 
    return id_modelo_ahorro; 
  }
  public void setId_modelo_ahorro(int id_modelo_ahorro) { 
    this.id_modelo_ahorro = id_modelo_ahorro;
  }
  
  public String getModelo_ahorro() { 
    return modelo_ahorro; 
  }
  public void setModelo_ahorro(String modelo_ahorro) { 
    this.modelo_ahorro = modelo_ahorro; 
  }

  public int getPonderacion_modelo() { 
    return ponderacion_modelo; 
  }
  public void setPonderacion_modelo(int ponderacion_modelo) { 
    this.ponderacion_modelo = ponderacion_modelo; 
  }

  public int getPonderacion_materia() { 
    return ponderacion_materia; 
  }
  public void setPonderacion_materia(int ponderacion_materia) { 
    this.ponderacion_materia = ponderacion_materia; 
  }
  
  public double getNota_aprobacion() { 
    return nota_aprobacion; 
  }
  public void setNota_aprobacion(double nota_aprobacion) { 
    this.nota_aprobacion = nota_aprobacion; 
  }

  public String getPago() { 
    return pago; 
  }
  public void setPago(String pago) { 
    this.pago = pago; 
  }

  public String getId_plan() { 
    return id_plan; 
  }
  public void setId_plan(String id_plan) { 
    this.id_plan = id_plan; 
  }

  public int getId_programa() { 
    return id_programa; 
  }
  public void setId_programa(int id_programa) {
    this.id_programa = id_programa;
  }


}

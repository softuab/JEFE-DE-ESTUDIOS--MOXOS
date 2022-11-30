package org.fautapo.domain;

import java.util.Date;
import org.fautapo.domain.Programas; 

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario bladimir
 * @fec_modificacion 2016/04/11
 */

public class Perfiles extends Planes {

  /* Private Fields */
  private int id_concepto;
  private int id_perfil;
  private int id_perfil_concepto;
  private int id_transaccion;
  private int id_estudiante;
  private int id_postulante;
  private int id_persona;
  private int id_persona_pst;
  private int id_programa;
  private int id_tipo_perfil;
  private int id_tipo_grado;
  private int id_tipo_clasificacion;
  private int id_proceso;
  private String id_perfil_proceso;
  private String tipo_perfil;
  private String concepto;
  private String perfil;
  private String codigo_perfil;
  private double costo;
  private double deposito;
  private double efectivo;
  private double total;
  private double pagado;
  private double descuento;
  private int remitente;
  private String nro_recibo;
  private int cantidad;
  private String  proceso;
  private Date   fec_pago;
  
  private String fecha_ini;
  private String fecha_fin;
  private String programa;
  
  private int id_tipo_descuento;
  private String tipo_descuento;
  private double porcentaje_descuento;
  private int id_perfil_materia; 
  private int ins_sede;
  private int id_almacen;
/*agregado*/
  private String sede;

  /* JavaBeans Properties */
  
  public int getId_concepto() {return id_concepto;}
  public void setId_concepto(int id_concepto) {this.id_concepto = id_concepto;}

  public int getId_perfil() {return id_perfil;}
  public void setId_perfil(int id_perfil) {this.id_perfil = id_perfil;}

  public int getId_perfil_concepto() {return id_perfil_concepto;}
  public void setId_perfil_concepto(int id_perfil_concepto) {this.id_perfil_concepto = id_perfil_concepto;}

  public int getId_transaccion() {return id_transaccion;}
  public void setId_transaccion(int id_transaccion) {this.id_transaccion = id_transaccion;}

  public String getId_perfil_proceso() {return id_perfil_proceso;}
  public void setId_perfil_proceso(String id_perfil_proceso) {this.id_perfil_proceso = id_perfil_proceso;}

  public int getId_estudiante() {return id_estudiante;}
  public void setId_estudiante(int id_estudiante) {this.id_estudiante = id_estudiante;}

  public int getId_postulante() {return id_postulante;}
  public void setId_postulante(int id_postulante) {this.id_postulante = id_postulante;}

  public int getId_persona() {return id_persona;}
  public void setId_persona(int id_persona) {this.id_persona = id_persona;}

  public int getId_persona_pst() {return id_persona_pst;}
  public void setId_persona_pst(int id_persona_pst) {this.id_persona_pst = id_persona_pst;}

  public int getId_programa() {return id_programa;}
  public void setId_programa(int id_programa) {this.id_programa = id_programa;}

  public int getId_tipo_perfil() {return id_tipo_perfil;}
  public void setId_tipo_perfil(int id_tipo_perfil) {this.id_tipo_perfil = id_tipo_perfil;}

  public int getId_tipo_grado() {return id_tipo_grado;}
  public void setId_tipo_grado(int id_tipo_grado) {this.id_tipo_grado = id_tipo_grado;}

  public int getId_tipo_clasificacion() {return id_tipo_clasificacion;}
  public void setId_tipo_clasificacion(int id_tipo_clasificacion) {this.id_tipo_clasificacion = id_tipo_clasificacion;}

  public String getTipo_perfil() {return tipo_perfil;}
  public void setTipo_perfil(String tipo_perfil) {this.tipo_perfil = tipo_perfil;}

  public String getConcepto() {return concepto;}
  public void setConcepto(String concepto) {this.concepto = concepto;}

  public String getPerfil() {return perfil;}
  public void setPerfil(String perfil) {this.perfil = perfil;}
  
  public String getCodigo_perfil() {return codigo_perfil;}
  public void setCodigo_perfil(String codigo_perfil) {this.codigo_perfil = codigo_perfil;}

  public double getCosto() {return costo;}
  public void setCosto(double costo) {this.costo = costo;}

  public double getDeposito() {return deposito;}
  public void setDeposito(double deposito) {this.deposito = deposito;}

  public double getEfectivo() {return efectivo;}
  public void setEfectivo(double efectivo) {this.efectivo = efectivo;}

  public double getTotal() {return total;}
  public void setTotal(double total) {this.total = total;}

  public double getPagado() {return pagado;}
  public void setPagado(double pagado) {this.pagado = pagado;}

  public double getDescuento() {return descuento;}
  public void setDescuento(double descuento) {this.descuento = descuento;}

  public int getRemitente() {return remitente;}
  public void setRemitente(int remitente) {this.remitente = remitente;}

  public String getNro_recibo() {return nro_recibo;}
  public void setNro_recibo(String nro_recibo) {this.nro_recibo = nro_recibo;}
  
  public int getId_almacen() {return id_almacen;}
  public void setId_almacen(int id_almacen) {this.id_almacen = id_almacen;}

  public int getCantidad() {return cantidad;}
  public void setCantidad(int cantidad) {this.cantidad = cantidad;}

  public int getId_proceso() { return id_proceso; }
  public void setId_proceso(int id_proceso) { this.id_proceso = id_proceso; }

  public String getProceso() { return proceso; }
  public void setProceso(String proceso) { this.proceso = proceso; }
  
  public Date getFec_pago() { return fec_pago; }
  public void setFec_pago(Date fec_pago) { this.fec_pago = fec_pago; }

  public String getFecha_ini() { return fecha_ini; }
  public void setFecha_ini(String fecha_ini) { this.fecha_ini = fecha_ini; }

  public String getFecha_fin() { return fecha_fin; }
  public void setFecha_fin(String fecha_fin) { this.fecha_fin = fecha_fin; }
  
  public String getPrograma() { return programa; }
  public void setPrograma(String programa) { this.programa = programa; }

  public int getId_tipo_descuento() {return id_tipo_descuento;}
  public void setId_tipo_descuento(int id_tipo_descuento) {this.id_tipo_descuento = id_tipo_descuento;}
  
  public String getTipo_descuento() {return tipo_descuento;}
  public void setTipo_descuento(String tipo_descuento) {this.tipo_descuento = tipo_descuento;}
  
  public double getPorcentaje_descuento() {return porcentaje_descuento;}
  public void setPorcentaje_descuento(double porcentaje_descuento) {this.porcentaje_descuento = porcentaje_descuento;}
  
  public int getId_perfil_materia() {return id_perfil_materia; }
  public void setId_perfil_materia(int id_perfil_materia) {this.id_perfil_materia = id_perfil_materia; }

  public int getIns_sede() {return ins_sede; }
  public void setIns_sede(int ins_sede) {this.ins_sede = ins_sede; }
  
  
  public String getSede() {return sede;}
  public void setSede(String sede) {this.sede = sede;}

}
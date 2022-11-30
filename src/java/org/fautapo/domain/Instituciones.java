package org.fautapo.domain;

import java.util.Date;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Instituciones extends Localidades {

  /* Private Fields */
  private int    id_institucion;
  private int    id_tipo_institucion;
  private int    id_sede_central;
  private String institucion;
  private String sigla;
  private String actividad;
  private String instrumento_apertura;
  private String direccion;
  private String telefono;
  private String fax;
  private String url;
  private Date   fec_creacion;
  private Date   fec_inicio_actividades;
  private int    nro_sedes;
  private String autoridad;
  private String representante_legal;
  private String correo;
  private String plan_estrategico;
  private String estatuto_organico;
  private String reglamento_investigacion;
  private String centro_investigacion_central;
  private String tipo_institucion;
  private String sede;
  private String logo;
  /* JavaBeans Properties */

  public int getId_institucion() { return id_institucion; }
  public void setId_institucion(int id_institucion) { this.id_institucion = id_institucion; }

  public int getId_tipo_institucion() { return id_tipo_institucion; }
  public void setId_tipo_institucion(int id_tipo_institucion) { this.id_tipo_institucion = id_tipo_institucion; }

  public int getId_sede_central() { return id_sede_central; }
  public void setId_sede_central(int id_sede_central) { this.id_sede_central = id_sede_central; }

  public String getInstitucion() { return institucion; }
  public void setInstitucion(String institucion) { this.institucion = institucion.toUpperCase(); }

  public String getSigla() { return sigla; }
  public void setSigla(String sigla) { this.sigla = sigla; }

  public String getActividad() { return actividad; }
  public void setActividad(String actividad) { this.actividad = actividad; }

  public String getInstrumento_apertura() { return instrumento_apertura; }
  public void setInstrumento_apertura(String instrumento_apertura) { this.instrumento_apertura = instrumento_apertura; }

  public String getDireccion() { return direccion; }
  public void setDireccion(String direccion) { this.direccion = direccion; }

  public String getTelefono() { return telefono; }
  public void setTelefono(String telefono) { this.telefono = telefono; }

  public String getFax() { return fax; }
  public void setFax(String fax) { this.fax = fax; }

  public String getUrl() { return url; }
  public void setUrl(String url) { this.url = url; }

  public Date getFec_creacion() { return fec_creacion; }
  public void setFec_creacion(Date fec_creacion) { this.fec_creacion = fec_creacion; }

  public Date getFec_inicio_actividades() { return fec_inicio_actividades; }
  public void setFec_inicio_actividades(Date fec_inicio_actividades) { this.fec_inicio_actividades = fec_inicio_actividades; }

  public int getNro_sedes() { return nro_sedes; }
  public void setNro_sedes(int nro_sedes) { this.nro_sedes = nro_sedes; }

  public String getAutoridad() { return autoridad; }
  public void setAutoridad(String autoridad) { this.autoridad = autoridad; }

  public String getRepresentante_legal() { return representante_legal; }
  public void setRepresentante_legal(String representante_legal) { this.representante_legal = representante_legal; }

  public String getCorreo() { return correo; }
  public void setCorreo(String correo) { this.correo = correo; }

  public String getPlan_estrategico() { return plan_estrategico; }
  public void setPlan_estrategico(String plan_estrategico) { this.plan_estrategico = plan_estrategico; }

  public String getEstatuto_organico() { return estatuto_organico; }
  public void setEstatuto_organico(String estatuto_organico) { this.estatuto_organico = estatuto_organico; }

  public String getReglamento_investigacion() { return reglamento_investigacion; }
  public void setReglamento_investigacion(String reglamento_investigacion) { this.reglamento_investigacion = reglamento_investigacion; }

  public String getCentro_investigacion_central() { return centro_investigacion_central; }
  public void setCentro_investigacion_central(String centro_investigacion_central) { this.centro_investigacion_central = centro_investigacion_central; }

  public String getTipo_institucion() { return tipo_institucion; }
  public void setTipo_institucion(String tipo_institucion) { this.tipo_institucion = tipo_institucion; }

  public String getSede() { return sede; }
  public void setSede(String sede) { this.sede = sede; }

  public String getLogo() { return logo; }
  public void setLogo(String logo) { this.logo = logo; }

}
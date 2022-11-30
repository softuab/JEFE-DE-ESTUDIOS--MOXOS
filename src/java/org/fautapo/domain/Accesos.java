package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import org.fautapo.domain.logic.MiFacade;

import org.fautapo.domain.Clientes;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Departamentos;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Accesos implements Serializable {

  /* Private Fields */
  private int    id_acceso;
  private String acceso;
  private List   listaFacultades;
  private List   listaProgramas;
  private List   listaDepartamentos;
  private List   listaPlanes;
  /* JavaBeans Properties */

  public int getId_acceso() { return id_acceso; }
  public void setId_acceso(int id_acceso) { this.id_acceso = id_acceso; }

  public String getAcceso() { return acceso; }
  public void setAcceso(String acceso) { this.acceso = acceso; }

  public List getListaFacultades() { return listaFacultades; }
  public void setListaFacultades(List listaFacultades) { this.listaFacultades = listaFacultades; }

  public List getListaProgramas() { return listaProgramas; }
  public void setListaProgramas(List listaProgramas) { this.listaProgramas = listaProgramas; }

  public List getListaDepartamentos() { return listaDepartamentos; }
  public void setListaDepartamentos(List listaDepartamentos) { this.listaDepartamentos = listaDepartamentos; }

  public List getListaPlanes() { return listaPlanes; }
  public void setListaPlanes(List listaPlanes) { this.listaPlanes = listaPlanes; }

  public void setAsignarAccesos(Clientes cliente, MiFacade mi) {
    // Tal vez tiene permiso para toda la universidad
    if (cliente.getId_universidad() > 0) {
      Universidades universidad = new Universidades();
      universidad.setId_universidad(cliente.getId_universidad());
      // AQUI - asignar el id_acceso y el acceso con id_universidad y universidad
      universidad = mi.getUnvBuscarUniversidad(universidad);
      this.setId_acceso(universidad.getId_universidad());
      this.setAcceso(universidad.getUniversidad());
      this.setListaFacultades(mi.getUnvListarFacultades(universidad));
      this.setListaProgramas(mi.getUnvListarProgramas(universidad));
      this.setListaDepartamentos(mi.getUnvListarDepartamentos(universidad));
      this.setListaPlanes(mi.getUnvListarPlanes(universidad));
    } else
    // Quizas, permiso a nivel facultativo
    if (cliente.getId_facultad() > 0) {
      Facultades facultad = new Facultades();
      facultad.setId_facultad(cliente.getId_facultad());
	  System.out.println("La facultad de secre es: "+facultad.getId_facultad());
      // AQUI - asignar el id_acceso y el acceso con id_facultad y facultad
      facultad = mi.getFclBuscarFacultad(facultad);
      this.setId_acceso(facultad.getId_facultad());
      this.setAcceso(facultad.getFacultad());
      this.setListaProgramas(mi.getFclListarProgramas(facultad));
      this.setListaDepartamentos(mi.getFclListarDepartamentos(facultad));
      this.setListaPlanes(mi.getFclListarPlanes(facultad));
    } else
    // Permiso a un programa
    if (cliente.getId_programa() > 0) {
      Programas programa = new Programas();
      programa.setId_programa(cliente.getId_programa());
      // AQUI - asignar el id_acceso y el acceso con id_programa y programa
      programa = mi.getPrgBuscarPrograma(programa);
      this.setId_acceso(programa.getId_programa());
      this.setAcceso(programa.getPrograma());
      this.setListaPlanes(mi.getPrgListarPlanes(programa));
    } else
    // Permiso a un departamento
    if (cliente.getId_departamento() > 0) {
      Departamentos departamento = new Departamentos();
      departamento.setId_departamento(cliente.getId_departamento());
      // AQUI - asignar el id_acceso y el acceso con id_departamento y departamento
      departamento = mi.getDptBuscarDepartamento(departamento);
      this.setId_acceso(departamento.getId_departamento());
      this.setAcceso(departamento.getDepartamento());
    }
    // fin Accesos
  }

}
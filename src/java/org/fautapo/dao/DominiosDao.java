package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Dominios;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-18
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-22
*/

public interface DominiosDao {

  //Administracion de dominios
  List getListarDominios() throws DataAccessException;
  List getListarDominiosAcceso(Clientes cliente) throws DataAccessException;  
  List getListarTiposDominios() throws DataAccessException;
  Dominios getBuscarDominio(Dominios dominio) throws DataAccessException;
  Dominios getBuscarTipoDominio(Dominios dominio) throws DataAccessException;
  int setRegistrarDominio(Dominios dominio) throws DataAccessException;
  int setEliminarDominio(Dominios dominio) throws DataAccessException;
  int getBuscarDominioOtrasTb(Dominios dominio) throws DataAccessException;
  //Fin Administracion de dominios

  //Administracion de tuplas
  List getListarTuplas(Dominios dominio) throws DataAccessException;
  List getListarTuplasPadre(Dominios dominio) throws DataAccessException;
  Dominios getBuscarTupla(Dominios dominio) throws DataAccessException;
  int setRegistrarTupla(Dominios dominio) throws DataAccessException;
  int setEliminarTupla(Dominios dominio) throws DataAccessException;
  //Fin Administracion de tuplas

  //Administracion de tramites
  int getBuscarTieneHijos(Tramites tramite) throws DataAccessException;
  List getListarCombos2(Tramites tramite) throws DataAccessException;
  int getBuscarTuplaPadre(Tramites tramite) throws DataAccessException;
  Dominios getBuscarTupla2(Dominios dominio) throws DataAccessException;
  int setRegistrarTempTupla(Tramites tramite) throws DataAccessException;
  int setLimpiarTempTuplas() throws DataAccessException;
  //Fin Administracion de tramites

}
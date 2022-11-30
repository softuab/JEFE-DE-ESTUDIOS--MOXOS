package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Abm;
import org.fautapo.domain.Tramites;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-22
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-22
*/

public interface GwDao {

  String getListarDatosTabla(Abm abm) throws DataAccessException;
  String getListarDatosPrimarios(Abm abm) throws DataAccessException;
  Abm getListarCamposTabla2(Abm abm) throws DataAccessException;
  Tramites getBuscarCampoGw(Tramites tramite) throws DataAccessException;

  //Tramites Limbo
  List getListarTramitesMiosLimbo(Tramites tramite) throws DataAccessException;
  int setRegistrarValorLimbo(Tramites tramite) throws DataAccessException;
  int setInsertarTramiteLimbo(Tramites tramite) throws DataAccessException;
  int setRetrocederTramiteLimbo(Tramites tramite) throws DataAccessException;
  //Fin Tramites Limbo
  
  String getBuscarTablaLimbo(Tramites tramite) throws DataAccessException;
  int setAvanzarTramiteLimbo(Tramites tramite) throws DataAccessException;
  int getBuscarIdCampoLimbo(Tramites tramite) throws DataAccessException;
  int setRegistrarValorLimbo2(Tramites tramite) throws DataAccessException;

  String getContarPaginasLimbo(Tramites tramite) throws DataAccessException;
  int setRegistrarTrPrFrLogLimbo(Tramites tramite) throws DataAccessException;

}
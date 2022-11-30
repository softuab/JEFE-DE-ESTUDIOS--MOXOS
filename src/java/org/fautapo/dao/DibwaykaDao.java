package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Dibwayka;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface DibwaykaDao {
  List getListarCamposProcesoWK(Dibwayka dibwayka) throws DataAccessException;
  List getListarComboWK(Dibwayka dibwayka) throws DataAccessException;
  int setCrearTablasDibWK(Dibwayka dibwayka) throws DataAccessException;
  List getListarCamposDibWK(Dibwayka dibwayka) throws DataAccessException;
  Dibwayka getBuscarTablaDibWK(Dibwayka dibwayka) throws DataAccessException;
  Dibwayka getBuscarCampoDibWK(Dibwayka dibwayka) throws DataAccessException;
  Dibwayka getBuscarTuplaDibWK(Dibwayka dibwayka) throws DataAccessException;

  int setInsertarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException;
  List getListarCondicionesConsultaDibWK(Dibwayka dibwayka) throws DataAccessException;
  List getListarConsultasDibWK() throws DataAccessException;
  int setBorrarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException;
  int setModificarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException;

  Dibwayka getBuscarConsultaDibWK(Dibwayka dibwayka) throws DataAccessException;
  List getConsultaCondicionDibWK(Dibwayka dibwayka) throws DataAccessException;
 
}
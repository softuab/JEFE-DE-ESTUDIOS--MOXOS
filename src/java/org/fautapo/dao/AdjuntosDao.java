package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Adjuntos;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-27
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-27
*/

public interface AdjuntosDao {

  int setRegistrarAdjunto(Adjuntos adjunto) throws DataAccessException;
  List getListarAdjuntos(Adjuntos adjunto) throws DataAccessException;
  
}
package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Calendarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface CalendariosDao {

  List getListarCalendarios(Calendarios calendario) throws DataAccessException;
  List<Calendarios> getlistarCalendarioDocente(Calendarios calendario) throws DataAccessException; 

}
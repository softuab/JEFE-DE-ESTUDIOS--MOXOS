package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Horarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface HorariosDao {

  List getListarDias() throws DataAccessException;
  List getListarHorario(Horarios horario) throws DataAccessException;
  List getListarAulasDisponibles(Horarios horario) throws DataAccessException;
  void setHrsLimpiarHorarioMateria(Horarios horario) throws DataAccessException;
  int setHrsRegistrarHorarioAula(Horarios horario) throws DataAccessException;


}
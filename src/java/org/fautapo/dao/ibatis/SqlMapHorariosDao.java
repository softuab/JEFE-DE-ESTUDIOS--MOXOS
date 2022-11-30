package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.HorariosDao;
import org.fautapo.domain.Horarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapHorariosDao extends SqlSessionDaoSupport implements HorariosDao {


 public List getListarDias() throws DataAccessException {
    return getSqlSession().selectList("getListarDias", null);
  }

  public List getListarHorario(Horarios horario) throws DataAccessException {
    return getSqlSession().selectList("getListarHorario", horario);
  }

  public List getListarAulasDisponibles(Horarios horario) throws DataAccessException {
    return getSqlSession().selectList("getListarAulasDisponibles", horario);
  }

  public void setHrsLimpiarHorarioMateria(Horarios horario) throws DataAccessException {
    getSqlSession().selectOne("setHrsLimpiarHorarioMateria", horario);
  }

  public int setHrsRegistrarHorarioAula(Horarios horario) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setHrsRegistrarHorarioAula", horario);
    return i.intValue();
  }


}
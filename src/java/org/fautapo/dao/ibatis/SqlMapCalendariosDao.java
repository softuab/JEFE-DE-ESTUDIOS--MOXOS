package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.CalendariosDao;
import org.fautapo.domain.Calendarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapCalendariosDao extends SqlSessionDaoSupport implements CalendariosDao {

  public List getListarCalendarios(Calendarios calendario) throws DataAccessException {
    return getSqlSession().selectList("getListarCalendarios", calendario);
  }

    @Override
    public List<Calendarios> getlistarCalendarioDocente(Calendarios calendario) throws DataAccessException {
        return getSqlSession().selectList("getlistarCalendarioDocente", calendario);
    }

}
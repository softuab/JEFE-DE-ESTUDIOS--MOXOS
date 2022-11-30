package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.AdjuntosDao;
import org.fautapo.domain.Adjuntos;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-27
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-27
*/

public class SqlMapAdjuntosDao extends SqlSessionDaoSupport implements AdjuntosDao {

  public int setRegistrarAdjunto(Adjuntos adjunto) throws DataAccessException {
    Integer i = (Integer) getSqlSession().selectOne("setRegistrarAdjunto", adjunto);
    return i.intValue();
  }

  public List getListarAdjuntos(Adjuntos adjunto) throws DataAccessException {
    return getSqlSession().selectList("getListarAdjuntos", adjunto);
  }

}
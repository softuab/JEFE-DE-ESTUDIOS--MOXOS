package org.fautapo.dao.ibatis;

import java.util.*;
import java.io.*;


import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.CurriculumDao;
import org.fautapo.domain.*;



public class SqlMapCurriculumDao extends SqlSessionDaoSupport implements CurriculumDao {

  public List cvGetListarRubrosPersona(Curriculum curriculum) throws DataAccessException { return getSqlSession().selectList("cvGetListarRubrosPersona", curriculum);}
  public List cvGetListarRubros(Curriculum curriculum) throws DataAccessException { return getSqlSession().selectList("cvGetListarRubros", curriculum);}
  public List cvGetListarSubRubros(Curriculum curriculum) throws DataAccessException { return getSqlSession().selectList("cvGetListarSubRubros", curriculum);}
  public int cvSetRegistrarCurriculum(Curriculum curriculum) throws DataAccessException {return ((Integer) getSqlSession().selectOne("cvSetRegistrarCurriculum", curriculum)).intValue(); }
  //Adjuntos Dct
  public int setRegistrarDctAdjuntos(Curriculum curriculum) throws DataAccessException {return ((Integer) getSqlSession().selectOne("setRegistrarDctAdjuntos", curriculum)).intValue(); }
  public List getListarAdjuntosDocente(Curriculum curriculum) throws DataAccessException { return getSqlSession().selectList("getListarAdjuntosDocente", curriculum);}
  public int setEliminarDctAdjunto(Curriculum curriculum) throws DataAccessException {return ((Integer) getSqlSession().selectOne("setEliminarDctAdjunto", curriculum)).intValue(); }

}




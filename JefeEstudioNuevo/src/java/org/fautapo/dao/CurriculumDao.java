package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Curriculum;


public interface CurriculumDao {


  List cvGetListarRubrosPersona (Curriculum curriculum) throws DataAccessException;
  List cvGetListarRubros        (Curriculum curriculum) throws DataAccessException;
  List cvGetListarSubRubros     (Curriculum curriculum) throws DataAccessException;
  int  cvSetRegistrarCurriculum (Curriculum curriculum) throws DataAccessException;
  //Adjunto Docente
  int  setRegistrarDctAdjuntos(Curriculum curriculum) throws DataAccessException;
  List getListarAdjuntosDocente(Curriculum curriculum) throws DataAccessException;
  int  setEliminarDctAdjunto(Curriculum curriculum) throws DataAccessException;
}

















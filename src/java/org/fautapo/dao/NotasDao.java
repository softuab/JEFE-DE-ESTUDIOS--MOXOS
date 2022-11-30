package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Notas;
import org.fautapo.domain.Estudiantes;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public interface NotasDao {

  //Mover notas 
  Notas getMtcMoverNoMatriculados(Notas nota) throws DataAccessException;
  Notas getMtcMoverMatriculados(Notas nota) throws DataAccessException;
  //Fin mover notas 
  //Reporte acta de calificaciones
  List getListarActaCalificaciones(Notas nota) throws DataAccessException;
  //Fin Reporte acta de calificaciones
  //Reporte acta de calificaciones PRECIERRE
  List getListarActaCalificacionesPreCierre(Notas nota) throws DataAccessException;
  //Fin Reporte acta de calificaciones PRECIERRE

  //Reporte acta de calificaciones Por Fase
  List getListarActaCalificacionesPorFase(Notas nota) throws DataAccessException;
  //Fin Reporte acta de calificaciones Por Fase

  //INICIO - Impresion de Certificado de Notas
  List getListarCertificadoNotasTodas(Estudiantes estudiante) throws DataAccessException;
  List getListarCertificadoNotasNivel(Estudiantes estudiante) throws DataAccessException;
  List getListarCertificadoNotasAprobadas(Estudiantes estudiante) throws DataAccessException;
  //FIN - Impresion de Certificado de Notas

 //INICIO2 - Impresion de Certificado de Notas
  List getListarCertificadoNotasTodas2(Estudiantes estudiante) throws DataAccessException;
  List getListarCertificadoNotasAprobadas2(Estudiantes estudiante) throws DataAccessException;
  List getListarCertificadoNotasTodas3(Estudiantes estudiante) throws DataAccessException;
  List getListarCertificadoNotasAprobadas3(Estudiantes estudiante) throws DataAccessException;
  List getListarHistorialAcademico(Estudiantes estudiante) throws DataAccessException;

  //FIN - Impresion de Certificado de Notas


  //INICIO - Rectificacion de notas
  List getListarNotasRectificar(Notas nota) throws DataAccessException;
  Notas getBuscarNota(Notas nota) throws DataAccessException;
  int setRegistrarRectificacion(Notas nota) throws DataAccessException;
  int setRegistrarRectificacionNota(Notas nota) throws DataAccessException;
  //FIN - Rectificacion de notas
  
  Notas getEstListarFichaAcademicaBuscar(Notas nota) throws DataAccessException;
  Notas getEstListarFichaAcademicaBuscarBuscarAnulada(Notas nota) throws DataAccessException;

  //INICIO - Historial Academico
  List getListarPlanMateriasNotas(Estudiantes estudiante) throws DataAccessException;
  List getListarPlanMateriasNotas2(Estudiantes estudiante) throws DataAccessException;
    List getListarPlanMateriasNotas3(Estudiantes estudiante) throws DataAccessException;
  double getBuscarPromedioDeNotas(Notas nota) throws DataAccessException;
  int getCantidadMateriasAprobadas(Estudiantes estudiante) throws DataAccessException;  
  //FIN - Historial Academico

}
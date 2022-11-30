package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.NotasDao;
import org.fautapo.domain.Notas;
import org.fautapo.domain.Estudiantes;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class SqlMapNotasDao extends SqlSessionDaoSupport implements NotasDao {

  //Mover notas
  public Notas getMtcMoverNoMatriculados(Notas nota) throws DataAccessException {
    return (Notas) getSqlSession().selectOne("getMtcMoverNoMatriculados", nota);
  }

  public Notas getMtcMoverMatriculados(Notas nota) throws DataAccessException {
    return (Notas) getSqlSession().selectOne("getMtcMoverMatriculados", nota);
  }
  //Fin mover notas
  // Reporte acta de calificaciones
  public List getListarActaCalificaciones(Notas nota) throws DataAccessException {
    return getSqlSession().selectList("getListarActaCalificaciones", nota);
  }
  //Fin Reporte acta de calificaciones
  // Reporte acta de calificaciones PRECIERRE
  public List getListarActaCalificacionesPreCierre(Notas nota) throws DataAccessException {
    return getSqlSession().selectList("getListarActaCalificacionesPreCierre", nota);
  }
  //Fin Reporte acta de calificaciones PRECIERRE

  // Reporte acta de calificaciones Por Fase
  public List getListarActaCalificacionesPorFase(Notas nota) throws DataAccessException {
    return getSqlSession().selectList("getListarActaCalificacionesPorFase", nota);
  }
  //Fin Reporte acta de calificaciones Por Fase

  //INICIO - Impresion de Certificado de Notas
  public List getListarCertificadoNotasTodas(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarCertificadoNotasTodas", estudiante);
  }

  public List getListarCertificadoNotasNivel(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarCertificadoNotasNivel", estudiante);
  }


  public List getListarCertificadoNotasAprobadas(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarCertificadoNotasAprobadas", estudiante);
  }
  //FIN - Impresion de Certificado de Notas

  //INICIO2 - Impresion de Certificado de Notas
  public List getListarCertificadoNotasTodas2(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarCertificadoNotasTodas2", estudiante);
  }

  public List getListarCertificadoNotasAprobadas2(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarCertificadoNotasAprobadas2", estudiante);
  }
    public List getListarCertificadoNotasTodas3(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarCertificadoNotasTodas3", estudiante);
  }

  public List getListarCertificadoNotasAprobadas3(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarCertificadoNotasAprobadas3", estudiante);
  }
  public List getListarHistorialAcademico(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarHistorialAcademico", estudiante);
  }
  //FIN - Impresion de Certificado de Notas



  //INICIO - Rectificacion de notas
  public List getListarNotasRectificar(Notas nota) throws DataAccessException {
    return getSqlSession().selectList("getListarNotasRectificar", nota);
  }

  public Notas getBuscarNota(Notas nota) throws DataAccessException {
    return (Notas) getSqlSession().selectOne("getBuscarNota", nota);
  }

  public Notas getEstListarFichaAcademicaBuscar(Notas nota) throws DataAccessException {
    return (Notas) getSqlSession().selectOne("getEstListarFichaAcademicaBuscar", nota);
  }

  public Notas getEstListarFichaAcademicaBuscarBuscarAnulada(Notas nota) throws DataAccessException {
    return (Notas) getSqlSession().selectOne("getEstListarFichaAcademicaBuscarBuscarAnulada", nota);
  }

  public int setRegistrarRectificacion(Notas nota) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarRectificacion", nota);
    return i.intValue();
  }

  public int setRegistrarRectificacionNota(Notas nota) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarRectificacionNota", nota);
    return i.intValue();
  }

  //FIN - Rectificacion de notas

  //INICIO - Historial Academico
  public List getListarPlanMateriasNotas(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarPlanMateriasNotas", estudiante);
  }

  public List getListarPlanMateriasNotas2(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarPlanMateriasNotas2", estudiante);
  }

public List getListarPlanMateriasNotas3(Estudiantes estudiante) throws DataAccessException {
    return getSqlSession().selectList("getListarPlanMateriasNotas3", estudiante);
  }
  public double getBuscarPromedioDeNotas(Notas nota) throws DataAccessException {
    Double d =  (Double) getSqlSession().selectOne("getBuscarPromedioDeNotas", nota);
    return d.doubleValue();
  }

  public int getCantidadMateriasAprobadas(Estudiantes estudiante) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("getCantidadMateriasAprobadas", estudiante);
    return i.intValue();
  }
  
  //FIN - Historial Academico
  
}
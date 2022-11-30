package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.PerfilesDao;
import org.fautapo.domain.Perfiles;
import org.fautapo.domain.Planes;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario bladimir
 * @fec_modificacion 2016/04/11
*/

public class SqlMapPerfilesDao extends SqlSessionDaoSupport implements PerfilesDao {

  public Perfiles getPrfBuscarPerfil(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getPrfBuscarPerfil", perfil);
  }
  
  public List getPstListarPerfiles(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getPstListarPerfiles", perfil);
  }

  public List getPstListarPerfilesEntidad(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getPstListarPerfilesEntidad", perfil);
  }

  public List getPrfListarConceptos(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getPrfListarConceptos", perfil);
  }

  public List getPstListarConceptos(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getPstListarConceptos", perfil);
  }

  public List getEstListarConceptos(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getEstListarConceptos", perfil);
  }

  public List getDctListarConceptos(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getDctListarConceptos", perfil);
  }

  public List getUsrListarConceptos(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getUsrListarConceptos", perfil);
  }

  public int setPstRegistrarTransaccion(Perfiles perfil) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setPstRegistrarTransaccion", perfil);
    return i.intValue();
  }

  public List getPrsListarConceptos(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getPrsListarConceptos", perfil);
  }

  public int setPrsRegistrarTransaccion(Perfiles perfil) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setPrsRegistrarTransaccion", perfil);
    return i.intValue();
  }

  public Perfiles getPrcBuscarPerfil(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getPrcBuscarPerfil", perfil);
  }

  public int setRegistrarTrnDetalle(Perfiles perfil) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setRegistrarTrnDetalle", perfil);
    return i.intValue();
  }

  public List getTrnListarTiposPerfiles() throws DataAccessException {
    return getSqlSession().selectList("getTrnListarTiposPerfiles", null);
  }
  
  public List getTrnMiListarPerfilesProceso(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnMiListarPerfilesProceso", perfil);
  }
  
  public Perfiles getTrnBuscarPerfilProceso(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getTrnBuscarPerfilProceso", perfil);
  }
  
  public int getTrnPerfilTieneDescuento(Perfiles perfil) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("getTrnPerfilTieneDescuento", perfil);
    return i.intValue();
  }

  public List getTrnListarPerfilesMaterias(Planes plan) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarPerfilesMaterias", plan);
  }
  
  public Perfiles getTrnBuscarPerfilMateria(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getTrnBuscarPerfilMateria", perfil);
  }
  
  public List getTrnListarPerfiles() throws DataAccessException {
    return getSqlSession().selectList("getTrnListarPerfiles", null);
  }
  
  public Perfiles getTrnBuscarPerfil(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getTrnBuscarPerfil", perfil);
  }
  
  public int setTrnRegistrarPerfilMateria(Planes plan) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("setTrnRegistrarPerfilMateria", plan);
    return i.intValue();
  }

  public Perfiles getTrnBuscarTransaccion(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getTrnBuscarTransaccion", perfil);
  }
  
  public Perfiles getTrnBuscarTransaccionRecibo(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getTrnBuscarTransaccionRecibo", perfil);
  }
  
   public Perfiles getTrnBuscarTransaccionReciboSede(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getTrnBuscarTransaccionReciboSede", perfil);
  }
  
  public List getTrnListarTrnDetalles(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarTrnDetalles", perfil);
  }
  
  //Tipos descuentos
  public List getTrnListarTiposDescuentos() throws DataAccessException {
    return getSqlSession().selectList("getTrnListarTiposDescuentos", null);
  }
  
  public Perfiles getTrnBuscarTipoDescuento(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getTrnBuscarTipoDescuento", perfil);
  } 
  
  public Perfiles getBuscarPerfilConcepto(Perfiles perfil) throws DataAccessException {
    return (Perfiles) getSqlSession().selectOne("getBuscarPerfilConcepto", perfil);
  }
  
  public List getTrnListarCajeros(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarCajeros", perfil);
  }
   public List getTrnListarCajerosProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarCajerosProv", perfil);
  }

  public List getTrnPrcListarPerfiles(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnPrcListarPerfiles", perfil);
  }

  public List getTrnListarTransacciones(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarTransacciones", perfil);
  }
  
  //aqui se agrego
  public List getRepCajasTransaccionesDiarias(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDiarias", perfil);
  } 

  public List getRepCajasTransaccionesDiariasGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDiariasGlobal", perfil);
  } 
//agregado para provincia darlin
  public List getRepCajasTransaccionesDiariasGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDiariasGlobalProv", perfil);
  } 

//fin agregado provincia darlin
//agregado para reporte detallado de conceptos por cajero Trinidad y Provincias
  public List getRepCajasTransaccionesDiariasGlobalxcajero(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDiariasGlobalxcajero", perfil);
  } 
  //agregado para reporte detallado de conceptos por cajero Trinidad y Provincias
  public List getRepCajasTransaccionesDiariasGlobalxcajeroProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDiariasGlobalxcajeroProv", perfil);
  } 
  
  public List getRepCajasTransaccionesDiariasEntidades(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDiariasEntidades", perfil);
  }
  
  public List getRepCajasResumenTesoroEntidades(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenTesoroEntidades", perfil);
  }
  
  public List getRepCajasResumenInstitucionalEntidades(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenInstitucionalEntidades", perfil);
  }
  
  
  
   public List getRepCajasResumenInstitucionalEntidadesConcepto(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenInstitucionalEntidadesConcepto", perfil);
  }
  
  

  public List getRepCajasResumenEstudiantilEntidades(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenEstudiantilEntidades", perfil);
  }
  
   public List getRepCajasResumenEstudiantilEntidadesConcepto(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenEstudiantilEntidadesConcepto", perfil);
  }

  
  public List getRepCajasResumenProfactulativoEntidades(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenProfactulativoEntidades", perfil);
  }
  
  public List getRepCajasResumenProfactulativoCarrera(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenProfactulativoCarrera", perfil);
  }

  public List getRepCajasDetalladoEntidades(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasDetalladoEntidades", perfil);
  }
    public List getRepCajasDetalladoCarrera(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasDetalladoCarrera", perfil);
  }
  public List getRepCajasTransaccionesDetalleGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDetalleGlobal", perfil);
  } 
  
  public List getRepCajasTransaccionesDetalleGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDetalleGlobalProv", perfil);
  } 

  public List getRepCajasTransaccionesDetalleGlobalAnuladas(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDetalleGlobalAnuladas", perfil);
  } 
   public List getRepCajasTransaccionesDetalleGlobalAnuladasProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDetalleGlobalAnuladasProv", perfil);
  } 

  public List getRepCajasTransaccionesDetalleEntidad(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDetalleEntidad", perfil);
  } 

  public List getRepCajasTransaccionesDetalle(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDetalle", perfil);
  } 

  public List getRepCajasTransaccionesDetalleAnuladas(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesDetalleAnuladas", perfil);
  } 

  public List getRepCajasResumenMatriculas(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenMatriculas", perfil);
  } 
 public List getRepCajasResumenTesoroCarrera(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenTesoroCarrera", perfil);
  }
  public List getRepCajasResumenMatriculasGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenMatriculasGlobal", perfil);
  } 
//Nro_2
  public List getRepCajasResumenMatriculasGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenMatriculasGlobalProv", perfil);
  }  
  
  
 public List getRepCajasResumenInstitucional(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenInstitucional", perfil);
  } 

 public List getRepCajasResumenInstitucionalGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenInstitucionalGlobal", perfil);
  } 
  // Nro_3
 public List getRepCajasResumenInstitucionalGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenInstitucionalGlobalProv", perfil);
  }   
  
 public List getRepCajasResumenEstudiantil(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenEstudiantil", perfil);
  } 
  
 public List getRepCajasResumenEstudiantilGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenEstudiantilGlobal", perfil);
  } 
  // Nro_4
 public List getRepCajasResumenEstudiantilGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenEstudiantilGlobalProv", perfil);
  }  

  public List getRepCajasResumenProfacultativo(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenProfacultativo", perfil);
  } 

  public List getRepCajasResumenProfacultativoGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenProfacultativoGlobal", perfil);
  } 
//Nro_5
  public List getRepCajasResumenProfacultativoGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenProfacultativoGlobalProv", perfil);
  } 
  
  public List getRepCajasResumenDetalladoMatriculas(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoMatriculas", perfil);
  } 
  
  public List getRepCajasResumenDetalladoMatriculasGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoMatriculasGlobal", perfil);
  } 
  
  public List getRepCajasResumenDetalladoMatriculasGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoMatriculasGlobalProv", perfil);
  } 

  public List getRepCajasResumenDetalladoEstudiantil(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoEstudiantil", perfil);
  } 

  public List getRepCajasResumenDetalladoEstudiantilGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoEstudiantilGlobal", perfil);
  } 
  
  public List getRepCajasResumenDetalladoEstudiantilGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoEstudiantilGlobalProv", perfil);
  } 

  public List getRepCajasResumenDetalladoInstitucional(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoInstitucional", perfil);
  } 

  public List getRepCajasResumenDetalladoInstitucionalGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoInstitucionalGlobal", perfil);
  } 

  public List getRepCajasResumenDetalladoInstitucionalGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoInstitucionalGlobalProv", perfil);
  } 
  
    public List getRepCajasResumenDetallado(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetallado", perfil);
  } 

    public List getRepCajasResumenDetalladoGlobal(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoGlobal", perfil);
  } 
     public List getRepCajasResumenDetalladoGlobalMatricula(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoGlobalMatricula", perfil);
  } 
public List getRepCajasResumenDetalladoGlobalProv(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoGlobalProv", perfil);
  } 
//para la entidad
    public List getRepCajasResumenDetalladoEntidades(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasResumenDetalladoEntidades", perfil);
  } 


  public List getRepCajasTransaccionesPorPrograma(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getRepCajasTransaccionesPorPrograma", perfil);
  } 
// public List getRepCajasGlobalGeneral(Perfiles perfil) throws DataAccessException {
//    return getSqlSession().selectList("getRepCajasGlobalGeneral", perfil);
//  } 

  //hasta aqui
  
  public List getTrnListarTransaccionesRecibo(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarTransaccionesRecibo", perfil);
  }
  
  public List getTrnListarTransaccionesReciboSede(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarTransaccionesReciboSede", perfil);
  }
  
  public List getTrnListarTrnDetalles2(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnListarTrnDetalles2", perfil);
  }

  // inicio JOJO
  public List getTrnBuscarPorNroRecibo(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnBuscarPorNroRecibo", perfil);
  }
   public List getTrnBuscarPorNroReciboSede(Perfiles perfil) throws DataAccessException {
    return getSqlSession().selectList("getTrnBuscarPorNroReciboSede", perfil);
  }

  public void setTrnBorrarDetalle(Perfiles perfil) throws DataAccessException {
    getSqlSession().selectOne("setTrnBorrarDetalle", perfil);
  }

  public void setTrnBorrarTransaccion(Perfiles perfil) throws DataAccessException {
    getSqlSession().selectOne("setTrnBorrarTransaccion", perfil);
  }
  // fin JOJO  

  public int getTrnBuscarSiguienteNroRecibo(Perfiles perfil) throws DataAccessException {
    Integer i =  (Integer) getSqlSession().selectOne("getTrnBuscarSiguienteNroRecibo", perfil);
    return i.intValue();
  }

  public void setTrnActualizarNroRecibo(Perfiles perfil) throws DataAccessException {
    getSqlSession().selectOne("setTrnActualizarNroRecibo", perfil);
  }

}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.BiBliografia;
import org.fautapo.domain.Contenidos;
import org.fautapo.domain.Cronograma;
import org.fautapo.domain.DistribucionTiempos;
import org.fautapo.domain.FormasDistribucion;
import org.fautapo.domain.FormasOrganizacion;
import org.fautapo.domain.FormasTrabajoAula;
import org.fautapo.domain.ProgramaAnalitico;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author DBMENESESJ
 */
public interface ProgramaAnaliticoDao {

    List<ProgramaAnalitico> GetListarDatosCaratula(int id_asignacion) throws DataAccessException;

    List<ProgramaAnalitico> GetListarMateriaProgramaAnalitico(int id_asignacion) throws DataAccessException;

    int PermitirRegistroPrograma(ProgramaAnalitico programaAnalitico) throws DataAccessException;

    List<ProgramaAnalitico> GetListarPrerequisitoMateria(ProgramaAnalitico programaAnalitico) throws DataAccessException;

    int RegistrarProgromaAnalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException;

    List<ProgramaAnalitico> GetListaProgramaanalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException;

    int ActualizarProgramaAnalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException;

    List<ProgramaAnalitico> GetProgramaanalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException;

    //bibliografia
    int ActualizarBibliografia(BiBliografia bibliografia) throws DataAccessException;

    int RegistrarBibliografia(BiBliografia bibliografia) throws DataAccessException;

    int EliminarBibliografia(BiBliografia bibliografia) throws DataAccessException;

    List<BiBliografia> GetListarBibliografia(BiBliografia bibliografia) throws DataAccessException;

    List<BiBliografia> GetBibliografia(BiBliografia bibliografia) throws DataAccessException;

    //cronograma
    int ActualizarCronograma(Cronograma cronograma) throws DataAccessException;

    int RegistrarCronograma(Cronograma cronograma) throws DataAccessException;

    int EliminarCronograma(Cronograma cronograma) throws DataAccessException;

    List<Cronograma> GetListarCronograma(Cronograma cronograma) throws DataAccessException;

    List<Cronograma> GetCronograma(Cronograma cronograma) throws DataAccessException;

    //CONTENIDO
    int ActualizarObjetivo_Instructivo(Contenidos contenidos) throws DataAccessException;

    int RegistrarObjetivo_Instructivo(Contenidos contenidos) throws DataAccessException;

    int EliminarObjetivo_Instructivo(Contenidos contenidos) throws DataAccessException;

    List<Contenidos> GetListarContenido(Contenidos contenidos) throws DataAccessException;

    List<Contenidos> GetContenido(Contenidos contenidos) throws DataAccessException;

    /* distribucion de tiempos*/
    List<FormasOrganizacion> GetListarformas() throws DataAccessException;

    List<FormasTrabajoAula> GetListarformastrabajoaula() throws DataAccessException;

    List<Contenidos> GetListarformascontenido(Contenidos contenidos) throws DataAccessException;

    List<DistribucionTiempos> GetListarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException;

    List<DistribucionTiempos> GetDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException;

    int RegistrarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException;

    int ActualizarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException;

    int EliminarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException;

    List<FormasDistribucion> GetListarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException;

    List<FormasDistribucion> GetFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException;

    int RegistrarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException;

    int ActualizarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException;

    int EliminarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException;

    ProgramaAnalitico GetDatosCaratula(int id_dct_programa_analitico) throws DataAccessException;

    List<FormasOrganizacion> GetListarformasProgramaAnalitico(int id_dct_programa_analitico) throws DataAccessException;

    List<FormasTrabajoAula> GetListarformastrabajoaulaProgramaAnalitico(int id_dct_programa_analitico) throws DataAccessException;

    List<FormasDistribucion> GetDetalleHorasFormasDistribucion(int id_dct_programa_analitico) throws DataAccessException;
    /* fin distribucion de tiempos*/
}

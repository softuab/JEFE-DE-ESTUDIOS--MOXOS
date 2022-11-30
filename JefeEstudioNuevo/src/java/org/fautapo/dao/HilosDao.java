package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Hilos;
import org.fautapo.domain.Usuarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-04
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-04
*/

public interface HilosDao {

  List getListarUsuariosHilos(Usuarios usuario) throws DataAccessException;
  List getListarTiposHilos() throws DataAccessException;
  int setRegistrarHilo(Hilos hilo) throws DataAccessException;
  List getListarTiposSegmentos() throws DataAccessException;
  List getListarSegmentos(Hilos hilo) throws DataAccessException;
  List getListarDestinatarios(Hilos hilo) throws DataAccessException;
  int setRegistrarSegmento(Hilos hilo) throws DataAccessException;
  int setRegistrarSgmAdjunto(Hilos hilo) throws DataAccessException;
  List getListarAdjuntosHilos(Hilos hilo) throws DataAccessException;
  Hilos getBuscarHilo(Hilos hilo) throws DataAccessException;
  List getListarHilosMios(Hilos hilo) throws DataAccessException;
  List getListarHilosAMi(Hilos hilo) throws DataAccessException;
  int getNroMensajes(Hilos hilo) throws DataAccessException;
  int getNroMensajesNuevos(Hilos hilo) throws DataAccessException;
  int setBorrarHilo(Hilos hilo) throws DataAccessException;

}

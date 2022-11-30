/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Tokens;

/**
 *
 * @author FNZABALETAA
 */
public interface TokenDao {

    int setGenerarToken(Tokens token) throws DataAccessException;

    List<Tokens> getListartokendocente(Tokens token) throws DataAccessException;
}

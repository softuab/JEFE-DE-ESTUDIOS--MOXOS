/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao.ibatis;

import java.util.List;
import org.fautapo.dao.TokenDao;
import org.fautapo.domain.Tokens;
import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;

/**
 *
 * @author FNZABALETAA
 */
public class SqlMapTokenDao extends SqlSessionDaoSupport implements TokenDao {

    @Override
    public int setGenerarToken(Tokens token) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setGenerarToken", token);
        return i.intValue();
    }

    @Override
    public List<Tokens> getListartokendocente(Tokens token) throws DataAccessException {
        return getSqlSession().selectList("getListartokendocente", token); //To change body of generated methods, choose Tools | Templates.
    }

}

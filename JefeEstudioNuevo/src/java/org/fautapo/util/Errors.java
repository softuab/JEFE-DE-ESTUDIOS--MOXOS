/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FNZABALETAA
 */
public class Errors {

    private List<String> error = null;
    private String detalleerror;
    private int count;

    public Errors() {
        error = new ArrayList<String>();
    }

    public void Add(String error) {
        this.error.add(error);
    }

    public int getCount() {
        count = error.size();
        return count;
    }

    public List<String> getError() {
        return error;
    }
 
}

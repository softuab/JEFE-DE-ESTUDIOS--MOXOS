/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

import java.io.File;

/**
 *
 * @author FNZABALETAA
 */
public enum Directorio {

    DIRECTORIO_CARNET("documentosidentificacion"),
    DIRECTORIO_LIBRETAMILITAR("libretamilitar"),
    DIRECTORIO_TITULOPROVISIONNACIONAL("tituloprovisionnacional"),
    DIRECTORIO_FORMACIONACADEMICA("formacionacademica"),
    DIRECTORIO_EXPERIENCIALABORAL("experiencialaboral"),
    DIRECTORIO_CURSOSREALIZADOS("cursosrealizados"),
    DIRECTORIO_PRODUCCIONCIENTIFICA("produccioncientifica"),
    DIRECTORIO_EVALUACIONDOCENTE("evaluaciondocente"),
    DIRECTORIO_IDIOMAS("idiomas");
    private String key;

    private Directorio(String key) {
        this.key = key;
    }

    public String key() {
        String rootPath = System.getProperty("catalina.home") + File.separator + "persona" + File.separator + this.key;
        return rootPath;
    }
}

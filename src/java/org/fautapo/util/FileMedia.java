/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileMedia {

    private byte[] bytes;
    private String contenttype;
    private String nombrearchivo;
    private String rootPath;
    private String extension;
    private String filename;
    private String fullname;

    public String getFullname() {
        fullname = rootPath + File.separator + nombrearchivo + extension;
        return fullname;
    }

    public String getFilename() {
        filename = contenttype + ";" + nombrearchivo + extension;
        return filename;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }

    public String getContenttype() {
        return contenttype;
    }

    public void setContenttype(String contenttype) {
        this.contenttype = contenttype;
    }

    public String getNombrearchivo() {
        return nombrearchivo;
    }

    public void setNombrearchivo(String nombrearchivo) {
        this.nombrearchivo = nombrearchivo;
    }

    public String getRootPath() {
        return rootPath;
    }

    public void setRootPath(String rootPath) {
        this.rootPath = rootPath;
    }

    public void save() throws IOException {
        Path path = Paths.get(getFullname());
        Files.write(path, bytes);
    }
}

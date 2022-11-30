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
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 *
 * @author FNZABALETAA
 */
public class FileUploadServlet {

    public static void MultipartRequest(HttpServletRequest request, String saveDirectory, String field, String fileName) throws IOException {
        String contentType = request.getContentType();
        if ((contentType.indexOf("multipart/form-data") >= 0)) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile(field);
            if (multipartFile != null) {
                if (!multipartFile.isEmpty()) {
                    byte[] bytes = multipartFile.getBytes();
                    String contenttype = multipartFile.getContentType();
                    String nombrearchivo = fileName + getExtension(contenttype);
                    String rootPath = saveDirectory + File.separator + nombrearchivo;
                    Path path = Paths.get(rootPath);
                    Files.write(path, bytes);
                    request.setAttribute(field, contenttype + ";" + nombrearchivo);
                } else {
                    request.setAttribute(field, "image.png");
                }
            } else {
                request.setAttribute(field, "image.png");
            }
        } else {
            request.setAttribute(field, "image.png");
        }
    }

    public static FileMedia FileRequest(HttpServletRequest request, String saveDirectory, String field, String Name) throws IOException {
        String contentType = request.getContentType();
        FileMedia media = null;
        if ((contentType.indexOf("multipart/form-data") >= 0)) {
            media = new FileMedia();
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile(field);
            if (multipartFile != null) {
                if (!multipartFile.isEmpty()) {
                    media.setBytes(multipartFile.getBytes());
                    media.setContenttype(multipartFile.getContentType());
                    media.setRootPath(saveDirectory);
                    media.setNombrearchivo(Name);
                    media.setExtension(getExtension(multipartFile.getContentType()));
                } else {
                    media = null;
                }
            } else {
                media = null;
            }
        } else {
            media = null;
        }
        return media;
    }

    public static void Rename(String actual, String nuevo) {
        File origen = new File(actual);
        File destino = new File(nuevo);
        origen.renameTo(destino);
    }

    private static String getExtension(String contentype) {
        String extension = "";
        switch (contentype) {
            case "image/jpeg":
                extension = ".jpg";
                break;
            case "image/gif":
                extension = ".gif";
                break;
            case "image/png":
                extension = ".png";
                break;
            default:
                extension = "";
                break;
        }
        return extension;
    }
}

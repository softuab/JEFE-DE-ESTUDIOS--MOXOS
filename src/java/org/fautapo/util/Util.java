/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.imageio.ImageIO;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author FNZABALETAA
 */
public class Util {

    public static String GetStructureList(List<ListViewItem> lista, String value) {
        String structure = "";
        for (ListViewItem obj : lista) {
            if (obj.getId().equals(value)) {
                obj.setSelect(Boolean.TRUE);
                structure += obj.getFormat();
            } else {
                obj.setSelect(Boolean.FALSE);
                structure += obj.getFormat();
            }
        }
        return structure;
    }

    public static BufferedImage resize(BufferedImage bufferedImage, int newW, int newH) {
        int w = bufferedImage.getWidth();
        int h = bufferedImage.getHeight();
        BufferedImage bufim = new BufferedImage(newW, newH, bufferedImage.getType());
        Graphics2D g = bufim.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.drawImage(bufferedImage, 0, 0, newW, newH, 0, 0, w, h, null);
        g.dispose();
        return bufim;
    }

    public static String EsImagenModificado(String value, String comparar) {
        String valorretorno = "";
        if (value.contains(":")) {
            if (comparar.equals("image.png")) {
                valorretorno = value;
            } else {
                valorretorno = comparar;
            }
        } else {
            if (value.equals(comparar)) {
                valorretorno = value;
            } else {
                valorretorno = comparar;
            }
        }
        return valorretorno;
    }

    public static boolean isNullOrBlank(String param) {
        return param == null || param.trim().length() == 0;
    }

    public static boolean isNumeric(String cadena) {
        try {
            Integer.parseInt(cadena);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }

    public static String Imagen64(String value, String Directorio) throws IOException {
        String imagen = "";
        String scontentype = "";
        String rootPath = "";
        if (value.contains(";")) {
            String[] str = value.split(";");
            scontentype = str[0];
            rootPath = Directorio + File.separator + str[1];
        } else {
            scontentype = "image/png";
            rootPath = Directorio + File.separator + value;
        }

        File fnew = new File(rootPath);
        BufferedImage originalImage = ImageIO.read(fnew);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(originalImage, scontentype.replaceAll("image/", ""), baos);
        byte[] imageInByte = baos.toByteArray();
        imagen = "data:" + scontentype + ";base64," + Base64.encodeBase64String(imageInByte);

        return imagen;
    }

    public static String Imagen64(String value, String Directorio, int w, int h) throws IOException {
        String imagen = "";
        String scontentype = "";
        String rootPath = "";
        if (value.contains(";")) {
            String[] str = value.split(";");
            scontentype = str[0];
            rootPath = Directorio + File.separator + str[1];
        } else {
            scontentype = "image/png";
            rootPath = Directorio + File.separator + value;
        }

        File fnew = new File(rootPath);
        BufferedImage originalImage = ImageIO.read(fnew);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(resize(originalImage, w, h), scontentype.replaceAll("image/", ""), baos);
        byte[] imageInByte = baos.toByteArray();
        imagen = "data:" + scontentype + ";base64," + Base64.encodeBase64String(imageInByte);

        return imagen;
    }
}

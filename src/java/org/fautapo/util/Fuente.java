/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.font.PdfFont;

public class Fuente {

    private float size;
    private Color color;
    private String type;
    private PdfFont font;

    public Fuente(PdfFont font, float size, String type, Color color) {
        this.size = size;
        this.color = color;
        this.type = type;
        this.font = font;
    }

    public PdfFont getFont() {
        return font;
    }

    public void setFont(PdfFont font) {
        this.font = font;
    }

    public float getSize() {
        return size;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}

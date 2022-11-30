/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

import com.itextpdf.layout.element.Text;

/**
 *
 * @author FNZABALETAA
 */
public class Texto {
    
    private Text text;
    private Fuente fuente;

    public Texto(String contenido, Fuente fuente) { 
        this.fuente = fuente; 
        switch(this.fuente.getType())
        {
            case "BOLD":
                text = new Text(contenido).setFont(this.fuente.getFont()).setFontColor(this.fuente.getColor()).setFontSize(this.fuente.getSize()).setBold();
                 break;
            case "ITALIC":
                 text = new Text(contenido).setFont(this.fuente.getFont()).setFontColor(this.fuente.getColor()).setFontSize(this.fuente.getSize()).setItalic();
                 break;
            case "NORMAL":
                 text = new Text(contenido).setFont(this.fuente.getFont()).setFontColor(this.fuente.getColor()).setFontSize(this.fuente.getSize());
                 break;
        }
    }

    public Text getText() {
        return text;
    }    
}

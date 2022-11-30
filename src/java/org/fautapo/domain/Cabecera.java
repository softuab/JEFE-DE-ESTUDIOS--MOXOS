/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.ExceptionConverter;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfContentByte;

/**
 * Clase que maneja los eventos de pagina necesarios para agregar un encabezado
 * y conteo de paginas a un documento. El encabezado, definido en onEndPage,
 * consiste en una tabla con 3 celdas que contienen: Frase del encabezado |
 * pagina de | total de paginas, con una linea horizontal separando el
 * encabezado del texto
 *
 * Referencia: http://itextpdf.com/examples/iia.php?id=104
 *
 * @author David
 */
public class Cabecera extends PdfPageEventHelper {

    protected Phrase header;

    public void setHeader(Phrase header) {
        this.header = header;
    }

    @Override
    public void onEndPage(PdfWriter writer, Document document) {
        PdfContentByte canvas = writer.getDirectContentUnder();
        ColumnText.showTextAligned(canvas, Element.ALIGN_RIGHT, header, 559, 806, 0);
    }
}

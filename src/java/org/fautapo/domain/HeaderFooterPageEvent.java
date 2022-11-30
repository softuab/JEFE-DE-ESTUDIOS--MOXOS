/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

/**
 *
 * @author FNZABALETAA
 */
import com.itextpdf.text.*;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.*;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletRequest;

public class HeaderFooterPageEvent extends PdfPageEventHelper {

    private LibretasDocente Libreta;
    protected Phrase watermark = new Phrase("NO OFICIAL", new Font(FontFamily.HELVETICA, 40, Font.NORMAL, BaseColor.LIGHT_GRAY));

    public HeaderFooterPageEvent(LibretasDocente libreta) {
        this.Libreta = libreta;
    }
    private PdfTemplate t;
    private Image total;
    Rectangle page;

    public void onOpenDocument(PdfWriter writer, Document document) {
        t = writer.getDirectContent().createTemplate(30, 16);
        try {
            total = Image.getInstance(t);
            total.setRole(PdfName.ARTIFACT);
        } catch (DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }

    @Override
    public void onEndPage(PdfWriter writer, Document document) {
        try {
            addHeader(writer, document);
            addHeader1(writer, document);
            addFooter(writer);
            PdfContentByte canvas = writer.getDirectContentUnder();
            String rootPath = System.getProperty("catalina.home");
            File IMAGE4 = new File(rootPath + File.separator + "imagenes" + File.separator + "uabtransparente.png");
            Image img = Image.getInstance(IMAGE4.getAbsolutePath());
            img.scaleToFit(240, 392);
            float width = img.getScaledWidth();
            float height = img.getScaledHeight();
            canvas.addImage(img, width, 0, 0, height, 400, 110);
            if (Libreta.getId_fase() == 7000 || Libreta.getId_fase() == 1000) {
                watermark = new Phrase("", new Font(FontFamily.HELVETICA, 40, Font.NORMAL, BaseColor.LIGHT_GRAY));
            } else {
                watermark = new Phrase("NO OFICIAL", new Font(FontFamily.HELVETICA, 40, Font.NORMAL, BaseColor.LIGHT_GRAY));
            }
            ColumnText.showTextAligned(canvas, Element.ALIGN_CENTER, watermark, 500, 75, 0);
        } catch (BadElementException ex) {
            Logger.getLogger(HeaderFooterPageEvent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(HeaderFooterPageEvent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(HeaderFooterPageEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void addHeader(PdfWriter writer, Document document) {
        PdfPTable header = new PdfPTable(3);
        page = document.getPageSize();
        try {
            // set defaults
            header.setWidths(new int[]{4, 36, 4});
            header.setTotalWidth(1000);
            header.setLockedWidth(true);
            header.getDefaultCell().setFixedHeight(40);
            header.getDefaultCell().setBorder(Rectangle.NO_BORDER);
            header.getDefaultCell().setBorderColor(BaseColor.WHITE);

            // add image 
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator + "imagenes" + File.separator + "logouab.jpg");

            Image logo = Image.getInstance(dir.getAbsolutePath());
            header.addCell(logo);

            // add text
            PdfPCell text = new PdfPCell();
            text.setPaddingBottom(10);
            text.setPaddingLeft(10);
            text.setBorder(Rectangle.NO_BORDER);
            text.setBorderColor(BaseColor.WHITE);
            Paragraph para = new Paragraph();
            para.add(new Phrase(this.Libreta.getNombreinstitucion().toUpperCase(), new Font(Font.FontFamily.HELVETICA, 12)));
            para.add(Chunk.NEWLINE);
            para.add(new Phrase(this.Libreta.getLugarimpresion().toUpperCase(), new Font(Font.FontFamily.HELVETICA, 8)));
            para.add(Chunk.NEWLINE);
            para.add(new Phrase("PLANILLA DE CALIFICACIONES", new Font(Font.FontFamily.HELVETICA, 8)));
            para.setAlignment(Element.ALIGN_CENTER);
            text.addElement(para);

            header.addCell(text);

            PdfPCell textfecha = new PdfPCell();
            textfecha.setPaddingBottom(10);
            textfecha.setPaddingLeft(10);
            textfecha.setBorder(Rectangle.NO_BORDER);
            textfecha.setBorderColor(BaseColor.WHITE);
            Paragraph parafecha = new Paragraph();
            Date fecha = new Date();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            parafecha.add(new Phrase(dateFormat.format(fecha), new Font(Font.FontFamily.HELVETICA, 12)));
            parafecha.setAlignment(Element.ALIGN_CENTER);
            textfecha.addElement(parafecha);

            header.addCell(textfecha);
            // write content 
            header.writeSelectedRows(0, -1, document.leftMargin(), page.getHeight(), writer.getDirectContent());
        } catch (DocumentException de) {
            throw new ExceptionConverter(de);
        } catch (MalformedURLException e) {
            throw new ExceptionConverter(e);
        } catch (IOException e) {
            throw new ExceptionConverter(e);
        }
    }

    private void addHeader1(PdfWriter writer, Document document) {
        PdfPTable header = new PdfPTable(3);
        page = document.getPageSize();
        try {
            // set defaults
            header.setWidths(new int[]{33, 33, 33});
            header.setTotalWidth(1000);
            header.setLockedWidth(true);
            header.getDefaultCell().setFixedHeight(40);
            header.getDefaultCell().setBorder(Rectangle.BOTTOM);
            header.getDefaultCell().setBorderColor(BaseColor.BLACK);

            //
            PdfPCell text1 = new PdfPCell();
            text1.setPaddingBottom(10);
            text1.setPaddingLeft(10);
            text1.setBorder(Rectangle.BOTTOM);
            text1.setBorderColor(BaseColor.BLACK);
            Paragraph para1 = new Paragraph();
            para1.add(new Phrase("FACULTAD: " + this.Libreta.getFacultad(), new Font(Font.FontFamily.HELVETICA, 8)));
            para1.add(Chunk.NEWLINE);
            para1.add(new Phrase("CARRERA: " + this.Libreta.getCarrera(), new Font(Font.FontFamily.HELVETICA, 8)));
            para1.add(Chunk.NEWLINE);
            para1.add(new Phrase("DOCENTE: " + this.Libreta.getDocente(), new Font(Font.FontFamily.HELVETICA, 8)));
            para1.add(Chunk.NEWLINE);
            para1.add(new Phrase("ASIGNATURA: " + this.Libreta.getAsignatura(), new Font(Font.FontFamily.HELVETICA, 8)));
            para1.add(Chunk.NEWLINE);
            para1.add(new Phrase("NIVEL ACADEMICO: " + this.Libreta.getNivelacademico(), new Font(Font.FontFamily.HELVETICA, 8)));
            para1.add(Chunk.NEWLINE);
            para1.setAlignment(Element.ALIGN_LEFT);
            text1.addElement(para1);

            header.addCell(text1);

            // add image 
            PdfContentByte cb = writer.getDirectContent();
            Image img = this.Libreta.GetBarcode(cb, 1, 1);
            header.addCell(img);

            // add text
            PdfPCell text = new PdfPCell();
            text.setPaddingBottom(10);
            text.setPaddingLeft(10);
            text.setBorder(Rectangle.BOTTOM);
            text.setBorderColor(BaseColor.BLACK);
            Paragraph para = new Paragraph();
            para.add(new Phrase("EVALUACION: " + this.Libreta.getTipoevaluacion(), new Font(Font.FontFamily.HELVETICA, 8)));
            para.add(Chunk.NEWLINE);
            para.add(new Phrase(this.Libreta.getTipoperiodo(), new Font(Font.FontFamily.HELVETICA, 8)));
            para.add(Chunk.NEWLINE);
            para.add(new Phrase("GRUPO: " + this.Libreta.getGrupo(), new Font(Font.FontFamily.HELVETICA, 8)));
            para.add(Chunk.NEWLINE);
            para.setAlignment(Element.ALIGN_LEFT);
            text.addElement(para);

            header.addCell(text);

            // write content 
            header.writeSelectedRows(0, -1, document.leftMargin(), page.getHeight() - 42, writer.getDirectContent());
        } catch (DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }

    private void addFooter(PdfWriter writer) {
        PdfPTable footer = new PdfPTable(3);
        try {
            // set defaults
            footer.setWidths(new int[]{24, 2, 1});
            footer.setTotalWidth(900);
            footer.setLockedWidth(true);
            footer.getDefaultCell().setFixedHeight(40);
            footer.getDefaultCell().setBorder(Rectangle.TOP);
            footer.getDefaultCell().setBorderColor(BaseColor.BLACK);

            // add copyright
            footer.addCell(new Phrase("Nota: Las raspaduras, anotaciones o enmiendas INVALIDA ESTE DOCUMENTO", new Font(Font.FontFamily.HELVETICA, 8, Font.BOLD)));

            // add current page count
            footer.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
            footer.addCell(new Phrase(String.format("Pagina %d de", writer.getPageNumber()), new Font(Font.FontFamily.HELVETICA, 8)));

            // add placeholder for total page count
            PdfPCell totalPageCount = new PdfPCell(total);
            totalPageCount.setBorder(Rectangle.TOP);
            totalPageCount.setBorderColor(BaseColor.BLACK);
            footer.addCell(totalPageCount);

            // write page
            PdfContentByte canvas = writer.getDirectContent();
            canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
            footer.writeSelectedRows(0, -1, 34, 50, canvas);
            canvas.endMarkedContentSequence();
        } catch (DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }

    public void onCloseDocument(PdfWriter writer, Document document) {
        int totalLength = String.valueOf(writer.getPageNumber()).length();
        int totalWidth = totalLength * 5;
        ColumnText.showTextAligned(t, Element.ALIGN_RIGHT,
                new Phrase(String.valueOf(writer.getPageNumber()), new Font(Font.FontFamily.HELVETICA, 8)),
                totalWidth, 6, 0);
    }
}

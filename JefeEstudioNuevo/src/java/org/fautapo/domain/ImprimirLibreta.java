/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;
import org.fautapo.util.Matematicas;

/**
 *
 * @author FNZABALETAA
 */
public class ImprimirLibreta {

    private LibretasDocente libreta;
    private HttpServletResponse response;
    private List<Libretas> parametros;
    private Font fonttitulotabla;
    private Font fontcontenttabla;
    private Font fontcontentreprobadotabla;
    private int NotaMinima;

    public ImprimirLibreta(LibretasDocente libreta, List<Libretas> parametros, int notaminima, HttpServletResponse response) {
        this.libreta = libreta;
        this.response = response;
        this.parametros = parametros;
        this.NotaMinima = notaminima;
    }

    public ImprimirLibreta(HttpServletResponse response) {
        this.response = response;
    }

    public void CreateLibretaRegular() throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=planillacalificaciones.pdf");
        OutputStream out = response.getOutputStream();
        try {
            try {
                Document document = new Document(PageSize.LEGAL.rotate(), 36, 36, 90, 36);
                PdfWriter writer = PdfWriter.getInstance(document, out);

                // add header and footer
                HeaderFooterPageEvent event = new HeaderFooterPageEvent(libreta);
                writer.setPageEvent(event);

                // write to document
                document.open();
                document.setMargins(5, 5, 155, 50);
                document.newPage();
                Paragraph part = new Paragraph();
                fonttitulotabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.BOLD, BaseColor.DARK_GRAY);
                fontcontenttabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.NORMAL, BaseColor.DARK_GRAY);
                fontcontentreprobadotabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.NORMAL, BaseColor.RED);
                part.add(new Phrase("  ", fonttitulotabla));
                List<Float> columnWidths = new ArrayList<>();
                columnWidths.add(5f);
                columnWidths.add(10f);
                columnWidths.add(50f);
                int columnas = parametros.stream().mapToInt(p -> p.getCantidad()).sum();

                for (Libretas l : parametros) {

                    if (l.getId_tipo_nota() != 6) {
                        if (l.getId_tipo_nota() != 9) {
                            for (int i = 1; i <= l.getCantidad(); i++) {
                                columnWidths.add(6f);
                            }
                        }
                    }
                }
                if (parametros.stream().filter(p -> p.getId_tipo_nota() == 3).count() != 0) {
                    columnWidths.add(10f);
                }
                if (parametros.stream().filter(p -> p.getId_tipo_nota() == 4).count() != 0) {
                    columnWidths.add(10f);
                }
                columnWidths.add(10f);
                if (parametros.stream().filter(p -> p.getId_tipo_nota() == 8).count() != 0) {
                    columnWidths.add(10f);
                }
                columnWidths.add(10f);
                columnWidths.add(10f);
                if (parametros.stream().filter(p -> p.getId_tipo_nota() == 6).count() != 0) {
                    columnWidths.add(10f);
                }
                columnWidths.add(10f);
                columnWidths.add(10f);
                columnWidths.add(20f);
                float[] anchocolumnas = new float[columnWidths.size()];
                for (int i = 0; i < columnWidths.size(); i++) {
                    anchocolumnas[i] = columnWidths.get(i);
                }
                PdfPTable table = new PdfPTable(anchocolumnas);
                crearDetalleColumnas(table);

                PdfPTable piepagina = new PdfPTable(3);
                piepagina.setTotalWidth(1000);
                piepagina.setLockedWidth(true);
                piepagina.getDefaultCell().setFixedHeight(40);
                piepagina.getDefaultCell().setBorder(Rectangle.NO_BORDER);
                piepagina.getDefaultCell().setBorderColor(BaseColor.WHITE);

                PdfPCell text = new PdfPCell();
                text.setPaddingBottom(10);
                text.setPaddingLeft(10);
                text.setBorder(Rectangle.NO_BORDER);
                text.setBorderColor(BaseColor.WHITE);
                Paragraph para = new Paragraph();
                para.add(new Phrase("______________________________________", new Font(Font.FontFamily.HELVETICA, 12)));
                para.add(Chunk.NEWLINE);
                para.add(new Phrase(libreta.getDocente(), new Font(Font.FontFamily.HELVETICA, 8)));
                para.setAlignment(Element.ALIGN_CENTER);
                text.addElement(para);

                piepagina.addCell(text);

                PdfPCell textsello = new PdfPCell();
                textsello.setPaddingBottom(10);
                textsello.setPaddingLeft(10);
                textsello.setBorder(Rectangle.NO_BORDER);
                textsello.setBorderColor(BaseColor.WHITE);
                Paragraph parasello = new Paragraph();
                parasello.add(new Phrase("______________________________________", new Font(Font.FontFamily.HELVETICA, 12)));
                parasello.add(Chunk.NEWLINE);
                parasello.add(new Phrase("Sello", new Font(Font.FontFamily.HELVETICA, 8)));
                parasello.setAlignment(Element.ALIGN_CENTER);
                textsello.addElement(parasello);

                piepagina.addCell(textsello);

                PdfPCell tablaobservacion = new PdfPCell();
                tablaobservacion.setPaddingBottom(10);
                tablaobservacion.setPaddingLeft(10);
                tablaobservacion.setBorder(Rectangle.NO_BORDER);
                tablaobservacion.setBorderColor(BaseColor.WHITE);
                float[] f1 = new float[]{3f, 3f, 3f};
                PdfPTable table2 = new PdfPTable(f1);
                table2.setHorizontalAlignment(Element.ALIGN_CENTER);
                crearDetalleColumnasObservaciones(table2);
                tablaobservacion.addElement(table2);

                piepagina.addCell(tablaobservacion);

                document.add(table);
                document.add(part);
                document.add(Chunk.NEWLINE);
                document.add(piepagina);
                document.close();

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                ex.getMessage();
            }
        } finally {
            out.close();
        }
    }

    public void CreateLibretaVerano() throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=planillacalificaciones.pdf");
        OutputStream out = response.getOutputStream();
        try {
            try {
                Document document = new Document(PageSize.LEGAL.rotate(), 36, 36, 90, 36);
                PdfWriter writer = PdfWriter.getInstance(document, out);

                // add header and footer
                HeaderFooterPageEvent event = new HeaderFooterPageEvent(libreta);
                writer.setPageEvent(event);

                // write to document
                document.open();
                document.setMargins(5, 5, 155, 50);
                document.newPage();
                Paragraph part = new Paragraph();
                fonttitulotabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.BOLD, BaseColor.DARK_GRAY);
                fontcontenttabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.NORMAL, BaseColor.DARK_GRAY);
                fontcontentreprobadotabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.NORMAL, BaseColor.RED);
                part.add(new Phrase("  ", fonttitulotabla));
                List<Float> columnWidths = new ArrayList<>();
                columnWidths.add(5f);
                columnWidths.add(10f);
                columnWidths.add(50f);
                int columnas = parametros.stream().mapToInt(p -> p.getCantidad()).sum();

                for (Libretas l : parametros) {
                    if (l.getId_tipo_nota() != 6) {
                        if (l.getId_tipo_nota() != 9) {
                            for (int i = 1; i <= l.getCantidad(); i++) {
                                columnWidths.add(6f);
                            }
                        }
                    }
                }
                columnWidths.add(10f);
                columnWidths.add(10f);
                columnWidths.add(10f);
                if (parametros.stream().filter(p -> p.getId_tipo_nota() == 8).count() != 0) {
                    columnWidths.add(10f);
                }
                if (parametros.stream().filter(p -> p.getId_tipo_nota() == 6).count() != 0) {
                    columnWidths.add(10f);
                }
                columnWidths.add(10f);
                columnWidths.add(10f);
                columnWidths.add(20f);
                float[] anchocolumnas = new float[columnWidths.size()];
                for (int i = 0; i < columnWidths.size(); i++) {
                    anchocolumnas[i] = columnWidths.get(i);
                }
                PdfPTable table = new PdfPTable(anchocolumnas);
                crearDetalleColumnasVerano(table);

                PdfPTable piepagina = new PdfPTable(3);
                piepagina.setTotalWidth(1000);
                piepagina.setLockedWidth(true);
                piepagina.getDefaultCell().setFixedHeight(40);
                piepagina.getDefaultCell().setBorder(Rectangle.NO_BORDER);
                piepagina.getDefaultCell().setBorderColor(BaseColor.WHITE);

                PdfPCell text = new PdfPCell();
                text.setPaddingBottom(10);
                text.setPaddingLeft(10);
                text.setBorder(Rectangle.NO_BORDER);
                text.setBorderColor(BaseColor.WHITE);
                Paragraph para = new Paragraph();
                para.add(new Phrase("______________________________________", new Font(Font.FontFamily.HELVETICA, 12)));
                para.add(Chunk.NEWLINE);
                para.add(new Phrase(libreta.getDocente(), new Font(Font.FontFamily.HELVETICA, 8)));
                para.setAlignment(Element.ALIGN_CENTER);
                text.addElement(para);

                piepagina.addCell(text);

                PdfPCell textsello = new PdfPCell();
                textsello.setPaddingBottom(10);
                textsello.setPaddingLeft(10);
                textsello.setBorder(Rectangle.NO_BORDER);
                textsello.setBorderColor(BaseColor.WHITE);
                Paragraph parasello = new Paragraph();
                parasello.add(new Phrase("______________________________________", new Font(Font.FontFamily.HELVETICA, 12)));
                parasello.add(Chunk.NEWLINE);
                parasello.add(new Phrase("Sello", new Font(Font.FontFamily.HELVETICA, 8)));
                parasello.setAlignment(Element.ALIGN_CENTER);
                textsello.addElement(parasello);

                piepagina.addCell(textsello);

                PdfPCell tablaobservacion = new PdfPCell();
                tablaobservacion.setPaddingBottom(10);
                tablaobservacion.setPaddingLeft(10);
                tablaobservacion.setBorder(Rectangle.NO_BORDER);
                tablaobservacion.setBorderColor(BaseColor.WHITE);
                float[] f1 = new float[]{3f, 3f, 3f};
                PdfPTable table2 = new PdfPTable(f1);
                table2.setHorizontalAlignment(Element.ALIGN_CENTER);
                crearDetalleColumnasObservaciones(table2);
                tablaobservacion.addElement(table2);

                piepagina.addCell(tablaobservacion);

                document.add(table);
                document.add(part);
                document.add(Chunk.NEWLINE);
                document.add(piepagina);
                document.close();

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                ex.getMessage();
            }
        } finally {
            out.close();
        }
    }

    public void CreateLibretaMesa() throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=planillacalificaciones.pdf");
        OutputStream out = response.getOutputStream();
        try {
            try {
                Document document = new Document(PageSize.LEGAL.rotate(), 36, 36, 90, 36);
                PdfWriter writer = PdfWriter.getInstance(document, out);

                // add header and footer
                HeaderFooterPageEvent event = new HeaderFooterPageEvent(libreta);
                writer.setPageEvent(event);

                // write to document
                document.open();
                document.setMargins(5, 5, 155, 50);
                document.newPage();
                Paragraph part = new Paragraph();
                fonttitulotabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.BOLD, BaseColor.DARK_GRAY);
                fontcontenttabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.NORMAL, BaseColor.DARK_GRAY);
                fontcontentreprobadotabla = new Font(Font.FontFamily.TIMES_ROMAN, 7.5f, Font.NORMAL, BaseColor.RED);
                part.add(new Phrase("  ", fonttitulotabla));
                List<Float> columnWidths = new ArrayList<>();
                columnWidths.add(5f);
                columnWidths.add(10f);
                columnWidths.add(50f);
                int columnas = parametros.stream().mapToInt(p -> p.getCantidad()).sum();

                for (Libretas l : parametros) {

                    if (l.getId_tipo_nota() != 6) {
                        for (int i = 1; i <= l.getCantidad(); i++) {
                            columnWidths.add(6f);
                        }
                    }
                }
                columnWidths.add(10f);
                columnWidths.add(10f);
                columnWidths.add(10f);
                columnWidths.add(10f);
                float[] anchocolumnas = new float[columnWidths.size()];
                for (int i = 0; i < columnWidths.size(); i++) {
                    anchocolumnas[i] = columnWidths.get(i);
                }
                PdfPTable table = new PdfPTable(anchocolumnas);
                crearDetalleColumnasMesa(table);

                PdfPTable piepagina = new PdfPTable(3);
                piepagina.setTotalWidth(1000);
                piepagina.setLockedWidth(true);
                piepagina.getDefaultCell().setFixedHeight(40);
                piepagina.getDefaultCell().setBorder(Rectangle.NO_BORDER);
                piepagina.getDefaultCell().setBorderColor(BaseColor.WHITE);

                PdfPCell text = new PdfPCell();
                text.setPaddingBottom(10);
                text.setPaddingLeft(10);
                text.setBorder(Rectangle.NO_BORDER);
                text.setBorderColor(BaseColor.WHITE);
                Paragraph para = new Paragraph();
                para.add(new Phrase("______________________________________", new Font(Font.FontFamily.HELVETICA, 12)));
                para.add(Chunk.NEWLINE);
                para.add(new Phrase(libreta.getDocente(), new Font(Font.FontFamily.HELVETICA, 8)));
                para.setAlignment(Element.ALIGN_CENTER);
                text.addElement(para);

                piepagina.addCell(text);

                PdfPCell textsello = new PdfPCell();
                textsello.setPaddingBottom(10);
                textsello.setPaddingLeft(10);
                textsello.setBorder(Rectangle.NO_BORDER);
                textsello.setBorderColor(BaseColor.WHITE);
                Paragraph parasello = new Paragraph();
                parasello.add(new Phrase("______________________________________", new Font(Font.FontFamily.HELVETICA, 12)));
                parasello.add(Chunk.NEWLINE);
                parasello.add(new Phrase("Sello", new Font(Font.FontFamily.HELVETICA, 8)));
                parasello.setAlignment(Element.ALIGN_CENTER);
                textsello.addElement(parasello);

                piepagina.addCell(textsello);

                PdfPCell tablaobservacion = new PdfPCell();
                tablaobservacion.setPaddingBottom(10);
                tablaobservacion.setPaddingLeft(10);
                tablaobservacion.setBorder(Rectangle.NO_BORDER);
                tablaobservacion.setBorderColor(BaseColor.WHITE);
                float[] f1 = new float[]{3f, 3f, 3f};
                PdfPTable table2 = new PdfPTable(f1);
                table2.setHorizontalAlignment(Element.ALIGN_CENTER);
                crearDetalleColumnasObservaciones(table2);
                tablaobservacion.addElement(table2);

                piepagina.addCell(tablaobservacion);

                document.add(table);
                document.add(part);
                document.add(Chunk.NEWLINE);
                document.add(piepagina);
                document.close();

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                ex.getMessage();
            }
        } finally {
            out.close();
        }
    }

    private PdfPCell createCell(String content, int colspan, int rowspan, int border) {
        PdfPCell cell = new PdfPCell(new Phrase(content, fonttitulotabla));
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setBorder(border);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        return cell;
    }

    private PdfPCell createContentCell(String content, int colspan, int rowspan, int border) {
        PdfPCell cell = new PdfPCell(new Phrase(content, fontcontenttabla));
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setBorder(border);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        return cell;
    }

    private PdfPCell createContentObservacionesCell(String content, int colspan, int rowspan, int border) {
        PdfPCell cell;
        if (content == "REPROBADO") {
            cell = new PdfPCell(new Phrase(content, fontcontentreprobadotabla));
        } else {
            cell = new PdfPCell(new Phrase(content, fontcontenttabla));
        }
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setBorder(border);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        return cell;
    }

    private void crearDetalleColumnas(PdfPTable table) {
        table.setWidthPercentage(100);
        table.setSpacingBefore(0f);
        table.setSpacingAfter(0f);
        // the cell object
        table.addCell(createCell("N°", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("R.U.", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("NOMBRE COMPLETO", 1, 2, PdfPCell.BOX));

        DecimalFormat format = new DecimalFormat("#.##");

        Libretas practicos = parametros.stream().filter(p -> p.getId_tipo_nota() == 4).count() == 0 ? null : parametros.stream().filter(p -> p.getId_tipo_nota() == 4).findFirst().get();
        if (practicos != null) {
            table.addCell(createCell(practicos.getTipo_nota().toUpperCase(), practicos.getCantidad(), 1, PdfPCell.BOX));
        }
        Libretas parciales = parametros.stream().filter(p -> p.getId_tipo_nota() == 3).count() == 0 ? null : parametros.stream().filter(p -> p.getId_tipo_nota() == 3).findFirst().get();
        if (parciales != null) {
            table.addCell(createCell(parciales.getTipo_nota().toUpperCase(), parciales.getCantidad(), 1, PdfPCell.BOX));
        }
        Libretas campoafectivo = parametros.stream().filter(p -> p.getId_tipo_nota() == 8).count() == 0 ? null : parametros.stream().filter(p -> p.getId_tipo_nota() == 8).findFirst().get();
        if (campoafectivo != null) {
            table.addCell(createCell(campoafectivo.getTipo_nota().toUpperCase(), campoafectivo.getCantidad(), 1, PdfPCell.BOX));
        }
        Libretas finales = parametros.stream().filter(p -> p.getId_tipo_nota() == 5).findFirst().get();
        table.addCell(createCell(finales.getTipo_nota().toUpperCase(), finales.getCantidad(), 1, PdfPCell.BOX));
        if (practicos != null) {
            table.addCell(createCell(practicos.getTipo_nota().toUpperCase() + "\n" + String.valueOf(practicos.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        }
        if (parciales != null) {
            table.addCell(createCell(parciales.getTipo_nota().toUpperCase() + "\n" + String.valueOf(parciales.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        }
        if (campoafectivo != null) {
            table.addCell(createCell(campoafectivo.getTipo_nota().toUpperCase() + "\n" + String.valueOf(campoafectivo.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        }
        table.addCell(createCell(finales.getTipo_nota().toUpperCase() + "\n" + String.valueOf(finales.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("NOTA\nFINAL", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("DERECHO\nSEGUNDA", 1, 2, PdfPCell.BOX));
        Libretas segunda = parametros.stream().filter(p -> p.getId_tipo_nota() == 6).count() == 0 ? null : parametros.stream().filter(p -> p.getId_tipo_nota() == 6).findFirst().get();
        if (segunda != null) {
            table.addCell(createCell(segunda.getTipo_nota().toUpperCase(), segunda.getCantidad(), 1, PdfPCell.BOX));
        }

        table.addCell(createCell("NOTA FINAL SEGUNDA INSTACIA", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("NOTA\nFINAL", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("OBSERVACION", 1, 2, PdfPCell.BOX));

        if (practicos != null) {
            for (int i = 1; i <= practicos.getCantidad(); i++) {
                table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
            }
        }
        if (parciales != null) {
            for (int i = 1; i <= parciales.getCantidad(); i++) {
                table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
            }
        }
        for (int i = 1; i <= finales.getCantidad(); i++) {
            table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
        }
        if (campoafectivo != null) {
            for (int i = 1; i <= campoafectivo.getCantidad(); i++) {
                table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
            }
        }
        if (segunda != null) {
            for (int i = 1; i <= segunda.getCantidad(); i++) {
                table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
            }
        }
        int nro = 1;
        for (LibretaEstudiante est : libreta.getPlanillaestudiantes().stream().sorted(Comparator.comparing(LibretaEstudiante::getNombrecompleto)).collect(Collectors.toList())) {
            table.addCell(createCell(String.valueOf(nro), 1, 1, PdfPCell.BOX));
            nro++;
            table.addCell(createCell(String.valueOf(est.getRu()), 1, 1, PdfPCell.BOX));
            table.addCell(createContentCell(est.getNombrecompleto(), 1, 1, PdfPCell.BOX));
            if (practicos != null) {
                for (double n : est.getNotas(4).getNotas()) {
                    NumberFormat formato = NumberFormat.getNumberInstance();;
                    table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
                }
            }
            if (parciales != null) {
                for (double n : est.getNotas(3).getNotas()) {
                    NumberFormat formato = NumberFormat.getNumberInstance();
                    table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
                }
            }
            if (campoafectivo != null) {
                for (double n : est.getNotas(8).getNotas()) {
                    NumberFormat formato = NumberFormat.getNumberInstance();;
                    table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
                }
            }
            for (double n : est.getNotas(5).getNotas()) {
                NumberFormat formato = NumberFormat.getNumberInstance();
                table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
            }
            if (practicos != null) {
                table.addCell(createCell(format.format(Matematicas.Redondear(est.getNotas(4).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
            }
            if (parciales != null) {
                table.addCell(createCell(format.format(Matematicas.Redondear(est.getNotas(3).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
            }
            if (campoafectivo != null) {
                table.addCell(createCell(format.format(Matematicas.Redondear(est.getNotas(8).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(format.format(Matematicas.Redondear(est.getNotas(5).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(format.format(Matematicas.Redondear(est.getNotas(4).getPonderacion() + est.getNotas(3).getPonderacion() + est.getNotas(5).getPonderacion() + est.getNotas(8).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
                double notasubtotal = est.getNotas(4).getPonderacion() + est.getNotas(3).getPonderacion() + est.getNotas(8).getPonderacion();
                double notatotal = est.getNotas(4).getPonderacion() + est.getNotas(3).getPonderacion() + est.getNotas(8).getPonderacion() + est.getNotas(5).getPonderacion();
                if (Matematicas.Redondear(notatotal, 0) >= 51) {
                    table.addCell(createCell(format.format(0), 1, 1, PdfPCell.BOX));
                } else {
                    if (Matematicas.Redondear(notasubtotal, 0) >= this.NotaMinima) {
                        table.addCell(createCell(format.format(Matematicas.Redondear(notasubtotal, 2)), 1, 1, PdfPCell.BOX));
                    } else {
                        table.addCell(createCell(format.format(0), 1, 1, PdfPCell.BOX));
                    }
                }
            } else {
                table.addCell(createCell(format.format(Matematicas.Redondear(est.getNotas(5).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
                Double notapractico = est.getNotas(4) == null ? 0 : est.getNotas(4).getPonderacion();
                Double notaparcial = est.getNotas(3) == null ? 0 : est.getNotas(3).getPonderacion();
                table.addCell(createCell(format.format(Matematicas.Redondear(notapractico + notaparcial + est.getNotas(5).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
                double notasubtotal = notapractico + notaparcial;
                double notatotal = notapractico + notaparcial + est.getNotas(5).getPonderacion();
                if (Matematicas.Redondear(notatotal, 0) >= 51) {
                    table.addCell(createCell(format.format(0), 1, 1, PdfPCell.BOX));
                } else {
                    if (Matematicas.Redondear(notasubtotal, 0) >= this.NotaMinima) {
                        table.addCell(createCell(format.format(Matematicas.Redondear(notasubtotal, 2)), 1, 1, PdfPCell.BOX));
                    } else {
                        table.addCell(createCell(format.format(0), 1, 1, PdfPCell.BOX));
                    }
                }
            }
            if (segunda != null) {
                for (int i = 1; i <= segunda.getCantidad(); i++) {
                    for (double n : est.getNotas(6).getNotas()) {
                        table.addCell(createCell(String.valueOf(n), 1, 1, PdfPCell.BOX));
                    }
                }
            }
            double notasinfinal = 0;
            if (parciales != null) {
                notasinfinal = campoafectivo == null ? est.getNotas(4).getPonderacion() + est.getNotas(3).getPonderacion() : est.getNotas(4).getPonderacion() + est.getNotas(3).getPonderacion() + est.getNotas(8).getPonderacion();
            } else {
                notasinfinal = campoafectivo == null ? 0 : est.getNotas(8).getPonderacion();
            }
            if (est.GetNotaPonderacionSegundaInstacia() != 0) {
                table.addCell(createCell(format.format(Matematicas.Redondear(notasinfinal + est.GetNotaPonderacionSegundaInstacia(), 0)), 1, 1, PdfPCell.BOX));
            } else {
                table.addCell(createCell(format.format(Matematicas.Redondear(est.GetNotaPonderacionSegundaInstacia(), 0)), 1, 1, PdfPCell.BOX));
            }
            table.addCell(createCell(format.format(Matematicas.Redondear(est.getNotafinal(), 0)), 1, 1, PdfPCell.BOX));
            table.addCell(createContentObservacionesCell(est.getObservaciones(), 1, 1, PdfPCell.BOX));
        }

    }

    private void crearDetalleColumnasVerano(PdfPTable table) {
        table.setWidthPercentage(100);
        table.setSpacingBefore(0f);
        table.setSpacingAfter(0f);
        // the cell object
        table.addCell(createCell("N°", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("R.U.", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("NOMBRE COMPLETO", 1, 2, PdfPCell.BOX));

        DecimalFormat format = new DecimalFormat("#.##");

        Libretas practicos = parametros.stream().filter(p -> p.getId_tipo_nota() == 4).findFirst().get();
        table.addCell(createCell(practicos.getTipo_nota().toUpperCase(), practicos.getCantidad(), 1, PdfPCell.BOX));

        Libretas parciales = parametros.stream().filter(p -> p.getId_tipo_nota() == 3).findFirst().get();
        table.addCell(createCell(parciales.getTipo_nota().toUpperCase(), parciales.getCantidad(), 1, PdfPCell.BOX));

        Libretas campoafectivo = parametros.stream().filter(p -> p.getId_tipo_nota() == 8).count() == 0 ? null : parametros.stream().filter(p -> p.getId_tipo_nota() == 8).findFirst().get();
        if (campoafectivo != null) {
            table.addCell(createCell(campoafectivo.getTipo_nota().toUpperCase(), campoafectivo.getCantidad(), 1, PdfPCell.BOX));
        }
        Libretas finales = parametros.stream().filter(p -> p.getId_tipo_nota() == 5).findFirst().get();
        table.addCell(createCell(finales.getTipo_nota().toUpperCase(), finales.getCantidad(), 1, PdfPCell.BOX));

        table.addCell(createCell(practicos.getTipo_nota().toUpperCase() + "\n" + String.valueOf(practicos.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        table.addCell(createCell(parciales.getTipo_nota().toUpperCase() + "\n" + String.valueOf(parciales.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        if (campoafectivo != null) {
            table.addCell(createCell(campoafectivo.getTipo_nota().toUpperCase() + "\n" + String.valueOf(campoafectivo.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        }
        table.addCell(createCell(finales.getTipo_nota().toUpperCase() + "\n" + String.valueOf(finales.getPonderacion()) + "%", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("NOTA\nFINAL", 1, 2, PdfPCell.BOX));

        table.addCell(createCell("NOTA\nFINAL", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("OBSERVACION", 1, 2, PdfPCell.BOX));

        for (int i = 1; i <= practicos.getCantidad(); i++) {
            table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
        }
        for (int i = 1; i <= parciales.getCantidad(); i++) {
            table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
        }
        if (campoafectivo != null) {
            for (int i = 1; i <= campoafectivo.getCantidad(); i++) {
                table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
            }
        }
        for (int i = 1; i <= finales.getCantidad(); i++) {
            table.addCell(createCell("Nota " + String.valueOf(i), 1, 1, PdfPCell.BOX));
        }
        int nro = 1;
        for (LibretaEstudiante est : libreta.getPlanillaestudiantes().stream().sorted(Comparator.comparing(LibretaEstudiante::getNombrecompleto)).collect(Collectors.toList())) {
            table.addCell(createCell(String.valueOf(nro), 1, 1, PdfPCell.BOX));
            nro++;
            table.addCell(createCell(String.valueOf(est.getRu()), 1, 1, PdfPCell.BOX));
            table.addCell(createContentCell(est.getNombrecompleto(), 1, 1, PdfPCell.BOX));
            for (double n : est.getNotas(4).getNotas()) {
                NumberFormat formato = NumberFormat.getNumberInstance();;
                table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
            }
            for (double n : est.getNotas(3).getNotas()) {
                NumberFormat formato = NumberFormat.getNumberInstance();;
                table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
            }
            if (campoafectivo != null) {
                for (double n : est.getNotas(8).getNotas()) {
                    NumberFormat formato = NumberFormat.getNumberInstance();;
                    table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
                }
            }
            for (double n : est.getNotas(5).getNotas()) {
                NumberFormat formato = NumberFormat.getNumberInstance();;
                table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
            }
            if (campoafectivo != null) {
                table.addCell(createCell(String.valueOf(est.getNotas(4).getPonderacion()), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(String.valueOf(est.getNotas(3).getPonderacion()), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(String.valueOf(est.getNotas(8).getPonderacion()), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(String.valueOf(est.getNotas(5).getPonderacion()), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(String.valueOf(Matematicas.Redondear(est.getNotas(4).getPonderacion() + est.getNotas(3).getPonderacion() + est.getNotas(5).getPonderacion() + est.getNotas(8).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));

            } else {
                table.addCell(createCell(String.valueOf(est.getNotas(4).getPonderacion()), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(String.valueOf(est.getNotas(3).getPonderacion()), 1, 1, PdfPCell.BOX)); 
                table.addCell(createCell(String.valueOf(est.getNotas(5).getPonderacion()), 1, 1, PdfPCell.BOX));
                table.addCell(createCell(String.valueOf(Matematicas.Redondear(est.getNotas(4).getPonderacion() + est.getNotas(3).getPonderacion() + est.getNotas(5).getPonderacion(), 2)), 1, 1, PdfPCell.BOX));
            }

            table.addCell(createCell(String.valueOf(est.getNotafinal()), 1, 1, PdfPCell.BOX));
            table.addCell(createContentObservacionesCell(est.getObservaciones(), 1, 1, PdfPCell.BOX));
        }

    }

    private void crearDetalleColumnasMesa(PdfPTable table) {
        table.setWidthPercentage(100);
        table.setSpacingBefore(0f);
        table.setSpacingAfter(0f);
        // the cell object
        table.addCell(createCell("N°", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("R.U.", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("NOMBRE COMPLETO", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("FASE INICIAL", 3, 1, PdfPCell.BOX));

        Libretas finales = parametros.stream().filter(p -> p.getId_tipo_nota() == 5).findFirst().get();

        table.addCell(createCell("NOTA\nFINAL", 1, 2, PdfPCell.BOX));
        table.addCell(createCell("OBSERVACION", 1, 2, PdfPCell.BOX));

        table.addCell(createCell(finales.getTipo_nota().toUpperCase(), finales.getCantidad(), 1, PdfPCell.BOX));
        table.addCell(createCell(finales.getTipo_nota().toUpperCase() + "\n" + String.valueOf(finales.getPonderacion()) + "%", 1, 1, PdfPCell.BOX));
        table.addCell(createCell("NOTA\nFINAL", 1, 1, PdfPCell.BOX));

        int nro = 1;
        for (LibretaEstudiante est : libreta.getPlanillaestudiantes().stream().sorted(Comparator.comparing(LibretaEstudiante::getNombrecompleto)).collect(Collectors.toList())) {
            table.addCell(createCell(String.valueOf(nro), 1, 1, PdfPCell.BOX));
            nro++;
            table.addCell(createCell(String.valueOf(est.getRu()), 1, 1, PdfPCell.BOX));
            table.addCell(createContentCell(est.getNombrecompleto(), 1, 1, PdfPCell.BOX));
            for (double n : est.getNotas(5).getNotas()) {
                NumberFormat formato = NumberFormat.getNumberInstance();;
                table.addCell(createCell(formato.format(n), 1, 1, PdfPCell.BOX));
            }
            table.addCell(createCell(String.valueOf(est.getNotas(5).getPonderacion()), 1, 1, PdfPCell.BOX));
            table.addCell(createCell(String.valueOf(est.getNotafinal()), 1, 1, PdfPCell.BOX));
            table.addCell(createCell(String.valueOf(est.getNotafinal()), 1, 1, PdfPCell.BOX));
            table.addCell(createContentObservacionesCell(est.getObservaciones(), 1, 1, PdfPCell.BOX));
        }
    }

    private void crearDetalleColumnasObservaciones(PdfPTable table) {

        table.addCell(createCell("RESUMEN DE RENDIMIENTO", 3, 1, PdfPCell.BOX));
        table.addCell(createCell("APROBADOS", 1, 1, PdfPCell.BOX));
        table.addCell(createCell("REPROBADOS", 1, 1, PdfPCell.BOX));
        table.addCell(createCell("TOTAL", 1, 1, PdfPCell.BOX));

        table.addCell(createCell(String.valueOf(this.libreta.getAprobados()), 1, 1, PdfPCell.BOX));
        table.addCell(createCell(String.valueOf(this.libreta.getReprobados()), 1, 1, PdfPCell.BOX));
        table.addCell(createCell(String.valueOf(this.libreta.getTotal()), 1, 1, PdfPCell.BOX));

    }
}

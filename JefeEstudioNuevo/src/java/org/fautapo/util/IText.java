/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.Jpeg;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FNZABALETAA
 */
public class IText {

    public static void CombinarPDF(List<InputStream> inputPdfList, List<File> fileimages, HttpServletResponse response, String FileName) throws Exception {
        //Create document and pdfReader objects.
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=" + FileName + ".pdf");
        OutputStream out = response.getOutputStream();
        Document document = new Document(PageSize.LEGAL, 36, 36, 90, 36);
        List<PdfReader> readers = new ArrayList<PdfReader>();
        int totalPages = 0;

        Iterator<InputStream> pdfIterator = inputPdfList.iterator();

        // Create reader list for the input pdf files.
        while (pdfIterator.hasNext()) {
            InputStream pdf = pdfIterator.next();
            PdfReader pdfReader = new PdfReader(pdf);
            readers.add(pdfReader);
            totalPages = totalPages + pdfReader.getNumberOfPages();
        }

        // Create writer for the outputStream
        PdfWriter writer = PdfWriter.getInstance(document, out);

        //Open document.
        document.open();
        if (!fileimages.isEmpty()) {
            for (File file : fileimages) {
                try {
                    document.newPage();
                    Image imagen = Image.getInstance(file.getPath());
                    imagen.scaleToFit(550, 700);
                    document.add(imagen);
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    continue;
                }
            }
        }

        //Contain the pdf data.
        PdfContentByte pageContentByte = writer.getDirectContent();

        PdfImportedPage pdfImportedPage;
        int currentPdfReaderPage = 1;
        Iterator<PdfReader> iteratorPDFReader = readers.iterator();

        // Iterate and process the reader list.
        while (iteratorPDFReader.hasNext()) {
            try {
                PdfReader pdfReader = iteratorPDFReader.next();
                //Create page and add content.
                while (currentPdfReaderPage <= pdfReader.getNumberOfPages()) {
                    document.newPage();
                    pdfImportedPage = writer.getImportedPage(
                            pdfReader, currentPdfReaderPage);

                    pageContentByte.addTemplate(pdfImportedPage, 0, 0);
                    currentPdfReaderPage++;
                }
                currentPdfReaderPage = 1;
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                continue;
            }
        }
        //Close document and outputStream.
        out.flush();
        document.close();
        out.close();
    }

}

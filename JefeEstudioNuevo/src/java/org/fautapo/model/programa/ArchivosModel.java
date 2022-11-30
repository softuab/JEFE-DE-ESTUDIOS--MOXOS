/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model.programa;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArchivosModel {
    private List<InputStream> pdfFiles;
    private List<File> imagesFiles;
}

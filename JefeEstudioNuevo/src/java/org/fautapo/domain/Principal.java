package org.fautapo.domain;

import com.itextpdf.text.log.SysoLogger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Principal implements Serializable {

    /* Private Fields */
    private int id_usuario;
    private int id_rol;
    private String id_estado;
    private String estado;
    private int gestion;
    private int periodo;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;
    private String nombre_usuario;
    private String fechita;
    private String nombres;
    private int id_universidad;
    private int id_facultad;
    private int id_programa;
    private String apodo;
    private String clave;

    public int getInt(HttpServletRequest request, String variable) {
        variable = request.getParameter(variable);
        if ((null == variable) || ("".equals(variable))) {
            variable = "0";
        }
        return Integer.parseInt(variable);
    }

    public Date getDate(HttpServletRequest request, String variable, String format) {
        SimpleDateFormat formatter = new SimpleDateFormat(format);
        variable = request.getParameter(variable);
        Date date = null;
        if ((null == variable) || ("".equals(variable))) {
            date = new Date();
        }
        try {
            date = formatter.parse(variable);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return date;
    }
}

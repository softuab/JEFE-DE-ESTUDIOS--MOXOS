package org.fautapo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author FNZABALETAA
 */
public class Convert {

    public static Boolean ToBoolean(HttpServletRequest request, String value) {
        String variable = request.getParameter(value);
        if (null == variable) {
            variable = "";
        }
        return ToBoolean(variable);
    }

    public static Date ToDate(HttpServletRequest request, String value, String format) throws ParseException {
        String variable = request.getParameter(value);
        Date date = null;
        if (null == variable) {
            variable = "";
            date = new Date();
        } else {
            date = new SimpleDateFormat(format).parse(variable);
        }
        return date;
    }

    public static int ToInteger(HttpServletRequest request, String variable) {
        variable = request.getParameter(variable);
        if ((null == variable) || ("".equals(variable))) {
            variable = "0";
        }
        return Integer.parseInt(variable);
    }

    public static Boolean ToBoolean(String value) {
        Boolean valuereturn = Boolean.FALSE;
        switch (value) {
            case "on":
                valuereturn = Boolean.TRUE;
                break;
            case "off":
                valuereturn = Boolean.FALSE;
                break;
            case "false":
                valuereturn = Boolean.FALSE;
                break;
            case "true":
                valuereturn = Boolean.TRUE;
                break;
            default:
                valuereturn = Boolean.FALSE;
                break;
        }
        return valuereturn;
    }

    public static String ToString(HttpServletRequest request, String variable) {
        variable = request.getParameter(variable);
        if (null == variable) {
            variable = "";
        }
        return variable;
    }

    public static String ToString(Object variable) {
        return String.valueOf(variable);
    }
    
    public static Integer ToInteger(Object variable) {
        return Integer.valueOf(String.valueOf(variable));
    }
}

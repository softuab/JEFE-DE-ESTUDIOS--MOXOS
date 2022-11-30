package org.fautapo.domain;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * @autor FAUTAPO
 * @fec_registro 2008-03-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Criptografia {

  public String MD5(String cadena) {
    String sMd5 = "";
    try {
      MessageDigest digest = MessageDigest.getInstance("MD5");
      sMd5 = new BigInteger(1, digest.digest((cadena).getBytes())).toString(16);
    } catch (Exception e) {
      System.out.println("Error al llamar a MD5");
    }
    if (sMd5.length() == 31)
      sMd5 = "0" + sMd5;
    return sMd5;
  }

}
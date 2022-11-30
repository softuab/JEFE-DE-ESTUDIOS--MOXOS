/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.filter;

import java.io.CharArrayWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class CharResponseWrapper extends HttpServletResponseWrapper {

  private final CharArrayWriter output;

  @Override
  public String toString() {
    return output.toString();
  }

  public CharResponseWrapper(HttpServletResponse response) {
    super(response);
    output = new CharArrayWriter();
  }

  @Override
  public PrintWriter getWriter() {
    return new PrintWriter(output);
  }

}
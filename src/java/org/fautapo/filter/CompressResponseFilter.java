/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.filter;

import com.googlecode.htmlcompressor.compressor.HtmlCompressor;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class CompressResponseFilter implements Filter {

    private HtmlCompressor compressor;

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {

        CharResponseWrapper responseWrapper = new CharResponseWrapper(
                (HttpServletResponse) resp);

        chain.doFilter(req, responseWrapper);

        String servletResponse = new String(responseWrapper.toString());
        resp.getWriter().write(compressor.compress(servletResponse));
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
         compressor = new HtmlCompressor();
        compressor.setCompressCss(true);
        compressor.setCompressJavaScript(true);
    }

    @Override
    public void destroy() {
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.estadoconexion;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.MoodleConfiguracion;
import org.fautapo.domain.logic.MiFacade;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("Status.fautapo")
public class Status {

    private MiFacade mi;

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }

    @RequestMapping(method = RequestMethod.POST)
    public void Status(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject modelo = new JSONObject();
        response.setContentType("application/json");
        response.setHeader("cache-control", "no-cache");
        PrintWriter out = response.getWriter();

        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        if (cliente == null) {
            modelo.put("status", "expirado");
            String jsonData = modelo.toString();
            out.print(jsonData);
            return;
        } 
        modelo.put("status", "on_line");
        String jsonData = modelo.toString();
        out.print(jsonData);
    }

}

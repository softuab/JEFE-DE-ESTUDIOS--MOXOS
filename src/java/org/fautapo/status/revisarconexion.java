package org.fautapo.status;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.fautapo.domain.Clientes;
import org.fautapo.domain.logic.MiFacade;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("revisarconexion.fautapo")
public class revisarconexion {

    private MiFacade mi;

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }

    @RequestMapping(method = RequestMethod.POST)
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("application/json");
        response.setHeader("cache-control", "no-cache");
        PrintWriter out = response.getWriter();
        JSONObject conectado = new JSONObject();
        Clientes cliente = (Clientes) request.getSession().getAttribute("__sess_cliente");
        if (cliente == null) {
            conectado.put("status", "expired");
            String jsonData = conectado.toString();
            out.print(jsonData);
            return;
        }
        conectado.put("status", "online");
        String jsonData = conectado.toString();
        out.print(jsonData);
    }
}
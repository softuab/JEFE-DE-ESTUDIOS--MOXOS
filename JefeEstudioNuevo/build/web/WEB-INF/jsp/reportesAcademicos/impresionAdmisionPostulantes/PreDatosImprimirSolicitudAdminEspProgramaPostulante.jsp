<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<table  width="100%">
  <tr>
    <td>
      <table  border="2px" width="90%">
        <tr>
          <td align="center" width="15%" align="right">
            <form name="fvolver" action="<c:url value='/postulantes/entradaBuscarPst.fautapo'/>" method="post">
              <input type="hidden" name="aplicacion" value="/" >
	      <input type="hidden" name="accion"     value='Formularito' >
              <div> <a href="javascript:document.fvolver.submit();">
              <IMG SRC="<c:url value='${logo}'/>"  border="0" ALT="logo institucion"></a></div>
	      <br>
	      <h1> U.A.B.</h1>
           </form>
          </td>
         <td align="center" width="20%">
           <table border="0">
             <tr>
               <td align="center"><font size="3"><b>FORM. DIA-003 <br>VIGENCIA 10/10/07 </font></b></td>
             <tr>
           </table>
        </td>
        <td  align="center" width="50%">
          <table border="0">
            <tr>
              <td align="center"><font size="5"><b>ADMISION ESPECIAL</font></b></td>
            <tr>
	   </tr>
             <td align="center"><font size="3"><b>POR CAMBIO DE PROGRAMA O <br>PROGRAMA SIMULTANEO</b></font></td>
           </tr>
        </table>
       </td>
     </tr>
   </table>
    </td>
  </tr>       
  <tr>
    <td> <hr> </td>  
  </tr>    
  <tr>
    <td>
      <form  name="forma" action="<c:url value='/postulantes/preDatosSolicitudCambioPrograma.fautapo'/>" method="post">
      <table class="tabla"  width=90% border=0 cellpadding=0>
        <tr>
          <th  colspan="4" align=center >SOLICITUD DE ADMISION</th> 
        </tr>      
        <tr>
          <td colspan="2"><b>POSTULANTE :</b>&nbsp;<c:out value="${datosPostulante.paterno}"/>&nbsp;<c:out value="${datosPostulante.materno}"/>&nbsp;<c:out value="${datosPostulante.nombres}"/>
          </td> 
          <td><b>R.P. :</b>&nbsp;<c:out value="${datosPostulante.id_postulante}"/>
            <input type="hidden" name="id_postulante"  value="${datosPostulante.id_postulante}">
          </td> 
          <td><b>Fecha  de solicitud:</b>&nbsp;
	       <input type="text" name="fec_solicitud" size="10" maxlength="10" value="<fmt:formatDate value="${now}" pattern="${formatoFecha}"/>">
	       <small><a href="javascript:showCal('fec_solicitud')"><img src="<c:url value='/imagenes/dibRap/calendario.jpeg'/>" border="0" ></a></small>
          </td>
	   
        </tr>       
        <tr>
          <td colspan="2">
           <table>
             <tr>
               <td><b>FACULTAD ORIGEN</b><font color='red'>(*)</font> </td>
            <td>
              <select id='id_facultad' name='id_facultad_origen' size='1'
                onChange="poblar('id_facultad', this.options[this.selectedIndex].value); document.forma.facultad.value = Afacultades[document.forma.id_facultad.value];">
              </select>
           </td>
           <script>
             var Afacultades = new Array();
             padre_hijo[h] = new Array ("id_facultad", "''", "<c:out value = "${id_facultad}"/>");
             combo[h] = new Array();
             combo[h][0] = new Array("0", "- Elija una opcion -", "");
             <c:forEach var = "lista" items = "${lFacultades}" varStatus="contador">
               Afacultades[<c:out value = "${lista.id_facultad}"/>] = '<c:out value = "${lista.facultad}"/>';
               combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${lista.id_facultad}"/>", "<c:out value = "${lista.facultad}"/>", "");
             </c:forEach>
             h++;
           </script>
        </tr>
        <tr>
          <td><b>PROGRAMA ORIGEN </b><font color='red'>(*)</font> </td>
          <td>
            <select id='id_programa' name='id_programa_origen' size='1'
              onChange="poblar('id_programa', this.options[this.selectedIndex].value); document.forma.id_programa.value = Aprogramas[document.forma.id_programa.value];">
            </select>
          </td>
            <script>
              var Aprograma = new Array();
              padre_hijo[h] = new Array ("id_programa", "id_facultad", "<c:out value = "${bPst.id_programa}"/>");
              combo[h] = new Array();
              combo[h][0] = new Array("0", "- Elija una opcion -", "");
              <c:forEach var = "cod" items = "${lProgramas}" varStatus = "programac">
                Aprograma[<c:out value = "${cod.id_programa}"/>] = '<c:out value = "${cod.programa}"/>';
                combo[h][<c:out value = "${programac.count}"/>] = new Array("<c:out value = "${cod.id_programa}"/>", "<c:out value = "${cod.programa}"/>", "<c:out value = "${cod.id_facultad}"/>");
              </c:forEach>
              h++;
            </script>
          </tr>
        </table>	
        </td>
        <td colspan="2">
          <table>
            <tr>
              <td><b>FACULTAD DESTINO </b><font color='red'>(*)</font> :: &nbsp;<c:out value="${datosPostulante.facultad}"/></td>  
            </tr>
            <tr>
	      <td><b>PROGRAMA DESTINO</b> <font color='red'>(*)</font> :: &nbsp;<c:out value="${datosPostulante.programa}"/></td>  
            </tr>
        </table>	
      </td>  
    </tr>    
    <tr>
      <td colspan="4">
      <p>Mediante la presente sol&iacute;cito la admisi&oacute;n especial dentro de la modalidad de : <b><c:out value="${datosPostulante.tipo_admision}"/> </b>
      </td>
    <tr>
      <td colspan="4"><b>ADMISION ESPECIAL POR : <c:out value="${datosPostulante.tipo_admision}"/></td> 
    </tr>
    <tr>
      <td colspan="4">
      <br><br><br><br>
      <center>
      _________________________<br>
      FIRMA
      </center>
      </td>
    </tr>
    <tr>
      <th  colspan="4" align=center >INFORME PROGRAMA ORIGEN</th> 
    </tr>      
    <tr>
      <td colspan="4">La coordinaci&oacute;n de programa origen de :  </td>
    </tr>
    <tr>
      <td colspan="2">
        <p>Informa que el solicitante cumple con los requisitos y plazas
        <p>establecidas para la admisi&oacute;n especial dentro de la modalidad de:
        <p>con el tramite solicitado.
        <br><br><br>
        <b>Fecha :</b><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></b>
      </td> 
      <td><br><br><br><br><br><br><br><br>
        <center>
        _______________________<br>
        FIRMA
       </center>
      </td> 
      <td align="center"><br><br><br><br><br><br><br><br> 
        Sello
      </td> 
    </tr>
    <tr>
      <th colspan="4"> INFORME PROGRAMA DESTINO</th>
    </tr>
    <tr>
      <td colspan="4">La coordinaci&on de programa origen de : <b><c:out value="${datosPostulante.programa}"/></b>  </td>
    </tr>
    <tr>
      <td colspan="2">
        <p>Informa que el soliciatando no tiene nada pendiente  con las Unidades
        <p>dependientes del Programa Acad&eacute;mico por lo tanto puede continuar
        <p><b><c:out value="${datosPostulante.tipo_admision}"/></b> por
        <p>lo tanto puede continuar con el tramite solicitado
       <br><br><br>
       <b>Fecha :</b><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></b>
      </td> 
      <td><br><br><br><br><br><br><br><br>
        <center>
        _______________________<br>
        FIRMA
        </center>
      </td> 
      <td align="center"><br><br><br><br><br><br><br><br> 
        Sello
      </td>     
    </tr>
    <tr>
      <th colspan="4">AUTORIZACION DE ADMISON ESPECIAL</th>
    </tr>
    <tr>
      <td colspan="3"><b>La direcci&oacute;n de &aacute;rea de :</b>&nbsp;<c:out value="${datosPostulante.facultad}"/></td>
    </tr>
    <tr>
      <td colspan="2">
        <p>Autoriza al (a la) solicitante a la admis&oacute; especial bajo la modalidad de
        <p><b><c:out value="${datosPostulante.tipo_admision}"/></b> por lo
        <p>tanto puede registrarse como estudiante regular al programa Destino Solicitado:
        <br><br><br>
        <b>Fecha :</b><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></b>
      </td> 
      <td><br><br><br><br><br><br><br><br>
       <center>
       _______________________<br>
       FIRMA VICERECTORADO
       </center>
      </td> 
      <td align="center"><br><br><br><br><br><br><br><br> 
      <center>
        Sello&nbsp;&nbsp;&nbsp;&nbsp;______________________<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V.B.
      </center>  
      </td>     
    </tr>
    <tr>
      <td colspan="4" align="center"><input type=submit  value='Ver Formulario' class="buscar"></td>
    </tr>
  </table>
</form>
  </td>
  </tr>
<table>    
<script language="JavaScript">
  var calFormat = "<c:out value='${formatoFecha}'/>";  
  iniciar();
</script>
<%@ include file="../../Inferior.jsp" %>
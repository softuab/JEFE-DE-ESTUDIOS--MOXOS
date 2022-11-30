<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<table  border="0" width="100%">
  <tr>
    <td  width="100%">
      <table  border="2px" width="100%">
        <tr>
          <td align="center" width="20%" align="right">
            <form name="fvolver" action="<c:url value='/postulantes/entradaBuscarPst.fautapo'/>" method="post">
              <input type="hidden" name="aplicacion" value="/" >
              <div> <a href="javascript:document.fvolver.submit();">
              <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion"></a></div>
	      <br><font size="4"><b> U.A.B.</b></font>
           </form>
          </td>
         <td align="center" width="25%">
           <table border="0">
             <tr>
               <td align="center"><font size="3"><b>FORM. DIA-003 <br> VIGENCIA 10/10/07</b></td>
             <tr>
           </table>
        </td>
        <td  align="center" width="55%">
          <table border="0">
            <tr>
              <td align="center"><font size="5"><b>ADMISION ESPECIAL</font></b></td>
            <tr>
	   </tr>
             <td align="center"><font size="3"><b>POR CAMBIO DE PROGRAMA O <br>PROGRAMA SIMULTANEO</font></b></td>
           </tr>
        </table>
       </td>
       </tr>
      </table>
    </td>
  </tr>  
  <tr>
    <td><hr></td>
  </tr>
  <tr>
    <td  width="100%">
     <table class="tabla"  width="100%" border=0 cellpadding=0>
       <tr>
         <th  colspan="4" align=center > <h3>SOLICITUD DE ADMISION </h3></th> 
      </tr>      
      <tr>
        <td colspan="2"><b>POSTULANTE :</b>&nbsp;<c:out value="${datosPostulante.paterno}"/>&nbsp;<c:out value="${datosPostulante.materno}"/>&nbsp;<c:out value="${datosPostulante.nombres}"/>
        </td> 
        <td><b>R.P. :</b>&nbsp;<c:out value="${datosPostulante.id_postulante}"/>
        </td> 
        <td><b>Fecha  de solicitud:</b>&nbsp; <a href='javascript:window.print()'><fmt:formatDate value="${datosPostulante.fec_registro}" pattern="${formatoFecha}"/> </a>
        </td> 
      </tr>       
      <tr>
        <td colspan="2"><b>PROGRAMA ORIGEN :</b>&nbsp;<c:out value="${datosPrograma.programa}"/></td> 
        <td colspan="2"><b>PROGRAMA DESTINO : </b>&nbsp;<c:out value="${datosPostulante.programa}"/></td> 
      </tr>
       <tr>
        <td colspan="4">
        <p>Mediante la presente sol&iacute;cito la admisi&oacute;n especial dentro de la modalidad de :<b>&nbsp;&nbsp;<c:out value="${datosPostulante.tipo_admision}"/> </b>
        </td>
      </tr>	
      <tr>
        <td colspan="4">
        <br><br><br><br><br><br>
        <center>
        _________________________<br>
        FIRMA
        </center>
        </td>
      </tr>
      <tr>
        <th  colspan="4" align="center"><h3>INFORME PROGRAMA ORIGEN</h3></th> 
      </tr>      
      <tr>
        <td colspan="4">La coordinaci&oacute;n de programa origen de : &nbsp;<b><c:out value="${datosPrograma.programa}"/></b>  </td>
      </tr>
      <tr>
        <td width="50%" colspan="2">
         <p>Informa que el solicitante cumple con los requisitos y plazas
         <p>establecidas para la admisi&oacute;n especial dentro de la modalidad de:
         <p> <b><c:out value="${datosPostulante.tipo_admision}"/></b>.
         <br><br><br>
         <b>Fecha :&nbsp; ............/............./............</b>
        </td> 
        <td width="25%"><br><br><br><br><br><br><br><br>
         <center>
         _______________________<br>
         Firma
         </center>
        </td> 
        <td width="25%" align="center"><br><br><br><br><br><br><br><br> 
          Sello
        </td> 
      </tr>
      <tr>
        <th colspan="4"><h3>INFORME PROGRAMA DESTINO</h3></th>
      </tr>
      <tr>
        <td colspan="4">La coordinaci&oacute;n de programa destino de :<b>&nbsp;<c:out value="${datosPostulante.programa}"/></b>  </td>
      </tr>
      <tr>
        <td width="50%" colspan="2">
         <p>Informa que el solicitado no tiene nada pendiente  con las Unidades
         <p>dependientes del Programa Acad&eacute;mico, por lo tanto puede continuar
         <p>con el tr&aacute;mite de :
         <p><b>&nbsp;<c:out value="${datosPostulante.tipo_admision}"/></b>.
         <br><br><br>
         <b>Fecha :&nbsp; ............/............./............</b>
        </td> 
        <td width="25%"><br><br><br><br><br><br><br><br><br>
         <center>
         _______________________<br>
         Firma
         </center>
        </td> 
        <td width="25%" align="center"><br><br><br><br><br><br><br><br><br> 
          Sello
        </td>     
      </tr>
       <tr>
        <th colspan="4"> <h3>AUTORIZACION DE ADMISION ESPECIAL</h3></th>
      </tr>
       <tr>
        <td colspan="3"><b>La direcci&oacute;n de &aacute;rea de  :</b><c:out value="${datosPostulante.facultad}"/> </td>
      </tr>
      <tr>
        <td width="50%" colspan="2">
         <p>Autoriza al (a la) solicitante a la admis&oacute;n especial bajo la modalidad de
         <p><b><c:out value="${datosPostulante.tipo_admision}"/></b>,&nbsp; por lo
         <p>tanto puede registrarse como estudiante regular al programa destino solicitado:
         <br><br><br>
         <b>Fecha :&nbsp; ............/............/............</b>
        </td> 
        <td width="25%"><br><br><br><br><br><br><br><br><br>
         <center>
         _______________________<br>
         Firma
         </center>
        </td> 
        <td width="25%" align="center"><br><br><br><br><br><br><br><br><br> 
        <center>
          Sello&nbsp;&nbsp;&nbsp;&nbsp;______________________<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V.B. Vice-Rector
        </center>  
        </td>     
      </tr>
    </table>
    </td>
  </tr>        
</table>  
      
<%@ include file="../../Inferior.jsp" %>
<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<table  border="0" width="100%">
  <tr>
    <td width="20%" align="right">
      <form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito' >
        <div> <a href="javascript:document.fvolver.submit();">
        <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion"></a></div>
      </form>
    </td>
    <td width="80%">
      <table border="0">
        <tr>
          <td align="center"><font size="3"><b><c:out value='${institucion}'/></font></b></td>
        <tr>
	</tr>
          <td align="center"><font size="1"><c:out value='${actividad}'/></font></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<hr>
<br>
<table class="tabla"  width=80% border=0 cellpadding=0>
  <tr>
    <th  colspan="3" align=center >SOLICITUD DE ADMISION</th> 
  </tr>      
  <tr>
    <td><b>POSTULANTE :</b>&nbsp;<c:out value="${datosPostulante.paterno}"/>&nbsp;<c:out value="${datosPostulante.materno}"/>&nbsp;<c:out value="${datosPostulante.nombres}"/>
    </td> 
    <td><b>R.P. :</b>&nbsp;<c:out value="${datosPostulante.id_postulante}"/>
    </td> 
    <td><b>Fecha :</b>&nbsp;<fmt:formatDate value="${datosPostulante.fec_registro}" pattern="${formatoFecha}"/>
    </td> 
  </tr>       
  <tr>
    <td><b>AREA :</b>&nbsp;<c:out value="${datosPostulante.facultad}"/>
    </td> 
    <td colspan="2"><b>PROGRAMA :</b>&nbsp;<c:out value="${datosPostulante.programa}"/>
    </td> 
  </tr>
  <tr>
    <td colspan="3"><b>MODALIDAD DE ADMISION :</b>&nbsp;<c:out value="${datosPostulante.tipo_admision}"/> </td>
  </tr>
  <tr>
    <td colspan="3"><b>DESCRIPCION DE MODALIDAD DE ADMISION :</b>&nbsp;<c:out value="${datosPostulante.tipo_admision}"/> </td>
  </tr>
  <tr>
    <td colspan="3">
    <p>Mediante la presente sol&iacute;cito la admisi&oacute;n especial dentro de la modalidad de admisi&oacute;n especial para profesionales.<br>
    <p>Que estando comprendido en el art&iacute;culo No.7 del Reglamento General de R&eacute;gimen Estudiantil de la Universidad Amaz&oacute;nica de Pando UAP. 
    <p>Solicito la admisi&oacute;n a la UAP en la presente gesti&oacute;n dentro de la modalidad de admisi&oacute;n especial.
    <br><br><br><br>
    <center>
    _________________________<br>
    FIRMA
    </center>
    </td>
  </tr>
  <tr>
    <th  colspan="3" align=center >INFORME DE PLAZA PROGRAMA SOLICITADO</th> 
  </tr>      
  <tr>
    <td colspan="3"><b>EL DEPARTAMENTO DE TRAMITES Y REGISTROS :</b> </td>
  </tr>
  <tr>
    <td>
     <p>Informa que de acuerdo a resoluci&oacute;n de Area en
     <p>relaci&oacute;n de cantidad de estudiantes que el área
     <p>acepta para presente gesti&oacuten, se ha verificado la
     <p>disponibilidad de plaza al programa solicitado.
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
      Timbres y Sello
    </td> 
  </tr>
  <tr>
    <th colspan="3"> AUTORIZACION DE ADMISION ESPECIAL</th>
  </tr>
  <tr>
    <td colspan="3"><b>LA DIRECCION DE AREA :</b><c:out value="${datosPostulante.facultad}"/> </td>
  </tr>
  <tr>
    <td>
      <p>Autoriza al (a la) solicitante  la admisi&oacute;n especial
      <p>bajo la modalidad de
      <p> <b><c:out value="${datosPostulante.tipo_admision}"/></b>
      <p>al Programa solicitado, por lo tanto puede
      <p>registrarse como estudiante regular al Programa
      <p>Acad&eacute;mico Solicitado: 
      <p><c:out value="${datosPostulante.programa}"/>
     <br><br><br>
     <b>Fecha :</b><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></b>
    </td> 
    <td><br><br><br><br><br><br><br><br>
     <center>
     _______________________<br>
     FIRMA
     </center>
    </td> 
    <td><br><br><br><br><br><br><br><br>
     <center>
     _______________________<br>
     V.B. RECTORADO
     </center>
    </td>     
  </tr>
</table>
  
<%@ include file="../../Inferior.jsp" %>
<%@ include file="../../Superior.jsp"%>
<jsp:useBean id="now" class="java.util.Date"/>

<center>
<table width=800 border = 0>
<tr>
<td>

<DIV ID="cont1" STYLE="position:center;top:10px;left:50px">
<IMG src='<c:url value="/"/>imagenes/certificados/uabcdc4.jpg' width=800 height=1000 border=0>
</DIV>
<DIV ID=2"cont1" STYLE="position:absolute;top:10px;left:50x">

<TABLE  width=800 border=0>
<TR>
<TD>


<!-- ===================================== TITLUO =========================================== -->
<center>


<table width="100%" border= 0>
  <tr>
    <td width="10%" align="center">
      <form name="fvolver" action="<c:url value='/documentacion/buscarEstudianteEntrada.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito'>
        <div> <a href="javascript:document.fvolver.submit();">
        <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion" width=100 height=140></a></div>
      </form>
</td>
    <td width="90%" align="center">
      <table width="100%"  cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><font size="6>"<b>UNIVERSIDAD AUTONOMA DEL BENI <BR>JOSE BALLIVIAN</font></td>
        <tr>
        <tr>
          <td align="center"><font size="5"><b>Direcci&oacute;n de Planificaci&oacute;n Acad&eacute;mica</b></font></td>
        <tr>  
        </tr>
          <td align="center"><font size="4"><b>Divisi&oacute;n de Registros e Inscripciones</b></font></td>
        </tr>
      </table>
    </td>
      </tr>
</table>


</center>
<br>
<!-- =============================================================================== -->
<!-- ========================== LINEA DE VOLVER ===================================== -->


<!-- =============================================================================== -->
<!-- ============================ SEGUNDO TITULO ==================================== -->
<hr>
<center>
<br>
<table border = 0>
  <tr>
    <td colspan="2" align="center"><font size="5"><b>CERTIFICADO DE DOCUMENTACI&Oacute;N</b></font></td>
  </tr>
</table>
</center>
<hr>
<!-- =============================================================================== -->

<center>
<br>
<br>

<!-- =========================== CUERPO ===================================================== -->
<table  border= 0  width ="70%"    >
<tr>
   <font size="3"> El Suscrito Responsable de Registros e Inscripciones </font>

</tr>
<tr>
<th><font size="3"><br>CERTIFICA QUE: </font></th>
</tr>
  <tr>
<th align=left><font size="3">Registro Universitario :</font></th>
<td>&nbsp &nbsp</td>
    <td>
      <font size="3"><c:out value="${datosEst.id_estudiante}"/></font>
    </td>
</tr>

<tr>
<th align=left><font size="3">Carnet de Identidad :</font></th>
<td>&nbsp &nbsp</td>
    <td>
     <font size="3"> <c:out value="${datosEst.dip}"/></font>
    </td>
</tr>
<tr>
<th align=left><font size="3">Nombres :</font></th>
<td>&nbsp &nbsp</td>
    <td>
     <font size="3"> <c:out value="${datosEst.nombres}"/> <c:out value="${datosEst.paterno}"/> <c:out value="${datosEst.materno}"/></font>
    </td>
      </tr>
  <tr>


<tr>
<th align=left><font size="3">Facultad :</font></th>
<td>&nbsp &nbsp</td>
    <td colspan="3">
     <font size="3"> <c:out value="${datosEst.facultad}"/></font>
    </td>
  </tr> 


<th align=left><font size="3">Carrera :</font></th>
<td>&nbsp &nbsp</td>
    <td colspan="3">
     <font size="3"> <c:out value="${datosEst.programa}"/></font>
    </td>
 </tr>  


 <th align=left><font size="3">Nivel :</font></th>
 <td>&nbsp &nbsp</td>
    <td colspan="3">
      <font size="3"><c:out value="${datosGrados.grado_academico}"/></font>
    </td>
   </tr>  
    <tr>
   <th align=left><font size="3">Fecha de Impresi&oacute;n :</font></th>
   <td>&nbsp &nbsp</td>
          <td width="50%" align="bottom" align="right">
              <font size="3"><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></font>
          </td>
   </tr>  

</table>

<!-- =============================================================================== -->
<!-- ====================================== SEGUNDO CUERPO ================================= -->
<br><br><br>
<table border = 0 >
<tr><font size="2">Cuenta con toda documentaci&oacute;n de admisi&oacute;n en Archivos y registrado en el Sistema de Informaci&oacute;n Acad&eacute;mico.</font>
  <br>
  <font size="2">Es todo cuanto certifico para fines consiguientes que convengan al interesado</font>
  </tr>
</table>
<!-- =============================================================================== -->
<!-- ======================================= TERCER CUERPO ================================ -->

<table border = 0>
  <br><br>
  <tr>
    <th colspan="3"><font size="3"><br> DOCUMENTOS PRESENTADOS </font></th>
  </tr
>  
  <tr>
    <td colspan="3" align="center">
	<table  witdh="50%" border="1">
	   <tr>
	     <th aling="center"><font size="3">Nro. </font></th>
	     <th align="center"><font size="3">TIPO DOCUMENTO </font></th>
	     <th align="center"><font size="3">PRESENT&Oacute; </font></th>
	     
	   </tr>
	   <c:forEach var="lDocumento" items="${lPrsDocumentosTodo}" varStatus="contadorClas">
	     <tr <c:if test="${(contadorClas.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td align= "center"><font size="3"> <c:out value='${contadorClas.count}'/></font> </td> 
	       <td> 
	         <font size="3"> <c:out value='${lDocumento.tipo_documento}'/></font>
	       </td> 
	       <td align ="center">
	        <font size="3"> <c:if test="${lDocumento.presento == true}"> Si</c:if> &nbsp;</font>
		 <font size="3"><c:if test="${lDocumento.presento == false}"> No</c:if> </font>
	       </td>
	      </tr>
	    </c:forEach>
          </table>
      </td>
  </tr>
</table>
<!-- =============================================================================== -->
<!-- ====================================== LINEA  PARA IMPRIMIR =================== -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table border="0" width="46%" align="center">
<tr>
<td align = "left">
      <font size="1"><b>Sello y firma</b></font>
</td>
</tr>
<tr>
<td>
<center><font size="2"><b>Registros e Inscripciones</b></font></center>
</td>
</tr>
</table>

<br>
<br>
<br>
<table border=0 width=45% align="right">
<tr>
<td   align ="left">
<b><font size = "2"><a href='javascript: window.print()'>&nbsp;&nbsp;VoBo</a></font></b>
</td>   
</tr> 
<tr>
<td   align ="left">
<b><font size = "1">Sello y firma</font></b>
</td>   
</tr> 
<tr>
<td align="center">
<b> <font size="1">Director Planificaci&oacute;n Acad&eacute;mica</font><b>
</td>   
</tr>
</table>

<!-- =============================================================================== -->
</center>
</TD>
</TR>
</TABLE>
</DIV>
</td>
</tr>
</table>
</CENTER>

<%@ include file="../../Inferior.jsp"%>


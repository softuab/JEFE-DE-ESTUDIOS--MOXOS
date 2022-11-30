<%@ include file="../../Superior.jsp"%>
<jsp:useBean id="now" class="java.util.Date"/>
<CENTER>
<table width=800 border = 0>
<tr>
<td>

<DIV ID="cont1" STYLE="position:center;top:10px;left:50px">
<IMG src='<c:url value="/"/>imagenes/certificados/uabcdc4.jpg' width=800 height=1000 border=0>
</DIV>
<DIV ID=2"cont1" STYLE="position:absolute;top:10px;left:50x">

<table border = 0 width=800>
<tr>
<td>

<!-- ================================================= TITULO ================================================= -->
<table width="100%" border= 0>
  <tr>
    <td width="10%" align="center">
      <form name="fvolver" action="<c:url value='/inscrito/buscarEstudianteEntrada.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito'>
        <div> <a href="javascript:document.fvolver.submit();">
        <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion" width=100 height=140></a></div>
      </form>
</td>
    <td width="90%" align="center">
      <table width="100%"  cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><font size="6"><font face ='Vivaldi'><b>UNIVERSIDAD AUTONOMA DEL BENI <BR>JOSE BALLIVIAN</font></font></td>
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
<!-- ========================================================================================================== -->
<br>
<hr>
<center>

<!-- ============================================== TITULO 2 ================================================= -->
<table>
  <tr>
    <td colspan="2" align="center"><font size="5"><b>CERTIFICADO DE INSCRIPCI&Oacute;N</font></b></td>
  </tr>
</table>
<!-- ========================================================================================================= -->

</center>
<hr>
<br>
<br>
<center>

<!-- =============================================== CUERPO ================================================= -->
<table  border="0"  width ="80%">
<tr>
 <font size="3"><br>El Suscrito Responsable de Registros e Inscripciones</font>
</tr>
<tr>
<th align=left><font size="3"><br>CERTIFICA QUE: </font></th>
</tr>

<tr>
<th align=left ><font size="3">Registro Universitario:</font></th>
    <td>
      <font size="3"><c:out value="${datosEst.id_estudiante}"/></font>
    </td>
</tr>
<tr>
<th align=left><font size="3">Carnet de Indentidad :</font></th>
    <td>
     <font size="3"> <c:out value="${datosEst.dip}"/></font>
    </td>
</tr>
<tr>
<th align=left><font size="3">Nombres :</font></th>
    <td>
     <font size="3"> <c:out value="${datosEst.nombres}"/> <c:out value="${datosEst.paterno}"/> <c:out value="${datosEst.materno}"/></font>
    </td>
      </tr>
  <tr>
<th align=left><font size="3">Facultad :</font></th>
    <td colspan="3">
      <font size="3"><c:out value="${datosEst.facultad}"/></font>
    </td>
 </tr>  
<tr>
<th align=left><font size="3">Carrera :</font></th>
    <td colspan="3">
      <font size="3"><c:out value="${sCarreracortada}"/></font>
    </td>
  </tr> 
    
  <tr>
 <th align=left><font size="3">Nivel :</font></th>
    <td colspan="3">
      <font size="3"><c:out value="${datosGrados.grado_academico}"/></font>
    </td>
   </tr>  
 <tr>
 <th align=left><font size="3">Fecha  de Registro a la U.A.B. :</font></th>
    <td colspan="3">
       <font size="3"><fmt:formatDate value="${ingresoU.fec_ingreso}" pattern="${formatoFecha}"/></font>
    </td>
     </tr>
<tr> 
<th align=left><font size="3"><br>Por tanto es alumno inscrito en:</font></th>
</tr>
<tr>
<th align=left><font size="3"><br>Periodo Acad&eacute;mico :</font></th>
    
     <c:if test="${id_periodo == 2}">
	<td colspan="3"><font size="3"> 1 </font></td>
        </tr>   
     </c:if>
     <c:if test="${id_periodo == 1}">
	<td colspan="3"><font size="3"> <c:out value="${periodo}"/></font></td>
        </tr>   
     </c:if>
<tr>
<th align=left><font size="3">Gesti&oacute;n Acad&eacute;mica :</font></th>
    <td colspan="3">
      <font size="3"><c:out value="${gestion}"/></font>
    </td>
</tr>
<tr>
    <th align=left><font size="3"> Fecha de Impresi&oacute;n :</font></th>
          <td width="50%" align="bottom" align="right">
              <font size="3"><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></font>
          </td>
   </tr>  

</table>
<!-- ================================================================================================================ -->

<br><br><br>

<!-- =============================================== PIE 1 ========================================================== -->
<table >
<tr><td><font size="3">Es todo cuanto certifico para fines consiguientes que convengan al interesado</font></td>
  </tr>
</table>
<!-- ================================================================================================================= -->

<br>

<!-- ============================================== PIE 2 - PARA IMPRIMIR =========================================== -->


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




<!-- ================================================================================================================= -->

<br><br><br>
</center>

</td>
</tr>
</table>

</DIV>

</td>
</tr>
</table>
</CENTER>

<%@ include file="../../Inferior.jsp"%>


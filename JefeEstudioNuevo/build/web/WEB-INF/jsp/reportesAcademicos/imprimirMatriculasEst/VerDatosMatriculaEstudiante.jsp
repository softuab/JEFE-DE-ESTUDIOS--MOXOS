<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<br><br><br><br><br><br>
<table border="0" align="center" width='100%'>
  <tr>
    <td width='70%' valign="bottom" align='right'>
      <small><b><a href='javascript: window.print()'>
        Nombre :</b>&nbsp;<c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/><br>
      </small></a>
    </td>
    <td width='15%' valign="bottom" align='center'><small><b>CI :</b>&nbsp;<c:out value="${datoEst.dip}"/></small></td>
    <td width='15%' valign="bottom" align='center'><small><b>RU :</b>&nbsp;<c:out value="${datoEst.id_estudiante}"/></small></td>	 		    		    
  </tr>
</table>
<br>

<table border="0" width='100%' align='center'>
  <tr>
    <td><br></td>
  </tr>
  <tr>
<!-- *****************PARA AUMENTAR EL BORDE IZQUIERDO DE LA TABLA 1  ****************************** -->
    <td width='48%'>
<!-- ********************************TABLA 1 ******************************************************* -->
      <table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr>
	  <td></td>
	  <td></td>
	  <td align="right"><small><p><b>N&deg;. </b><c:out value="${datoEst.id_matricula}"/></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">Nombres:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">C.I.:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.dip}"/></font></small> </td>
	</tr>
	<tr>
	  <td><small><b><font size="1">Reg. Univ.:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.id_estudiante}"/></font></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">&Aacute;rea:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.facultad}"/></font></small></td>
	</tr>
	<tr>
          <td><small><b><font size="1">Programa:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.programa}"/></font></small></td>		
	</tr>		
	<tr>
          <td><small><b><font size="1">Categor&iacute;a:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datosClasificacion.tipo_clasificacion}"/></font></small></td>
	</tr>
	<tr>
          <td><small><b><font size="1">Antiguo/Nuevo:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_estudiante}"/> &nbsp; &nbsp; <b> Periodo :</b><c:out value="${datoEst.periodo}"/></font></small></td>
	</tr>
	<tr>
	  <td colspan=3 align=center> <img src="<c:out value="${ruta}"/>"></td>
        </tr>
	<tr>
	  <td colspan=3 align=center><small><b><font size="1">Fecha:</b>
	  <fmt:formatDate value="${datoEst.fec_registro}" pattern="dd"/> de <fmt:formatDate value="${datoEst.fec_registro}" pattern="MMMM"/>  del <fmt:formatDate value="${datoEst.fec_registro}" pattern="yyyy"/></small></td>
	</tr>		
      </table>
<!-- *******************************************FIN TABLA 1 **********************-->
    </td>
    <td width='5%'></td><!----PARA AUMENTAREL BORDE IZQUIERDO DE LA TABLA 2---->
    <td align='left' valign="top" width='47%'>
<!-- ******************************************* TABLA 2 ************************* -->	
      <table border=0 align='right' cellspacing='0' cellpadding='2' width='100%'>
	<tr>
	  <td></td>
	  <td></td>
	  <td align="right"><small><p><b>N&deg;. </b><c:out value="${datoEst.id_matricula}"/></small></td>
	</tr>
        <tr>
	  <td><small><b><font size="1">Nombres:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">C.I.:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.dip}"/></font></small> </td>
	</tr>
	<tr>
	  <td><small><b><font size="1">Reg. Univ.:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.id_estudiante}"/></font></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">&Aacute;rea:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.facultad}"/></font></small></td>
	</tr>
	<tr>
          <td><small><b><font size="1">Programa:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.programa}"/></font></small></td>		
	</tr>		
	<tr>
          <td><small><b><font size="1">Categor&iacute;a:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datosClasificacion.tipo_clasificacion}"/></font></small></td>
	</tr>
	<tr>
          <td><small><b><font size="1">Antiguo/Nuevo:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_estudiante}"/> &nbsp; &nbsp;<b> Periodo :</b><c:out value="${datoEst.periodo}"/></font></small></td>
	</tr>   
	<tr>
	  <td colspan=3 align=center> <img src="<c:out value="${ruta}"/>"></td>    
        </tr>
	<tr>
	  <td colspan=3 align=center><small><b><font size="1">Fecha:</b><fmt:formatDate value="${datoEst.fec_registro}" pattern="dd"/> de <fmt:formatDate value="${datoEst.fec_registro}" pattern="MMMM"/>  del <fmt:formatDate value="${datoEst.fec_registro}" pattern="yyyy"/></small></td>
	</tr>		
      </table>
<!-- ************************* FIN TABLA 2 ******************************************************  -->		    		
    </td>
  </tr>
<!-- ************************** MEDIO *********************************************************** -->		    		
  <tr>
    <td colspan="5"><br><br><br></td>
  </tr>
<!-- ************************** FIN MEDIO *********************************************************** -->		    		
  <tr>
    <td width='48%'>
<!-- *************************** TABLA 3 ************************************************************ -->	
      <table border=0 cellspacing='0' cellpadding='2' width='100%'>
	<tr>
	  <td></td>
	  <td></td>
	  <td align="right"><small><p><b>N&deg;. </b><c:out value="${datoEst.id_matricula}"/></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">Nombres:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">C.I.:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.dip}"/></font></small> </td>
	</tr>
	<tr>
	  <td><small><b><font size="1">Reg. Univ.:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.id_estudiante}"/></font></small></td>
	</tr>
	<tr>
	  <td><small><b><font size="1">&Aacute;rea:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.facultad}"/></font></small></td>
	</tr>
	<tr>
          <td><small><b><font size="1">Programa:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.programa}"/></font></small></td>		
	</tr>		
	<tr>
          <td><small><b><font size="1">Categor&iacute;a:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datosClasificacion.tipo_clasificacion}"/></font></small></td>
	</tr>
	<tr>
          <td><small><b><font size="1">Antiguo/Nuevo:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_estudiante}"/> &nbsp; &nbsp; <b> Periodo :</b><c:out value="${datoEst.periodo}"/></font></small></td>
	</tr>   
	<tr>
          <td colspan=3 align=center><img src="<c:out value="${ruta}"/>"></td>    
        </tr>		
	<tr>
	  <td colspan=3 align=center><small><b><font size="1">Fecha:</b><fmt:formatDate value="${datoEst.fec_registro}" pattern="dd"/> de <fmt:formatDate value="${datoEst.fec_registro}" pattern="MMMM"/>  del <fmt:formatDate value="${datoEst.fec_registro}" pattern="yyyy"/></small></td>
	</tr>		
      </table>
<!-- *************************** FIN TABLA 3 ************************************************************ -->	      
    </td>
<!-- ************* PARA AUMENTAREL BORDE IZQUIERDO DE LA TABLA 3 ***************************************  -->	
    <td width='5%'>&nbsp;</td>
    <td valign="top" width='47%'>&nbsp;
      <table align="center" width="100%">
        <tr>
	  <td align="right"><font size="5"><c:out value="${datoEst.id_estudiante}"/></font></td>
          <td align="center"><img  src='<c:url value="/"/>imagenes/reportes/anulado.jpg' width="250" height="200" border="1"/></td>
        </tr>
      </table>
    </td>
<!-- ****************************** TABLA 4 *********************************************** -->	
<!-- *********************** FIN TABLA 4 ************************************* -->		    		
  </tr>
</table>
<%@ include file="../../Inferior.jsp" %>
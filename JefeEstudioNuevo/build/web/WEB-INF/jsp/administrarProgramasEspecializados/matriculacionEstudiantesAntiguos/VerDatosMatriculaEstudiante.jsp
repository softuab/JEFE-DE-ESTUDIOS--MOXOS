<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<br>
<table border=0 align=center width='100%'>	    				
  <tr>
    <td width='70%' valign="bottom" align='right'>	    	        
      <small><b>Nombre :</b>&nbsp;<c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/><br></small>
    </td>
    <td width='15%' valign="bottom" align='center'><small><b>CI :</b>&nbsp;<c:out value="${datoEst.dip}"/></small>
    </td>
    <td width='15%' valign="bottom" align='center'><small><b>RU :</b>&nbsp;<c:out value="${datoEst.id_estudiante}"/></small></td>	 		    		    
  </tr>
</table>
<br><br>

<table border='0' width='100%' >	    
  <tr>
    <td colspan=2 width='30%'>
    </td>
    <td width='20%' align='center'>
      <small><p><b>N&deg;. </b><c:out value="${datoEst.id_matricula}"/></small>
    </td>     
    <td colspan=2 width='40%'>
    </td>
    <td width='20%' align='center'>
      <small><p><b>N&deg;. </b><c:out value="${datoEst.id_matricula}"/></small>
    </td>          
  </tr>
</table>
	
<table border=0 width='100%' align='center'>
  <tr>
<!-- *****************PARA AUMENTAR EL BORDE IZQUIERDO DE LA TABLA 1  ****************************** -->
    <td></td>
    <td align='left'>
<!-- ********************************TABLA 1 ******************************************************* -->	
      <table border=0  align='left' cellspacing='0' cellpadding='2' width='100%' >
	<tr><td colspan=1><small><b><font size="1">Nombres:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></small></td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">C.I.:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.dip}"/></font></small> </td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">Reg. Univ.:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.id_estudiante}"/></font></small></td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">Area:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.facultad}"/></font></small></td>
	</tr>
	<tr>
          <td colspan=1><small><b><font size="1">Carrera:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.programa}"/></font></small></td>		
	</tr>		
	<tr>
          <td colspan=1><small><b><font size="1">Categoria:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_grado}"/></font></small></td>
	</tr>
	<tr>
          <td colspan=1><small><b><font size="1">Antiguo/Nuevo:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_estudiante}"/> &nbsp; &nbsp; <b> Periodo :</b><c:out value="${datoEst.periodo}"/></font></small></td>
	</tr>   
	<tr>
	  <td colspan=3 align=center> <img src="<c:out value="${ruta}"/>"><b>
         <!-- <td colspan=3 align=center> ESTE ES OTRO : <img src="http://localhost:8080/barbecue/barcode?data=<c:out value='${datoEst.id_estudiante}'/>&height=50&drawText=yes&type=Code128"><b>-->
            </b>
	  </td>    
        </tr>		
	<tr>
	  <td colspan=3 align=center><small><b><font size="1">Fecha:</b><fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  del <fmt:formatDate value="${now}" pattern="yyyy"/></small></td>
	</tr>		
      </table>
<!-- *******************************************FIN TABLA 1 ********************** -->		    		
    </td>
    <td valign="top"></td> <!----PARA AUMENTAREL BORDE IZQUIERDO DE LA TABLA 2---->	
    <td align='left' valign="top">
<!-- ******************************************* TABLA 2 ************************* -->	
      <table border=0 align='right' cellspacing='0' cellpadding='2' width='100%'>
        <tr><td colspan=1><small><b><font size="1">Nombres:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></small></td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">C.I.:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.dip}"/></font></small> </td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">Reg. Univ.:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.id_estudiante}"/></font></small></td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">Area:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.facultad}"/></font></small></td>
	</tr>
	<tr>
          <td colspan=1><small><b><font size="1">Carrera:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.programa}"/></font></small></td>		
	</tr>		
	<tr>
          <td colspan=1><small><b><font size="1">Categoria:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_grado}"/></font></small></td>
	</tr>
	<tr>
          <td colspan=1><small><b><font size="1">Antiguo/Nuevo:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_estudiante}"/> <font color=#FFFFFF>.....</font> <b> Periodo :</b><c:out value="${datoEst.periodo}"/></font></small></td>
	</tr>   
	<tr>
	  <td colspan=3 align=center> <img src="<c:out value="${ruta}"/>">
	  </td>    
        </tr>		
	<tr>
	  <td colspan=3 align=center><small><b><font size="1">Fecha:</b><fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  del <fmt:formatDate value="${now}" pattern="yyyy"/></small></td>
	</tr>		
      </table>

<!-- ************************* FIN TABLA 2 ******************************************************  -->		    		
    </td>
  </tr>
</table>
<br><br>
<!-- ************************** MEDIO *********************************************************** -->		    		
<table border='0' width='100%'>	    
  <tr>
    <td colspan=2 width='30%'>
    </td>
    <td width='20%' align='center'>
      <small><p><b>N&deg;. </b><c:out value="${datoEst.id_matricula}"/></small>
    </td>     
    <td colspan=2 width='40%'>
    </td>
    <td width='20%' align='center'>
        <small><p><b>N&deg;. </b><c:out value="${datoEst.id_matricula}"/></small>
    </td>          
  </tr>
</table>
<!-- ************************** FIN MEDIO *********************************************************** -->		    		
<br>
<table border=0 width='100%' align='center'>
  <tr>
    <td align='left'>
<!-- *************************** TABLA 3 ************************************************************ -->	
      <table border=0  cellspacing='0' cellpadding='0' align='left' width='100%'>
	<tr><td colspan=1><small><b><font size="1">Nombres:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></small></td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">C.I.:</font></b></small>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.dip}"/></font></small> </td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">Reg. Univ.:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.id_estudiante}"/></font></small></td>
	</tr>
	<tr>
	  <td colspan=1><small><b><font size="1">Area:</font></b></small></td>
	  <td colspan=2><small><font size="1"><c:out value="${datoEst.facultad}"/></font></small></td>
	</tr>
	<tr>
          <td colspan=1><small><b><font size="1">Carrera:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.programa}"/></font></small></td>		
	</tr>		
	<tr>
          <td colspan=1><small><b><font size="1">Categoria:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_grado}"/></font></small></td>
	</tr>
	<tr>
          <td colspan=1><small><b><font size="1">Antiguo/Nuevo:</font></b></small></td>
          <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_estudiante}"/> <font color=#FFFFFF>.....</font> <b> Periodo :</b><c:out value="${datoEst.periodo}"/></font></small></td>
	</tr>   
	<tr>
          <td colspan=3 align=center>  <img src="<c:out value="${ruta}"/>">
	  </td>    
        </tr>		
	<tr>
	  <td colspan=3 align=center><small><b><font size="1">Fecha:</b><fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  del <fmt:formatDate value="${now}" pattern="yyyy"/></small></td>
	</tr>		
      </table>
<!-- *************************** FIN TABLA 3 ************************************************************ -->	      
    </td>
<!-- ************* PARA AUMENTAREL BORDE IZQUIERDO DE LA TABLA 3 ***************************************  -->	
    <td align='right'><!----PARA BAJAR LA IMAGEN (FOTO)----->   
       <img valign='top' src='<c:out value="${ruta_foto}"/>' width='90' height='90' border='0'>
    </td>
    <td valign="top" align='left'>
<!-- ****************************** TABLA 4 *********************************************** -->	
      <table border=0  cellspacing='0' cellpadding='0' align='right' width='100%'>
        <tr>
	  <td colspan="1" width='30%'>
	    <table align="center">
            <c:forEach var="listaFoto" items="${lImagenes}" varStatus="contador"> 
             <tr>
               <td align="center"> 
               <img  src='<c:url value="/"/>adjuntosMi/fotosEstudiantes/<c:out value="${listaFoto.adjunto}"/>' width="100" height="100" border="1"/>
	       </td>
             </tr>
            </c:forEach>
           </table>    
	  </td>
	  <td colspan="2" width='70%' valing="top">
	  <table>
            <tr><td colspan=1><small><b><font size="1">Nombres:</font></b></small>
	      <td colspan=2><small><font size="1"><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></small></td>
	    </tr>
	    <tr>
	      <td colspan=1><small><b><font size="1">C.I.:</font></b></small>
	      <td colspan=2><small><font size="1"><c:out value="${datoEst.dip}"/></font></small> </td>
	    </tr>
	    <tr>
	      <td colspan=1><small><b><font size="1">Reg. Univ.:</font></b></small></td>
	      <td colspan=2><small><font size="1"><c:out value="${datoEst.id_estudiante}"/></font></small></td>
	    </tr>
	    <tr>
	      <td colspan=1><small><b><font size="1">Area:</font></b></small></td>
	      <td colspan=2><small><font size="1"><c:out value="${datoEst.facultad}"/></font></small></td>
	    </tr>
	    <tr>
              <td colspan=1><small><b><font size="1">Carrera:</font></b></small></td>
              <td colspan=2><small><font size="1"><c:out value="${datoEst.programa}"/></font></small></td>		
	    </tr>		
	    <tr>
              <td colspan=1><small><b><font size="1">Categoria:</font></b></small></td>
              <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_grado}"/></font></small></td>
	    </tr>
	    <tr>
              <td colspan=1><small><b><font size="1">Antiguo/Nuevo:</font></b></small></td>
              <td colspan=2><small><font size="1"><c:out value="${datoEst.tipo_estudiante}"/> <font color=#FFFFFF>.....</font> <b> Periodo :</b><c:out value="${datoEst.periodo}"/></font></small></td>
	    </tr>   
	    <tr>
              <td colspan=3 align="center"> <img src="<c:out value="${ruta}"/>">
	      </td>    
            </tr>		
	    <tr>
	      <td colspan=3 align=center><small><b><font size="1">Fecha:</b><fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  del <fmt:formatDate value="${now}" pattern="yyyy"/></small></td>
	    </tr>
	    </table>
	  </td>
	  </tr>    		
      </table>
<!-- *********************** FIN TABLA 4 ************************************* -->		    		
    </td>
    <td> </td>
  </tr>
</table>
<%@ include file="../../Inferior.jsp" %>
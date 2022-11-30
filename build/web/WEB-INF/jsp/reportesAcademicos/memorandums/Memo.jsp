<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<table width="100%" border="0">
  <!-- SE REPITE-->
  <thead>
  <tr>
    <td width="100%" align="center" cellspancin="0" cellpading="0">
    
    <table width="80%" border="0">
      <tr>
        <td width="14%" align="center">
          <img src="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion">
        </td>
        <td width="80%" align="center">
          <table width="100%" heigth="100%" cellpading="0" cellspacing="0" >	  
            <tr>
              <td align="center"><font size=5><b><c:out value='${datosInstitucion.institucion}'/></font></td>
            </tr>
            <tr>
              <td align="center"><font size=3>VICE-RECTORADO</font></td>	      
            </tr>	    
            <tr>
              <td align="center"><font size=2>DIRECCI&Oacute;N DE INTERACCI&Oacute;N SOCIAL</font></td>	      
            </tr>	    	    
            <tr>
              <td align="center"><c:out value='${datosInstitucion.actividad}'/></td>
            </tr>
          </table>
        </td>
        <td width="14%">
        </td>
      </tr>
    </table>
    <hr width="80%">
    <br><br><br><br>
<div align="center"><H1>MEMORANDUM</H1></div><br><br>
<div align="center">
<table width="80%" border="0">
    <tr>    
	<td width="49%"><font size="3">		
	<h4>DPTO. BIENESTAR ESTUDIANTIL</h4><br>
	<b>No.</b><a href='javascript: window.print()'> 00<c:out value="${becario.id_perfil}"/>/<c:out value="${cliente.gestion}"/></a><br><br>        
	<b>Fecha:</b> <font size=2>Trinidad, 	
	<fmt:formatDate value="${becario.fecha_i}" pattern="dd"/> de 
	<fmt:formatDate value="${becario.fecha_i}" pattern="MMMM"/>  del 	
	<fmt:formatDate value="${becario.fecha_i}" pattern="yyyy"/>        
	</font>
	</td>   
	<td border="0">
	    <img src="imagenes/logos/linea.gif" border="0" ALT="logo institucion">
	</td>
	<td width="49%"><font size="3">	
	Se&ntilde;or(a)<br>
	Univ. <c:out value="${datosEstudiante.nombre_completo}"/><br>
	<u>Presente.-</u> <br><br>
	Ref.: <b>Designaci&oacute;n <u><c:out value="${becario.modalidad_beca}"/></u></b>
	</font>
	</td>
    </tr>	
</table>
<table width="80%">
    <tr>    
    <td>
	<img src="imagenes/logos/linea.gif" border="0" height="1" width="100%">
    </td>
    </tr>
</table>    

<table width="80%">
    <tr><td align=justify>    
    <font size="3">
    Distinguido(a) Universitario (a): 
    <br><br>        
    Mediante la presente tengo el agrado de comunicarle, que de acuerdo a la convocatoria a concurso de m&eacute;ritos para la provisi&oacute;n de 
    <c:out value="${becario.modalidad_beca}"/>,
    ha sido seleccionado(a) por el Comit&eacute; de Becas como <b><c:out value="${becario.cargo}"/></b> del(a) <b><c:out value="${becario.ubicacion_organica}"/></b>, 
    a <b><c:out value="${becario.carga_horaria}"/></b>, a partir de la Fecha hasta el 
    	
	<fmt:formatDate value="${becario.fecha_f}" pattern="dd"/> de 
	<fmt:formatDate value="${becario.fecha_f}" pattern="MMMM"/>  del a&ntilde;o  	
	<fmt:formatDate value="${becario.fecha_f}" pattern="yyyy"/>        
    <br><br>    
    Dese&aacute;ndole &eacute;xito en el desempe&ntilde;o de sus funciones, saludo a ud. muy atentamente.
    </font>
    </td>
    </tr>
</table> 
<br><br><br><br><br><br><br><br><br><br><br><br>

<table width="70%" border="0">
   <tr>
   <td width="100%" colspan="2">
   c.c.: VICE-RECTORADO<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DPTO. RR.HH.<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FUL<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UNIDAD DESTINO<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ARCH.<br>
   </td>
   </tr>
</table>

<table width="80%" border="0">
   <tr>
   <td width="100%" colspan="2"><hr width="100%"></td>
   </tr>
   <tr>    
    <td coslpan="1" width="50%">Telefono: 842-3958 Int.(122)</td>   
    <td coslpan="1" width="50%" align="right">Urbanizaci&oacute;n las Palmas<br>Campus Universitario-Edificio Vice-Rectorado</td>   
   </tr>         

</table>   

<%@ include file="../../Inferior.jsp" %>
</div>

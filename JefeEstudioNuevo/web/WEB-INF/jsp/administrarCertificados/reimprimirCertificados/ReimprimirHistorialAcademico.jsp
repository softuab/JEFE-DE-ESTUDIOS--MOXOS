<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<center>
<table border =0 width=800 >
<tr>
<td>

<!-- ========================================== TITULO ============================================================== -->

	<table width="100%" border =0>
		<td width="1%" align="center">
		<form name="fvolver" action="listarProgramasPlanes.fautapo" method="post">
			<input type="hidden" name="id_programa"        value="<c:out value='${datosPrograma.id_programa}'/>" >
			<input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
			<input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">
			<input type="hidden" name="todas"              value="<c:out value='${todas}'/>">
			<input type="hidden" name="nrocertificado"     value="<c:out value='${nrocertificado}'/>">
			<input type="hidden" name="observacion"        value="<c:out value='${observacion}'/>">
			<input type="hidden" name="NC"                 value="<c:out value='${NC}'/>">
			<input type="hidden" name="Ru"                 value="<c:out value='${Ru}'/>">	
		</form>
		</td>
		<td  width = "85%"  align="center">
			<table  width="100%" heigth="10%" cellpading ="0" cellspacing ="0" border = 0 >     
				<tr><td  align="center"><font size="2"><b>UNIVERSIDAD   BOLIVIANA</b></font></td><tr>
				<tr><td   align="center"><font size="2"><b>Universidad Autónoma del Beni "José Ballivián"</b></font></td><tr>
			</table>
		</td>
	</table>
<center>

<!-- ============================================ TITULO 2 =========================================================== -->
<table width="100%">
<c:forEach var="lista" items="${estcert}" varStatus="contador">
	<tr>
		<td height= "30%"  width ="30%" ><font size="2"></font></td>
	    <td height= "30%"  width ="30%" align ="center"><font size="2"><b>HISTORIAL ACADEMICO</b></font></td>
		<td height= "30%"  width ="30%" align ="right"><font size="2"><b>Nro.<c:out value="${lista.nro_certificado}"/>/<c:out value="${lista.gestion_certificado}"/></b></font></td>
	</tr>
 </c:forEach> 
</table>
<!-- ================================================================================================================= -->

<!-- ======================================== CUERPO 1 =============================================================== -->
<table width = "100%" height= "20%" border = 0>
<c:forEach var="lista" items="${estcert}" varStatus="contador">
 <tr>
   <td><b><small>Facultad</small></b></td>
   <td><small><c:out value="${lista.facultad}"/></small></td>
	<td><b><small>Plan</small></b></td>
   <td><small><c:out value="${lista.planes}"/></small></td>
 </tr>
 <tr>
    <td><b><small>Carrera</font></b></td>
    	<td colspan="2"><small><c:out value="${lista.carrera}"/></small></td>
 </tr>
 <tr>
    <td><b><small>Apellidos y Nombres</small></b></td>
      <td colspan="2">
      <small>
      <c:out value="${lista.estudiante}"/> &nbsp;
     </small>
      </td>
  </tr>
  <tr>
		 <td><b><small>Observacion</small></b></td>
		<td colspan="2"><small><c:out value="${lista.obs}"/></small></td>
  </tr>
	</c:forEach> 
  </table>
<!-- =================================================================================================================== -->

<br>

<!-- ============================================ CUERPO 2 ============================================================= -->
<table width = "100%" border = 0 >
		<tr> <td align = "left"><small>Por Tanto: De acuerdo al plan de estudios, ha cursado las asignaturas que se indican, obteniendo las siguientes calificaciones:</small></td></tr>
	</table>
<!-- =================================================================================================================== -->

<!-- =========================================== CUERPO 3 ============================================================== -->
<table class="tabla" width="100%" border = 0>

        <tr>
		    <th><small>NIVEL</small></th>
			<th><small>NRO.</small></th>
			<th><small>SIGLA</small></font></th>
			<th><small>ASIGNATURA</small></th>
			<th><small>TIPO EVALUACION</small></th>
			<th><small>GESTION</small></th>
			<th><small>NOTA</small></th>
		</tr>
<c:set var="nivel_academico_ant" value="0"/>
<c:set var="contadorApro" value="0"/>

		<c:forEach var="lista1" items="${estcert1}" varStatus="contador">
    <tr>
	    <td align="center"><small><c:out value="${lista1.nivel}"/></small></td>
		<td align="center"><small><c:out value="${contador.count}"/></small></td>       
		<td><small><c:out value="${lista1.sigla}"/></font></td>
		<td><small><c:out value="${lista1.asignatura}"/></font></td>
		<td><small><c:out value="${lista1.tipo_evaluacion}"/></font></td>
		
		<td><small><c:out value="${lista1.periodogestion}"/></font></td>
		
			<c:if test="${lista1.numeral != 0}">
			     <c:set var="contadorApro" value="${contadorApro+1}"/>
				 <td align="center"><small><fmt:formatNumber value="${lista1.numeral}" pattern = "#"/></small></td>
			</c:if>
			<c:if test="${lista1.numeral == 0}">
				<td></td>
			</c:if>
     </tr>
  <c:set var="nivel_academico_ant" value="${lista1.nivel}"/>  
 </c:forEach>

</table>

<!-- ==================================================================================================================== -->
<!--<table width="100%" align="center" border = 0>
		 <tr>
				<td width="100%" align="center"><b>  TOTAL ASIGNATURAS DEL PLAN :</b> <c:out value="${total_materias_plan}"/>
				<b>  TOTAL ASIGNATURAS APROBADAS :</b> <c:out value="${total_materias_aprobadas}"/>
				<b>  PROMEDIO DE CALIFICACIONES :</b> <c:out value="${promedio}"/></td>
		</tr>
</table>-->
	<br>
	<table width = "100%" border = 0 >
		 <tr>
			<td width="100%" align="justify"><small>ESCALA VIGENTE DE CALIFICACIONES de 1 A 100 Y SUS  VALORES : 1 a 50  =  Reprobado ; 51 a 63 = Suficiente ; 64 a 76 = Bueno ; 
			77 a 89 = Distinguido; 90 a 100 = Sobresaliente.</small></td>
		 </tr>
		 <tr>
		    <td colspan="3" width="100%" align="justify">
			    
				<IMG width="270" height="50" border="0" align="left" src='<c:url value="/"/>imagenes/CodigoBarra/CertificadoNotas/barcode_<c:out value='${NC1}'/>.jpg'>
				<a href='javascript: window.print()'><small>ADVERTENCIA: </a>
				Las raspaduras, anotaciones o enmiendas<b> INVALIDA ESTE DOCUMENTO</b>.
				Este Certificado para su validez debe llevar el nombre completo del responsable de los archivos de la jefatura y/o Direccion de Estudios o Carrera, del Sr. Decano del Sr. Vicerrector con sus respectivos sellos.</small>
			</td>
		 </tr>
	</table>
		
</center>
<!-- ============================================= CUERPO FIRMAS ============================================================ -->
	<table width="100%" align="center" border=0>
		<tr>
			<td width="100%" align="center"><small>&nbsp;<c:out value='${datosInstitucionsede.localidad}'/>, <fmt:formatDate value="${now}" type="date" dateStyle="long"/></small></td>
		</tr>
<!-- ============================================= CUERPO FIRMAS ============================================================ -->
		<table border = 0 width=100%>
			<tr>
				<td colspan="3"><br><br><br></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="35%">_____________________________________</td>
			    <td align="left" colspan="2" width="15%">SELLO</td> 
				<td align="center" width="35%">____________________________________</td>
				<td align="left" colspan="2" width="15%"> SELLO</td> 
			</tr>
			<tr>  
				<td align="center" colspan="2" width="35%"><b> </b></td>
				<td align="center" colspan="2" width="15%"></td> 
				<td align="center" width="35%"><b> </b></td>
				<td align="center" colspan="2" width="15%"></td> 
			</tr>
		</table>
	</table> 
</table>
</td>
</tr>
</table>

</center>

<%@ include file="../../Inferior.jsp" %>
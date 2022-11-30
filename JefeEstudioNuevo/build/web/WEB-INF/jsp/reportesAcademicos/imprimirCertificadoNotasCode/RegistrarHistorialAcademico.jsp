<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<center>
 <table border = 0 width=800 >
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
		<tr>
		    <td height= "30%"  width ="30%" ><font size="2"></font></td>
			<td height= "30%"  width ="30%" align ="center"><font size="2"><b>HISTORIAL ACADEMICO</b></font></td>
			<td height= "30%"  width ="30%" align ="right"><font size="2"><b>Nro.<c:out value="${NC}"/></b></font></td>
		</tr>
	</table>
<!-- ================================================================================================================= -->

<!-- ======================================== CUERPO 1 =============================================================== -->
	<table width = "100%" height= "20%" border = 0>
		<tr>
			<td><b><small>Facultad</small></b></td>
			<td><small><c:out value="${datosFacultad.facultad}"/></small></td>
			<td><b><small>Plan</small></b></td>
			<td><small><c:out value="${datosEstudiante.id_plan}"/></small></td>
		</tr>
		<tr>
			<td><b><small>Carrera</font></b></td>
			<td colspan="2"><small><c:out value="${datosPrograma.programa}"/></small></td>
			<!--<td><b><small>Nivel</font></b></td>
			<td ><small><c:out value="${datosGrados.grado_academico}"/></small></td>-->
		</tr>
		<tr>
			<td><b><small>Apellidos y Nombres</small></b></td>
			  <td colspan="2">
			  <small>
				  <c:out value="${datosEstudiante2.paterno}"/>&nbsp;
				  <c:out value="${datosEstudiante2.materno}"/>&nbsp;
				  <c:out value="${datosEstudiante2.nombres}"/>
			  </small>
			</td>
		</tr>
		
	</table>
<!-- ============================================ CUERPO 2 ============================================================= -->
	<table width = "100%" border = 0 >
		<tr> <td align = "left"><small>Por Tanto: De acuerdo al plan de estudios, ha cursado las asignaturas que se indican, obteniendo las siguientes calificaciones:</small></td></tr>
	</table>
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
		<c:forEach var="lista" items="${lMateriasNotas}" varStatus="contador">
		<!-- <c:if test="${nivel_academico_ant != lista.nivel_academico}">
        <tr>
          <td colspan="6"><small>NIVEL :: <c:out value="${lista.nivel_academico}"/></small></td>
        </tr>
      </c:if>-->
		<tr> 
		    <td align="center"><small><c:out value="${lista.nivel_academico}"/></small></td>
			<td align="center"><small><c:out value="${contador.count}"/></small></td>  
			<td><small><c:out value="${lista.sigla}"/></small></td>   
			<td><small><c:out value="${lista.materia}"/></small></td>
			<td><small><c:out value="${lista.tipo_evaluacion}"/></small></td>
			<c:if test="${lista.gestion != 0}">
				<c:if test="${datosPrograma.id_periodo==1}">
					<td><c:out value="${lista.periodo}"/>-<c:out value="${lista.gestion}"/></td>
				</c:if>
				<c:if test="${datosPrograma.id_periodo==2}">
					<td><c:out value="${lista.gestion}"/></td>
				</c:if>
			</c:if>
			<c:if test="${lista.gestion == 0}">
				<td></td>
			</c:if>
			<c:if test="${lista.nota != 0}">
			     <c:set var="contadorApro" value="${contadorApro+1}"/>
				 <td align="center"><small><fmt:formatNumber value="${lista.nota}" pattern = "#"/></small></td>
			</c:if>
			<c:if test="${lista.gestion == 0}">
				<td></td>
			</c:if>
				<!--<c:if test="${lista.id_estado=='A'}">
				   <td><font size="1">Aprobado</font></td>        
				</c:if>
				<c:if test="${lista.id_estado=='C'}">
				   <td><font size="1">Comvalidado</font></td>    
				</c:if>
				<c:if test="${lista.id_estado=='D'}">
				 <td><font size="1">Abandono</font></td>        
				</c:if>
				<c:if test="${lista.id_estado=='R'}">
				 <td><font size="1">Reprobado</font></td>        
				</c:if>-->
		</tr>
		<c:set var="nivel_academico_ant" value="${lista.nivel_academico}"/>
		</c:forEach>
	</table>
<!-- ==================================================================================================================== -->
	<table width="100%" align="center" border = 0>
		 <tr>
				<td width="100%" align="center"><b><small>  TOTAL ASIGNATURAS DEL PLAN :</small></b><small> <c:out value="${total_materias_plan}"/></small>
				<b><small>  TOTAL ASIGNATURAS APROBADAS :</small></b><small> <c:out value="${contadorApro}"/></small>
				<b><small>  PROMEDIO DE CALIFICACIONES :</small></b><small> <c:out value="${promedio}"/></small></td>
		</tr>
	</table>
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
<!-- =========================================== CUERPO FECHAS ========================================================== -->
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
</td>
</tr>
</table>
</center>

<%@ include file="../../Inferior.jsp" %>
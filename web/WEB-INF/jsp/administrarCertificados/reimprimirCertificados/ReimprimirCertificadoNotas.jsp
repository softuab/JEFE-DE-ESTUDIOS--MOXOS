<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<center>

<table width=800 height =1140 border = 0>
<tr>
<td>

<DIV ID="cont1" STYLE="position:center;top:10px;left:50px">
<IMG src='<c:url value="/"/>imagenes/certificados/Reimpresion_fondo.jpg' width=800 height="1140" border="0" border="white">
</DIV>
<DIV ID=2"cont1" STYLE="position:absolute;top:10px;left:50x">

<table border =0 width=800 >
<tr>
<td>

<!-- ========================================== TITULO ============================================================== -->
<p><p><p><p><p><p><p><p><p><p>
<table width="100%" border =0>
  
    <td width="1%" align="center">
    <form name="fvolver" action="listarProgramasPlanes.fautapo" method="post">
    <input type="hidden" name="id_programa"        value="<c:out value='${datosPrograma.id_programa}'/>" >
	<input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
	<input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">
	<input type="hidden" name="todas"              value="<c:out value='${todas}'/>">
    <input type="hidden" name="sNro_certificado"              value="<c:out value='${sNro_certificado}'/>">
    <input type="hidden" name="nrocertificado"            value="<c:out value='${nrocertificado}'/>">
	<input type="hidden" name="observacion"            value="<c:out value='${observacion}'/>">
	
	
	</form>
    </td> 
        <td  width = "100%"  align="center">
			<p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p>
			<table  width="100%" heigth="10%" cellpading ="1" cellspacing ="0" border = 0 >
				<p><p><p><p><p><p><p><p>      
				<tr><p><p><p><p><p><p><p><p><p><p><p><p><p><td  align="center"><p><p><p><p><font size="5">UNIVERSIDAD   BOLIVIANA </font></td><tr>
				<tr><td   align="center"><font size="5">Universidad Autónoma del Beni</font></td><tr>
				<tr><td   align="center"><font size="5">"José Ballivián"</font></td><tr>
			</table>
		</td>
</table>

<!-- ================================================================================================================= -->

<center>
<!-- ============================================ TITULO 2 =========================================================== -->
	<table width="100%">
		<tr>
		    <td height= "30%"  width ="30%" ><font size="2"></font></td>
			<td height= "30%"  width ="30%" align ="center"><font size="2"><b>CERTIFICADO DE CALIFICACIONES</b></font></td>
			<td height= "30%"  width ="30%" align ="right"><font size="2"><b>Nro.<c:out value="${sNro_certificado}"/></b></font></td>
		</tr>
	</table>
<!-- ======================================== CUERPO 1 =============================================================== -->
<table width = "90%" height= "20%" border = 0>
<c:forEach var="lista" items="${estcert}" varStatus="contador">
 <tr>
    <td><b><font size="2"><br>Facultad</font></b></td>
    <td><font size="2"><c:out value="${lista.facultad}"/></font></td>

  
<!--   <th><td><b><font size="2"><br>Nº</font></b></td>
    <td><font size="2"><c:out value="${nrocertificado}"/></font></td>-->


 </tr>
 <tr>
    <td><b><font size="2">Carrera</font></b></td>
    <td colspan="2"><font size="2"><c:out value="${lista.carrera}"/></font></td>

    <td><b><font size="2">Nivel</font></b></td>
    <td ><font size="2"><c:out value="${lista.nivel}"/></font></td>
 
 </tr>
 <tr>
    <td><b><font size="2">Apellidos y Nombres</font></b></td>
      <td colspan="2">
      <font size="2">
      <c:out value="${lista.estudiante}"/> &nbsp;
      <!--<c:out value="${datosEstudiante2.materno}"/> &nbsp;
      <c:out value="${datosEstudiante2.nombres}"/>-->
      </font>
      </td>
      
    <td><b><font size="2">Plan</font></b></td>
    <td><font size="2"><c:out value="${lista.planes}"/></font></td>
 
  </tr>
  <tr>
     <td><b><font size="2">C.I. </font></b></td>
     <td colspan="2"><font size="2"><c:out value="${lista.ci}"/></font></td>

      <c:if test="${todas=='Si'}">
	    <c:if test="${datosPrograma.id_periodo==1}">
	      <td><b><font size="2">Periodo Acádemico</font></b></td>
           <td><font size="2"><c:out value="${periodo_academico}"/>/<c:out value="${gestion}"/> </font></td>        
	    </c:if>    
		<c:if test="${datosPrograma.id_periodo==2}">
	      <td><b><font size="2">Gestión Acádemica</font></b></td>
           <td><font size="2"><c:out value="${gestion}"/></font></td>        
	    </c:if>    
	  </c:if>     
      <c:if test="${todas=='No'}">
	       <td><b><font size="2">Periodo Acádemico</font></b></td>
           <td><font size="2"><c:out value="${gestion}"/></font></td>        
		   <tr> <td><td><td><td><b><font size="2">Curso de Verano</font></b></td></td></td></td></tr>
	  </c:if>     
	
     
  </tr>
  <tr>
     <td><b><font size="2">Observacion </font></b></td>
	 <td><font size="2"><c:out value="${lista.obs}"/></font></td>
 
  </tr>
  
   </c:forEach> 
</table>
<!-- =================================================================================================================== -->

<br>

<!-- ============================================ CUERPO 2 ============================================================= -->
<table width = "100%" border = 0 >
<tr> <td align = "left"><font size="3">Por Tanto:</font></td></tr>
<tr> <td align = "left"><font size="3">De acuerdo al plan de estudios, ha cursado las asignaturas que se indican, obteniendo las siguientes calificaciones:</font></td></tr>
</table>
<!-- =================================================================================================================== -->

<!-- =========================================== CUERPO 3 ============================================================== -->
<table class="tabla" width="100%" border = 0>

  <tr>
    <th><font size="2">SIGLA</font></th>
    <th><font size="2">NIVEL</font></th>
    <th><font size="2">ASIGNATURA</font></th>
	<th><font size="2">TIPO EVALUACION</font></th>
    <th><font size="2">NUMERAL</font></th>
    <th><font size="2">LITERAL</font></th>	
    <th><font size="2">OBSERVACION</font></th>
  </tr>
  <c:forEach var="lista1" items="${estcert1}" varStatus="contador">
    <tr>
      <td><font size="2"><c:out value="${lista1.sigla}"/></font></td>
      <td align="center"><font size="2"><c:out value="${lista1.nivel}"/></font></td>      
	  <td><font size="2"><c:out value="${lista1.asignatura}"/></font></td>
	  <!-- <c:if test="${lista.tipo_evaluacion != 'Regular'}">
	         <td><font size="2"><c:out value="${lista.materia}  *"/></font></td>
	   </c:if>
       <c:if test="${lista.tipo_evaluacion == 'Regular'}">
	         <td><font size="2"><c:out value="${lista.materia}"/></font></td>
	   </c:if>	   -->
	  <td><font size="2"><c:out value="${lista1.tipo_evaluacion}"/></font></td>
	  
	  <td align="center"><font size="2"><fmt:formatNumber value="${lista1.numeral}" pattern = "#"/></font></td>
      <td><font size="2"><c:out value="${lista1.literal}"/></font></td>
	            <c:if test="${lista1.observacion=='A'}">
				   <td><font size="2">Aprobado</font></td>        
				</c:if>
				<c:if test="${lista1.observacion=='C'}">
				   <td><font size="2">Comvalidado</font></td>    
				</c:if>
				<c:if test="${lista1.observacion=='D'}">
				 <td><font size="2">Abandono</font></td>        
				</c:if>
				<c:if test="${lista1.observacion=='R'}">
				 <td><font size="2">Reprobado</font></td>        
				</c:if>
   </tr>
   
 </c:forEach>

</table>
<!-- ==================================================================================================================== -->
	<table width = "100%" border = 0 >
		 <tr>
			<td width="100%" align="justify"><font size="0">ESCALA VIGENTE DE CALIFICACIONES de 1 A 100 Y SUS  VALORES :<br> 1 a 50  =  Reprobado ; 51 a 63 = Suficiente ; 64 a 76 = Bueno ; 
			77 a 89 = Distinguido; 90 a 100 = Sobresaliente.</font></td>
		 </tr>
		 <tr>
		    <td colspan="3" width="100%" align="justify">
			    <br><br>
				<IMG width="270" height="50" border="0" align="left" src='<c:url value="/"/>imagenes/CodigoBarra/CertificadoNotas/barcode_<c:out value='${NC1}'/>.jpg'>
				<a href='javascript: window.print()'>ADVERTENCIA: </a>
				Las raspaduras, anotaciones o enmiendas<b> INVALIDA ESTE DOCUMENTO</b>.
				Este Certificado para su validez debe llevar el nombre completo del responsable de los archivos de la jefatura y/o Direccion de Estudios o Carrera, del Sr. Decano del Sr. Vicerrector con sus respectivos sellos.
				<br><br>
			</td>
		 </tr>
	</table>
</center>
<br>

<!-- =========================================== CUERPO FECHAS ========================================================== -->
<table width="90%" align="center" border=0>
  <tr>
    <td width="100%" align="center"><font size="2">&nbsp;<c:out value='${datosInstitucionsede.localidad}'/>, <fmt:formatDate value="${now}" type="date" dateStyle="long"/></font></td>
  </tr>
  

<!-- ======================================================================================================================== -->

<!-- ============================================= CUERPO FIRMAS ============================================================ -->
<table border = 0 width=100%>
			<tr>
				<td colspan="3"><br><br><br><br><br></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="35%"><c:out value="${datosFacultad.decano}"/>_____________________________________</td>
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
			<tr>
				<td colspan="3"><br><br><br><br><br><br></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="35%">_____________________________________</td>
				<td align="left" colspan="2" width="15%">SELLO</td> 
				<td align="center" width="35%">____________________________________</td>
				<td align="left" colspan="2" width="15%">SELLO</td> 
			</tr>
			<tr>
				<td align="center" colspan="2" width="35%"><b> </b></td>
				<td align="center" colspan="2" width="15%"></td> 
				<td align="center" width="35%"><b></b></td>
				<td align="center" colspan="2" width="15%"></td> 
			</tr>
		</table>
</table>
</td>
</tr>
</table>

</center>

<%@ include file="../../Inferior.jsp" %>
<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<center>

<table width=800 border = 0>
<tr>
<td>

<DIV ID="cont1" STYLE="position:center;top:10px;left:50px">
<IMG src='<c:url value="/"/>imagenes/certificados/uabcdc4.jpg' width=800 height="1030" border=0>
</DIV>
<DIV ID=2"cont1" STYLE="position:absolute;top:10px;left:50x">

<table border = 0 width=800>
<tr>
<td>

<!-- ========================================== TITULO ============================================================== -->
<p><p><p><p><p><p><p><p><p><p>
<table width="100%">
  
    <td width="1%" align="center">
      <form name="fvolver" action="listarProgramasPlanes.fautapo" method="post">
        <input type="hidden" name="id_programa"        value="<c:out value='${datosPrograma.id_programa}'/>" >
	<input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
	<input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">
	<input type="hidden" name="todas"              value="<c:out value='${todas}'/>">
    
    <input type="hidden" name="nrocertificado"            value="<c:out value='${nrocertificado}'/>">
	<input type="hidden" name="nivel"            value="<c:out value='${nivel}'/>">
	<input type="hidden" name="observacion"            value="<c:out value='${observacion}'/>">
	
	
	</form>
    </td>
    
<td  width = "85%"  align="center">
  <p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p>
  <table  width="100%" heigth="40%" cellpading ="2" cellspacing ="0" >
          <p><p><p><p><p><p><p><p>      
      <tr><p><p><p><p><p><p><p><p><p><p><p><p><p><td  align="center"><p><p><p><p><font size="6">UNIVERSIDAD   BOLIVIANA </font></td><tr>
      <tr><td   align="center"><font size="5">Universidad Autónoma del Beni</font></td><tr>
      <tr><td   align="center"><font size="5">"José Ballivián"</font></td><tr>
  </table>
  </form>
</td>

</table>
<!-- ================================================================================================================= --> 

<!-- ============================================ LINEA DE VOLVER =========================================================== -->
<table align="center" >
<tr align= "center"><td align="center" colspan="1" width="50%"> <a href="javascript:document.fvolver.submit();"><a href="javascript:document.fvolver.submit();">
_______________________________________________________________________________________________________________________________________________________
</td></tr>
</table>
<!-- ================================================================================================================= -->

<center>

<!-- ============================================ TITULO 2 =========================================================== -->
<table width=700>
<td width ="78%" align ="right"><font size="5">CERTIFICADO DE CALIFICACIONES</font></td>
<td width ="22%" align ="left"> <table border="1" cellspacing = 0 cellpading =2>
       <!--<td ><font size="3">Nro.<c:out value="${periodo}"/>/<c:out value="${gestion}"/></font></td>--></table></td>
</table>
<!-- ================================================================================================================= -->

<!-- ======================================== CUERPO 1 =============================================================== -->
<table width = "90%">
<tr>
    <td><b><font size="2"><br>Facultad</font></b></td>
    <td><font size="2"><c:out value="${datosFacultad.facultad}"/></font></td>

    <th><td><b><font size="2"><br>Nº</font></b></td>
    <td><font size="2"><c:out value="${nrocertificado}"/></font></td>


	</tr>
 <tr>
    <td><b><font size="2">Carrera</font></b></td>
    <td colspan="2"><font size="2"><c:out value="${datosPrograma.programa}"/></font></td>

    <td><b><font size="2">Nivel</font></b></td>
    <td ><font size="2"><c:out value="${datosGrados.grado_academico}"/></font></td>
 
 </tr>
 <tr>
    <td><b><font size="2">Apellidos y Nombres</font></b></td>
      <td colspan="2">
      <font size="2">
      <c:out value="${datosEstudiante2.paterno}"/> &nbsp;
      <c:out value="${datosEstudiante2.materno}"/> &nbsp;
      <c:out value="${datosEstudiante2.nombres}"/>
      </font>
      </td>
      
    <td><b><font size="2">Plan</font></b></td>
    <td><font size="2"><c:out value="${datosEstudiante2.id_plan}"/></font></td>
 
  </tr>
  <tr>
     <td><b><font size="2">C.I. </font></b></td>
     <td colspan="2"><font size="2"><c:out value="${datosEstudiante2.dip}"/></font></td>

      <c:if test="${todas=='Si'}">
	    <c:if test="${datosPrograma.id_periodo==1}">
	      <td><b><font size="2">Periodo Acádemico</font></b></td>
           <td><font size="2"><c:out value="${periodo}"/>/<c:out value="${gestion}"/> </font></td>        
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
</table>
<!-- =================================================================================================================== -->

<br>

<!-- ============================================ CUERPO 2 ============================================================= -->
<table width = "90%" >
<tr> <td align = "left"><font size="3">Por Tanto:</font></td></tr>
<tr> <td align = "left"><font size="3">De acuerdo al Plan de Estudios vigente curso las siguientes materias</font></td></tr>
</table>
<!-- =================================================================================================================== -->

<!-- =========================================== CUERPO 3 ============================================================== -->
<table class="tabla" width="90%">

  <tr>
    <th><font size="2">SIGLA</font></th>
    <th><font size="2">NIVEL</font></th>
    <th><font size="2">ASIGNATURA</font></th>
    <th><font size="2">NUMERAL</font></th>
    <th><font size="2">LITERAL</font></th>
    <th><font size="2">OBSERVACION</font></th>
  </tr>
  <c:forEach var="lista" items="${lMateriasNotas}" varStatus="contador">
    <tr>
      <td><font size="2"><c:out value="${lista.sigla}"/></font></td>
      <td align="center"><font size="2"><c:out value="${lista.nivel_academico}"/></font></td>      
	  <td><font size="2"><c:out value="${lista.materia}"/></font></td>
	  <!-- <c:if test="${lista.tipo_evaluacion != 'Regular'}">
	         <td><font size="2"><c:out value="${lista.materia}  *"/></font></td>
	   </c:if>
       <c:if test="${lista.tipo_evaluacion == 'Regular'}">
	         <td><font size="2"><c:out value="${lista.materia}"/></font></td>
	   </c:if>	   -->
	  <!--<td><font size="2"><c:out value="${lista.tipo_evaluacion}"/></font></td>-->
	  <td align="center"><font size="2"><fmt:formatNumber value="${lista.nota}" pattern = "#"/></font></td>
      <td><font size="2"><c:out value="${lista.literal}"/></font></td>
	  <c:if test="${lista.nota >= 51}">
             <td><font size="2">Aprobado</font></td>
	  </c:if>	 
	  <c:if test="${lista.nota < 51}">
             <td><font size="2">Reprobado</font></td>
	  </c:if>	 
   </tr>
 </c:forEach>
</table>
<!-- ==================================================================================================================== -->

</center>
<br>

<!-- =========================================== CUERPO FECHAS ========================================================== -->
<table width="90%" align="center" border=0>
  <tr>
    <td width="100%" align="center"><font size="2">&nbsp;<c:out value='${datosInstitucion.localidad}'/>, <fmt:formatDate value="${now}" type="date" dateStyle="long"/></font></td>
  </tr>
  
  <c:if test="${observacion!=''}">
  <tr>
    <td width="100%" ><font size="2"><b>Observacion:</b>&nbsp;<c:out value='${observacion}'/></font></td>
  </tr>
  </c:if>
<!-- ======================================================================================================================== -->

<!-- ============================================= CUERPO FIRMAS ============================================================ -->
<table border = 0 width=100%>
  <tr>
    <td colspan="3"><br><br><br><br><br><br><br><br></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="35%">_____________________________________</td>
    <td align="left" colspan="2" width="15%">SELLO</td> 

    <td align="center" width="35%">____________________________________</td>
    <td align="left" colspan="2" width="15%"> </td> 
  </tr>
  <tr>  
    <td align="center" colspan="2" width="35%"><b> </b></td>
    <td align="center" colspan="2" width="15%"></td> 
    
    <td align="center" width="35%"><b> </b></td>
    <td align="center" colspan="2" width="15%"></td> 
  </tr>
  <tr>
    <td colspan="3"><br><br><br><br><br><br><br><br><br></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="35%">_____________________________________</td>
    <td align="left" colspan="2" width="15%">SELLO</td> 
    <td align="center" width="35%">____________________________________</td>
    <td align="left" colspan="2" width="15%">SELLO</td> 
    <p>
    <p>
    <p>
    <p>
    <p>
    <p>
  </tr>
  
  <tr>

    <td align="center" colspan="2" width="35%"><b> </b></td>
    <td align="center" colspan="2" width="15%"></td> 
    <td align="center" width="35%"><b></b></td>
    <td align="center" colspan="2" width="15%"></td> 
  </tr>
</table>
<!-- ================================================================================================================= -->

<!-- =========================================== PARA IMPRIMIR ======================================================= -->
<table border=0 align=left>
  <tr>
    <td colspan="3" width="5%">&nbsp</td>
    <td colspan="3" width="95%"><br><br><br><br><b> <a href='javascript: window.print()'>ADVERTENCIA: </a></b></b>
    Las raspaduras, anotaciones o enmiendas<b> INVALIDA ESTE DOCUMENTO</b>.
    <br>
    Este Certificado para su validez debe llevar el nombre completo del responsable de los archivos de la jefatura y/o Direccion de Estudios o Carrera,
    del Sr. Decano y 
    <br>
    del Sr. Vicerrector con sus respectivos sellos.
    <br><br><b>
    ESCALA VIGENTE DE CALIFICACIONES, 1 A 100 Y SUS VALORES :</b> 1 a 50 = Reprobado; 51 a 63 = Suficiente; 64 a 76 = 
    Bueno; 77 a 89 = Distinguido;
    <br>
    90 a 100 = Sobresaliente.
    </td>
  </tr>
</table>
<!-- =========================================================================================================================== -->

</td>
</tr>
</table>

</div>
</td>
</tr>
</table>

</center>

<%@ include file="../../Inferior.jsp" %>
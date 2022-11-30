<%@ include file="../../Superior.jsp" %>
<table border=0 align="center" width="97%">
   <tr>
     <th align="left">NOMBRES Y APELLIDOS</th>
     <td colspan="5"><c:out value="${nombres}"/></td>
   </tr>
   <tr>
     <th align="left">&Aacute;REA</th>
     <td><c:out value="${facultad}"/></td>
     <th align="left">RU</th>
     <td colspan="3"><c:out value="${id_estudiante}"/></td>
   </tr>
   <tr>
     <th align="left">CARRERA</th>
     <td><c:out value="${nom_programa}"/></td>
     <th align="left">N CI.</th>
     <td colspan="3"><c:out value="${estudiante.dip}"/></td>
   </tr>
   <tr>
     <th align="left">PERIODO LECTIVO</th>
     <td><c:out value="${periodo}"/> / <c:out value="${gestion}"/></td>
     <th align="left">Semestral</th>
     <td>&nbsp;&nbsp;</td>
     <th align="left">Anual</th>
     <td>&nbsp;&nbsp;</td>
   </tr>
   <tr>
     <th align="left">NIVEL ACAD&Eacute;MICO</th>
     <td colspan="5"><c:out value="${estudiante.tipo_graduacion}"/></td>
   </tr>
</table>
<br>
<table border=1 align="center" width="97%">
  <tr>
    <th colspan=4>ASIGNATURA</th>
    <th colspan=2>CALIFICACIONES</th>
    <th rowspan=2>OBSERV. <br>  A/R </th>
  </tr>
  <tr>
    <th>SIGLA</th>
    <th>C&Oacute;DIGO</th>
    <th>NOMBRE</th>
    <th>HORAS</th>
    <th>NUM.</th>
    <th>LITERAL</th>
  </tr>    
  <c:forEach var="lnotas" items="${lcertificados}" varStatus="contador">
    <tr>
      <td align="center"><c:out value="${lnotas.alfabetico}"/></td>
      <td align="center"><c:out value="${lnotas.numerico}"/></td>
      <td><c:out value="${lnotas.materia}"/></td>
      <td align="center"><c:out value="${lnotas.horas}"/></td>
      <td align="center"><c:out value="${lnotas.nota}"/></td>
      <c:forEach var="ln" items="${lliterales}" varStatus="contador">
        <c:if test="${ln.id_nota == lnotas.id_nota}">
           <td align="center"><c:out value="${ln.nota_literal}"/></td>
	</c:if>
      </c:forEach>
      <td align="center">
        <c:if test="${lnotas.nota >=  programa.nota_aprobacion}">
	  A
	</c:if>
	<c:if test="${lnotas.nota <  programa.nota_aprobacion}">
	  R
	</c:if>
      </td>
    </tr>
  </c:forEach>
  <br>
</table>
<br>
<br>
<table border=0 align="center" width="97%">
<tr>
  <td align="right">
  <script>
    var mydate=new Date();
    var year=mydate.getYear();
    if (year < 1000)
      year+=1900;
    var day=mydate.getDay();
    var month=mydate.getMonth()+1;
    if (month<10)
      month="0"+month;
    var daym=mydate.getDate();
    if (daym<10)
      daym="0"+daym;
      document.write("<small><font color='000000' face='Arial'><b>"+daym+
                     "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+month+
		     "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+year+"</b></font></small>")
  </script>
  </td>
</tr>  
</table>  
<%@ include file="../../Inferior.jsp" %>
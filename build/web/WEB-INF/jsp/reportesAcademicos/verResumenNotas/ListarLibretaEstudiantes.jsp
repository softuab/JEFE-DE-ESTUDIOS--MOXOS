<%@ include file="../../Superior.jsp" %>

<script language='JavaScript' SRC="./validar.js">  </script>

<table border="0" width="100%">
  <tr>
    <td width="14%" align="center">
      <img src="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion">
    </td>
    <td width="72%" align="center">
      <table width="100%" heigth="100%" cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><h1><b><c:out value='${datosInstitucion.institucion}'/></h1></td>
        <tr>
        <tr>
          <td align="center"><font size="3"><b><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></b></font></td>
        <tr>
        </tr>
          <td align="center"><c:out value='${datosInstitucion.actividad}'/></td>
        </tr>
      </table>
    </td>
    <td width="14%">
      Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a> 
    </td>
  </tr>
</table>
<hr>
<table>
  <tr>
    <td colspan="2" align="center"><font size="4"><b>RESUMEN DE NOTAS</font></b></td>
  </tr>
</table>
<br>
  <table border="0" width="97%">
    <tr>
      <td>ASIGNATURA :</td>
      <td><c:out value="${materia}"/></td>
      <td>SIGLA :</td>
      <td><c:out value="${sigla}"/></td>
      <td>GRUPO :</td>
      <td><c:out value="${grupo}"/></td>
    </tr>
    <tr>
      <td>PROGRAMA:</td>
      <td><c:out value="${programa.programa}"/></td>
      <td>GESTI&Oacute;N :</td>
      <td><c:out value="${gestion}"/></td>
      <td>PERIODO :</td>
      <td><c:out value="${periodo}"/></td>
    </tr>  
  </table>
  <br>
   
  <br>
  <table class="tabla" border=1 width="97%">
    <tr>
      <th>Nro</th>
      <th>RU</th>
      <th>Nombres</th>
      <c:forEach var="lfases" items="${lListarFases}" varStatus="contador">
        <th><c:out value="${lfases.fase}"/></th>
      </c:forEach>
      <th>Nota Final</th>      
      <th>Observaciones</th>
    </tr>	
    <c:set var="reprobado" value="0"/>
    <c:set var="aprobado" value="0"/>
    <c:forEach var="lestudiante" items="${listaEstudiantes}" varStatus="contador">
      <tr>
        <td><c:out value="${contador.count}"/></td>    
        <td><c:out value="${lestudiante.id_estudiante}"/></td>    
	<td><c:out value="${lestudiante.nombres}"/></td>    
	<c:set var="suma" value="0"/>
	<c:forEach var="lfases" items="${lListarFases}" varStatus="contador">
	  <c:set var="bandera_fase" value="0"/>
          <c:forEach var="lnotas" items="${lResumenNotas}" varStatus="contador">
            <c:if test="${lestudiante.id_estudiante == lnotas.id_estudiante && lnotas.id_fase==lfases.id_fase}">
	      <td align="center"><c:out value="${lnotas.nota}"/></td>
	      <c:set var="bandera_fase" value="1"/>
	      <c:set var="suma" value="${lnotas.nota}"/>
	    </c:if>
          </c:forEach>
	  <c:if test="${bandera_fase == 0}">
	    <td align="center">  &nbsp; </td>
	  </c:if>      
        </c:forEach>    	   
	<td align="center">
	 <script>
	   document.write(Math.round(<c:out value="${suma}"/>))
	 </script>  
	</td>
	<td align="center">
	   <c:if test="${suma >= programa.nota_aprobacion}">
	     Aprobado      
	     <c:set var="aprobado" value="${aprobado+1}"/>
	   </c:if>
	   <c:if test="${suma < programa.nota_aprobacion && suma>0}">
	     Reprobado
	     <c:set var="reprobado" value="${reprobado+1}"/>
	   </c:if>
	   <c:if test="${suma == 0 }">
	     Abandono      
	     <c:set var="reprobado" value="${reprobado+1}"/>
	   </c:if>
	</td>
      </tr>  
    </c:forEach>    
  </table>      
  <br>
  <table class="tabla" align="center">
     <tr>
       <th colspan=3>RESUMEN</th>
     <tr>
     <tr>
       <th>APROBADOS</th>
       <th>REPROBADOS</th>
       <th>TOTAL</th>
     </tr>
     <tr>
       <th><c:out value="${aprobado}"/></th>
       <th><c:out value="${reprobado}"/></th>
       <th><c:out value="${reprobado+aprobado}"/></th>
     </tr>
  </table>
<%@ include file="../../Inferior.jsp" %>
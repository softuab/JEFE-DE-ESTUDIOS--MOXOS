<%@ include file="../../Superior.jsp" %>

<script language='JavaScript' SRC="./validar.js">  </script>

<table border="0" width="100%">
  <!-- SE REPITE-->
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
    <td colspan="2" align="center"><h2>DETALLE DE LIBRETA</h2></td>
  </tr>
</table>
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
      <td>DOCENTE :</td>
      <td><c:out value="${docente}"/></td>
      <td>GESTI&Oacute;N :</td>
      <td><c:out value="${gestion}"/></td>
      <td>PERIODO :</td>
      <td><c:out value="${periodo}"/></td>
    </tr>  
  </table>
  <br>
  <table class="tabla" border=1 width="97%">
    <tr>
      <th>Nro</th>
      <th>RU</th>
      <th>Nombres</th>
      <c:forEach var="ltiposnotas" items="${listaItems}" varStatus="contador">
        <th><c:out value="${ltiposnotas.tipo_nota}"/></th>
      </c:forEach>
      <th>Nota Final Ev.Cont</th>      
      <th>Observaciones</th>
    </tr>	
    <c:forEach var="lestudiante" items="${listaEstudiantes}" varStatus="contador">
      <tr>
        <td><c:out value="${contador.count}"/></td>    
        <td><c:out value="${lestudiante.id_estudiante}"/></td>    
	<td><c:out value="${lestudiante.nombres}"/></td>    
	<c:set var="bandera" value="0"/>
	<c:set var="suma" value="0"/>
	<c:forEach var="ltiposnotas" items="${listaItems}" varStatus="contador">
	  <c:set var="bandera_fase" value="0"/>
          <c:forEach var="lnotas" items="${lnotasFases}" varStatus="contador">
            <c:if test="${lestudiante.id_estudiante == lnotas.id_estudiante && lnotas.id_tipo_nota==ltiposnotas.id_tipo_nota}">
	      <td align="center"><c:out value="${lnotas.nota}"/></td>
	      <c:set var="bandera" value="1"/>
	      <c:set var="bandera_fase" value="1"/>
	      <c:set var="nota" value="${lnotas.nota_ponderada}"/>
	      <c:set var="suma" value="${suma+lnotas.nota_ponderada}"/>
	    </c:if>
          </c:forEach>
	  <c:if test="${bandera_fase == 0}">
	    <td align="center"> 0 </td>
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
	   </c:if>
	   <c:if test="${suma < programa.nota_aprobacion && suma>0}">
	     Reprobado
	   </c:if>
	   <c:if test="${suma == 0 }">
	     Abandono      
	   </c:if>
	</td>
      </tr>  
    </c:forEach>    
  </table>      

<%@ include file="../../Inferior.jsp" %>
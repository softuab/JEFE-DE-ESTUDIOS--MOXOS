<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script language='JavaScript' SRC="./validar.js">  </script>

<table border="0" width="100%">
  <!-- SE REPITE-->
  <thead>
  <tr>
    <td width="100%" align="center" cellspancin="0" cellpading="0">
    <table width="100%">
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
    <table width="100%" align="center">
      <tr>
        <td align="center"><label><h1>ACTA DE CALIFICACIONES DE PRE-CIERRE</h1></label></td>
      </tr>
    </table>
    </td>  
  </tr>      
  <tr>
    <td>
      <table border="0" width="97%">
        <tr>
          <td>TIPO DE ACTA::</td>
          <td><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/></td>
          <td>CODIGO ::</td>
          <td><c:out value="${datosDoc.id_docente}"/></td>
        </tr>  
        <tr>
          <td>DOCENTE::</td>
          <td><c:out value="${datosDoc.paterno}"/>&nbsp;<c:out value="${datosDoc.materno}"/>&nbsp;<c:out value="${datosDoc.nombres}"/></td>
          <td>PERIODO ::</td>
          <td>
	   <c:out value="${periodo}"/> - <c:out value="${gestion}"/></td>
        </tr>
        <tr>
          <td>MATERIA ::</td>
          <td><c:out value="${materia}"/></td>
          <td>SIGLA::</td>
          <td><c:out value="${sigla}"/></td>
        </tr>
        <tr>
          <td>PROGRAMA::</td>
          <td><c:out value="${programa.programa}"/></td>
          <td>AREA::</td>
          <td><c:out value="${facultad}"/></td>
       </tr>
       <tr>
         <td>PLAN ::</td>
         <td><c:out value="${id_plan}"/></td>
         <td>NIVEL ACADEMICO::</td>
         <td><c:out value="${datosGrados.grado_academico}"/></td>
      </tr>
    </table>
  </td>
</tr>      
</thead>  
<tr>   
  <td>
    <br>
    <table class="tabla" border="1" width="97%">
      <thead>
      <tr>
        <th>Nro</th>
        <th>Matricula</th>
        <th>R.U.</th>
        <th>Apellidos y Nombres</th>
        <th>Nota Final</th>      
        <th>OBSERVACIONES</th>
      </tr>	
      </thead>
      
      <c:set var="reprobado" value="0"/>
      <c:set var="aprobado" value="0"/>
      <c:forEach var="lestudiante" items="${listNotas}" varStatus="contador">
      <tbody>
      <tr>
        <td><c:out value="${contador.count}"/></td>    
        <td>
	  <c:if test="${lestudiante.id_matricula != -1}">
            <c:out value="${lestudiante.id_matricula}"/>
	  </c:if>
	  <c:if test="${lestudiante.id_matricula == -1}">
            <font color="red"> Estudiante no matriculado </font>
	  </c:if>
	</td>    
	<td><c:out value="${lestudiante.id_estudiante}"/></td>    
	<td><c:out value="${lestudiante.nombres}"/></td>    
	<td>
	  <c:if test="${lestudiante.nota != -1}">
            <c:out value="${lestudiante.nota}"/>
	  </c:if>
	  <c:if test="${lestudiante.id_matricula == -1}">
            <font color="red"> Sin Nota</font>
	  </c:if>
	</td>    
	<td align="center">
	   <c:if test="${lestudiante.nota >= programa.nota_aprobacion}">
	     Aprobado      
	     <c:set var="aprobado" value="${aprobado+1}"/>
	   </c:if>
	   <c:if test="${lestudiante.nota < programa.nota_aprobacion && lestudiante.nota != 0}">
	     Reprobado
	     <c:set var="reprobado" value="${reprobado+1}"/>
	   </c:if>
	   <c:if test="${lestudiante.nota == 0 }">
	     Abandono      
	     <c:set var="reprobado" value="${reprobado+1}"/>
	   </c:if>
	</td>
      </tr>  
      </tbody>
      </c:forEach>    
    </table> 
  </td>
</tr>      
<tr>
  <td>
  <br><br><br><br><br><br>
  <table border=0 width="100%">
    <tr><th>_______________</th><th>____________________</th><th>___________________</th></tr>
    <tr><th>Firma Docente</th><th>Coordinador Programa</th><th>Firma Director Area</th></tr>
  </table>
  </td>
</tr>
</table>    
  
<%@ include file="../../Inferior.jsp" %>
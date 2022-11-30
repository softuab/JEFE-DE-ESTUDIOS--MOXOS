<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table width="100%">
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
              <td align="center"><b><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></b></td>
            <tr>
            </tr>
<!--              <td align="center"><c:out value='${datosInstitucion.actividad}'/></td> -->
            </tr>
          </table>
        </td>
        <td width="14%">
          Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a> 
        </td>
      </tr>
    </table>
    <hr>
    </td>
  <tr>
  <tr>
    <td>
     <table width="100%" align="center">
        <tr>
          <td align="center">
            <label><h1>RESUMEN DE CALIFICACIONES </h1></label>
          </td>
        </tr>
      </table>
    </td>  
  </tr>      
  <tr>
    <td>
      <table border="0" width="97%">
        <tr>
          <td><b>DOCENTE ::</b></td>
          <td><c:out value="${nombres}"/></td>
          <td><b>CODIGO ::</b></td>
          <td><c:out value="${datosAsignacion.id_docente}"/></td>
        </tr>  
        <tr>
          <td><b>SIGLA-MATERIA ::</b></td>
          <td><c:out value="${datosAsignacion.sigla}"/> - <c:out value="${datosAsignacion.materia}"/></td>
          <td><b>GRUPO ::</b></td>
          <td><c:out value="${datosAsignacion.grupo}"/></td>
        </tr>
        <tr>
          <td><b>CARRERA ::</b></td>
          <td><c:out value="${datosPrograma.programa}"/></td>
          <td><b>FACULTAD ::</b></td>
          <td><c:out value="${datosFacultad.facultad}"/></td>
        </tr>
        <tr>
          <td><b>PLAN ::</b></td>
          <td><c:out value="${id_plan}"/></td>
          <td><b>NIVEL ACADEMICO::</b></td>
          <td><c:out value="${datosGrados.grado_academico}"/></td>
        </tr>
        <tr>
          <td><b>PERIODO ::</b></td>
          <td><c:out value="${datosAsignacion.periodo}"/> - <c:out value="${datosAsignacion.gestion}"/></td>
          <td></td>
          <td></td>
        </tr>
      </table>
       <br>
     </td> 
  </tr>
  </thead>
  <!-- HASTA AQUI SE REPITE-->
  <tr>
    <td align="center">
    <table class="tabla">
      <tr>
        <th colspan="4">RESUMEN DE RENDIMIENTO</th>
      </tr>
      <tr>
        <th>APROBADOS</th>
        <th>REPROBADOS</th>
        <th>ABANDONOS</th>
        <th>TOTAL</th>
      </tr>
      <c:forEach var="lista" items="${lTotales}" varStatus="contador">
        <tr>
          <td align="center"><c:out value="${lista.aprobados}"/></td>
          <td align="center"><c:out value="${lista.reprobados}"/></td>
          <td align="center"><c:out value="${lista.abandonos}"/></td>
          <td align="center"><c:out value="${lista.cantidad}"/></td>
        </tr>
      </c:forEach>
    </table>
    <br>
    <table class="tabla" width="97%">
      <thead>
      <tr>
        <th>Nro.</th>
        <th>Nro. Matricula</th>
        <th>R. U.</th>
        <th>Nombres</th>
        <c:forEach var="l" items="${lFases}" varStatus="contador">
          <c:if test="${l.id_fase != 1000 && l.id_fase!= 7000}">
            <th><c:out value="${l.fase}"/></th>
          </c:if>
        </c:forEach>
        <th>NOTA FINAL</th>
        <th>OBSERVACION</th>
      </tr>
      </thead>
      </tr>
      <c:forEach var="lestudiante" items="${lEstudiantes}" varStatus="contador">
        <tr>
          <td><c:out value="${contador.count}"/></td>    
          <td><c:out value="${lestudiante.id_matricula}"/></td>
          <td><c:out value="${lestudiante.id_estudiante}"/></td>
  	  <td><c:out value="${lestudiante.nombres}"/></td>
  	  <c:forEach var="l" items="${lFases}">
	    <c:if test="${l.id_fase!='7000'}">
	      <c:set var="cols" value="0"/>
	      <c:forEach var="lnota" items="${lEvaluaciones}" varStatus="contador1">
	        <c:if test="${l.id_fase==lnota.id_fase && lestudiante.id_estudiante==lnota.id_estudiante}">
                  <td align="center"><c:out value="${lnota.nota}"/></td>
                  <c:if test="${l.id_fase==1000 && lestudiante.id_estudiante==lnota.id_estudiante}">
	            <td><c:out value="${lnota.estado}"/></td>
	          </c:if>
	          <c:set var="cols" value="1"/>
	        </c:if>
	      </c:forEach>
	      <c:if test="${cols==0}">
	        <td align="center"> - &nbsp;</td>
              </c:if>
	    </c:if>
          </c:forEach>
        </tr>
      </c:forEach>   
    </table>
    </td>
  </tr>
</table>

<br><br><br><br><br><br>
<table width="100%">
  <tr>
    <th width="35%"></th><th width="35%">____________________________</th><th width="35%"></th>
  </tr>
  <tr>
    <th width="35%"></th><th width="30%"><c:out value="${nombres}"/></th><th width="35%"></th>
  </tr>
  
  <tr>
    <th width="35%"></th><th width="30%">Docente</th><th width="35%"></th>
  </tr>
  
</table>


<%@ include file="../../Inferior.jsp" %>
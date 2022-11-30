<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

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
              <td align="center"><font size="3"><b><c:out value='${datosInstitucionsede.localidad}'/> - <c:out value='${datosInstitucionsede.departamento}'/> - <c:out value='${datosInstitucionsede.pais}'/></b></font></td>
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
        <td align="center"><label><h1>NRO. DE PROGRAMADOS POR SEXO Y NACIONALIDAD</h1></label></td>
      </tr>
    </table>
    <table border="0">
      <tr>
        <td>PERIODO ::</td>
        <td><c:out value="${periodo}"/> - <c:out value="${gestion}"/></td>
      </tr>
    </table>
    <br>
    </td>
  </tr>
  </thead>
  <!-- HASTA AQUI SE REPITE-->
  <tr>
    <td>
    <table class="tabla" border="1" width="97%">
      <tr>
        <th rowspan="2">Nro</th>
        <th rowspan="2">Nivel</th>
        <th rowspan="2">Sigla</th>
        <th rowspan="2">Materia</th>
        <th rowspan="2">Grupo</th>
        <c:forEach var="lpais" items="${lPaises}" varStatus="contador">
          <th colspan="<c:out value="${tTipoSexo}"/>"><c:out value="${lpais.nacionalidad}"/></th>    
        </c:forEach>
      </tr>
      <tr>  
        <c:forEach var="lpais" items="${lPaises}">
          <c:forEach var="ltsexos" items="${lTiposSexos}">
            <th><c:out value="${ltsexos.tipo_sexo}"/></th>    
          </c:forEach>
        </c:forEach>  
      </tr>
      <c:forEach var="lmateria" items="${lMateriasPlanGrupo}" varStatus="contador">
        <tr>
          <td><c:out value="${contador.count}"/></td>    
          <td><c:out value="${lmateria.nivel_academico}"/></td>
          <td><c:out value="${lmateria.sigla}"/></td>
          <td><c:out value="${lmateria.materia}"/></td>
          <td><c:out value="${lmateria.grupo}"/></td>
	  <c:forEach var="lpais" items="${lPaises}">
            <c:forEach var="ltsexos" items="${lTiposSexos}">
	      <c:set var="cont" value="0"/>
	      <c:forEach var="lestudiante" items="${lEstudiantes}">
	        <c:if test="${lestudiante.nacionalidad == lpais.nacionalidad && lestudiante.tipo_sexo == ltsexos.tipo_sexo && lestudiante.id_materia == lmateria.id_materia && lestudiante.id_grupo == lmateria.id_grupo}">
	          <td><c:out value="${lestudiante.numero}"/></td>
		  <c:set var="cont" value="${cont+1}"/> 
	        </c:if>
	      </c:forEach>
	      <c:if test="${cont == '0'}">
	        <td>0</td>
	      </c:if>  
            </c:forEach>
	  </c:forEach>    
        </tr>
      </c:forEach>
      <tr>
        <td class="colb" colspan="5">
          TOTALES POR SEXO Y NACIONALIDAD :
        </td>
        <c:set var="total" value="0"/> 
        <c:set var="c" value="0"/> 
        <c:forEach var="lpais" items="${lPaises}">
          <c:forEach var="ltsexos" items="${lTiposSexos}">
            <c:set var="cont" value="0"/>
            <c:forEach var="lestudiante" items="${lEstudiantes}">
	      <c:if test="${lestudiante.nacionalidad == lpais.nacionalidad && lestudiante.tipo_sexo == ltsexos.tipo_sexo}">
	        <c:set var="cont" value="${cont+lestudiante.numero}"/> 
	        <c:set var="total" value="${total+lestudiante.numero}"/> 
	      </c:if>
	    </c:forEach>
            <td class="colb"><c:out value="${cont}"/></td>   
	    <c:set var="c" value="${c+1}"/> 
          </c:forEach>
        </c:forEach> 
      </tr>  
      <tr>
        <td class="colb" colspan="5">
          TOTAL PROGRAMADOS :
        </td>
        <td class="colb" colspan="${c}">
          <c:out value="${total}"/> Programados
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
    
<%@ include file="../../Inferior.jsp" %>
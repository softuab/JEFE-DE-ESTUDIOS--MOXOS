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
        <td align="center"><label><h1>N&Uacute;MERO DE MATRICULADOS POR TIPO ADMISION</h1></label></td>
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
    <table class="tabla" border=1 width="97%">
      <tr>
        <th>Nro</th>
        <th>Programa</th>
        <c:forEach var="ltiposadmisiones" items="${lTiposAdmisiones}" varStatus="contador">
          <th><c:out value="${ltiposadmisiones.tipo_admision}"/></th>    
        </c:forEach>
      </tr>
      <c:forEach var="lprograma" items="${lProgramas}" varStatus="contador">
        <tr>
          <td><c:out value="${contador.count}"/></td>    
          <td><c:out value="${lprograma.programa}"/></td>
	  <c:forEach var="ltiposadmisiones" items="${lTiposAdmisiones}">
	    <c:set var="cont" value="0"/>
	    <c:forEach var="lestudiante" items="${lEstudiantes}">
	      <c:if test="${lestudiante.tipo_admision == ltiposadmisiones.tipo_admision && lestudiante.id_programa == lprograma.id_programa}">
	        <td><c:out value="${lestudiante.cantidad}"/></td>   
		<c:set var="cont" value="${cont+1}"/> 
	      </c:if>
	    </c:forEach>
	    <c:if test="${cont == '0'}">
	      <td>0</td>
	    </c:if>  
	  </c:forEach>
        </tr>
      </c:forEach>
      <tr>
        <td class="colb" colspan="2">
          TOTALES POR TIPO ADMISION :
        </td>
        <c:set var="total" value="0"/>
        <c:set var="c" value="0"/>
        <c:forEach var="ltiposadmisiones" items="${lTiposAdmisiones}">
	  <c:set var="cont" value="0"/>
	  <c:forEach var="lestudiante" items="${lEstudiantes}">
            <c:if test="${lestudiante.tipo_admision == ltiposadmisiones.tipo_admision}">
              <c:set var="cont" value="${cont+lestudiante.cantidad}"/> 
	      <c:set var="total" value="${total+lestudiante.cantidad}"/> 
            </c:if>
	  </c:forEach>
          <td class="colb"><c:out value="${cont}"/></td>   
	  <c:set var="c" value="${c+1}"/> 
        </c:forEach>
      </tr>  
      <tr>
        <td class="colb" colspan="2">
          TOTAL MATRICULADOS :
        </td>
        <td class="colb" colspan="${c}">
          <c:out value="${total}"/> Matriculados
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>
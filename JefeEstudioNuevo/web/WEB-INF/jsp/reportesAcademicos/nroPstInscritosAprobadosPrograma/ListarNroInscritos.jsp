<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table border="0" width="100%">
  <tr>
    <td>
      <table border="0" width="100%">
        <tr>
	  <td width="20%" align="right">
            <form name="fvolver" action="<c:url value='/nroPstInscritosAprobadosPrograma/ListarProgramas.fautapo'/>" method="post">
              <input type="hidden" name="gestion" value="<c:out value='{gestion}'/>" >
	      <input type="hidden" name="periodo"     value="<c:out value='{gestion}'/>" >
              <div> <a href="javascript:document.fvolver.submit();">
              <IMG SRC="<c:url value='${logo}'/>" width="60" height="70" border="0" ALT="logo institucion"></a></div>
            </form>
          </td>
          <td width="60%">
          <table border="0">
            <tr>
              <td align="center"><h3><b><c:out value='${institucion}'/></h3></td>
            <tr>
            </tr>
              <td align="center"><h4><c:out value='${actividad}'/></h4></td>
            </tr>
          </table>
          </td>
          <td width="20%">
            Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="dd/MM/yyyy"/></a> 
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
            <label><h1>Nro de Postulantes Aprobados - Inscritos x Programa </h1></label>
          </td>
        </tr>
      </table>
    </td>  
  </tr>      
  <tr>
    <td>
      <table border="0" width="97%">
        <tr>
          <td>PERIODO ::</td>
          <td><c:out value="${periodo}"/> - <c:out value="${gestion}"/></td>
        </tr>  
        <tr>
          <td>AREA::</td>
          <td><c:out value="${datosFacultad.facultad}"/></td>
        </tr>
      </table>
       <br>
     </td> 
  </tr>
  <tr>
    <td>
    <table class="tabla" border=1 width="97%">
      <tr>
        <th>Nro</th>
        <th>Programa</th>
        <th>Nro. Habilitados</th>
        <th>Nro. Inhabilitados</th>
	<th>Total Inscritos</th>
      </tr>
      <c:set var="total" value="0"/>
      <c:set var="totalAprob" value="0"/>
      <c:set var="totalReprob" value="0"/>
      <c:forEach var="lNroPst" items="${lNroPstInscritosHabilitados}" varStatus="contador">
        <tr>
          <td><c:out value="${contador.count}"/></td>   
          <td><c:out value="${lNroPst.programa}"/></td>
          <td>
	    <c:out value="${lNroPst.habilitados}"/>
            <c:set var="totalAprob" value="${totalAprob+lNroPst.habilitados}"/>
          </td>
          <td>
            <c:out value="${lNroPst.inhabilitados}"/>
            <c:set var="totalReprob" value="${totalReprob+lNroPst.inhabilitados}"/>
          </td>
          <td>
            <c:out value="${lNroPst.inscritos}"/>
            <c:set var="total" value="${total+lNroPst.inscritos}"/>
          </td>
        </tr> 	
      </c:forEach>
      <tr>
        <td class="colb" colspan="2"> TOTALES: </td>
        <td class="colb"><c:out value="${totalAprob}"/></td>
        <td class="colb"><c:out value="${totalReprob}"/></td>
        <td class="colb"><c:out value="${total}"/> Inscritos</td>
      </tr>  
    </table>
    </td>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>
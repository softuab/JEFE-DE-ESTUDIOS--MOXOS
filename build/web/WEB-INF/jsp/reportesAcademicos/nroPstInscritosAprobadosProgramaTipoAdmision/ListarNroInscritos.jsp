<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table border="0" width="100%">
  <tr>
    <td>
      <table border="0" width="100%">
        <tr>
	  <td width="14%" align="center">
            <form name="fvolver" action="<c:url value='/nroPstInscritosAprobadosProgramaTipoAdmision/ListarProgramas.fautapo'/>" method="post">
              <input type="hidden" name="gestion" value="<c:out value='{gestion}'/>" >
	      <input type="hidden" name="periodo"     value="<c:out value='{gestion}'/>" >
              <div> <a href="javascript:document.fvolver.submit();">
              <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" width="60" height="70" border="0" ALT="logo institucion"></a></div>
            </form>
          </td>
          <td width="72%">
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
            <label><h1>Nro de Postulantes Aprobados - Inscritos x Programa  Tipo Admisi&oacute;n </h1></label>
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
        <th rowspan="2">Nro</th>
	<th rowspan="2">Programa</th>
        <th colspan="2">PRe-Universitario</th>
        <th colspan="2">Nro. PSA</th>
	<th colspan="2">Nro. Admisiones Especiales</th>
	<th>Total Inscritos</th>
      </tr>
      <tr>
	<th>Nro. Aprobados</th>
        <th>Nro. Reprobados</th>
	<th>Nro. Aprobados</th>
        <th>Nro. Reprobados</th>
        <th>Nro. Aprobados</th>
        <th>Nro. Reprobados</th>
	<th>Total Inscritos</th>
      </tr>
      <c:set var="total" value="0"/>
      <c:set var="totalAprobPre" value="0"/>
      <c:set var="totalReprobPre" value="0"/>
      <c:set var="totalAprobPsa" value="0"/>
      <c:set var="totalReprobPsa" value="0"/>
      <c:set var="totalAprobEspecial" value="0"/>
      <c:set var="totalReprobEspecial" value="0"/>
      
      <c:forEach var="lNroPst" items="${lNroPstInscritosHabilitadosTipoAdmision}" varStatus="contador">
        <tr>
          <td><c:out value="${contador.count}"/></td>   
	  <td><c:out value="${lNroPst.programa}"/></td>   
           <td>
	    <c:out value="${lNroPst.pre_habilitados}"/>
            <c:set var="totalAprobPre" value="${totalAprobPre+lNroPst.pre_habilitados}"/>
          </td>
          <td>
            <c:out value="${lNroPst.pre_inhabilitados}"/>
            <c:set var="totalReprobPre" value="${totalReprobPre+lNroPst.pre_inhabilitados}"/>
          </td>
          <td>
	    <c:out value="${lNroPst.psa_habilitados}"/>
            <c:set var="totalAprobPsa" value="${totalAprobPsa+lNroPst.psa_habilitados}"/>
          </td>
          <td>
            <c:out value="${lNroPst.psa_inhabilitados}"/>
            <c:set var="totalReprobPsa" value="${totalReprobPsa+lNroPst.psa_inhabilitados}"/>
          </td>
         <td>
            <c:out value="${lNroPst.eEpecial_habilitados}"/>
            <c:set var="totalAprobEspecial" value="${totalAprobEspecial+lNroPst.eEpecial_habilitados}"/>
          </td>
          
         <td>
            <c:out value="${lNroPst.especial_inhabilitados}"/>
            <c:set var="totalReprobEspecial" value="${totalReprobEspecial+lNroPst.especial_inhabilitados}"/>
          </td>
          <td>
            <c:out value="${lNroPst.inscritos}"/>
            <c:set var="total" value="${total+lNroPst.inscritos}"/>
          </td>
        </tr> 	
      </c:forEach>
      <tr>
        <td class="colb" colspan="2"> TOTALES: </td>
        <td class="colb"><c:out value="${totalAprobPre}"/></td>
        <td class="colb"><c:out value="${totalReprobPre}"/></td>
	<td class="colb"><c:out value="${totalAprobPsa}"/></td>
        <td class="colb"><c:out value="${totalReprobPsa}"/></td>
	<td class="colb"><c:out value="${totalAprobEspecial}"/></td>
        <td class="colb"><c:out value="${totalReprobEspecial}"/></td>
        <td class="colb"><c:out value="${total}"/> Inscritos</td>
      </tr>  
    </table>
    </td>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>
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
          <img width="50%" src="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion">
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
        <td align="center"><label><h2>ESTUDIANTES MATRICULADOS POR PROGRAMA</h2></label></td>
		<tr><td align="center"><label><h3>Reporte Generado del <c:out value="${fecha_ini}"/> al <c:out value="${fecha_fin}"/> :: (Periodo <c:out value="${periodo}"/> - <c:out value="${gestion}"/> )</h3></label></td></tr>		
      </tr>
    </table>    
    <br>
    </td>
  </tr>
  </thead>
  <c:set var="total" value="0"/>
  <!-- HASTA AQUI SE REPITE-->
  <tr>
    <td>
      <table class="tabla" width="100%">
        <thead>
        <tr>
          <th>Nro</th>                    
          <th>PROGRAMA</th>
          <th>GESTION</th>
          <th>PERIODO</th>
          <th>CANTIDAD</th>
        </tr>
        </thead>
        <c:forEach var="lista" items="${lEstudiantes}" varStatus="contador">
          <tr>
            <td><c:out value="${contador.count}"/></td>                        
            <td><c:out value="${lista.programa}"/></td>
            <td align='center'><c:out value="${lista.gestion}"/></td>
			<td align='center'><c:out value="${lista.periodo}"/></td>
			<td align='right'><c:out value="${lista.cantidad}"/></td>  
            <c:set var="total" value="${total + lista.cantidad}"/>			
          </tr>
        </c:forEach>
		  <tr>
           <td colspan=4 height="1" style="border-top: 2px solid #000000; border-bottom: 2px solid #000000;" align="right">TOTAL&nbsp;&nbsp;&nbsp;&nbsp;</td>
           <td  height="1" style="border-top: 2px solid #000000; border-bottom: 2px solid #000000;" align="right"> <c:out value="${total}"/> </td>           
          </tr>
		
      </table>
    </td>
  </tr>
</table>
<%@ include file="../../Inferior.jsp" %>
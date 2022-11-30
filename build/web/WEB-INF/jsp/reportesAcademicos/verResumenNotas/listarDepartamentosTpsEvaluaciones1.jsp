<%@ include file="../../Superior.jsp"%>

<div class="titulo">Reporte Resumen de Notas</div>
<br>
<div class="volver"><a href="/verResumenNotas.fautapo">Volver</a></div>

<c:if test="${!empty cliente.id_rol}">
<form action="<c:url value="/listarDocentesAsignados.fautapo"/>" method="post">
  <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>'>
  <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>'>
  <table class="formulario" border=0>
    <tr>
       <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta" align=right>Fcl. Departamento</td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_departamento">
	  <option value="">--Seleccione--
            <c:forEach var="fcldepartamentos" items="${lListarFclDepartamentos}" varStatus="contador">
              <option value="<c:out value="${fcldepartamentos.id_departamento}"/>"><c:out value="${fcldepartamentos.departamento}"/> 
	      </option>
            </c:forEach>
	  </option>
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta" align=right>Tipo de Evaluaci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_tipo_evaluacion">
	  <option value="">--Seleccione
            <c:forEach var="tipo" items="${lListarTiposEvaluaciones}">
              <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>"> <c:out value="${tipo.tipo_evaluacion}"/>
	      </option>
            </c:forEach>
	  </option>    
        </select>
      </td>
    </tr>
    
    <tr>
    <td colspan="3" align="center"><input class="aceptar" type="submit" value=Buscar></td>   
    </tr>
  </table>    
</form>
</c:if>

<%@ include file="../../Inferior.jsp" %>
    
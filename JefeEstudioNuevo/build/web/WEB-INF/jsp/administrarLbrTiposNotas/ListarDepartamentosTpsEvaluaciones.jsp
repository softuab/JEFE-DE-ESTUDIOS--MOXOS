<%@ include file="../Superior.jsp"%>

<div class="titulo">Administrar Tipos Notas</div>
<br>
<div class="volver"><a href="../administrarTiposNotas/verificarEntrada.fautapo">Volver</a></div>

<table class="tabla" border=0>
  <tr>
      <th>FACULTAD</th>
      <th>GESTION</th>      
      <th>PERIODO</th>
 </tr>  
 <tr class=colb>
   <td align=center><c:out value="${facultad.facultad}"/> </td>
   <td align=center><c:out value="${gestion}"/></td>
   <td align=center><c:out value="${periodo}"/></td>      
 </tr>
</table>

<c:if test="${!empty cliente.id_rol}">
<form action="<c:url value="/administrarTiposNotas/registrarTipoNota.fautapo"/>" method="post">
  <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>'>
  <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>'>
  <input type="hidden" name="id_facultad" value='<c:out value="${facultad.id_facultad}"/>'>
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

<%@ include file="../Inferior.jsp" %>
    
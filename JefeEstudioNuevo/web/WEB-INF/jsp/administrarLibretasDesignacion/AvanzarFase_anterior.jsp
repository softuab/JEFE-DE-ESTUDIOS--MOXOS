<%@ include file="../Superior.jsp" %>

<c:if test="${!empty id_rol}">
  <div class=titulo> Administrar Libretas</div>
  <br>
<form name=formavolver method=post action='<c:url value="/definirEvaluacion/listarAsignaciones.fautapo"/>'>
        <div><a class="volver" href="javascript:document.formavolver.submit();"> Volver</a></div>
          <input type="hidden" name="id_docente"            value="<c:out value='${id_docente}'/>">
          <input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
          <input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">	  
	  <input type="hidden" name="bandera"             value='1'>
</form>  
  
  <c:if test="${mensaje != null}">
    <center><div class="cuadroAviso"><c:out value="${mensaje}"/></div> </center>
  </c:if>
  <c:if test="${id_fase >= 1000}">
    <center><div class="cuadroAviso">Usted ya realiz&oacute; el Pre-Cierre de Libreta</div> </center>
  </c:if>
  <c:if test="${mensaje == null && id_fase != 1000}">
    <form method=post>
      <table class="tabla" border="0">
        <tr>
          <th>CARRERA/PROGRAMA</th>
          <th>SIGLA</th>
    	  <th>MATERIA</th>
          <th>GRUPO</th>
          <th>GESTI&Oacute;N</th>
          <th>PERIODO</th>
	<tr>    
          <td class="etiqueta"><c:out value="${programa}"/></td>
          <td class="etiqueta" align="center"><c:out value="${sigla}"/></td>    
    	  <td class="etiqueta"><c:out value="${materia}"/></td>    
          <td class="etiqueta" align="center"><c:out value="${grupo}"/></td>
          <td class="etiqueta" align="center"><c:out value="${gestion}"/></td>
          <td class="etiqueta" align="center"><c:out value="${periodo}"/></td>
        </tr>
      </table>
      <table class="formulario">
        <tr>
          <td class="cuadroError" colspan=7><br>¿Esta seguro que desea avanzar de <u><c:out value="${fase}"/></u> a <u>  <c:out value="${fase_sgt}"/></u>?</th>
        </tr>
        <tr>
          <td colspan="7" align="center"><input type=submit name=accion value='Avanzar >>'></td>
        </tr>    
      </table>
      <input type="hidden" name="id_materia"         value="<c:out value="${id_materia}"/>">
      <input type="hidden" name="id_grupo"           value="<c:out value="${id_grupo}"/>">
      <input type="hidden" name="grupo"              value="<c:out value="${grupo}"/>">    
      <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
      <input type="hidden" name="id_departamento"    value="<c:out value="${id_departamento}"/>">
      <input type="hidden" name="id_fase"            value="<c:out value="${id_fase}"/>">
      <input type="hidden" name="id_modelo_ahorro"   value="<c:out value="${id_modelo_ahorro}"/>">
      <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
      <input type="hidden" name="tipo_evaluacion"    value="<c:out value="${tipo_evaluacion}"/>">
      <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
      <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
      <input type="hidden" name="id_tipo_grado"      value="<c:out value="${id_tipo_grado}"/>">      
    </form>
  </c:if>
</c:if>

<%@ include file="../Inferior.jsp" %>
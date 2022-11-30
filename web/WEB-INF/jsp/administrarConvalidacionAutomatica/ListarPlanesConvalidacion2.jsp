<%@ include file="../Superior.jsp" %>

<div class="titulo">Admin. Convalidaci&oacute;n Aut&oacute;matica</div>
<form name="fvolver" method="POST" action='<c:url value="/listarPlanesConvalidacion.fautapo"/>' >
  <input type="hidden" name="id_facultad"         value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa"         value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_prg_plan_nuevo"   value="<c:out value="${id_prg_plan_nuevo}"/>">
  <input type="hidden" name="id_prg_plan_antiguo" value="<c:out value="${id_prg_plan_antiguo}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<table class="tabla">
  <tr>
    <th>Facultad</th>
    <td class="colb"><c:out value="${datosFacultad.facultad}"/></td>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/></td>
  </tr>
  <tr>
    <th>Plan Nuevo</th>
    <td class="colb"><c:out value="${datosPrgPlanNuevo.id_plan}"/></td>
    <th>Plan Antiguo</th>
    <td class="colb"><c:out value="${datosPrgPlanAntiguo.id_plan}"/></td>
  </tr>
</table>
<br>

<h4>Seleccione las materias que convalidan a: <u><c:out value="${datosMateria.materia}"/></u> 
<c:if test="${id_mencion > 0}">
  Menci&oacute;n <u><c:out value="${datosMencion.mencion}"/></u></h4>
</c:if>

<form name="forma" method="POST" action='<c:url value="/registrarConvalidacionPlanes.fautapo"/>' >
<table border="0">
  <tr>
    <td with="45%" valign="top">
      <table class="tabla">
        <tr>
          <th colspan="4">MATERIAS SIN CONVALIDAR</th>
        </tr>
        <tr>
          <th>?</th>
          <th>NIVEL</th>
          <th>SIGLA</th>
          <th>MATERIA</th>
        </tr>
        <c:forEach var="lista1" items="${lMateriasPlanAntiguoSinConvalidar}" varStatus="contador">
          <!-- ********** Esto es para el efecto ************ -->
            <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
          <!-- ********** Fin  efecto ************ -->
            <td class="colb"><input type="checkbox" name="id_materia_anterior_adicionar" value="<c:out value="${lista1.id_materia}"/>"></td>
            <td><c:out value="${lista1.nivel_academico}"/></td>
            <td><c:out value="${lista1.sigla}"/></td>
            <td><c:out value="${lista1.materia}"/></td>
          </tr>
        </c:forEach>
      </table>
    </td>
    <td width="10%" valign="top">
      <input type="submit" class="siguiente" value='Adicionar' OnClick='javascript:document.forma.accion.value="Adicionar"'>
      <input type="submit" class="atras" value='Eliminar' OnClick='javascript:document.forma.accion.value="Eliminar"'>
    </td>
    <td with="45%" valign="top">
      <table class="tabla">
        <tr>
          <th colspan="3">MATERIAS CONVALIDADAS</th>
        </tr>
        <tr>
          <th>?</th>
          <th>SIGLA</th>
          <th>MATERIA</th>
        </tr>
        <c:forEach var="lista1" items="${lMateriasPlanAntiguoConvalidadas}" varStatus="contador">
          <!-- ********** Esto es para el efecto ************ -->
            <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
          <!-- ********** Fin  efecto ************ -->
            <td class="colb"><input type="checkbox" name="id_mtr_plan_eliminar" value="<c:out value="${lista1.id_mtr_plan}"/>"></td>
            <td><c:out value="${lista1.sigla}"/></td>
            <td><c:out value="${lista1.materia}"/></td>
          </tr>
        </c:forEach>
      </table>
    </td>
  </tr>
</table>
  <input type="hidden" name="id_facultad"         value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa"         value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_prg_plan_nuevo"   value="<c:out value="${id_prg_plan_nuevo}"/>">
  <input type="hidden" name="id_prg_plan_antiguo" value="<c:out value="${id_prg_plan_antiguo}"/>">
  <input type="hidden" name="id_materia"          value="<c:out value="${id_materia}"/>">
  <input type="hidden" name="id_mencion"          value="<c:out value="${id_mencion}"/>">
  <input type="hidden" name="nivel_academico"     value="<c:out value="${nivel_academico}"/>">
  <input type="hidden" name="accion"              value="">
</form>

<%@ include file="../Inferior.jsp" %>
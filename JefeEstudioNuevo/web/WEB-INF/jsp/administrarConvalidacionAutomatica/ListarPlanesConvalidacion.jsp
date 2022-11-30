<%@ include file="../Superior.jsp" %>

<div class="titulo">Admin. Convalidaci&oacute;n Aut&oacute;matica</div>
<form name="fvolver" method="POST" action='<c:url value="/listarPlanesPrograma.fautapo"/>' >
  <input type="hidden" name="id_facultad"         value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa"         value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_prg_plan_nuevo"   value="<c:out value="${id_prg_plan_nuevo}"/>">
  <input type="hidden" name="id_prg_plan_antiguo" value="<c:out value="${id_prg_plan_antiguo}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<table class="tabla">
  <tr>
    <th>Facultad</th>
    <td class="colb"><c:out value="${datosFacultad.facultad}"/>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
    <th>Plan Nuevo</th>
    <td class="colb"><c:out value="${datosPrgPlanNuevo.id_plan}"/></td>
  </tr>
</table>
<br>

<table class="tabla">
  <tr>
    <th>MENCION</th>
    <th>NIVEL</th>
    <th>ID</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>MATERIAS ANTERIORES <br>(PLAN - <c:out value="${datosPrgPlanAntiguo.id_plan}"/>)</th>
    <th>CONVALIDAR</th>
  </tr>
  <c:forEach var="lista1" items="${lPlanNuevo}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${lista1.mencion}"/></td>
    <td><c:out value="${lista1.nivel_academico}"/></td>
    <td><c:out value="${lista1.id_materia}"/></td>
    <td><c:out value="${lista1.sigla}"/></td>
    <td><c:out value="${lista1.materia}"/></td>
    <td><c:out value="${lista1.materias_anteriores}" escapeXml="false"/></td>
    <td>
      <form name=forma<c:out value="${contador.count}"/> method="POST" action='<c:url value="/listarPlanesConvalidacion2.fautapo"/>' >
        <input type="hidden" name="id_facultad"         value="<c:out value="${id_facultad}"/>">
        <input type="hidden" name="id_programa"         value="<c:out value="${id_programa}"/>">
        <input type="hidden" name="id_prg_plan_nuevo"   value="<c:out value="${id_prg_plan_nuevo}"/>">
        <input type="hidden" name="id_prg_plan_antiguo" value="<c:out value="${id_prg_plan_antiguo}"/>">
        <input type="hidden" name="id_materia"          value="<c:out value="${lista1.id_materia}"/>">
        <input type="hidden" name="id_mencion"          value="<c:out value="${lista1.id_mencion}"/>">
        <input type="hidden" name="nivel_academico"     value="<c:out value="${lista1.nivel_academico}"/>">
        <div class="agregar"><a href='javascript: document.forma<c:out value="${contador.count}"/>.submit();' > Convalidar </a></div>
      </form>
    </td>
   </tr>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp" %>
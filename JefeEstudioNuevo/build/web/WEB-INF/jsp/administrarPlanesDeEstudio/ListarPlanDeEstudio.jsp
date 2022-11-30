<%@ include file="../Superior.jsp" %>

<div class="titulo">Admin. Planes de Estudio</div>
<form name="fvolver" method="POST" action='<c:url value="/adminPlanesDeEstudio2.fautapo"/>' >
  <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa" value="<c:out value="${datosPrgPlan.id_programa}"/>">
  <input type="hidden" name="id_prg_plan" value="<c:out value="${id_prg_plan}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<table class="tabla">
  <tr>
    <th>Facultad</th>
    <td class="colb"><c:out value="${datosFacultad.facultad}"/>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosPrgPlan.id_plan}"/></td>
    <th>Tipo Grado</th>
    <td class="colb"><c:out value="${datosPrgPlan.tipo_grado}"/></td>
  </tr>
</table>
<br>

<form name="fnuevo" method="POST" action='<c:url value="/listarMateriasNoPlan.fautapo"/>' >
  <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa" value="<c:out value="${datosPrgPlan.id_programa}"/>">
  <input type="hidden" name="id_prg_plan" value="<c:out value="${id_prg_plan}"/>">
  <div class="agregar"><a href='javascript: document.fnuevo.submit();' > Nueva materia </a></div>
</form>

<table class="tabla">
  <tr>
    <th>MENCION</th>
    <th>NIVEL</th>
    <th>ID</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>TIPO MATERIA</th>
    <th>REQUISITOS</th>
    <th>MODIFICAR</th>
    <th>ELIMINAR</th>
  </tr>
  <c:forEach var="lista1" items="${lPlanDeEstudios}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${lista1.mencion}"/></td>
    <td><c:out value="${lista1.nivel_academico}"/></td>
    <td><c:out value="${lista1.id_materia}"/></td>
    <td><c:out value="${lista1.sigla}"/></td>
    <td>
      <form name=fRequisitos<c:out value="${contador.count}"/> method="POST" action='<c:url value="/seleccionarAccion.fautapo"/>' >
        <input type="hidden" name="id_facultad"     value="<c:out value="${id_facultad}"/>">
        <input type="hidden" name="id_prg_plan"     value="<c:out value="${id_prg_plan}"/>">
        <input type="hidden" name="id_mtr_plan"     value="<c:out value="${lista1.id_mtr_plan}"/>">
        <a href='javascript: document.fRequisitos<c:out value="${contador.count}"/>.submit();' > <c:out value="${lista1.materia}"/> </a></div>
      </form>
    </td>
    <td><c:out value="${lista1.tipo_materia}"/></td>
    <td><c:out value="${lista1.materias_anteriores}" escapeXml="false"/></td>
    <td>
      <form name=fModificar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/modificarMtrPlan.fautapo"/>' >
        <input type="hidden" name="id_facultad"     value="<c:out value="${id_facultad}"/>">
        <input type="hidden" name="id_prg_plan"     value="<c:out value="${id_prg_plan}"/>">
        <input type="hidden" name="id_mtr_plan"     value="<c:out value="${lista1.id_mtr_plan}"/>">
        <div class="modificar"><a href='javascript: document.fModificar<c:out value="${contador.count}"/>.submit();' > Modificar </a></div>
      </form>
    </td>
    <td>
      <form name=fEliminar<c:out value="${contador.count}"/> method="POST" action='<c:url value="/eliminarMtrPlan.fautapo"/>' >
        <input type="hidden" name="id_facultad"     value="<c:out value="${id_facultad}"/>">
        <input type="hidden" name="id_prg_plan"     value="<c:out value="${id_prg_plan}"/>">
        <input type="hidden" name="id_mtr_plan"     value="<c:out value="${lista1.id_mtr_plan}"/>">
        <div class="eliminar"><a href='javascript: document.fEliminar<c:out value="${contador.count}"/>.submit();' > Eliminar </a></div>
      </form>
    </td>
   </tr>
  </c:forEach>
</table>

<h2>Listado de Materias Electivas</h2>
<table class="tabla">
  <tr>
    <th>MENCION</th>
    <th>NIVEL</th>
    <th>ID</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>TIPO MATERIA</th>
    <th>MODIFICAR</th>
    <th>ELIMINAR</th>
  </tr>
  <c:forEach var="lista1" items="${lElectivasPlanDeEstudios}" varStatus="contador1">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador1.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${lista1.mencion}"/></td>
    <td><c:out value="${lista1.nivel_academico}"/></td>
    <td><c:out value="${lista1.id_materia}"/></td>
    <td><c:out value="${lista1.sigla}"/></td>
    <td><c:out value="${lista1.materia}"/></td>
    <td><c:out value="${lista1.tipo_materia}"/></td>
    <td>
      <form name=fModificarE<c:out value="${contador1.count}"/> method="POST" action='<c:url value="/modificarMtrPlan.fautapo"/>' >
        <input type="hidden" name="id_facultad"     value="<c:out value="${id_facultad}"/>">
        <input type="hidden" name="id_prg_plan"     value="<c:out value="${id_prg_plan}"/>">
        <input type="hidden" name="id_mtr_plan"     value="<c:out value="${lista1.id_mtr_plan}"/>">
        <div class="modificar"><a href='javascript: document.fModificarE<c:out value="${contador1.count}"/>.submit();' > Modificar </a></div>
      </form>
    </td>
    <td>
      <form name=fEliminarE<c:out value="${contador1.count}"/> method="POST" action='<c:url value="/eliminarMtrPlan.fautapo"/>' >
        <input type="hidden" name="id_facultad"     value="<c:out value="${id_facultad}"/>">
        <input type="hidden" name="id_prg_plan"     value="<c:out value="${id_prg_plan}"/>">
        <input type="hidden" name="id_mtr_plan"     value="<c:out value="${lista1.id_mtr_plan}"/>">
        <div class="eliminar"><a href='javascript: document.fEliminarE<c:out value="${contador1.count}"/>.submit();' > Eliminar </a></div>
      </form>
    </td>
   </tr>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp" %>
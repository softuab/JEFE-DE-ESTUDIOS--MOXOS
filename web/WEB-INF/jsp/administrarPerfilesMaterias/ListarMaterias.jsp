<%@ include file="../Superior.jsp" %>

<div class="titulo">Admin. Perfiles - Materias</div>
<form name="fvolver" method="POST" action="listarPlanes.fautapo" >
  <input type="hidden" name="id_facultad"  value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa"  value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_plan"      value="<c:out value="${id_plan}"/>">
  <input type="hidden" name="id_perfil"    value="<c:out value="${id_perfil}"/>">
  <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
  <input type="hidden" name="gestion"      value="<c:out value="${gestion}"/>">
  <input type="hidden" name="periodo"      value="<c:out value="${periodo}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<table class="tabla">
  <tr>
    <th>Facultad</th>
    <td class="colb"><c:out value="${datosFacultad.facultad}"/>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${id_plan}"/></td>
  <tr>
  </tr>
    <th>Tipo Evaluaci&oacute;n</th>
    <td class="colb"><c:out value="${datosTipoEvaluacion.tipo_evaluacion}"/></td>
    <th>Gesti&oacute;n</th>
    <td class="colb"><c:out value="${gestion}"/></td>
    <th>Periodo</th>
    <td class="colb"><c:out value="${periodo}"/></td>
  </tr>
</table>
<br>

<h2>Perfil : <c:out value="${datosPerfil.perfil}"/></h2>
<form name="forma" method="post" action="registrarPerfilesMaterias.fautapo">
  <input type="hidden" name="id_programa"  value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_plan"      value="<c:out value="${id_plan}"/>">
  <input type="hidden" name="id_perfil"    value="<c:out value="${id_perfil}"/>">
  <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
  <input type="hidden" name="gestion"      value="<c:out value="${gestion}"/>">
  <input type="hidden" name="periodo"      value="<c:out value="${periodo}"/>">
  <table class="tabla">
    <tr>
      <th>MENCION</th>
      <th>NIVEL</th>
      <th>SIGLA</th>
      <th>MATERIA</th>
      <th>COSTO</th>
    </tr>
    <c:forEach var="lista1" items="${lPlanMaterias}" varStatus="contador">
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
       <td><c:out value="${lista1.mencion}"/></td>
       <td><c:out value="${lista1.nivel_academico}"/></td>
       <td><c:out value="${lista1.sigla}"/></td>
       <td><c:out value="${lista1.materia}"/></td>
       <td>
         <input type="hidden" name="materia<c:out value="${contador.index}"/>" value="<c:out value="${lista1.id_materia}"/>">
         <input type="text" name="costo<c:out value="${lista1.id_materia}"/>" value="<c:out value="${lista1.costo}"/>" size="5">
       </td>
     </tr>
    </c:forEach>
  </table>
  <center>
    <input type="submit" class="aceptar" value='Aceptar'>
  </center>
  <input type="hidden" name="nro_materias" value="<c:out value="${fn:length(lPlanMaterias)}"/>">
</form>

<%@ include file="../Inferior.jsp" %>
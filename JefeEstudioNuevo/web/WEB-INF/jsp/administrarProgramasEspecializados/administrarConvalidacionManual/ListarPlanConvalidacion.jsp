<%@ include file="../../Superior.jsp" %>

<div class="titulo">Admin. Convalidaci&oacute;n Manual</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<table class="tabla">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/></td>
    <th>Estudiante</th>
    <td class="colb">
      <c:out value="${datosEstudiante.nombres}"/> &nbsp; 
      <c:out value="${datosEstudiante.paterno}"/> &nbsp;
      <c:out value="${datosEstudiante.materno}"/>
    </td>
  </tr>
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosEstudiante.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosEstudiante.id_plan}"/>
  </tr>
</table>
<br>

<form name="forma" method="POST" action='<c:url value="/registrarConvalidacionManual.fautapo"/>' >
  <table class="tabla">
    <tr>
      <th>?</th>
      <th>NIVEL</th>
      <th>SIGLA</th>
      <th>MATERIA</th>
      <th>MENCION</th>
    </tr>
    <c:forEach var="lista" items="${lMateriasPlan}" varStatus="contador">
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
        <td class="colb"><input type="checkbox" name="id_materia" value="<c:out value="${lista.id_materia}"/>"></td>
        <td><c:out value="${lista.nivel_academico}"/></td>
        <td><c:out value="${lista.sigla}"/></td>
        <td><c:out value="${lista.materia}"/></td>
        <td><c:out value="${lista.mencion}"/></td>
      </tr>
    </c:forEach>
  </table>
  <center>
      <input type="submit" class="siguiente" value='Aceptar'>
  </center>
</form>

<%@ include file="../../Inferior.jsp" %>
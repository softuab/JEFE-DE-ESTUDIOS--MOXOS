<%@ include file="../Superior.jsp" %>

<div class="titulo">Admin. Materias</div>
<form name="fvolver" method="POST" action='listarDepartamentos.fautapo'>
  <input type="hidden" name="id_departamento" value="<c:out value="${id_departamento}"/>">
  <input type="hidden" name="sigla"           value="<c:out value="${sigla}"/>">
  <input type="hidden" name="materia"         value="<c:out value="${materia}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>
<br>

<form name="fnuevo" method="POST" action='buscarMateria.fautapo' >
  <input type="hidden" name="accion" value="Adicionar">
  <div class="agregar"><a href='javascript: document.fnuevo.submit();' > Nueva materia </a></div>
</form>

<table class="tabla">
  <tr>
    <th>TIPO GRADO</th>
    <th>PROGRAMA</th>
    <th>PLAN</th>
    <th>ID</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>TIPO MATERIA</th>
    <th>HRS. TEORICAS</th>
    <th>HRS. PRACTICAS</th>
    <th>HRS. PERIODO</th>
    <th>CREDITOS</th>
    <th>MODIFICAR</th>
    <th>ELIMINAR</th>
  </tr>
  <c:set var="id_departamento_ant" value="0"/>
  <c:forEach var="lista" items="${lMaterias}" varStatus="contador">
    <c:if test="${id_departamento_ant != lista.id_departamento}">
      <tr>
        <td colspan="13" class="colb"><c:out value="${lista.departamento}"/></td>
      </tr>
    </c:if>
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${lista.tipo_grado}"/></td>
    <td><c:out value="${lista.programa}"/></td>
    <td><c:out value="${lista.id_plan}"/></td>
    <td><c:out value="${lista.id_materia}"/></td>
    <td><c:out value="${lista.sigla}"/></td>
    <td><c:out value="${lista.materia}"/></td>
    <td><c:out value="${lista.tipo_materia}"/></td>
    <td align="center"><c:out value="${lista.hrs_teoricas}"/></td>
    <td align="center"><c:out value="${lista.hrs_practicas}"/></td>
    <td align="center"><c:out value="${lista.hrs_periodo}"/></td>
    <td align="center"><c:out value="${lista.creditos}"/></td>
    <form name=fModificar<c:out value="${contador.count}"/> method="POST" action='buscarMateria.fautapo' >
      <td><a class="modificar" href='javascript: document.fModificar<c:out value="${contador.count}"/>.submit();' >Modificar</a></td>
      <input type="hidden" name="accion" value="Modificar">
      <input type="hidden" name="id_materia" value="<c:out value="${lista.id_materia}"/>">
    </form>
    <form name=fEliminar<c:out value="${contador.count}"/> method="POST" action='buscarMateria.fautapo' >
      <td><a class="eliminar" href='javascript: document.fEliminar<c:out value="${contador.count}"/>.submit();'> Eliminar</a></td>
      <input type="hidden" name="accion" value="Eliminar">
      <input type="hidden" name="id_materia" value="<c:out value="${lista.id_materia}"/>">
    </form>
   </tr>
   <c:set var="id_departamento_ant" value="${lista.id_departamento}"/>
  </c:forEach>
</table>

<%@ include file="../Inferior.jsp" %>
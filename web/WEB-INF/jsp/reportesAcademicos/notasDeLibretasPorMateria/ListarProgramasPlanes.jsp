<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<div class="titulo">Evaluaci&oacute;n de Estudiantes por Materia</div>
<div class="volver"><a href='entrada.fautapo'>Volver</a></div>

<form name='forma' method="post" action='listarPlanEstudios.fautapo'>
  <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
  <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
<table class="formulario">
  <tr>
    <th colspan="3">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta">
      <c:choose>
        <c:when test="${cliente.id_universidad > 0}">Universidad</c:when>
        <c:when test="${cliente.id_facultad > 0}">Facultad</c:when>
        <c:when test="${cliente.id_programa > 0}">Programa</c:when>
      </c:choose>      
    </td>
    <td class="etiqueta">::</td>
    <td><c:out value="${acceso.acceso}"/></td>
  </tr>
  <c:if test="${fn:length(acceso.listaFacultades) > 0}">
    <tr>
      <td class="etiqueta">Facultad <font color="red">(*)</font></td>
      <td class="etiqueta">::</td>
      <td><select name="id_facultad" id="id_facultad" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
    </tr>
  </c:if>
  <c:if test="${fn:length(acceso.listaProgramas) > 0}">
    <tr>
      <td class="etiqueta">Programa <font color="red">(*)</font></td>
      <td class="etiqueta">::</td>
      <td><select name="id_programa" id="id_programa" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
    </tr>
  </c:if>
  <c:if test="${fn:length(acceso.listaPlanes) > 0}">
    <tr>
      <td class="etiqueta">Plan <font color="red">(*)</font></td>
      <td class="etiqueta">::</td>
      <td><select name="id_prg_plan" id="id_prg_plan" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
    </tr>
  </c:if>
  <tr>
    <td class="etiqueta">Tipo de Evaluaci&oacute;n <font color="red">(*)</font></td>
    <td class="etiqueta">::</td>
    <td>
      <select name="id_tipo_evaluacion">
       <option value=""> - Elija una opción - </option>    
        <c:forEach var="tipo" items="${lTiposEvaluaciones}">
          <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>"> <c:out value="${tipo.tipo_evaluacion}"/></option>
        </c:forEach>
      </select>
    </td>
  </tr>
</table>
<center>
  <input type='button' value='Siguiente' class="siguiente" onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")'>
</center>

<c:if test="${cliente.id_facultad > 0}"><input type="hidden" name="id_facultad" value='<c:out value="${cliente.id_facultad}"/>'></c:if>
<c:if test="${cliente.id_programa > 0}"><input type="hidden" name="id_programa" value='<c:out value="${cliente.id_programa}"/>'></c:if>
</form>

<script language="JavaScript">
var combo = new Array();
var padre_hijo = new Array();
h = 0;
<c:if test="${fn:length(acceso.listaFacultades) > 0}">
  padre_hijo[h] = new Array("id_facultad", "''");
  combo[h] = new Array();
  <c:forEach var="facultad" items="${acceso.listaFacultades}" varStatus="fac">
    combo[h][<c:out value="${fac.index}"/>] = new Array("<c:out value="${facultad.id_facultad}"/>", "<c:out value="${facultad.facultad}"/>", "");
  </c:forEach>
  h++;
</c:if>
<c:if test="${fn:length(acceso.listaProgramas) > 0}">
  padre_hijo[h] = new Array("id_programa", <c:if test="${fn:length(acceso.listaFacultades) == 0}">"''"</c:if> <c:if test="${fn:length(acceso.listaFacultades) > 0}">"id_facultad"</c:if>);
  combo[h] = new Array();
  <c:forEach var="programa" items="${acceso.listaProgramas}" varStatus="prg">
    combo[h][<c:out value="${prg.index}"/>] = new Array("<c:out value="${programa.id_programa}"/>", "<c:out value="${programa.programa}"/>", "<c:out value="${programa.id_facultad}"/>");
  </c:forEach>
  h++;
</c:if>
<c:if test="${fn:length(acceso.listaPlanes) > 0}">
  padre_hijo[h] = new Array("id_prg_plan", <c:if test="${fn:length(acceso.listaProgramas) == 0}">"''"</c:if> <c:if test="${fn:length(acceso.listaProgramas) > 0}">"id_programa"</c:if>);
  combo[h] = new Array();
  <c:forEach var="plan" items="${acceso.listaPlanes}" varStatus="pln">
    combo[h][<c:out value="${pln.index}"/>] = new Array("<c:out value="${plan.id_prg_plan}"/>", "<c:out value="${plan.tipo_grado}"/> - <c:out value="${plan.id_plan}"/>", "<c:out value="${plan.id_programa}"/>");
  </c:forEach>
  h++;
</c:if>
</script>

<script language="JavaScript">
  iniciar();
</script>

<%@ include file="../../Inferior.jsp" %>
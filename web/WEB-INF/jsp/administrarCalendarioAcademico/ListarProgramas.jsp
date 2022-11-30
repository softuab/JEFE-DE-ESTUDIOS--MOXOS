<%@ include file="../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<div class="titulo">Admin. Calendario Acad&eacute;mico</div>
<div class="volver"><a href='entrada.fautapo'>Volver</a></div>

<body onLoad='iniciar()'>
<form name='forma' method="post" action='listarCalendarios.fautapo'>
  <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
  <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
<table class="formulario">
  <tr>
    <th colspan="3">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta">Gesti&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${gestion}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${periodo}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">
      <c:choose>
        <c:when test="${cliente.id_universidad > 0}">Universidad</c:when>
        <c:when test="${cliente.id_facultad > 0}">Facultad</c:when>
        <c:when test="${cliente.id_programa > 0}">Programa</c:when>
        <c:when test="${cliente.id_departamento > 0}">Departamento</c:when>
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
  <c:if test="${fn:length(acceso.listaDepartamentos) > 0}">
    <tr>
      <td class="etiqueta">Departamento <font color="red">(*)</font></td>
      <td class="etiqueta">::</td>
      <td><select name="id_departamento" id="id_departamento" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
    </tr>
  </c:if>
  <tr>
    <td class="etiqueta">Tabla <font color="red">(*)</font></td>
    <td class="etiqueta">::</td>
    <td>
      <select name="tabla">
       <option value=""> - Elija una opción - </option>
        <c:forEach var="lista" items="${lTablas}">
          <option value="<c:out value="${lista.id_tabla}"/>"> <c:out value="${lista.tabla}"/></option>
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
<c:if test="${cliente.id_departamento > 0}"><input type="hidden" name="id_departamento" value='<c:out value="${cliente.id_departamento}"/>'></c:if>
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
<c:if test="${fn:length(acceso.listaDepartamentos) > 0}">
  padre_hijo[h] = new Array("id_departamento", "''");
  combo[h] = new Array();
  <c:forEach var="departamento" items="${acceso.listaDepartamentos}" varStatus="dep">
    combo[h][<c:out value="${dep.index}"/>] = new Array("<c:out value="${departamento.id_departamento}"/>", "<c:out value="${departamento.departamento}"/>", "");
  </c:forEach>
  h++;
</c:if>
</script>

<script language="JavaScript">
  iniciar();
</script>

</body>
<%@ include file="../Inferior.jsp" %>
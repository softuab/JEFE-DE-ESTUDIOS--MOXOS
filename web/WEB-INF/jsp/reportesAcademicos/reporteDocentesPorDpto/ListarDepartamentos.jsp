<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<div class="titulo">Docentes por Departamento</div>
<!--<div class="volver"><a href='entrada.fautapo'>Volver</a></div>-->

<form name='forma' method="post" action="listarDocentesPorDpto.fautapo" target="_blanck">
<table class="formulario">
  <tr>
    <th colspan="3">INGRESE LOS DATOS</th>
  </tr>

  <c:if test="${fn:length(acceso.listaDepartamentos) > 0}">
  <tr>
    <td colspan="3">
    <table width="100%">
      <tr><td>
          <table align="right">
	   <!-- <tr><td class="etiqueta">Usuario</td><td class="etiqueta">::</td><td><c:out value="${usuario}" /></td></tr>-->
	    <tr><td class="etiqueta">
    		<c:choose>
    		<c:when test="${cliente.id_universidad > 0}">Universidad</c:when>
    		<c:when test="${cliente.id_departamento > 0}">Departamento</c:when>
    		</c:choose>
		</td>
		<td class="etiqueta">::</td><td><c:out value="${acceso.acceso}"/></td>
	    </tr>
    	    <tr><td class="etiqueta">Gesti&oacute;n</td><td class="etiqueta">::</td><td><input type="text" name="gestion" value='<c:out value="${gestion}" />' onblur='validar(gestion,"9")' size="4" maxlength="4"></td></tr>
    	    <tr><td class="etiqueta">Periodo</td><td class="etiqueta">::</td><td><input type="text" name="periodo" value='<c:out value="${periodo}" />' onblur='validar(periodo,"9")' size="1" maxlength="1"> </td></tr>
    	    <tr><td colspan="3" align="center"><input type="hidden" name="nombres"  value="<c:out value='${usuario}'/>"></td></tr>
            <tr><td class="etiqueta">Departamento</td><td class="etiqueta">::</td><td><select name="id_departamento" id="id_departamento"/></td></tr>
    	    <tr><td colspan="3" align="center"><input type="submit" name="boton" value='Siguiente' class="siguiente"></td></tr>
            </tr>
          </table>
       </td></tr>
    </table>
    </td>
  </tr>
  </c:if>
</table>
<c:if test="${cliente.id_departamento > 0}"><input type="hidden" name="id_departamento" value='<c:out value="${cliente.id_departamento}"/>'></c:if>
</form>

<script language="JavaScript">

var combo = new Array();
var padre_hijo = new Array();
h = 0;
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

<%@ include file="../../Inferior.jsp" %>
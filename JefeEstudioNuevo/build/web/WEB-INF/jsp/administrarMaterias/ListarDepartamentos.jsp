<%@ include file="../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<div class="titulo">Admin. Materias</div>
<div class="volver"><a href='entrada.fautapo'>Volver</a></div>

<form name='forma' method="post" action="listarMaterias.fautapo">
<table class="formulario">
  <tr>
    <th colspan="3">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta">
      <c:choose>
        <c:when test="${cliente.id_universidad > 0}">Universidad</c:when>
        <c:when test="${cliente.id_departamento > 0}">Departamento</c:when>
      </c:choose>
    </td>
    <td class="etiqueta">::</td>
    <td><c:out value="${acceso.acceso}"/></td>
  </tr>
  <c:if test="${fn:length(acceso.listaDepartamentos) > 0}">
  <tr>
    <td colspan="3">
    <table width="100%">
      <tr>
        <td>
        <fieldset>
          <legend>Seleccione un departamento</legend>
          <table align="right">
            <tr>
              <td class="etiqueta">Departamento</td>
              <td class="etiqueta">::</td>	
              <td><select name="id_departamento" id="id_departamento"/></td>
    	      <td><input type="submit" name="boton" value='Buscar' class="buscar"></td>
            </tr>
          </table>
        </fieldset>
        </td>
      </tr>
    </table>
    </td>
  </tr>
  </c:if>
  <tr>
    <td colspan="3">
    <table width="100%">
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca una Sigla</legend>
          <form name='forma1' method="post" action="listarMaterias.fautapo">
          <table>
            <tr>
              <td class="etiqueta">Sigla</td>
              <td class="etiqueta">::</td>	
              <td><input type="text" name="sigla"></td>
    	      <td><input type="submit" name="boton" value="Buscar - Sigla" class="buscar"></td>
            </tr>
          </table>
        </fieldset>
        </td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>    
    <td colspan="3">
    <table width="100%">
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca una Materia</legend>
          <table>
            <tr>
              <td class="etiqueta">Materia</td>
              <td class="etiqueta">::</td>	
              <td><input type="text" name="materia"></td>
              <td><input type="submit" name="boton" value="Buscar - Materia" class="buscar"></td>
            </tr>
          </table>
        </fieldset>
        </td>
      </tr>
    </table>
    </td>
  </tr>
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

<%@ include file="../Inferior.jsp" %>
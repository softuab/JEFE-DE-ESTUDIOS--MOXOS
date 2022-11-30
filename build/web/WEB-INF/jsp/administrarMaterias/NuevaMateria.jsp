<%@ include file="../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<div class="titulo">Admin. Materias</div>
<form name="fvolver" method="POST" action='listarMaterias.fautapo' >
  <input type="hidden" name="id_departamento" value="<c:out value="${id_departamento}"/>">
  <input type="hidden" name="sigla"           value="<c:out value="${sigla}"/>">
  <input type="hidden" name="materia"         value="<c:out value="${materia}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>
<br>

<form name="forma" action="registrarMateria.fautapo" method="post">
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
        <td class="etiqueta">Departamento<font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
          <select id='id_departamento' name='id_departamento' size='1'
            onChange="poblar('id_departamento', this.options[this.selectedIndex].value); document.forma.departamento.value = Adepartamentos[document.forma.id_departamento.value];">
          </select>
        </td>
      </tr>
    </c:if>
    <tr>
      <td class="etiqueta">Tipo Materia <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td>
        <select name="id_tipo_materia">
          <option value="0">-- seleccione --
            <c:forEach var="lista" items="${lTiposMaterias}">
              <option value="<c:out value="${lista.id_tipo_materia}"/>">
                <c:out value="${lista.tipo_materia}"/>
              </option>
            </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Materia <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td><input type="text" name="materia">
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Sigla <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td><input type="text" name="sigla">
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Hrs. Te&oacute;ricas <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td><input type="text" name="hrs_teoricas">
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Hrs. Pr&aacute;cticas <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td><input type="text" name="hrs_practicas">
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Hrs. Periodo <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td><input type="text" name="hrs_periodo">
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Cr&eacute;ditos <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td><input type="text" name="creditos">
      </td>
    </tr>
  </table>
  <center>
    <input type="submit" class="aceptar"  value='Aceptar'>
    <input type="button" class="cancelar" value='Cancelar' OnClick='javascript: history.go(-1);'>
  </center>
  <c:if test="${cliente.id_departamento > 0}"><input type="hidden" name="id_departamento" value='<c:out value="${cliente.id_departamento}"/>'></c:if>
  <input type="hidden" name="accion" value='<c:out value="${accion}"/>'>
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
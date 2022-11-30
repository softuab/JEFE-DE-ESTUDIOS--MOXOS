<%@ include file="../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<div class="titulo">Admin. Planes de Estudio</div>
<form name="fvolver" method="POST" action='<c:url value="/listarPlanesDeEstudio.fautapo"/>' >
  <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa" value="<c:out value="${id_programa}"/>">
  <input type="hidden" name="id_prg_plan" value="<c:out value="${id_prg_plan}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<table class="tabla">
  <tr>
    <th>Facultad</th>
    <td class="colb"><c:out value="${datosFacultad.facultad}"/></td>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/></td>
    <th>Plan</th>
    <td class="colb"><c:out value="${id_plan}"/></td>
  </tr>
</table>
<br>

<form name="forma" action="<c:url value="/registrarMateriaPlan.fautapo"/>" method="post">
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Departamento<font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_departamento' name='id_departamento' size='1'
          onChange="poblar('id_departamento', this.options[this.selectedIndex].value); document.forma.departamento.value = Adepartamentos[document.forma.id_departamento.value];">
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Materias <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_materia' name='id_materia' size='1'
          onChange="poblar('id_materia', this.options[this.selectedIndex].value); document.forma.id_materia.value = Amaterias[document.forma.id_materia.value];">
        </select>
      </td>
    </tr>
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
      <td class="etiqueta">Menci&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td>
        <select name="id_mencion">
          <option value="0">-- seleccione --
            <c:forEach var="lista" items="${lMenciones}">
              <option value="<c:out value="${lista.id_mencion}"/>">
                <c:out value="${lista.mencion}"/>
              </option>
            </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Nivel acad&eacute;mico <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td><input type="text" name="nivel_academico">
      </td>
    </tr>
  </table>
  <center>
    <input type="submit" class="aceptar"  value='Aceptar'>
    <input type="button" class="cancelar" value='Cancelar' OnClick='javascript: history.go(-1);'>
  </center>
  <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_prg_plan" value="<c:out value="${id_prg_plan}"/>">
  <input type="hidden" name="accion"      value="Adicionar">
</form>

<script>
  var Adepartamentos = new Array();
  padre_hijo[h] = new Array ("id_departamento", "''", "");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "lista" items = "${lDepartamentos}" varStatus="contador">
    Adepartamentos[<c:out value = "${lista.id_departamento}"/>] = '<c:out value = "${lista.departamento}"/>';
    combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${lista.id_departamento}"/>", "<c:out value = "${lista.departamento}"/>", "");
  </c:forEach>
  h++;
</script>

<script>
  var Amaterias = new Array();
  padre_hijo[h] = new Array ("id_materia", "id_departamento", "");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "cod" items = "${lMaterias}" varStatus = "contador">
    Amaterias[<c:out value = "${cod.id_materia}"/>] = '<c:out value = "${cod.materia}"/>';
    combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${cod.id_materia}"/>", "(<c:out value = "${cod.sigla}"/>) - <c:out value = "${cod.materia}"/>", "<c:out value = "${cod.id_departamento}"/>");
  </c:forEach>
  h++;
</script>

<script language="JavaScript">
  iniciar();
</script>

<%@ include file="../Inferior.jsp" %>
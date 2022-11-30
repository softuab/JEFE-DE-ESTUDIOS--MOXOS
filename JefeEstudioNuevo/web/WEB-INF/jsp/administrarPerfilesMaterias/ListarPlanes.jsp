<%@ include file="../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<div class="titulo">Admin. Perfiles - Materias</div>
<form name="fvolver" method="POST" action="entrada.fautapo">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<form name="forma" action="listarMaterias.fautapo" method="post">
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Perfil<font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_perfil' name='id_perfil' size='1'
          onChange="poblar('id_perfil', this.options[this.selectedIndex].value); document.forma.perfil.value = Aperfiles[document.forma.id_perfil.value];">
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Facultad<font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_facultad' name='id_facultad' size='1'
          onChange="poblar('id_facultad', this.options[this.selectedIndex].value); document.forma.facultad.value = Afacultades[document.forma.id_facultad.value];">
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Programa <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_programa' name='id_programa' size='1'
          onChange="poblar('id_programa', this.options[this.selectedIndex].value); document.forma.id_programa.value = Aprogramas[document.forma.id_programa.value];">
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Plan <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_plan' name='id_plan' size='1'
          onChange="poblar('id_plan', this.options[this.selectedIndex].value); document.forma.id_plan.value = Aplanes[document.forma.id_plan.value];">
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de Evaluaci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_tipo_evaluacion">
         <option value=""> - Elija una opción - </option>    
          <c:forEach var="tipo" items="${lTiposEvaluaciones}">
            <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>" <c:if test="${tipo.id_tipo_evaluacion == id_tipo_evaluacion}">selected</c:if>>
	      <c:out value="${tipo.tipo_evaluacion}"/>
	    </option>
          </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Gesti&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="gestion" value="<c:out value="${cliente.gestion}"/>"></td>
    </tr>
    <tr>
      <td class="etiqueta">Periodo <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="periodo" value="<c:out value="${cliente.periodo}"/>"></td>
    </tr>
  </table>
  <center>
    <input type="submit" class="siguiente" value='Aceptar'>
  </center>
</form>
  
<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<script>
  var Aperfiles = new Array();
  padre_hijo[h] = new Array ("id_perfil", "''", "<c:out value = "${id_perfil}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "lista" items = "${lPerfiles}" varStatus="contador">
    Aperfiles[<c:out value = "${lista.id_perfil}"/>] = '<c:out value = "${lista.perfil}"/>';
    combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${lista.id_perfil}"/>", "<c:out value = "${lista.perfil}"/>", "");
  </c:forEach>
  h++;
</script>

<script>
  var Afacultades = new Array();
  padre_hijo[h] = new Array ("id_facultad", "''", "<c:out value = "${id_facultad}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "lista" items = "${lFacultades}" varStatus="contador">
    Afacultades[<c:out value = "${lista.id_facultad}"/>] = '<c:out value = "${lista.facultad}"/>';
    combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${lista.id_facultad}"/>", "<c:out value = "${lista.facultad}"/>", "");
  </c:forEach>
  h++;
</script>

<script>
  var Aprograma = new Array();
  padre_hijo[h] = new Array ("id_programa", "id_facultad", "<c:out value = "${id_programa}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "cod" items = "${lProgramas}" varStatus = "programac">
    Aprograma[<c:out value = "${cod.id_programa}"/>] = '<c:out value = "${cod.programa}"/>';
    combo[h][<c:out value = "${programac.count}"/>] = new Array("<c:out value = "${cod.id_programa}"/>", "<c:out value = "${cod.programa}"/>", "<c:out value = "${cod.id_facultad}"/>");
  </c:forEach>
  h++;
</script>

<script>
  var Aplanes = new Array();
  padre_hijo[h] = new Array ("id_plan", "id_programa", "<c:out value = "${id_plan}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "cod" items = "${lPlanes}" varStatus = "planc">
    Aplanes[<c:out value = "${cod.id_plan}"/>] = '<c:out value = "${cod.id_plan}"/>';
    combo[h][<c:out value = "${planc.count}"/>] = new Array("<c:out value = "${cod.id_plan}"/>", "<c:out value="${cod.tipo_grado}"/> - <c:out value="${cod.id_plan}"/>", "<c:out value = "${cod.id_programa}"/>");
  </c:forEach>
  h++;
</script>

<script language="JavaScript">
  iniciar();
</script>

<%@ include file="../Inferior.jsp" %>
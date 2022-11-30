<%@ include file="../../Superior.jsp" %>

<div class="titulo">Administrar Docentes EOEEOEO</div>
<form name="fvolver" method="POST" action="entrada.fautapo">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
  <input type="hidden" name="id_municipio"                value="<c:out value="${id_municipio}"/>">
</form>

<br>
<form name="forma">
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta"> Persona <font color = 'red'>(*)</font></td>
      <td class="etiqueta"> ::</td>
      <td>
        <input type="hidden" name="id_persona" value='<c:out value="${docente.id_docente}"/>'>
        <input type="text" name="docente" value='<c:out value="${docente.nombres}"/>' size="50" >
        <input type='button' value="" class="buscar" onClick='fcombo("listarPersonas.fautapo",forma.docente.value, "");' >
      </td>
    <tr>
    <tr>
      <td class="etiqueta"> Apodo <font color = 'red'>(*)</font></td>
      <td class="etiqueta"> ::</td>
      <td>
        <input type="text" name="apodo" size="30">
        <input type="text" name="docente" value='<c:out value="${docente.nombres}"/>' size="50" >
      </td>
    <tr>
    <tr>
      <td class="etiqueta"> Categoria <font color = 'red'>(*)</font></td>
      <td class="etiqueta"> ::</td>
      <td>
        <input type="text" name="categoria" size="30" >
      </td>
    <tr>
    </tr>
      <td colspan="3" align="center"><input type="submit" name="boton" value="Guardar">
      <input type="hidden" name="accion" value='<c:out value="${accion}"/>'>
      </td>
    </tr>
  </table>
</form>
<%@ include file="../../Inferior.jsp" %>
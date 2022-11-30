<%@ include file="../Superior.jsp" %>

<div class="titulo">Administrar Docentes</div>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/administrarDocentes/listarDocentesPersonas.fautapo'/>" method="post">
      <input type="hidden" name="dip" value='<c:out value="${dip}"/>'>
      <input type="hidden" name="nombre" value='<c:out value="${nombre}"/>'>
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </form>
    </td>
    <td>&nbsp;&nbsp;</td>
    <td>
     <form name="fnuevo" action="<c:url value='/administrarDocentes/buscarDatosDocente.fautapo'/>" method="post">
      <div> <a class="agregar" href="javascript:document.fnuevo.submit();"> Nuevo Persona Docente</a>
        <input type="hidden" name="accion" value="NuevoPersonaDocente">
	<input type="hidden" name="dip" value='<c:out value="${dip}"/>'>
        <input type="hidden" name="nombre" value='<c:out value="${nombre}"/>'>
      </div>
     </form>
  </td>
</tr>
</table>
<br>
<form  name="forma" action="<c:url value='/administrarDocentes/registrarDocente.fautapo'/>" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="3">SELECCIONE LA PERSONA</th>
    </tr>
    <tr>
      <td class="etiqueta"> Persona <font color = 'red'>(*)</font></td>
      <td class="etiqueta"> ::</td>
      <td>
        <input type="hidden" name="id_persona" value='<c:out value="${persona.id_persona}"/>'>
        <input type="text" name="persona" value='<c:out value="${persona.nombres}"/>' size="50" >
        <input type='button' value="" class="buscar" onClick='fcombo("listarPersonas.fautapo",forma.persona.value, "");' >
      </td>
    <tr>
    <!--
    <tr>
      <td class="etiqueta"> Apodo <font color = 'red'>(*)</font></td>
      <td class="etiqueta"> ::</td>
      <td>
        <input type="text" name="apodo" size="30">
      </td>
    <tr>
    <tr>
      <td class="etiqueta"> Categoria <font color = 'red'>(*)</font></td>
      <td class="etiqueta"> ::</td>
      <td>
        <input type="text" name="categoria" size="30" >
      </td>
    <tr>
    -->
    </tr>
      <td colspan="3" align="center"><input class="aceptar" type="submit" name="boton" value="Guardar"></td>
      <input type="hidden" name="accion" value='<c:out value="${accion}"/>'>
    </tr>
  </table>
</form>
<%@ include file="../Inferior.jsp" %>
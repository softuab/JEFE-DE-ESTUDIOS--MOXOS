<%@ include file="../Superior.jsp" %>

<div class="titulo">Admin. Planes de Estudio</div>
<form name="fvolver" method="POST" action='<c:url value="/listarPlanesDeEstudio.fautapo"/>' >
  <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_programa" value="<c:out value="${datosPrgPlan.id_programa}"/>">
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
    <td class="colb"><c:out value="${datosPrgPlan.id_plan}"/></td>
  </tr>
</table>
<br>

<form name="forma" method="post">
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Nivel Acad&eacute;mico <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMtrPlan.nivel_academico}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Sigla <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.sigla}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Materia <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.materia}"/></td>
    </tr>
  </table>
  <center>
    <input type="submit" class="aceptar"  value="Admin Requisitos" onClick='javascript: document.forma.action="<c:url value="/listarMateriasRequisitos.fautapo"/>"'>
    <input type="submit" class="aceptar"  value="Admin Convalidaciones" onClick='javascript: document.forma.action="<c:url value="/listarMateriasConvalidaciones.fautapo"/>"'>
    <input type="submit" class="cancelar" value="Cancelar" OnClick='javascript: document.forma.action="<c:url value="/listarPlanesDeEstudio.fautapo"/>"'>
  </center>
  <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_prg_plan" value="<c:out value="${id_prg_plan}"/>">
  <input type="hidden" name="id_mtr_plan" value="<c:out value="${datosMtrPlan.id_mtr_plan}"/>">
  <input type="hidden" name="accion"      value="Modificar">
</form>

<%@ include file="../Inferior.jsp" %>
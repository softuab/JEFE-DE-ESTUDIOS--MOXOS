<%@ include file="../Superior.jsp" %>

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
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Materia </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.materia}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo Materia </td>
      <td class="etiqueta">::</td>	      
      <td><c:out value="${datosTipoMateria.tipo_materia}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Menci&oacute;n </td>
      <td class="etiqueta">::</td>	      
      <td><c:out value="${datosMencion.mencion}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Nivel acad&eacute;mico </td>
      <td class="etiqueta">::</td>	      
      <td><c:out value="${datosMtrPlan.nivel_academico}"/></td>
    </tr>
  </table>
  <center>
    <input type="submit" class="aceptar"  value='Aceptar'>
    <input type="button" class="cancelar" value='Cancelar' OnClick='javascript: history.go(-1);'>
  </center>
  <input type="hidden" name="id_facultad" value="<c:out value="${id_facultad}"/>">
  <input type="hidden" name="id_prg_plan" value="<c:out value="${id_prg_plan}"/>">
  <input type="hidden" name="id_mtr_plan" value="<c:out value="${datosMtrPlan.id_mtr_plan}"/>">
  <input type="hidden" name="accion"      value="Eliminar">
</form>

<%@ include file="../Inferior.jsp" %>
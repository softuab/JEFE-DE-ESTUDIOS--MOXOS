<%@ include file="../Superior.jsp" %>

<div class="titulo">Admin. Materias</div>
<form name="fvolver" method="POST" action='<c:url value="/listarPlanesDeEstudio.fautapo"/>' >
  <input type="hidden" name="id_departamento" value="<c:out value="${id_departamento}"/>">
  <input type="hidden" name="sigla"           value="<c:out value="${sigla}"/>">
  <input type="hidden" name="materia"         value="<c:out value="${materia}"/>">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>
<br>

<form name="forma" action="registrarMateria.fautapo" method="post">
  <table class="formulario">
    <tr>
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Departamento </td>
      <td class="etiqueta">::</td>	      
      <td><c:out value="${datosDepartamento.departamento}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo Materia </td>
      <td class="etiqueta">::</td>	      
      <td><c:out value="${datosTipoMateria.tipo_materia}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Materia </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.materia}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Sigla </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.sigla}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Hrs. Te&oacute;ricas </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.hrs_teoricas}"/></td>
    </tr>
    <tr>
      <td class="etiqueta"Hrs. Pr&aacute;cticas </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.hrs_practicas}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Hrs. Periodo </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.hrs_periodo}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Cr&eacute;ditos </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosMateria.creditos}"/></td>
    </tr>
  </table>
  <center>
    <input type="submit" class="aceptar"  value='Aceptar'>
    <input type="button" class="cancelar" value='Cancelar' OnClick='javascript: history.go(-1);'>
  </center>
  <input type="hidden" name="id_materia" value="<c:out value="${datosMateria.id_materia}"/>">
  <input type="hidden" name="accion" value='<c:out value="${accion}"/>'>
</form>

<%@ include file="../Inferior.jsp" %>
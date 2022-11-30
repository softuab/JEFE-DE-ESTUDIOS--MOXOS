<%@ include file="../../Superior.jsp" %>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<br>

<form name="forma" action="<c:url value="/listarDatosEstudiante1.fautapo"/>" method="POST">
<table class="formulario">
  <tr>
    <td>
    <table width="100%">
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca su Carnert de Identidad</legend>
	    <table align=right>
    	      <tr>
                <td class="etiqueta">DIP</td>
	        <td class="etiqueta">::</td>
                <td><input type=text name="id_estudiante" maxlength=8/></td>
      	        <td><input type=submit name="buscar" value='Buscar' class="buscar"></td>
              </tr>
            </table>
         </fieldset>
         </td>
        </tr>
      <tr>
        <td>
</table>
  <input type="hidden" name="id_proceso" value='<c:out value="${datosProceso.id_proceso}"/>'>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../../Inferior.jsp" %>
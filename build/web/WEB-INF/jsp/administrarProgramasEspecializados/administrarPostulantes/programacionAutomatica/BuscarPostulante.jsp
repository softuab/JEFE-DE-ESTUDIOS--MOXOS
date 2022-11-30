<%@ include file="../../../Superior.jsp" %>

<div class="titulo">Buscar Postulante Programacion Automatica</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<form name=forma method="POST" action='<c:url value="/postulantes/buscarPostulante.fautapo"/>' >
<table class="formulario">
  <tr>
    <td>
    <table width=100%>
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca Registro de Postulante</legend>
	    <table align=right>
    	      <tr>
                <td class="etiqueta">RP</td>
	        <td class="etiqueta">::</td>
                <td><input type=text name="id_postulante" maxlength=8/></td>
      	        <td><input type=submit name="buscar" value='Buscar' class="buscar"></td>
              </tr>
            </table>
         </fieldset>
         </td>
        </tr>
      </table>
    </td>
  </tr>
  <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
  <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
  <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
</table>
</form>

<%@ include file="../../../Inferior.jsp" %>

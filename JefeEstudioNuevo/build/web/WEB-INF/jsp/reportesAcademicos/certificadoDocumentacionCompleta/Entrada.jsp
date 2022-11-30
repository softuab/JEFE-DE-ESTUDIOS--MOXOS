<%@ include file="../../Superior.jsp" %>

<div class="titulo">Documentacion Completa</div>
<br>

<form name=forma method="POST" action='<c:url value="/documentacion/buscarEstudiante.fautapo"/>'>
<table class="formulario">
  <tr>
    <td>
    <table width="100%">
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca Registro Universitario</legend>
	    <table align=right>
    	      <tr>
                <td class="etiqueta">RU</td>
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
        <fieldset>
          <legend>Introduzca C&eacute;dula de Identidad</legend>
          <table align=right>
            <tr>
              <td class="etiqueta">CI</td>
              <td class="etiqueta">::</td>	
              <td><input type=text name="ci" maxlength=35 onblur='validar(this,"A9")'></td>
    	      <td><input type=submit name="buscar" value='Buscar' class="buscar"></td>
            </tr>
          </table>
        </fieldset>
        </td>
      </tr>
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca un Nombre</legend>
          <table align=right>
            <tr>
              <td class="etiqueta">Nombres</td>
              <td class="etiqueta">::</td>	
              <td><input type=text name="nombres" maxlength=35 onblur='validar(this,"A9")'></td>
              <td><input type=submit name="buscar" value='Buscar' class="buscar"></td>
            </tr>
          </table>
        </fieldset>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</form>

<%@ include file="../../Inferior.jsp" %>

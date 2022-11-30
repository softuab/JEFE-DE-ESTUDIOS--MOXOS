<%@ include file="../Superior.jsp"%>
<div class="titulo">Administrar Datos Estudiantes</div>

<br>
<form action="listarEstudiantes.fautapo" method="post">
<table class="formulario">
  <tr>
    <th colspan="2"> BUSCAR ESTUDIANTE
    </th>
  </tr>    
  <tr>
    <td class="etiqueta">Usuario :: </td>
    <td><c:out value="${usuario}"/>
  </tr>      
  <tr>
    <td colspan="2">
    <table width=100%>
      <tr>
        <td>
        <fieldset>
          <legend>Registro Universitario</legend>
	    <table align=right>
    	      <tr>
                <td class="etiqueta">R.U.</td>
	        <td class="etiqueta">::</td>
                <td><input type="text" name="id_estudiante" maxlength="8"/></td>
      	        <td><input type="submit" value='Buscar' class="buscar"></td>
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
                <td class="etiqueta">DIP</td>
	        <td class="etiqueta">::</td>
                <td><input type="text" name="dip" /></td>
      	        <td><input type="submit" value='Buscar' class="buscar"></td>
              </tr>
            </table>
         </fieldset>
         </td>
        </tr>
	<tr>
        <td>
        <fieldset>
          <legend>Introduzca nombres</legend>
	    <table align=right>
    	      <tr>
                <td class="etiqueta">Nombres</td>
	        <td class="etiqueta">::</td>
                <td><input type="text" name="nombre"/></td>
      	        <td><input type="submit" value='Buscar' class="buscar"></td>
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

<%@ include file="../Inferior.jsp" %>
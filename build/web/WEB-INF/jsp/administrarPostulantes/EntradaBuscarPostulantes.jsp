<%@ include file="../Superior.jsp"%>
<div class="titulo">Administrar Datos Pst Personas</div>

<br>
<form action="listarPostulantes.fautapo" method="post">
<table class="formulario">
  <tr>
    <th colspan="2"> BUSCAR POSTULANTE
    </th>
  </tr>    
  <tr>
    <td class="etiqueta">Usuario :: </td>
    <td><c:out value="${cliente.nombres}"/>
  </tr>      
  <tr>
    <td colspan="2">
    <table width=100%>
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca C&eacute;dula de Identidad</legend>
	    <table align=right>
    	      <tr>
                <td class="etiqueta">DIP</td>
	        <td class="etiqueta">::</td>
                <td><input type=text name="dip" maxlength=8/></td>
      	        <td><input type=submit name="botonDip" value='Buscar' class="buscar"></td>
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
                <td><input type=text name="nombre" /></td>
      	        <td><input type=submit name="botonNombre" value='Buscar' class="buscar"></td>
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
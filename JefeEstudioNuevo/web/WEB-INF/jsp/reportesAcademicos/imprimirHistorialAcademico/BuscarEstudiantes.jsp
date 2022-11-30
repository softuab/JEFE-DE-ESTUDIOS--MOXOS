<%@ include file="../../Superior.jsp" %>

<div class="titulo">Imprimir Historial Acad&eacute;mico</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<table class="tabla">
  <tr>
    <th>PROGRAMA</th>
    <td><c:out value='${datosPrograma.programa}'/></td>
  </tr> 
</table>  
<br>
<table class="formulario">
  <tr>
    <td>
    <table width="100%">
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca Registro Universitario</legend>
            <form name="forma1" method="POST" action="listarHistorialAcademico.fautapo" target="_blank">
	    <table align=right>
    	      <tr>
                <td class="etiqueta">RU</td>
	        <td class="etiqueta">::</td>
                <td><input type="text" name="id_estudiante" maxlength="8"/></td>
      	        <td><input type="submit" name="buscar" value='Buscar' class="buscar"></td>
              </tr>
            </table>
            <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
	    </form>
         </fieldset>
         </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
    <table width=100%>
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca C&eacute;dula de Identidad</legend>
          <form name="forma2" method="POST" action="listarHistorialAcademico.fautapo">
            <table align=right>
              <tr>
                <td class="etiqueta">CI</td>
                <td class="etiqueta">::</td>	
                <td><input type="text" name="ci" maxlength="35" onblur='validar(this,"A9")'></td>
       	        <td><input type="submit" name="buscar" value='Buscar' class="buscar"></td>
              </tr>
            </table>
            <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
	  </form>
        </fieldset>
        </td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td>
    <table width=100%>
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca un Nombre</legend>
          <form name="forma3" method="POST" action="listarHistorialAcademico.fautapo">
            <table align=right>
              <tr>
                <td class="etiqueta">Nombres</td>
                <td class="etiqueta">::</td>	
                <td><input type="text" name="nombres" maxlength=35 onblur='validar(this,"A9")'></td>
                <td><input type="submit" name="buscar" value='Buscar' class="buscar"></td>
              </tr>
            </table>
            <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
	  </form>
        </fieldset>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<%@ include file="../../Inferior.jsp" %>
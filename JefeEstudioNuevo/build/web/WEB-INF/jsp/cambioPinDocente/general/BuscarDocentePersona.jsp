<%@ include file="../../Superior.jsp" %>

<div class="titulo">Cambio Clave(PIN) Docente - Autoridad</div>
<br>
<form name="fvolver" action="entrada.fautapo" method="post">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<form name=forma method="POST" action='<c:url value="listarDocentes.fautapo"/>' >
<table class="formulario">
  <tr>
    <th> Buscar Docente </th>
  </tr>    
  <tr>
    <td>
    <table width=100%>
      <tr>
        <td>
        <fieldset>
          <legend>Introduzca los Datos</legend>
	    <table align=right>
    	      <tr>
                <td class="etiqueta">DIP</td>
	        <td class="etiqueta">::</td>
                <td><input type="text"  name="dip" size="20" value="<c:out value="${dip}"/>" /></td>
      	        <td><input type="submit" name="buscar" value='Buscar' class="buscar"></td>
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
                <td><input type="text" name="nombre" size="20" value="<c:out value="${nombre}"/>"/></td>
      	        <td><input type="submit" name="buscar" value='Buscar' class="buscar"></td>
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

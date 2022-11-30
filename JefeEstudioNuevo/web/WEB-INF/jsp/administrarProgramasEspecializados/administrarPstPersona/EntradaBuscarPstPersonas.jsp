<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Administrar Personas </div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<form name="fvolver" action="<c:url value='/registrarTramiteNuevo.fautapo'/>" method="post">
   <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<form action="listarPstPersonas.fautapo" method="post">
<table class="formulario">
  <tr>
    <th> BUSCAR POSTULANTE
    </th>
  </tr>    
  <tr>
    <td>
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
                <td><input type=text name="nombre" maxlength=8/></td>
      	        <td><input type=submit name="botonNombre" value='Buscar' class="buscar"></td>
              </tr>
            </table>
         </fieldset>
         </td>
        </tr>
      </table>
    </td>
    <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
    <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
    <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
  </tr>
</table>
</form>

<%@ include file="../../Inferior.jsp" %>
<%@ include file="../../Superior.jsp" %>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<br>

  <table class="formulario">
    <tr>
      <th> BUSCAR POSTULANTE </th>
    </tr>    
    <tr>
      <td>
      <table width="100%">
        <tr>
          <td>
          <fieldset>
            <legend>Introduzca el Registro de Postulante</legend>
            <form name="forma" action="<c:url value="/buscarPostulanteHabilitado/ListarDatosPostulante.fautapo"/>" method="POST">
  	    <table align="right">
    	      <tr>
                <td class="etiqueta">R.P.</td>
	        <td class="etiqueta">::</td>
                <td><input type="text" name="id_postulante"/></td>
      	        <td><input type="submit" name="botonRP" value='Buscar' class="buscar"></td>
              </tr>
            </table>
            <input type="hidden" name="id_proceso" value="<c:out value='${datosProceso.id_proceso}'/>">
            <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
	    </form>
          </fieldset>
          </td>
        </tr>
        <tr>
          <td>
          <fieldset>
            <legend>Introduzca C&eacute;dula de Identidad</legend>
            <form name="forma1" action="<c:url value="/buscarPostulanteHabilitado/Entrada.fautapo"/>" method="POST">
  	    <table align="right">
    	      <tr>
                <td class="etiqueta">DIP</td>
	        <td class="etiqueta">::</td>
                <td><input type="text" name="dip"/></td>
      	        <td><input type="submit" name="botonDip" value='Buscar' class="buscar"></td>
              </tr>
            </table>
            <input type="hidden" name="id_proceso" value="<c:out value='${datosProceso.id_proceso}'/>">
            <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
            </form>
          </fieldset>
          </td>
        </tr>
	<tr>
          <td>
          <fieldset>
            <legend>Introduzca nombres</legend>
            <form name="forma2" action="<c:url value="/buscarPostulanteHabilitado/Entrada.fautapo"/>" method="POST">
	    <table align="right">
    	      <tr>
                <td class="etiqueta">Nombres</td>
	        <td class="etiqueta">::</td>
                <td><input type="text" name="nombre" /></td>
      	        <td><input type="submit" name="botonNombre" value='Buscar' class="buscar"></td>
              </tr>
            </table>
            <input type="hidden" name="id_proceso" value="<c:out value='${datosProceso.id_proceso}'/>">
            <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
            </form>
          </fieldset>
          </td>
        </tr>
      </table>
      </td>
    </tr>
  </table>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../../Inferior.jsp" %>
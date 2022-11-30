<%@ include file="../../Superior.jsp" %>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<br>
<form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
  <input type="hidden" name="aplicacion" value="/" >
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<br>
<form  name=forma action="<c:url value="/bloquearMatricula/registrarBloquearMatricula.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <td>
        <table class="formulario">
          <tr>
            <th colspan="2"> CONFIRMAR DATOS DEL ESTUDIANTE </th>
          </tr>  
          <tr>
            <td class="etiqueta4">Nombres ::</td>
            <td><c:out value="${datosEst.paterno}"/>  <c:out value="${datosEst.materno}"/>  <c:out value="${datosEst.nombres}"/>
            </td>
          </tr>
          <tr>
            <td class="etiqueta4">DIP ::</td>
            <td><c:out value="${datosEst.dip}"/>
            </td>
          </tr>
          <tr>
            <td class="etiqueta4">Programa ::</td>
            <td><c:out value="${datosEst.programa}"/>
            </td>
          </tr>
          <tr>
            <td class="etiqueta4">Plan ::</td>
            <td><c:out value="${datosEst.id_plan}"/>
            </td>
          </tr>
          <tr>
            <td class="etiqueta4">Tipo Clasificaci&oacute;n ::</td>
            <td><c:out value="${datosClas.tipo_clasificacion}"/>
            </td>
          </tr>
          <tr>
            <td class="etiqueta4">Tipo Estudiante ::</td>
            <td><c:out value="${datosEst.tipo_estudiante}"/>
            </td>
          </tr>
          <tr>
            <td class="etiqueta4">Tipo Grado ::</td>
            <td><c:out value="${datosEst.tipo_grado}"/>
            </td>
          </tr>
	</table>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type='submit' name="boton" value='Bloquear' class="siguiente" >
	<input type="hidden" name="id_estudiante"  value="<c:out value="${id_estudiante}"/>">
	<input type="hidden" name="id_tramite"  value="<c:out value="${id_tramite}"/>">
	<input type="hidden" name="id_proceso"  value="<c:out value="${datosProceso.id_proceso}"/>">
      </td>
    </tr>
  </table>
</form>

<%@ include file="../../Inferior.jsp" %>
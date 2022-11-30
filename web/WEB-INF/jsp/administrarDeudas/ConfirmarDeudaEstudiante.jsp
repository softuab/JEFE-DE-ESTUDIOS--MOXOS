<%@ include file="../Superior.jsp" %>
<div class="titulo">Administrar Deudas</div>
<br>
<form name="fvolver" action="listarDeudasEstudiante.fautapo" method="post">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
   <input type="hidden" name="id_estudiante" value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
   <input type="hidden" name="id_programa"   value="<c:out value="${datosEstudiante.id_programa}"/>" >
</form>
<form name="formulario" method="POST" action="registrarDeudaEstudiante.fautapo">
<table class="formulario">
  <tr>
    <th colspan="2">Introduzca Razones de la Deuda</td>
  </tr>
  <tr>
    <td class="etiqueta">R.U. ::</td>
    <td><c:out value="${datosEstDeuda.id_estudiante}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Nombres ::</td>
    <td><c:out value="${datosEstudiante.nombres}"/>&nbsp;<c:out value="${datosEstudiante.paterno}"/>&nbsp;<c:out value="${datosEstudiante.materno}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Estado ::</td>
    <td><c:out value="${datosEstudiante.estado}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Gesti&oacute;n de Deuda::</td>
    <td><c:out value="${datosEstDeuda.gestion}"/> </td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo de Deuda::</td>
    <td><c:out value="${datosEstDeuda.periodo}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Tipo de Deuda ::</td>
    <td><c:out value="${datosEstDeuda.tipo_deuda}"/>
    </td>
  </tr>
   <tr>
    <td class="etiqueta">Deuda Cancelada? ::</td>
    <td><c:if test="${datosEstDeuda.cancelado == false}">NO</c:if>
        <c:if test="${datosEstDeuda.cancelado == true}">SI</c:if>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Observaci&oacute;n del registro de Deuda ::</td>
    <td><c:out value="${datosEstDeuda.observacion}" escapeXml="false"/>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Observaciones Deuda Cancelada<font color='red'>(*)</font> ::</td>
    <td><textarea name="observacion" cols="20" rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td align="center" colspan="2">
       <input class="desbloquear" type="submit" value="Saldar Deuda">
       <input type="hidden" name="id_est_deuda" value="<c:out value="${datosEstDeuda.id_est_deuda}"/>" >
       <input type="hidden" name="id_estudiante" value="<c:out value="${datosEstDeuda.id_estudiante}"/>" >
       <input type="hidden" name="accion" value="CancelarDeuda" >
    </td>
  </tr>  
</table>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>
<%@ include file="../Inferior.jsp" %>
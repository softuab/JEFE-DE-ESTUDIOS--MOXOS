<%@ include file="../Superior.jsp" %>
<div class="titulo">Administrar Deudas</div>
<br>
<form name="fvolver" action="listarDeudasEstudiante.fautapo" method="post">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
   <input type="hidden" name="id_estudiante" value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
    <input type="hidden" name="id_programa" value="<c:out value="${datosEstudiante.id_programa}"/>" >
</form>
<form name="formulario" method="POST" action="registrarDeudaEstudiante.fautapo">
<table class="formulario">
  <tr>
    <th colspan="2">Introduzca los Datos de la Deuda</td>
  </tr>
  
  <tr>
    <td class="etiqueta">R.U. ::</td>
    <td><c:out value="${datosEstudiante.id_estudiante}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Nombres ::</td>
    <td><c:out value="${datosEstudiante.nombres}"/>&nbsp;<c:out value="${datosEstudiante.paterno}"/>&nbsp;<c:out value="${datosEstudiante.materno}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Programa ::</td>
    <td><c:out value="${datosEstudiante.programa}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Gesti&oacute;n de Deuda::</td>
    <td><input type="text" name="gestion" value="<c:out value="${gestion}"/>" size="4" maxlength="4"  onblur="validar(this,'9')"> </td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo de Deuda::</td>
    <td><input type="text" name="periodo" value="<c:out value="${periodo}"/>" size="2" maxlength="2"  onblur="validar(this,'9')"></td>
  </tr>
  <tr>
    <td class="etiqueta">Tipo de Deuda<font color='red'>(*)</font> ::</td>
    <td>
      <select name="id_tipo_deuda">
          <c:forEach var="lista" items="${lTiposDeudas}">
            <option value='<c:out value="${lista.id_tipo_deuda}"/>' >
              <c:out value="${lista.tipo_deuda}"/>
          </c:forEach>
        </select>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Observaciones ::</td>
    <td><textarea name="observacion" cols="20" rows="3"></textarea>
    </td>
  </tr>
  <tr>
    <td align="center" colspan="2">
       <input class="aceptar" type="submit" value="Aceptar">
       <input type="hidden" name="id_estudiante" value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
       <input type="hidden" name="accion" value="Nuevo">
    </td>
  </tr>  
</table>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>
<%@ include file="../Inferior.jsp" %>
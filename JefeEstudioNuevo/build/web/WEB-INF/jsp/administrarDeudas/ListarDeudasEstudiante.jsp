<%@ include file="../Superior.jsp" %>
<div class="titulo">Administrar Deudas</div>
<br>
<form name="fvolver" action="buscarEstudiantes.fautapo" method="post">
  <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
   <input type="hidden" name="id_estudiante" value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
    <input type="hidden" name="id_programa" value="<c:out value="${datosEstudiante.id_programa}"/>" >
</form>
<table class="formulario">
  <tr>
    <th colspan="2">Datos del Estudiante</td>
  </tr>
  <tr>
    <td class="etiqueta">R.U. ::</td>
    <td><c:out value="${datosEstudiante.id_estudiante}"/>
    
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Estudiante ::</td>
    <td><c:out value="${datosEstudiante.nombres}"/>&nbsp;<c:out value="${datosEstudiante.paterno}"/>&nbsp;<c:out value="${datosEstudiante.materno}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Programa ::</td>
    <td><c:out value="${datosEstudiante.programa}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Estado del Estudiante::</td>
    <td><c:out value="${datosEstudiante.estado}"/>
    </td>
  </tr>
</table>
<br>
<table class="tabla">
  <tr>
    <td colspan="8">
      <form name="fCancelar<c:out value='${contador.count}'/>" method="POST" action="nuevaDeudaEstudiante.fautapo">
	  <a class="agregar" href="javascript:document.fCancelar<c:out value='${contador.count}'/>.submit();">Nuevo</a>
	  <input type="hidden" name="id_estudiante"      value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
	  <input type="hidden" name="accion" value="Nuevo">
      </form> 
    </td>
  </tr>    
  <tr>
    <th>Nro.</th>
    <th>TIPO DE DEUDA</th>
    <th>GESTION</th>
    <th>PERIODO</th>
    <th>OBSERVACIONES</th> 
    <th>DEUDA CANCELADA</th>
    <th>CANCELAR DEUDA</th>
  </tr>    
  <c:forEach var="datos" items="${lListarDeudasEstudiantes}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
      <td><c:out value="${contador.count}"/></td>
      <td><c:out value="${datos.tipo_deuda}"/></td>
      <td><c:out value="${datos.gestion}"/></td>
      <td><c:out value="${datos.periodo}"/></td>
      <td><c:out value="${datos.observacion}" escapeXml="false"/></td>
      <td>
        <c:if test="${datos.cancelado==true}">SI</c:if>
        <c:if test="${datos.cancelado==false}">NO</c:if>
      </td>
      <td>	
	<c:if test="${datos.cancelado==false}">
	 <form name="fCancelar<c:out value='${contador.count}'/>" method="POST" action="nuevaDeudaEstudiante.fautapo">
	  <a class="anular" href="javascript:document.fCancelar<c:out value='${contador.count}'/>.submit();"> Cancelar Deuda</a>
	  <input type="hidden" name="id_estudiante"      value="<c:out value="${datos.id_estudiante}"/>" >
	  <input type="hidden" name="id_est_deuda"       value="<c:out value="${datos.id_est_deuda}"/>" >
	  <input type="hidden" name="accion" value="CancelarDeuda">
	 </form> 
	</c:if>
      </td>
     </tr>
  </c:forEach>
  </tr>
</table>

<%@ include file="../Inferior.jsp" %>
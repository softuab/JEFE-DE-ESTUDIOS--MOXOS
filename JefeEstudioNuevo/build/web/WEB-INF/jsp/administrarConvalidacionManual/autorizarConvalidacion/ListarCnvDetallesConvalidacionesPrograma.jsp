<%@ include file="../../Superior.jsp" %>

<div class="titulo">Autorizar Convalidaci&oacute;n Manual </div>
<br>
<table>
  <tr>    
    <td>
      <form name="fvolver" action="<c:url value='listarConvalidacionesPrograma.fautapo'/>" method="post">
	<input type="hidden" name="id_programa" value="<c:out value='${datosPrograma.id_programa}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
  </tr>
</table>
<table class="tabla">
  <tr>
    <th class=colh>USUARIO AUTORIZADO</th>
    <th class=colh>PROGRAMA</th>
  </tr>  
  <tr>
    <td class=colb><c:out value="${usuario}"/></td>
    <td class=colb><c:out value="${datosPrograma.programa}"/></td>
  <tr>  
</table>
<br>
<table class="tabla">
  <tr>
    <th colspan="2" align="center">
      MATERIAS CARGADAS A CONVALIDAR
    </th>
  </tr>    
  <tr>
    <td align="center">
      <table class="tabla" width="60%">
        <tr>
            <th colspan="2">DATOS DE CONVALIDACION</th>
	</tr>    
        <tr>
            <td class="etiqueta">R.U. ::</th>
	    <td><c:out value="${datosConvalidacion.id_estudiante}"/></td>
        </tr>
	<tr>
            <td class="etiqueta">Estudiante. ::</th>
	    <td><c:out value="${datosConvalidacion.paterno}"/>&nbsp;<c:out value="${datosConvalidacion.materno}"/>&nbsp;<c:out value="${datosConvalidacion.nombres}"/></td>
        </tr>
	<tr>
            <td class="etiqueta">Tipo de Convalidaci&oacute;n ::</th>
	    <td><c:out value="${datosConvalidacion.tipo_convalidacion}"/></td>
        </tr>
	<c:if test="${datosConvalidacion.id_tipo_convalidacion ==1}" >
	<tr>
          <td class="etiqueta">Universidad <font color='red'>(*)</font>::</th>
	  <td><c:out value="${datosConvalidacion.universidad}"/>
	  </td>
        </tr>
	</c:if>
	<c:if test="${datosConvalidacion.id_tipo_convalidacion ==2}" >
	<tr>
          <td class="etiqueta">Programa <font color='red'>(*)</font>::</th>
	  <td><c:out value="${datosConvalidacion.programa}"/>
	  </td>
        </tr>
	</c:if>
	<c:if test="${datosConvalidacion.id_tipo_convalidacion ==3}" >
	<tr>
          <td class="etiqueta">Plan <font color='red'>(*)</font>::</th>
	  <td><c:out value="${datosConvalidacion.id_plan}"/>
	  </td>
        </tr>
	</c:if>
	<tr>
	  <td class="etiqueta">Gesti&oacute;n Acad&eacute;mica ::</td>
	  <td><c:out value="${datosConvalidacion.periodo}"/>/<c:out value="${datosConvalidacion.gestion}"/> 
	    <input type="hidden" name="periodo" value="<c:out value="${datosConvalidacion.periodo}"/>">
	    <input type="hidden" name="gestion" value="<c:out value="${datosConvalidacion.gestion}"/>">
	  </td>
	</tr>
	<tr>
	  <td class="etiqueta">Resoluci&oacute;n ::</td>
	  <td><c:out value="${datosConvalidacion.nro_resolucion}"/>
	    <input type="hidden" name="resolucion" value="<c:out value="${datosConvalidacion.nro_resolucion}"/>">
	  </td>
	</tr>
      </table>
    </td>
  </tr>
  <c:if test="${!empty lCnvDetallesConvalidacionPrograma}">
  <tr>    
    <td>  
      <table class="tabla" width="100%">
        <tr>
	    <th>NRO.</th>
            <th>SIGLA <br> ORIGEN</th>
	    <th>MATERIA <br> ORIGEN</th>
            <th colspan="2">SIGLA - MATERIA<br>A CONVALIDAR</th>
            <th>MODALIDAD<br></th>
	    <th>% SIMILITUD</th>
	    <th>NOTA</th>
	    <th>ELIMINAR MATERIA <br> A CONVALIDAR</th>
        </tr>
        <c:forEach var="lista" items="${lCnvDetallesConvalidacionPrograma}" varStatus="contador">
        <tr>
	  <td><c:out value="${contador.count}"/></td>
          <td><c:out value="${lista.sigla_origen}"/><input type="hidden" name="sigla_origen<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.sigla_origen}"/>">
	  </td>
          <td><c:out value="${lista.materia_origen}"/>
	      <input type="hidden" name="materia_origen<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.materia_origen}"/>"></td>
          <td><c:out value="${lista.sigla}"/></td>
          <td><c:out value="${lista.materia}"/>
	    <input type="hidden" name="id_materia_conv" value="<c:out value="${lista.id_materia}"/>">
	  </td>
	  <td><c:out value='${lista.tipo_materia}'/>
	    <input type="hidden" name="id_tipo_materia<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.id_tipo_materia}'/>">
	  </td>
          <td><c:out value='${lista.similitud}'/>
	    <input type="hidden" name="similitud<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.similitud}'/>">
	  </td>
	  
          <td><c:out value='${lista.nota_origen}'/>
	    <input type="hidden" name="nota_origen<c:out value="${lista.id_materia}"/>" value="<c:out value='${lista.nota_origen}'/>">
	  </td>
	  <td>
            <c:if test="${lista.ult_usuario == id_usuario}">
            <form name="fDetalle<c:out value="${contador.count}"/>" methos="post" action="<c:url value="/autorizarConvalidacionManual/eliminarCnvDetalleConvalidacion.fautapo"/>">
              <input type="hidden" name="id_programa"      value="<c:out value="${datosPrograma.id_programa}"/>">
	      <input type="hidden" name="id_cnv_detalle"   value="<c:out value="${lista.id_cnv_detalle}"/>">
	      <input type="hidden" name="id_convalidacion"  value="<c:out value="${datosConvalidacion.id_convalidacion}"/>" >
	      <input type="hidden" name="accion" value="Eliminar"/>
	      <div> <a class="eliminar" href="javascript:document.fDetalle<c:out value="${contador.count}"/>.submit();"> Eliminar</a> </div>
            </form>
            </c:if>
	    <c:if test="${lista.ult_usuario != id_usuario}">
	      No autorizado para Eliminar
	    </c:if>
          </td>
        </tr>  
        </c:forEach>
      </table>
      </td>
    </tr>
    <tr>
      <td align="center" colspan="2">
      <form name="fConvalidar" methos="post" action="<c:url value="/autorizarConvalidacionManual/registrarNotasConvalidacionManual.fautapo"/>">
	<input type="submit" value="Convalidar" class="agregar" >
	<input type="hidden" name="id_convalidacion"  value="<c:out value="${datosConvalidacion.id_convalidacion}"/>" >
	<input type="hidden" name="id_programa"       value="<c:out value="${datosPrograma.id_programa}"/>" >
	<input type="hidden" name="accion"            value="Convalidar"/>
      </form>	  
      </td>
    </tr>
    </c:if>
    <c:if test="${empty lCnvDetallesConvalidacionPrograma}">
    <tr>
      <td><div class="nota"><font color="red" size=""1>*</font>&nbsp;No existen Detalles de Materias para esta Convalidaci&oacute;n. </div></td>
    </tr>    
    </c:if>
  </table>       
</form>
<%@ include file="../../Inferior.jsp" %>
<%@ include file="../Superior.jsp"%>

<div class="titulo">Administrar  Lbr Tipos Notas</div>
<br>
<form name=formavolver method=post action='<c:url value="/administrarTiposNotas/listarLbrTiposNotas.fautapo"/>'>
      <div><a class="volver" href="javascript:document.formavolver.submit();"> Volver</a></div>
      <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>" >
      <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
      <input type="hidden" name="id_facultad"        value="<c:out value="${datosFacultad.id_facultad}"/>">
      <input type="hidden" name="id_departamento"    value="<c:out value="${datosDepartamento.id_departamento}"/>">
      <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>">
      <input type="hidden" name="id_lbr_fase"        value="<c:out value="${datosLbrFase.id_lbr_fase}"/>">
</form>
<form name="forma" action="<c:url value="/administrarTiposNotas/registrarLbrTipoNota.fautapo"/>" method="post">	
<table class="formulario">
  <tr>
    <th colspan="3"><c:out value="${accion}"/> Lbr Tipo Nota</th>
  </tr>
  <tr>
    <td class="etiqueta">Fcl Departamento</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${datosDepartamento.departamento}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Tipo Evaluaci&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${datosTipoEval.tipo_evaluacion}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Fase</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${datosLbrFase.fase}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Gesti&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${gestion}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${periodo}"/></td>
  </tr>
  <tr>
    <td class="etiqueta" align=right>Tipo de Nota <font color="red">*</font></td>
    <td class="etiqueta">::</td>
    <td>
      <c:if test='${accion == "Eliminar"}'> 
        <c:out value="${datosLbrTipoNota.tipo_nota}"/>
        <input type="hidden" name="id_tipo_nota" value="<c:out value="${datosLbrTipoNota.id_tipo_nota}"/>">
      </c:if>
      <c:if test='${accion != "Eliminar"}'>
      <select name="id_tipo_nota" onchange="javascript:document.fevaluacion.submit();">	    
        <option value="">-- Seleccione --
        <c:forEach var="lista" items="${lTiposNotas}" varStatus="contador">
          <option value="<c:out value="${lista.id_tipo_nota}"/>" <c:if test="${lista.id_tipo_nota == datosLbrTipoNota.id_tipo_nota}"> Selected </c:if>>
	  <c:out value="${lista.tipo_nota}"/>
        </c:forEach>
      </select>
      </c:if>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center">
      <input  class="siguiente" type="button" value="Aceptar" onClick="fguardar()">
    </td>
  </tr>
  </table>
  <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>" >
  <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
  <input type="hidden" name="id_facultad"        value="<c:out value="${datosFacultad.id_facultad}"/>">
  <input type="hidden" name="id_departamento"    value="<c:out value="${datosDepartamento.id_departamento}"/>">
  <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>">
  <input type="hidden" name="id_lbr_fase"        value="<c:out value="${datosLbrFase.id_lbr_fase}"/>">
  <input type="hidden" name="accion"             value="<c:out value="${accion}"/>">
  <input type="hidden" name="id_lbr_tipo_nota"   value="<c:out value="${datosLbrTipoNota.id_lbr_tipo_nota}"/>">
</form>        
<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>
<script language="JavaScript">
function fguardar()
  {
    if((document.forma.id_tipo_nota.value!=""))
    {
      document.forma.submit();
    }  
    else
    {
      alert("Los campos con (*), son obligatorios");
    }
  }
</script>  
<%@ include file="../Inferior.jsp" %>

    
<%@ include file="../../Superior.jsp" %>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<form name="forma" action="<c:url value="/listarInformesProcesoPersona.fautapo"/>" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="3" align="center">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Nombre Completo</td>
      <td class="etiqueta">::</td>
      <td>
        <c:out value="${datosPersona.nombres}"/> &nbsp; 
        <c:out value="${datosPersona.paterno}"/> &nbsp;
        <c:out value="${datosPersona.materno}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">C.I.</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPersona.dip}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Cargo</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPersona.cargo}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Ubicacion Organica</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPersona.ubicacion_organica}"/>
    </tr>
    <c:if test="${id_tramite != null}">
    <tr>
      <td class="etiqueta" align="right">Requisitos</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${requisitos}"/>
    </tr>
    </c:if>
    <c:if test="${tieneDescuento == 1}">
    <tr>
      <td class="etiqueta" align="right">Descuento (%)</td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="descuento" value='<c:out value="${descuento}"/>'>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de Descuento <font color="red" >(*)</font> </td> 
      <td class="etiqueta">::</td>
      <td>
          <select name="id_tipo_descuento">
            <option value="">-- Elija una opci&oacute;n --</option>
            <c:forEach var="listaD" items="${lTiposDescuentos}" >
              <option value='<c:out value="${listaD.id_tipo_descuento}"/>' >
                <c:out value="${listaD.tipo_descuento}"/>
              </option>
            </c:forEach>
          </select>
       </td>
     </tr>
    </c:if>
  </table>
  <br>

<c:if test="${(id_tramite == null || id_tramite=='') && (!empty lTuplas)}">
  <table class="tabla">
    <tr>
      <th>?</th>
      <th>Requisito</th>
    </tr>
    <c:forEach var="lista" items="${lTuplas}">
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
        <td class="etiqueta2"><input type="checkbox" name="id_tupla" value="<c:out value="${lista.id_tupla}"/>" ></td>
        <td class="etiqueta2"><c:out value="${lista.tupla}"/></td>
      </tr>
    </c:forEach>
  </table>
</c:if>

  <center>
    <input class="aceptar" type="submit" value="Aceptar">
  </center>

  <input type="hidden" name="id_proceso"    value='<c:out value="${datosProceso.id_proceso}"/>'>
  <input type="hidden" name="id_persona"    value='<c:out value="${datosPersona.id_persona}"/>'>
  <input type="hidden" name="id_item"    value='<c:out value="${datosPersona.id_item}"/>'> 
</form>

<%@ include file="../../Inferior.jsp" %>
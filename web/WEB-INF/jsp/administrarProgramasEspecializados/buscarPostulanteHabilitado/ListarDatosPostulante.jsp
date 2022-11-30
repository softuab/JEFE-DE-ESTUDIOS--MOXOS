<%@ include file="../../Superior.jsp" %>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<form name="forma" action="<c:url value="/buscarPostulanteHabilitado/ListarInformesProcesoPostulante.fautapo"/>" method="POST">
  <table class="tabla">
    <tr>
      <th colspan="3" align="center">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta" align="right">R. P.</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${id_postulante}"/></td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Postulante</td>
      <td class="etiqueta">::</td>
      <td>
        <c:out value="${datosPostulante.nombres}"/> &nbsp; 
        <c:out value="${datosPostulante.paterno}"/> &nbsp;
        <c:out value="${datosPostulante.materno}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Facultad</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPostulante.facultad}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Programa</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPostulante.programa}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Plan</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPostulante.id_plan}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Pa&iacute;s</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPostulante.pais}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Direcci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosPostulante.direccion}"/>
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
  <input type="hidden" name="id_postulante" value='<c:out value="${id_postulante}"/>'>
</form>

<%@ include file="../../Inferior.jsp" %>
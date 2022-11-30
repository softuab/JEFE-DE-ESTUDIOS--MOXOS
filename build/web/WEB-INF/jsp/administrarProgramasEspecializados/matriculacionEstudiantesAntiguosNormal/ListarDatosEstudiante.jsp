<%@ include file="../../Superior.jsp" %>

<div class="titulo"><c:out value="${datosProceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<form name="forma" action="<c:url value="/antiguos/listarEstConceptos.fautapo"/>" method="POST">
  <table class="tabla">
    <tr>
      <th colspan="3" align="center">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta" align="right">RU</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${id_estudiante}"/></td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Estudiante</td>
      <td class="etiqueta">::</td>
      <td>
        <c:out value="${datosEstudiante.nombres}"/> &nbsp; 
        <c:out value="${datosEstudiante.paterno}"/> &nbsp;
        <c:out value="${datosEstudiante.materno}"/>
      </td>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Programa</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.programa}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Plan</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.id_plan}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Nacionalidad</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.nacionalidad}"/>
    </tr>
    <tr>
      <td class="etiqueta" align="right">Direcci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosEstudiante.direccion}"/>
    </tr>
	<tr>
      <th colspan="3" align="center">PERIODO Y GESTION ACADEMICA DE INSCRIPCIÓN</th>
    </tr>
	<tr>
      <td class="etiqueta" align="right">Gestión</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${gestion}"/>
    </tr>
	<tr>
      <td class="etiqueta" align="right">Periodo</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${periodo}"/>
    </tr>
	<tr>
      <th colspan="3" align="center">TIPO DE DESCUENTO</th>
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
            <option value="0">Ninguno</option>
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
  <input type="hidden" name="id_estudiante" value='<c:out value="${id_estudiante}"/>'>
</form>

<%@ include file="../../Inferior.jsp" %>
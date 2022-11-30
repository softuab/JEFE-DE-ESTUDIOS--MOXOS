<%@ include file="../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Dominios</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Dominios</div>
</c:if>
<c:if test="${accion == 'Eliminar'}">
  <div class="titulo"> Eliminando Dominios</div>
</c:if>

<div><a class="volver" href='listarDominios.fautapo'>Volver</a></div>
<br>

<form method="POST" action='<c:url value="/registrarDominio.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">CONFIRME LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Area</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosUbicacionOrganica.ubicacion_organica}"/></td>
    </tr>    
    <tr>
      <td class="etiqueta">Padre</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosDominioPadre.dominio}"/> </td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de dominio</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosTipoDominio.tipo_dominio}"/> </td>
    </tr>
    <c:if test="${id_tipo_dominio == 2}">
      <tr>
        <td class="etiqueta">Formulario</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${datosFormulario.form}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta">Campo</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${datosCampo.campo}"/> </td>
      </tr>
    </c:if>
    <c:if test="${id_tipo_dominio == 3}">
      <tr>
        <td class="etiqueta">Tabla</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${datosDominio.tabla}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta">Primario</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${datosDominio.primario}"/> </td>
      </tr>
      <tr>
        <td class="etiqueta">Campos</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${datosDominio.campo}"/> </td>
      </tr>
    </c:if>
    <tr>
      <td class="etiqueta">Dominio</td>
      <td class="etiqueta">::</td>
      <td> <c:out value="${datosDominio.dominio}"/> </td>
    </tr>
    <tr>
      <td class="etiqueta">Privado</td>
      <td class="etiqueta">::</td>
      <td> <c:if test="${datosDominio.privado == 'true'}"> Si </c:if>
           <c:if test="${datosDominio.privado == 'false' || empty datosDominio.privado}"> No </c:if>
    </tr>
  </table>
  <center> 
    <input type="submit" class="aceptar" name='accion1' value='Aceptar'>
  </center>
  <input type="hidden" name='id_dominio'       value='<c:out value="${id_dominio}"/>'>
  <input type="hidden" name='dominio'          value='<c:out value="${datosDominio.dominio}"/>'>
  <input type="hidden" name='privado'          value='<c:out value="${datosDominio.privado}"/>'>
  <input type="hidden" name='id_ubicacion_organica' value='<c:out value="${datosUbicacionOrganica.id_ubicacion_organica}"/>'>
  <input type="hidden" name='id_dominio_padre' value='<c:out value="${datosDominioPadre.id_dominio}"/>'>
  <input type="hidden" name='id_tipo_dominio'  value='<c:out value="${id_tipo_dominio}"/>'>
  <input type="hidden" name='id_form'          value='<c:out value="${id_form}"/>'>
  <input type="hidden" name='id_campo'         value='<c:out value="${id_campo}"/>'>
  <input type="hidden" name='accion'           value='<c:out value="${accion}"/>'>
  <input type="hidden" name='tabla'            value='<c:out value="${datosDominio.tabla}"/>'>
  <input type="hidden" name='primario'         value='<c:out value="${datosDominio.primario}"/>'>
  <input type="hidden" name='campo'            value='<c:out value="${datosDominio.campo}"/>'>
</form>

<%@ include file="../Inferior.jsp"%>
<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Administrar Estudiante Nuevo</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>
<br>
<form name="fvolver" action="<c:url value='/registrarTramiteNuevo.fautapo'/>" method="post">
   <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<form action="<c:url value='/estudianteNuevoPost/listarPostulantes.fautapo'/>" method="post">
<table class="formulario">
  <tr>
    <th colspan="3"> BUSCAR ESTUDIANTE -POSTULANTE
    </th>
  </tr>
  <tr>
    <td class="etiqueta"> Gesti&oacute;n de Matriculaci&oacute;n <font color="red">*</font> ::</th>
    <td colspan="2">
      <input type="text" name="gestion"  size="4"  maxlength="4" value="<c:out value="${gestion}"/>" onblur='validar(this,"9");'/>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo de Matriculaci&oacute;n  <font color="red">*</font> ::</td>
    <td colspan="2">
      <input type="text" name="periodo" size="2"  maxlength="2" value="<c:out value="${periodo}"/>" onblur='validar(this,"9");' />
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Tipo Admisi&oacute;n <font color="red" >(*)</font>::</td> 
    <td colspan="2">
      <select name="id_tipo_admision_entrada">
            <option value="">-- Elija una opci&oacute;n --</option>
            <c:forEach var="listaA" items="${lTiposAdmisiones}" >
            <option value='<c:out value="${listaA.id_tipo_admision}"/>'<c:if test="${listaA.id_tipo_admision == id_tipo_admision_entrada}">selected</c:if> >
              <c:out value="${listaA.tipo_admision}"/>
            </option>
          </c:forEach>
      </select>
    </td>
  </tr>
  <tr>
    <td colspan="3">
    <fieldset>
      <legend>Introduzca C&eacute;dula de Identidad</legend>
    <table align="center">
      <tr>
        <td class="etiqueta">DIP</td>
        <td class="etiqueta">::</td>
        <td><input type=text name="dip" maxlength="8" value="${dip}"></td>
        <td><input type=submit name="botonDip" value='Buscar' class="buscar"></td>
      </tr>
    </table>
    </fieldset>
    </td>
  </tr>
  <tr>
    <td colspan="3">
    <fieldset>
      <legend>Introduzca nombres</legend>
      <table align="center">
      <tr>
        <td class="etiqueta">Nombres</td>
        <td class="etiqueta">::</td>
        <td><input type=text name="nombre" value="${nombre}"></td>
        <td><input type=submit name="botonNombre" value='Buscar' class="buscar"></td>
      </tr>
      </table>
     </fieldset>
    </td>
  </tr>
    <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
    <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
    <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
</table>
</form>

<script>
 function fguardar()
  {
    if((document.forma.id_tipo_admision.value!="") && (document.forma.gestion.value!="") && (document.forma.periodo.value!="") && 
        ((document.forma.nombre.value!="") || (document.forma.dip.value !="")) )
      
    {
      document.forma.submit();
    }
    else
    {
      alert("Los campos con (*), son obligatorios");
    }
  }
  iniciar();
</script>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>
<%@ include file="../../Inferior.jsp" %>
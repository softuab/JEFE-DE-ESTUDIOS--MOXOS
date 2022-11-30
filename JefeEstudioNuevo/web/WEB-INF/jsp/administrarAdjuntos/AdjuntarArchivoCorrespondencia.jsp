<%@ include file="../Superior.jsp" %>

<div class="titulo">Adjuntando Archivos</div>
<div><a class="volver" href="javascript:history.back();">Volver</a></div></td>
<br>

<form name="forma" method="POST" enctype='multipart/form-data'>
  <table class="formulario">
    <tr>
      <th>Direcci&oacute;n</th>
      <th>::</th>
      <td><input type=file name="fichero"></td>
    </tr>
    <tr>
      <th>Direcci&oacute;n</th>
      <th>::</th>
      <td><input type=file name="fichero"></td>
    </tr>
    <tr>
      <th>Direcci&oacute;n</th>
      <th>::</th>
      <td><input type=file name="fichero"></td>
    </tr>
    <tr>
  </table>
  <center>
    <input type="submit" class="adjuntar" value="Adjuntar" onclick="document.forma.action='<c:url value="/registrarCorrespondencia.fautapo">
      <c:param name="id_tramite"          value="${id_tramite}"/>
      <c:param name="id_actividad_actual" value="${id_actividad}"/>
      <c:param name="id_proceso"          value="${id_proceso}"/>	      
      <c:param name="id_tipo_proceso"     value="${id_tipo_proceso}"/>	            
      <c:param name="id_form"             value="${id_form}"/>
      <c:param name="recargado"           value="si"/> 
      <c:param name="auxiliar"            value="2"/> 
      <c:param name="accion"              value="Formulario"/> 
      <c:param name="proveido_0"          value="${proveido}"/> 
      <c:param name="id_usuario_a"        value="${id_usuario_a}"/> 
      <c:param name="codigos"             value="${codigos}"/> 
      <c:param name="aplicacion"          value="${aplicacion}"/>
      <c:forEach var="lista1" items="${lFormulario}" varStatus="contador">
        <c:param name="nu_registros" value="${contador.count}"/>
        <c:param name="id_campo_${contador.count}_0"   value="${lista1.id_campo}"/>
        <c:param name="id_tipo_permiso_${contador.count}_0" value="${lista1.id_tipo_permiso}"/>
        <c:param name="id_dominio_${contador.count}_0" value="${lista1.id_dominio}"/>
        <c:if test="${lista1.id_tipo_permiso=='R' || lista1.id_tipo_permiso=='W' || lista1.id_tipo_permiso=='C' || lista1.id_tipo_permiso=='K'}">
	  <c:if test="${lista1.id_tipo_permiso=='W'}">
	    <c:param name="valor_${contador.count}_0" value="${lista1.valor}"/>
          </c:if>
          <c:if test="${lista1.id_tipo_permiso=='C'}">
	   <c:forEach var="lista" items="${lista1.tuplas}">
	      <c:if test="${lista.id_tupla == lista1.seleccionado}">
                <c:param name="combo_${lista1.id_dominio}_0" value="${lista.id_tupla}"/>
              </c:if>
           </c:forEach>
          </c:if>
          <c:if test="${lista1.id_tipo_permiso=='K'}">
            <c:forEach var="lista" items="${lista1.tuplas}" varStatus="cont1">
              <c:if test="${lista.id_tupla == lista.seleccionado}">
	        <c:param name="check${contador.count}_0" value="${lista.id_tupla}"/>
	      </c:if>  
            </c:forEach>
          </c:if>
          <c:if test="${lista1.id_tipo_permiso=='R'}">
            <c:param  name="valor_${contador.count}_0" value="${lista1.valor}"/>
          </c:if>
        </c:if>          
        <c:if test="${lista1.id_tipo_permiso!='R' && lista1.id_tipo_permiso!='W' && lista1.id_tipo_permiso!='C' && lista1.id_tipo_permiso!='K'}">
  	  <c:param  name="valor_${contador.count}_0" value="${lista1.valor}"/>
        </c:if>	
       </c:forEach>
     </c:url>'">
   </center>
</form>

<%@ include file="../Inferior.jsp" %>
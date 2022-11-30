<%@ include file="../Superior.jsp"%>

<div class="titulo">Administraci&oacute;n de informes</div>
<br>

<form name="forma" method="POST" action="<c:url value="/listarInformes.fautapo"/>">
  <table class="formulario">
    <tr>
      <th>Tipo de proceso</th>
      <th>::</th>
      <td>
        <select name="id_proceso" OnChange="javascript: document.forma.submit()">
	  <option value="0">-- Seleccionar --</option>
          <c:forEach var="lista" items="${lProcesos}" >
	    <option value="<c:out value="${lista.id_proceso}"/>"<c:if test="${lista.id_proceso == id_proceso}">selected</c:if>>
	      <c:out value="${lista.proceso}"/>
            </option>
	  </c:forEach>
	</select>  
      </td>
    </tr>  
  </table>

  <c:if test="${id_proceso != null && id_proceso != 0}">
    <div class="agregar">
      <a href="<c:url value="/registrarInforme.fautapo">
        <c:param name="id_proceso" value="${id_proceso}"/>
        <c:param name="accion" value="Adicionar"/>
      </c:url>">Nuevo</a>
    </div>
  </c:if>
</form>

<c:if test="${id_proceso != null && id_proceso != 0}">
  <table class="tabla">
    <tr>
      <th>INFORMES</th>
      <th>MODIFICAR</th>
      <th>ELIMINAR</th>
    </tr>
    <c:set var="id_actividad_ant" value="-1"/>
    <c:forEach var="lista" items="${lInformes}" varStatus="contador">
      <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ -->
      <c:if test="${lista.id_actividad != id_actividad_ant}">
          <td colspan="3"><b><c:out value="${lista.actividad}"/></b></td>
        </tr>
      </c:if>
      <tr>
        <form name=formaver<c:out value="${contador.count}"/> method="post" action='<c:url value="/registrarInforme.fautapo"/>'>
        <td>
           <img src="./imagenes/reportes/reportes.gif" border="0"/>&nbsp;
	   <a href="javascript:document.formaver<c:out value="${contador.count}"/>.submit();"><c:out value="${lista.informe}"/></a>
  	   <input type="hidden" name="id_informe" value='<c:out value="${lista.id_informe}"/>'>
	   <input type="hidden" name="id_proceso" value='<c:out value="${lista.id_proceso}"/>'>
	   <input type="hidden" name="accion"     value='Ver'>
	   <br>&nbsp; &nbsp; &nbsp; &nbsp;<i><c:out value="${lista.descripcion}"/></i>
        </td>
        </form>
        <form name=formamodificar<c:out value="${contador.count}"/> method="post" action='<c:url value="/registrarInforme.fautapo"/>'>
        <td>
           <div class="modificar"><a href="javascript:document.formamodificar<c:out value="${contador.count}"/>.submit();">Modificar</a></div>
  	   <input type="hidden" name="id_informe" value='<c:out value="${lista.id_informe}"/>'>
	   <input type="hidden" name="id_proceso" value='<c:out value="${lista.id_proceso}"/>'>
	   <input type="hidden" name="accion"     value='Modificar'>
        </td>
        </form>
        <form name=formaeliminar<c:out value="${contador.count}"/> method=post action='<c:url value="/registrarInforme.fautapo"/>'>
        <td>
          <div class="eliminar"><a href="javascript:document.formaeliminar<c:out value="${contador.count}"/>.submit();"> Eliminar</a></div>
  	  <input type="hidden" name="id_informe" value='<c:out value="${lista.id_informe}"/>'> 
	  <input type="hidden" name="id_proceso" value='<c:out value="${lista.id_proceso}"/>'>
	  <input type="hidden" name="accion"     value='Eliminar'>
        </td>
        </form>
      </tr>
      <c:set var="id_actividad_ant" value="${lista.id_actividad}"/>
    </c:forEach>
    </tr>
  </table>
</c:if>

<%@ include file="../Inferior.jsp" %>
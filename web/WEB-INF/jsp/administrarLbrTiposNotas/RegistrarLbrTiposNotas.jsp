<%@ include file="../Superior.jsp"%>

<div class="titulo">Administrar  Lbr Tipos notas</div>
<br>
<form name="vuelve" method="POST">
  <div class="volver">
          <a href="javascript: document.vuelve.submit()" OnClick="javascript:document.vuelve.action='<c:url value="../administrarTiposNotas/buscarDepartamentoFase.fautapo?gestion=${gestion}&periodo=${periodo}&id_facultad=${facultad.id_facultad}"></c:url>'"> Volver </a>
  </div>
</form>



<c:if test="${!empty cliente.id_rol}">
<form name=fevaluacion action="<c:url value="/administrarTiposNotas/registrarLbrTipoNota.fautapo"/>" method="post">	
  <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>" >
  <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>">
  <input type="hidden" name="id_facultad" value="<c:out value="${facultad.id_facultad}"/>">
  <table class="tabla" border=0>
    <tr>
      <th>FACULTAD</th>
      <th>FCL DEPARTAMENTO</th>
      <th>TIPO EVALUACION</th>
      <th>GESTION</th>      
      <th>PERIODO</th>
    </tr>  
    <tr class=colb>
      <td align=center><c:out value="${facultad.facultad}"/></td>
      <td align=center><c:out value="${fcldepartamento}"/></td>
      <td align=center><c:out value="${tipo_evaluacion}"/></td>      
      <td align=center><c:out value="${gestion}"/></td>
      <td align=center><c:out value="${periodo}"/></td>      
    </tr>
  </table>

  <br>
  <table border=0 cellspacing=2 cellpadding=3 >
    <td valign=top>
      <table class="formulario" border=0>
        <tr>
	  <td colspan="3"></td>
	</tr>
        <tr>
          <td class="etiqueta" align=right>Fase</td>
          <td class="etiqueta">::</td>
	  <input type=hidden name=id_fase_ant  value="<c:out value="${id_fase_s}"/>">
          <td><select name="id_fase" onchange="javascript:document.fevaluacion.submit();">	    
  	        <option value="--">-- Elija una Fase --
                <c:forEach var="fases" items="${lListarFases}" varStatus="contador">
		 <c:if test="${fases.id_fase != '100' && fases.id_fase != '700'}">
                  <OPTION value="<c:out value="${fases.id_fase}"/>" <c:if test="${fases.id_fase == id_fase_s}"> Selected </c:if>>
	          <c:out value="${fases.fase}"/>
		  </c:if>
                </c:forEach>
	      </select>
          </td>
        </tr>
        <tr>
          <td class="etiqueta" align=right>Tipo Nota</th>
          <td class="etiqueta">::</td>
          <td><select name="id_tipo_nota" onchange="javascript:document.fevaluacion.submit();">
  	        <option value="0">-- Elija un tipo nota --
                <c:forEach var="tiposNotas" items="${lListarTiposNotas}">
                  <OPTION value="<c:out value="${tiposNotas.id_tipo_nota}"/>" 
	            <c:if test="${tiposNotas.id_tipo_nota == id_tipo_nota_s}"> Selected</c:if>>
	          <c:out value="${tiposNotas.tipo_nota}"/>
                </c:forEach>
	      </select>
          </td>
        </tr>
      </table>	
    </td>
    <td valign=top>
      <table class="formulario" border=0>
        <c:if test="${sAux=='3'}">
	  <th colspan=3 class=colb><c:out value="${mensaje}"/></th>
	</c:if> 
        <c:if test="${sAux=='1'}">
	  <th class=colh colspan="3" aling=center>MODIFICAR</th>
          <tr>
	    <td class="etiqueta" align=right>Tipo Nota</td>
	    <td class="etiqueta">::</td>
	    <td><input type=text name=tipo_nota value="<c:out value="${tipo_nota}"/>" maxlength=30></td>	    
	  </tr>
	  <tr>	    
	    <td class="etiqueta" align=right>Estado</td>
	    <td class="etiqueta">::</td>              
	    <td><select name=id_estado>
	        <option value="<c:out value="${id_estado}"/>"><c:out value="${id_estado}"/>
		  <c:forEach var="listarEstados" items="${lListarEstados}">
		    <c:if test="${id_estado != listarEstados.id_estado}">
		      <OPTION value="<c:out value="${listarEstados.id_estado}"/>"><c:out value="${listarEstados.id_estado}"/> 		    
		    </c:if>
		  </c:forEach>
		</select>
	    </td>	    
	  </tr>
	  <tr>
	  <td colspan=3 align="center"><input class="agregar" type=submit name=boton value=Crear>&nbsp; &nbsp;<input class="modificar" type=submit name=boton value=Modificar></td>
	  </tr>
	</c:if>
	<c:if test="${sAux=='2'}">
	  <th colspan=3 align=center>CREAR TIPO DE NOTA</th>	
	  <tr>
	    <td class="etiqueta" align=right>Tipo Nota</td>
	    <td class="etiqueta">::</td>
	    <td><input type=text name=tipo_nota maxlength=30></td>	  
	  </tr>
	  <tr>
	    <td class="etiqueta" align=right>Estado</td>
	    <td class="etiqueta">::</td>              
	    <td><select name=id_estado>	        
		  <c:forEach var="listarEstados" items="${lListarEstados}">
		      <OPTION value="<c:out value="${listarEstados.id_estado}"/>"><c:out value="${listarEstados.id_estado}"/> 		    
		  </c:forEach>
		</select>
	    </td>
	  </tr>
	  <tr>
	  <td colspan="3" align="center"><input class="aceptar" type=submit name=boton value=Aceptar></td>
	  </tr>
	</c:if>
      </table>
    </td>
  </table>
  <input type=hidden name=id_fase_ant  value="<c:out value="${id_fase_s}"/>">
  <input type=hidden name=id_departamento value="<c:out value="${id_departamento}"/>">
  <input type=hidden name=id_tipo_evaluacion value="<c:out value="${id_tipo_evaluacion}"/>">  
</form>  
</c:if>

<%@ include file="../Inferior.jsp" %>

    
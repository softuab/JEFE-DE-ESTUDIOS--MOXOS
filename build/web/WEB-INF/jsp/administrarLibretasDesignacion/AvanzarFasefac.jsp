<%@ include file="../Superior.jsp" %>

  <div class=titulo> Administrar Designaciones</div>
  <br>

    <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/docentesFacultativa/verProgramaPlanAsignacion.fautapo"/>'>
    <td>
      <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
      <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
      <input type="hidden" name="id_prg_plan"     value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
      <input type="hidden" name="gestion"     value="<c:out value='${gestion}'/>">
      <input type="hidden" name="periodo"     value="<c:out value='${periodo}'/>">	  
      <input type="hidden" name="bandera"     value='1'>
    </td>
  </form>

  <c:if test="${mensaje != null}">
    <center><div class="cuadroAviso"><c:out value="${mensaje}"/></div> </center>
  </c:if>
 <c:if test="${datosAsignacion.id_fase_resolucion >= 1}">
    <center><div class="cuadroAviso">Usted ya realiz&oacute; el Pre-Cierre de Libreta</div> </center>
  </c:if>

    <form>
      
      <br>
      <table class="formulario">
        <tr>
          <th>Atenci&oacute;n!</th>
        </tr>
        <tr>
          <td align="center">LA FASE DE DESIGNACION HA SIDO AVANZADA CON EXITO!!</b></td>
        </tr>
          
      </table>
      
    </form>
 
<%@ include file="../Inferior.jsp" %>
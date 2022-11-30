<%@ include file="../../Superior.jsp" %>

<div class="titulo">Retiro y adici&oacute;n de materias</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<form method=post action=<c:url value="/retiroAdicionMateriasEstudiante/confirmarAccionProgramacionMaterias.fautapo"/> >

<table class="tabla">
<tr>
  <th class=colh>RU </th>
  <th class=colh>NOMBRES</th>
  <th class=colh>PLAN</th>
  <th class=colh>PROGRAMA</th>
  <th class=colh>TIPO PROGRAMACION</th>
</tr>  
<tr>
  <td class=colb><c:out value="${datosEstudiante.id_estudiante}"/>
  <td class=colb><c:out value="${datosPersona.paterno}"/> &nbsp; <c:out value="${datosPersona.materno}"/> &nbsp; <c:out value="${datosPersona.nombres}"/>
  <td class=colb><c:out value="${datosEstudiante.id_plan}"/>
  <td class=colb><c:out value="${datosPrograma.programa}"/>
   <td class=colb align="center"> 
    <c:forEach var="parametro" items="${lParametros}" >
     <c:out value="${parametro.tipo_programacion}"/><br>
    </c:forEach>
  </td>
<tr>  
</table>
<br>

<table class="tabla">
<tr>
  <th colspan="6" class=colh>ADICIONAR MATERIAS </th>
</tr>  
<tr align="center">
  <th>ELEGIR</th>
  <th>NIVEL</th>
  <th>SIGLA</th>
  <th>MENCION</th>
  <th>MATERIA</th>
  <th>GRUPO</th>
<c:set var="nombremateria" value=""/>
<c:set var="colordt" value=""/>
<c:forEach var="materias" items="${lMaterias}" varStatus="contador">
  
<c:if test="${materias.id_modelo_ahorro > 0}">
  <c:if test="${materias.materia != nombremateria}">
  <!-- ********** Esto es para el efecto ************ -->
  <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
  <!-- ********** Fin  efecto ************ -->    
    <td></td>
    <td align="center"><b><c:out value="${materias.nivel_academico}"/></b></td>
    <td align="center"><b><c:out value="${materias.sigla}"/></b></td>
    <td align="center"><b><c:out value="${materias.id_mencion}"/></b></td>
    <td  align="left"><b><c:out value="${materias.materia}"/></b></td>
    <td> </td>
    <c:set var="nombremateria" value="${materias.materia}"/>
   </tr>
   </c:if>
</c:if>
  <!-- ********** Esto es para el efecto ************ -->
  <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
  <!-- ********** Fin  efecto ************ -->   
    <td>
      <c:if test="${materias.id_estado == 'A'}">
        <font color=red>Inscrita</font>
      </c:if>
      <c:if test="${materias.id_estado != 'A'}">
        <c:if test="${materias.cupo_restante > '0'}">
          <input type=checkbox name="materia" VALUE="<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_modelo_ahorro}"/>" >
        </c:if>
        <c:if test="${materias.cupo_restante == '0'}">
          Sin plazas
        </c:if>
      </c:if>
    </td>
    <c:if test="${materias.id_modelo_ahorro <= 0 }">
      <td align=center><b><c:out value="${materias.nivel_academico}"/></b></td> 
      <td align="center"><b><c:out value="${materias.sigla}"/> </b></td>
      <td align="center"><b><c:out value="${materias.id_mencion}"/></b></td>    
    </c:if>
    <c:if test="${materias.id_modelo_ahorro > 0}">
      <td class="colb" align="center">--</td>
      <td class="colb" align="center">-- </td>
      <td class="colb" align="center" aling="center"> --</td>    
      <td class="colb" align=left>
          <c:out value="${materias.modelo_ahorro}"/>
      </td>
    </c:if>
    <c:if test="${materias.id_modelo_ahorro <= 0}">
    <td align=left><b><c:out value="${materias.materia}"/></b></td>
    </c:if>
    <td>
      <c:if test="${materias.id_estado == 'A'}">
        <font color=red><c:out value="${materias.grupo}"/></font>
      </c:if>
      <c:if test="${materias.id_estado != 'A'}">
        <c:if test="${materias.cupo_restante > '0'}">
           <table class="tabla" border=0 cellspacing=0 colpadding=0>
	     <tr>
              <c:forEach var="grupos" items="${materias.grupos}">
	         <td><font size=-1><c:out value="${grupos.grupo}"/><br>
	             <input type=radio name='id_grupo:<c:out value="${materias.id_materia}"/>:<c:out value="${materias.id_modelo_ahorro}"/>' value="<c:out value="${grupos.id_grupo}"/>"><br>
		     (<c:out value="${grupos.cupo_restante}"/>)</font>
                 </td>		   
	      </c:forEach>
             </tr>
	   </table>  
        </c:if>
      </c:if>
    </td>
  </tr>
  
</c:forEach>
<tr>
  <td colspan="6" align=center>
    <input class="aceptar" type=submit value=Aceptar>
</table>
<input type="hidden" name="accion"      value="<c:out value='${accion}'/>"> 
<br>
<c:if test="${!empty mensaje }">
<blink>
  <center>
    <div class='cuadroAviso'>
      <div class="titulo">Aviso</div>
      <c:out value="${mensaje}"/>
    </div>
  </center>
</blink>
</c:if>
</form>

<%@ include file="../../Inferior.jsp" %>
<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="./validar.js">  </script>
<div class="titulo">Ver Notas Evaluaci&oacute;n </div>
<br>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
  <table class="tabla">
    <tr>
      <th align="right">R.U. :</th>
      <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/></td>
      <th align="right">ESTUDIANTE :</th>
      <td class="colb"><c:out value="${datosEstudiante.nombres}"/>&nbsp;<c:out value="${datosEstudiante.paterno}"/>&nbsp;<c:out value="${datosEstudiante.materno}"/></td>
      <th align="right">GRUPO :</th>
      <td class="colb"><c:out value="${datosProgramacion.grupo}"/></td>
    </tr>
    <tr>
      <th align="right">PERIODO :</th>
      <td class="colb"><c:out value="${datosAsignacion.periodo}"/>-<c:out value="${datosAsignacion.gestion}"/></td>      
      <th align="right">DOCENTE:</th>
      <td class="colb" colspan="3"><c:out value="${datosDocente.nombres}"/>&nbsp;<c:out value="${datosDocente.paterno}"/>&nbsp;<c:out value="${datosDocente.materno}"/></td>
    </tr>  
  </table>
  <br>

  <table class="tabla" border=1 width="97%">
    <tr>
      <th colspan="2" rowspan="1">DATOS DE MATERIA</th>    
      <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
         <c:set var="cols" value="0"/>
         <c:forEach var="l1" items="${lFasesTiposnotas}">
	   <c:if test="${l1.id_fase == l.id_fase}">
             <c:set var="cols" value="${cols + l1.cantidad}"/>
	   </c:if> 		       
         </c:forEach>
	 <c:if test="${l.id_fase != '7000'}">
         <th <c:if test="${cols > 0}"> colspan="${cols}" </c:if> ><c:out value="${l.fase}"/></th>      
         </c:if>
      </c:forEach>
    </tr>
    <tr>
       <th>SIGLA</th>    
       <th>MATERIA</th>    
       <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
	 <c:if test="${l.id_fase != '7000'}">
       <c:set var="ban3" value="0"/>
           <c:forEach var="l1" items="${lFasesTiposnotas}">
	      <c:if test="${l1.id_fase == l.id_fase}">
	         <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
                    <th><c:out value="${l1.tipo_nota}"/> <c:out value="${nro_nota}"/></th>
		    <c:set var="ban3" value="1"/>
		 </c:forEach>    
	      </c:if> 		 
           </c:forEach>
	   <c:if test="${ban3==0}">         
	        <th> &nbsp;</th>
	   </c:if>
	 </c:if>
       </c:forEach>      
    </tr>
    <c:set var="reprobado" value="0"/>
    <c:set var="aprobado" value="0"/>
      <tr>
        <td><c:out value="${datosProgramacion.sigla}"/></td>
	<td><c:out value="${datosProgramacion.materia}"/></td>
	<c:forEach var="l" items="${lListarFases}">
	  <c:if test="${l.id_fase != '7000'}">
          <c:set var="ban" value="0"/>
          <c:forEach var="l1" items="${lFasesTiposnotas}">
             <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
	           <c:set var="cols" value="0"/>
	           <c:forEach var="lnota" items="${lNotasEvaluacion}" varStatus="contador1">
	              <c:if test="${l1.id_fase==lnota.id_fase && lnota.id_tipo_nota==l1.id_tipo_nota && lnota.nro_nota==nro_nota && datosEstudiante.id_estudiante==lnota.id_estudiante}">         
		          <c:set var="cols" value="1"/>
                          <td align="center"><c:out value="${lnota.nota}"/></td>
		       </c:if>
		   </c:forEach>     	
		   <c:if test="${cols==0}">         
	              <td> &nbsp;</td>
	           </c:if> 		 	 
	        </c:forEach>
	        <c:set var="ban" value="1"/>
             </c:if> 
          </c:forEach>       	  		 
          <c:if test="${ban==0}">         
            <td> &nbsp;</td>
          </c:if> 		 	 
	  </c:if>
        </c:forEach>       
      </tr>
  </table>      
<%@ include file="../../Inferior.jsp" %>
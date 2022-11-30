<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="./validar.js">  </script>
<div class="titulo">Evaluaci&oacute;n de Estudiantes por Materia</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<br>
  <table border="0" width="97%">
    <tr>
      <th align="left">DOCENTE:</th>
      <td><c:out value="${docente}"/></td>
      <th align="left">GESTI&Oacute;N :</th>
      <td><c:out value="${gestion}"/></td>
      <th align="left">PERIODO :</th>
      <td><c:out value="${periodo}"/></td>      
    </tr>
    <tr>
      <th align="left">SIGLA :</th>
      <td><c:out value="${sigla}"/></td>
      <th align="left">ASIGNATURA :</th>
      <td><c:out value="${materia}"/></td>
      <th align="left">GRUPO :</th>
      <td><c:out value="${grupo}"/></td>
    </tr>  
  </table>
  <br>
<form name=forma action="<c:url value="/imprimirEvaluacionContinuaEstudiantes.fautapo"/>" method="POST" target="_blank">  
  <table class="tabla" border=1 width="97%">
    <tr>
      <th colspan=3 rowspan=3>Nomina de Estudiantes</th>    
      <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
         <c:set var="cols" value="0"/>
         <c:forEach var="l1" items="${lfasesTiposnotas}">
	   <c:if test="${l1.id_fase == l.id_fase}">
             <c:set var="cols" value="${cols + l1.cantidad}"/>
	   </c:if> 		       
         </c:forEach>
         <th  <c:if test="${cols > 0}"> colspan="${cols}" </c:if> ><c:out value="${l.fase}"/></th>      
      </c:forEach>
    </tr>
    <tr>
       <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
       <c:set var="ban3" value="0"/>
           <c:forEach var="l1" items="${lfasesTiposnotas}">
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
       </c:forEach>      
    </tr>
    <tr>
       <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
       <c:set var="ban3" value="0"/>
           <c:forEach var="l1" items="${lfasesTiposnotas}">
	      <c:if test="${l1.id_fase == l.id_fase}">
	         <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
                    <th><input type="checkbox" name="datos_impresion" value="${nro_nota}/${l1.id_tipo_nota}/${l1.id_fase}"></th>
		    <c:set var="ban3" value="1"/>
		 </c:forEach>    
	      </c:if> 		 
           </c:forEach>
	   <c:if test="${ban3==0}">         
	        <th> &nbsp;</th>
	   </c:if> 		 
       </c:forEach>      
    </tr>
    <c:set var="reprobado" value="0"/>
    <c:set var="aprobado" value="0"/>
    <c:forEach var="lestudiante" items="${listaEstudiantes}" varStatus="contador">
      <tr>
        <td><c:out value="${contador.count}"/></td>    
        <td><c:out value="${lestudiante.id_estudiante}"/></td>    
	<td><c:out value="${lestudiante.nombres}"/></td>    
	<c:forEach var="l" items="${lListarFases}">
          <c:set var="ban" value="0"/>
          <c:forEach var="l1" items="${lfasesTiposnotas}">
             <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
	           <c:set var="cols" value="0"/>
	           <c:forEach var="lnota" items="${levalContinua}" varStatus="contador1">
	              <c:if test="${l1.id_fase==lnota.id_fase && lnota.id_tipo_nota==l1.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
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
        </c:forEach>       
      </tr>  
    </c:forEach>    
  </table>      
  <div align="center">
    <input type="submit" value="Imprimir">
  <div>
    <input type="hidden" name="gestion" value="${gestion}">
    <input type="hidden" name="periodo" value="${periodo}">
    <input type="hidden" name="id_docente" value="${id_docente}">
    <input type="hidden" name="id_grupo" value="${id_grupo}">
    <input type="hidden" name="grupo" value="${grupo}">
    <input type="hidden" name="id_tipo_evaluacion" value="${id_tipo_evaluacion}">
    <input type="hidden" name="tipo_evaluacion" value="${tipo_evaluacion}">
    <input type="hidden" name="id_modelo_ahorro" value="${id_modelo_ahorro}">
    <input type="hidden" name="id_materia" value="${id_materia}">
    <input type="hidden" name="materia" value="${materia}">
    <input type="hidden" name="sigla" value="${sigla}">
    <input type="hidden" name="id_programa" value="${id_programa}">
    <input type="hidden" name="programa" value="${programa}">
    <input type="hidden" name="id_departamento" value="${id_departamento}">
    <input type="hidden" name="nombres" value="${docente}">
<form>
<%@ include file="../../Inferior.jsp" %>
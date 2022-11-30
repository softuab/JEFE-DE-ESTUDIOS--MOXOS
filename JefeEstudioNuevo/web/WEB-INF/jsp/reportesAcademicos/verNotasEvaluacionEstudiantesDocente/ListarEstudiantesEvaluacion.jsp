<%@ include file="../../Superior.jsp" %>

<script language='JavaScript' SRC="./validar.js">  </script>
<div class="titulo">Reporte Notas Evaluacion Estudiantes-Docente</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<br>
  <table border="0" width="97%" class="tabla">
    <tr>
      <th align="right">DOCENTE:</th>
      <td><c:out value="${datosDocente.nombre_completo}"/></td>
      <th  align="right">GESTI&Oacute;N :</th>
      <td><c:out value="${datosAsignacion.gestion}"/></td>
      <th align="right">PERIODO :</th>
      <td><c:out value="${datosAsignacion.periodo}"/></td>      
    </tr>
    <tr>
      <th align="right">ASIGNATURA :</th>
      <td><c:out value="${datosAsignacion.sigla}"/> - <c:out value="${datosAsignacion.materia}"/></td>
      <th align="right">TIPO EVALUACION :</th>
      <td><c:out value="${datosAsignacion.tipo_evaluacion}"/></td>
      <th align="right">GRUPO :</th>
      <td><c:out value="${datosAsignacion.grupo}"/></td>
    </tr>  
	  <tr>
      <th align="right">NIVEL ACADEMICO :</th>
      <td><c:out value="${datosAsignacion.nivel_academico}"/></td>
      <th align="right"> </th>
      <td></td>
      <th align="right"></th>
      <td></td>
    </tr>  
  </table>
<br>
<form name=forma action="<c:url value="/docente/imprimirEvaluacionEstudiantes.fautapo"/>" method="GET" target="_blank">  
 <div align="center">
    <input type="submit" value="Imprimir">
Paginacion    <input type="text"  name="paginacion" size="3"/>     
  <div>
  <br>
  <table class="tabla" border=1 width="97%">
    <tr>
      <th colspan="3" rowspan="5">N&oacute;mina de Estudiantes</th>  
  <!-- ENCABEZADOS FASES            -->
      <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
        <c:if test="${l.id_fase < 1000 && l.id_fase <= datosAsignacion.id_fase}">
          <c:set var="cols" value="0"/>
          <c:forEach var="l1" items="${lFasesTiposNotas}">
	    <c:if test="${l1.id_fase == l.id_fase}">
              <c:set var="cols" value="${cols + l1.cantidad}"/>
	    </c:if> 		       
          </c:forEach>

        <c:set var="cols_f1" value="0"/>
        <c:forEach var="l1" items="${lFasesTiposNotas}">
	   <c:if test="${l1.id_fase == l.id_fase}">
             <c:set var="cols_f1" value="${cols_f1 + 1}"/>
	   </c:if> 		       
         </c:forEach>
          
        <th  <c:if test="${cols > 0}"> colspan="${cols+1+cols_f1}" </c:if> > <c:out value="${l.fase}"/></th>      
        </c:if> 
      </c:forEach>
    </tr>
    <tr>
    
<!--   ENCABEZADOS TIPOS NOTAS -->    
<c:forEach var="l" items="${lListarFases}" varStatus="contador">    
      
    <c:if test="${l.id_fase < 1000  && l.id_fase <= datosAsignacion.id_fase}">
         <c:set var="cols_f" value="0"/>
         <c:forEach var="l1" items="${lFasesTiposNotas}">
	   <c:if test="${l1.id_fase == l.id_fase}">
             <c:set var="cols_f" value="${cols_f + l1.cantidad}"/>
	   </c:if> 		       
         </c:forEach>
         
         <c:set var="cols_f1" value="0"/>
         <c:forEach var="l1" items="${lFasesTiposNotas}">
	   <c:if test="${l1.id_fase == l.id_fase}">
             <c:set var="cols_f1" value="${cols_f1 + 1}"/>
	   </c:if> 		       
         </c:forEach>
         
         
     <th <c:if test="${cols_f > 0}"> colspan="${cols_f}" </c:if> >NOTA<br>EVALUADA</th>      
	 <th <c:if test="${cols_f > 0}"> colspan="${cols_f1}" </c:if> >NOTA <br>PONDERADA PROMEDIADA</th>      
	 <th>NOTA<br>FINAL</th>      
	</c:if>  
      </c:forEach>
     </tr>
    <tr>
    
    </tr>
    
    <tr>
    <!--           ENCABEZADOS PONDERADOS TIPOS NOTAS     -->
      <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
    
          <c:if test="${l.id_fase < 1000 && l.id_fase <= datosAsignacion.id_fase}">
          <c:set var="ban3" value="0"/>
          <c:set var="ban8" value="0"/>
    
<!--           NOTA EVALUADA     -->      
<c:forEach var="l1" items="${lFasesTiposNotas}">
	    <c:if test="${l1.id_fase == l.id_fase}">
	     <th  colspan="${l1.cantidad}"  ><c:out value="${l1.tipo_nota}"/></th>      
	<!--
	      <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
                 <th nowrap><c:out value="${nro_nota}"/>&ordm; </th>
	         <c:set var="ban3" value="1"/>
	      </c:forEach>  -->
	    </c:if>
          </c:forEach>
	 
	 
	
        	 
        	 
<!-- PONDERADA PROMEDIADA  --> 
	  <c:forEach var="l1" items="${lFasesTiposNotas}">
	    <c:if test="${l1.id_fase == l.id_fase}">
	      <th  colspan="${1}"  ><c:out value="${l1.tipo_nota}"/><br><c:out value="${l1.ponderacion}"/> % </th>      
    	<!--      <c:forEach var="nro_nota" begin="1" end="1">
                <th nowrap><c:out value="${l1.tipo_nota}"/><br>(Promediada Ponderada)<br><c:out value="${l1.ponderacion}"/> %</th>
		<c:set var="ban8" value="1"/>
	      </c:forEach>    
	-->
	    </c:if> 		 
          </c:forEach>



<!-- ESPACIO UNO SI NO EXISTE NOTAS -->
	  <c:if test="${ban3==0 || ban8==0}">         
	    <th> &nbsp;</th>
	    <th> &nbsp;</th>
	    <th> &nbsp;</th>
	  </c:if>
	  <c:if test="${ban3 !=0 || ban8 !=0}">         
	  <th> &nbsp; NOTA FINAL</th>
	  </c:if>     		  		 
	</c:if>  
      </c:forEach>      
    </tr>
    <tr>
    <!-- NOTA EVALUADA CHECK     -->
      <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
        <c:if test="${l.id_fase < 1000 && l.id_fase <= datosAsignacion.id_fase}">
          <c:set var="ban3" value="0"/>
          <c:set var="ban8" value="0"/>
          <c:forEach var="l1" items="${lFasesTiposNotas}">
	    <c:if test="${l1.id_fase == l.id_fase}">
	      <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
                  <th><c:out value ="${nro_nota}"/><br><input type="checkbox"  checked="checked"   name="datos_impresion" value="${nro_nota}/${l1.id_tipo_nota}/${l1.id_fase}/1"></th>
		  <c:set var="ban3" value="1"/>
	      </c:forEach>    
	    </c:if> 		 
          </c:forEach>
	
	  
          <!-- NOTA PROMEDIADA PONDERADA -->
          <c:set var="fase_aux" value="${l.id_fase}"/>
	  
        <c:forEach var="l1" items="${lFasesTiposNotas}"  varStatus="contadorcito">
	    <c:if test="${l1.id_fase == l.id_fase}">
	   <c:forEach var="nro_nota" begin="1" end="1">
                  <th><c:out value ="${nro_nota}"/><br><input type="checkbox" checked="checked"  name="datos_impresion" value="${nro_nota}/${l1.id_tipo_nota}/${l1.id_fase}/4"></th>
		  <c:set var="ban8" value="1"/>
	  </c:forEach> 
	    </c:if> 		 
          </c:forEach>
	  
          <!--   -->
          
	  <c:set var="fase_aux" value="${l.id_fase}"/>
	  <c:forEach var="l1" items="${lFasesTiposNotas}"  varStatus="contadorcito">
	    <c:if test="${l1.id_fase == l.id_fase}">
	      <c:forEach var="nro_nota" begin="1" end="1">
	        <c:if test="${fase_aux == l1.id_fase}"> 
                  <th><c:out value ="${nro_nota}"/><br><input type="checkbox"  checked="checked"   name="datos_impresion" value="${nro_nota}/${l1.id_tipo_nota}/${l1.id_fase}/3"></th>
		  <c:set var="ban8" value="1"/>
		</c:if>  
		<c:set var="fase_aux" value="${fase_aux +1}"/>
	      </c:forEach>    
	    </c:if> 		 
          </c:forEach>
	  <!-- ESPACIO DOS SI NO EXISTE NOTAS -->
	  <c:if test="${ban3==0 || ban8==0}">         
	    <th> &nbsp;</th>
	    <th> &nbsp;</th>
	    <th> &nbsp;</th>
	  </c:if>
	</c:if>        
      </c:forEach>      
    </tr>
    
    <c:set var="reprobado" value="0"/>
    <c:set var="aprobado" value="0"/>
    <c:forEach var="lestudiante" items="${lEstudiantes}" varStatus="contador">
      <tr>
        <td><c:out value="${contador.count}"/></td>    
        <td><c:out value="${lestudiante.id_estudiante}"/></td>    
	<td><c:out value="${lestudiante.nombres}"/></td>    
	<c:forEach var="l" items="${lListarFases}">
	  <c:if test="${l.id_fase < 1000 && l.id_fase <= datosAsignacion.id_fase}">
            <c:set var="ban" value="0"/>
	    <c:set var="ban1" value="0"/>
            <c:forEach var="l1" items="${lFasesTiposNotas}">
              <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
	          <c:set var="cols" value="0"/>
	          <c:forEach var="lnota" items="${lEstudiantesEvaluacion}" varStatus="contador1">
	            <c:if test="${l1.id_fase==lnota.id_fase && lnota.id_tipo_nota==l1.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
		      <c:set var="cols" value="1"/>
                      <td align="center"><c:out value="${lnota.nota}"/> </td>
		    </c:if>
		  </c:forEach>     	
		  <c:if test="${cols==0}">         
	            <td> &nbsp;</td>
	          </c:if> 		 	 
	        </c:forEach>
	        <c:set var="ban" value="1"/>
              </c:if> 
            </c:forEach>
	    
	    <c:set var="suma" value="0"/>
	     
	     	    <!--  NOTA PONDERADA PROMEDIADA  -->
            <c:forEach var="l1" items="${lFasesTiposNotas}">
              <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="1">
	          <c:set var="cols" value="0"/>
	          <c:forEach var="lnota" items="${lEstudiantesEvaluacion}" varStatus="contador1">
	            <c:if test="${l1.id_fase==lnota.id_fase && lnota.id_tipo_nota==l1.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
		      <c:set var="cols" value="1"/>
                      <td align="center"><c:out value="${lnota.nota_final_ponderada}"/>
		        <c:set var="suma" value="${suma+lnota.nota_final_ponderada}"/> 
		      </td>
		    </c:if>
		  </c:forEach>     	
		  <c:if test="${cols==0}">         
	            <td> &nbsp;</td>
	          </c:if> 		 	 
	        </c:forEach>
	        <c:set var="ban1" value="1"/>
              </c:if> 
            </c:forEach>
	    
            
	    <!-- NOTA FINAL -->
	    <c:set var="fase_aux1" value="${l.id_fase}"/>
	    <c:forEach var="l1" items="${lFasesTiposNotas}">
              <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="1">
		  <c:if test="${fase_aux1 == l1.id_fase}"> 
		  <c:set var="cols" value="0"/>
	            <c:forEach var="lnota" items="${lEstudiantesEvaluacion}" varStatus="contador1">
	              <c:if test="${l1.id_fase==lnota.id_fase && lnota.id_tipo_nota==l1.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
		        <c:set var="cols" value="1"/>
                        <td align="center"><c:out value="${lnota.nota_final}"/>
		        </td>
		      </c:if>
		    </c:forEach>
		  </c:if>  
		<c:set var="fase_aux1" value="${fase_aux1 +1}"/>
		  <c:if test="${cols==0}">         
	            <td> &nbsp;</td>
	          </c:if> 		 	 
	        </c:forEach>
	        <c:set var="ban1" value="1"/>
              </c:if> 
            </c:forEach>
	    <!-- FIN NOTA FINAL -->
	    <!-- ESPACIO SI NO EXISTE NOTAS -->
            <c:if test="${ban==0 || ban1==0}">
              <td> &nbsp;</td>
	      <td> &nbsp;</td>
	      <td> &nbsp;</td>
            </c:if>
	  </c:if>    
        </c:forEach>       
      </tr>  
    </c:forEach>    
  </table>      
 
    <input type="hidden" name="id_asignacion"      value="${datosAsignacion.id_asignacion}">    
    <input type="hidden" name="gestion"            value="${datosAsignacion.gestion}">
    <input type="hidden" name="periodo"            value="${datosAsignacion.periodo}">
    <input type="hidden" name="id_docente"         value="${datosAsignacion.id_docente}">
    <input type="hidden" name="id_grupo"           value="${datosAsignacion.id_grupo}">
    <input type="hidden" name="grupo"              value="${datosAsignacion.grupo}">
    <input type="hidden" name="id_tipo_evaluacion" value="${datosAsignacion.id_tipo_evaluacion}">
    <input type="hidden" name="id_modelo_ahorro"   value="${datosAsignacion.id_modelo_ahorro}">
    <input type="hidden" name="id_materia"         value="${datosAsignacion.id_materia}">
    <input type="hidden" name="sigla"              value="${datosAsignacion.sigla}">
    <input type="hidden" name="id_programa"        value="${id_programa}">
    <input type="hidden" name="id_departamento"    value="${datosAsignacion.id_departamento}">
    <input type="hidden" name="nro_estudiantes"    value="${nroEstudiantes}">
<form>  
<%@ include file="../../Inferior.jsp" %>
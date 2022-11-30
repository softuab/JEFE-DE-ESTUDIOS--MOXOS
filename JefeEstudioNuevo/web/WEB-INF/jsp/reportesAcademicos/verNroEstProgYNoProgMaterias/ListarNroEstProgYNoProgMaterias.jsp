<%@ include file="../../Superior.jsp" %>

<script language='JavaScript' SRC="./validar.js">  </script>

<table border="0" width="100%">
  <tr>
    <td width="20%" align="right">
      <IMG SRC="<c:url value='${logo}'/>" width="70" height="70" border="0" ALT="logo institucion">
    </td>
    <td width="80%">
      <table border="0">
        <tr>
          <td align="center"><font size="3"><b><c:out value='${institucion}'/></font></b></td>
        <tr>
        </tr>
          <td align="center"><font size="1"><c:out value='${actividad}'/></font></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center"><font size="4"><b>N&Uacute;MERO DE APROBADOS DE ADMISI&Oacute;N ESPECIAL POR SEXO Y NACIONALIDAD</font></b></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <table border="0" width="80%" align="center">
        <tr>
          <td align="left" width="20%"><b>Programa :</b></td>
	  <td align="left" width="30%"><b><c:out value='${programa}'/></b></td>
	  <td align="left" width="20%"><b>Fecha :</b></td>
	  <td align="left" width="30%"><b>
	    <script>
              var mydate=new Date();
              var year=mydate.getYear();
              if (year < 1000)
                 year+=1900;
              var day=mydate.getDay();
              var month=mydate.getMonth()+1;
              if (month<10)
                 month="0"+month;
              var daym=mydate.getDate();
              if (daym<10)
              daym="0"+daym;
              document.write("<a href = 'javascript: window.print()'>" + daym+"/"+month+"/"+year+"</a>");
            </script> 
	  </b></td>
        <tr>
        </tr>
	  <td align="left" width="20%"><b>Gestion :</b></td>
	  <td align="left" width="30%"><b><c:out value='${gestion}'/></b></td>
	  <td align="left" width="20%"><b>Periodo :</b></td>
	  <td align="left" width="30%"><b><c:out value='${periodo}'/></b></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br>
  <table class="tabla" border=1 width="97%">
    <tr>
      <th>Nro</th>
      <th>Materia</th>
      <th>Departamento</th>
      <th>Programados<br>${gestion-1}-${periodo}
      </th>
      <th>Programados<br>${gestion}-${periodo}
      </th>
      <th>No Programados
      </th>
    </tr>	
    <c:set var="totalpantes" value="0"/>
    <c:set var="totalpahora" value="0"/>
    <c:set var="totalnoprog" value="0"/>    
    <c:forEach var="lestudiante1" items="${listaEstudiantes1}" varStatus="contador">
      <c:set var="noprog" value="0"/>    
      <tr>
        <td><c:out value="${contador.count}"/></td>   
        <td>
          <c:out value="${lestudiante1.materia}"/>
        </td>
	<td>
          <c:out value="${lestudiante1.departamento}"/>
        </td>
        <td>
          <c:out value="${lestudiante1.cantidad}"/>
          <c:set var="totalpantes" value="${totalpantes+lestudiante1.cantidad}"/>
	  <c:set var="noprog" value="${noprog+lestudiante1.cantidad}"/>
        </td>
	<c:forEach var="lestudiante" items="${listaEstudiantes}">
	  <c:if test="${lestudiante1.id_materia == lestudiante.id_materia}">
	    <td>
	      <c:out value="${lestudiante.cantidad}"/>
              <c:set var="totalpahora" value="${totalpahora+lestudiante.cantidad}"/>
	      <c:set var="noprog" value="${lestudiante.cantidad-noprog}"/>
	    </td>
	  </c:if>
	</c:forEach>  
	<td>
	  <c:out value="${noprog}"/>
	  <c:set var="totalnoprog" value="${totalnoprog+noprog}"/>    
	</td>
      </tr>   	
    </c:forEach>  
    <tr>
      <td class="colb" colspan="3">
        TOTALES:
      </td>
      <td class="colb">
        <c:out value="${totalpantes}"/> Programados
      </td>
      <td class="colb">
        <c:out value="${totalpahora}"/> Programados
      </td>
      <td class="colb">
        <c:out value="${totalnoprog}"/> No Programados
      </td>
    </tr>  
  </table> 
<%@ include file="../../Inferior.jsp" %>
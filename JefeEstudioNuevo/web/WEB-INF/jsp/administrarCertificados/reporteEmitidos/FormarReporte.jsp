<%@ include file="../../Superior.jsp" %>

<!--
  FUNDACION AUTAPO
  @autor            : Luis A. Jordan P.
  @fec_registro     : 11/04/2006
  @ult_usuario      : Jorge Copa
  @fec_modificacion : 2007-11-13
-->
<!-- ========================================== TITULO ============================================================== -->
	<table width="100%" border =0>
	<td width="0%" align=center>
              <c:if test="${!empty logo}">
                <IMG SRC="<c:url value='${logo}' />" width="100" height="120" border="0" ALT="logo institucion"><br>
              </c:if>
    </td>		
		<td  width = "85%"  align="center">
			<p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p><p>
			<table  width="100%" heigth="10%" cellpading ="1" cellspacing ="0" border = 0 >
				<p><p><p><p><p><p><p><p>      
				<tr><p><p><p><p><p><p><p><p><p><p><p><p><p><td  align="center"><p><p><p><p><font size="5">UNIVERSIDAD   BOLIVIANA </font></td><tr>
				<tr><td   align="center"><font size="5">Universidad Autonoma del Beni</font></td><tr>
				<tr><td   align="center"><font size="5">"Jose Ballivian"</font></td><tr>
				<br>
				<br>
				<td height= "100%"  width ="50%" align ="center"><font size="3">CERTIFICADOS EMITIDOS</font></td>
			</table>
		</td>
	</table>
<br>
<br>
<!-- ======================================== CUERPO 1 =============================================================== -->

<c:forEach var="lista" items="${lDatosAnuladosCertificados}" varStatus="contador">
<c:if test="${(contador.count) == 1}">
	<table width = "90%" height= "20%" border = 0 >
		<tr>
			<td><b><font size="2">Sede : <c:if test="${(lista.id_sede) == 1}">
				CENTRAL-TRINIDAD
			</c:if>
			<c:if test="${(lista.id_sede) == 8}">
				RIBERALTA
			</c:if>
			<c:if test="${(lista.id_sede) == 4}">
				GUAYARAMERIN
			</c:if></font></b></td>
		</tr>
		<tr>
			<td><b><font size="2">Tipo documento : 
					<c:if test="${(lista.id_concepto) == 27}">
						CERTIFICADO DE NOTAS
					</c:if>
					<c:if test="${(lista.id_concepto) == 31}">
						HISTORIAL ACADEMICO
					</c:if>
			</font></b></td>
		</tr>
</c:if>	
</c:forEach>
		<tr>
        <td align="lefth"><label>Certificados emitidos:: Del <c:out value='${fec_comprobantei}'/> Al  <c:out value='${fec_comprobantef}'/></label></td>
        </tr>
	</table>
	
<br>


  <table class="tabla" width="90%" border = 0>
  <tr>
    <th><font size="2">Facultad</font></th>
	<th><font size="2">Carrera</font></th>
	<th><font size="2">Num. certificado</font></th>
    <th><font size="2">R.U.</font></th>
	<th><font size="2">C.I.</font></th>
	<th><font size="2">Nombre</font></th>
	<th><font size="2">Obs.</font></th>
	<th><font size="2">Fecha Emision</font></th>
	
  </tr>
  <c:set var="x" value="0"/>
  <c:set var="y" value="0"/>
  <c:forEach var="lista" items="${lDatosAnuladosCertificados}" varStatus="contador">
	<c:if test="${(lista.facultad!=y)}">
	<td colspan = "8"><font size="2"><B>
				  <c:out value="${lista.facultad}"/></B></font></td>
    </c:if>
	<c:if test="${(lista.carrera!=x)}">
	<tr>
	<td></td>
	<td colspan = "7"><font size="2"><B><c:out value="${lista.carrera}"/></B></font></td>
	</tr>
	</c:if>
	<tr>
	<td></td>
	<td></td>
	<td><font size="2"><c:out value="${lista.nrocertificado_gestion}"/></font></td>
	<td><font size="2"><c:out value="${lista.ru}"/></font></td>
	<td><font size="2"><c:out value="${lista.ci}"/></font></td>
	<td><font size="2"><c:out value="${lista.estudiante}"/></font></td>
	<td><font size="2"><c:out value="${lista.obs}"/></font></td>
	<td><font size="2"><fmt:formatDate value="${lista.fec_registro}" pattern="yyyy-MM-dd"/></font></td>
	
    </tr>
  <c:set var="y" value="${lista.facultad}"/>
  <c:set var="x" value="${lista.carrera}"/>
  </c:forEach>
</table>



<td width="14%">
          <script>
                hora = new Date();
                var dia = hora.getDate();
				var mes = hora.getMonth()+1;
                var anio = hora.getFullYear();
                horas = hora.getHours()
				minutos = hora.getMinutes()
				segundos = hora.getSeconds()
				if (mes <= 9) mes = "0" + mes
				if (horas >= 12) tiempo = " p.m."
				else tiempo = " a.m."
				if (horas > 12) horas -= 12
				if (horas == 0) horas = 12
				if (minutos <= 9) minutos = "0" + minutos
				if (segundos <= 9) segundos = "0" + segundos								
  	        //document.write("<sup>Pagina:</sup><sup>1</sup><br>");
                document.write("<font size=1>Fecha:<a href = 'javascript: window.print()'>" +dia+"/"+mes+"/"+anio+" " + horas+":"+minutos+":"+segundos+"  "+tiempo+"</a></font>");
			</script>        
        </td>
<%@ include file="../../Inferior.jsp" %>
<%@ include file="../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Dominios</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Dominios</div>
</c:if>

<div><a class="volver" href='listarDominios.fautapo'>Volver</a></div>
<br>

<form name="forma" method="POST">
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Area <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
         <SELECT name="id_ubicacion_organica">
	    <OPTION value="">-- seleccione --
             <c:forEach var="listaA" items="${lUbicacionesOrganicas}" >
	       <OPTION value="<c:out value="${listaA.id_ubicacion_organica}"/>"<c:if test="${listaA.id_ubicacion_organica == id_ubicacion_organica}">selected</c:if>>
	       <c:out value="${listaA.ubicacion_organica}"/>
             </c:forEach>
	 </SELECT>  
    </tr>    
    <tr>
      <td class="etiqueta">Padre</td>
      <td class="etiqueta">::</td>
      <td>
         <SELECT name="id_dominio_padre">
	    <OPTION value="">-- seleccione --
             <c:forEach var="listaTodas" items="${lDominios}" >
	       <OPTION value="<c:out value="${listaTodas.id_dominio}"/>"<c:if test="${listaTodas.id_dominio == id_dominio_padre}">selected</c:if>>
	       <c:out value="${listaTodas.dominio}"/>
             </c:forEach>
	 </SELECT>  
    </tr>
    <tr>
      <td class="etiqueta">Tipo de dominio <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
         <SELECT name="id_tipo_dominio" onchange="javascript:document.forma.submit()";>
	    <OPTION value="">-- seleccione --
             <c:forEach var="listaTD" items="${lTiposDominios}" >
	       <OPTION value="<c:out value="${listaTD.id_tipo_dominio}"/>"<c:if test="${listaTD.id_tipo_dominio == id_tipo_dominio}">selected</c:if>>
	       <c:out value="${listaTD.tipo_dominio}"/>
             </c:forEach>
	 </SELECT>  
    </tr>
    <c:if test="${id_tipo_dominio == 2}">
      <tr>
        <td class="etiqueta">Formulario <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
           <SELECT name="id_form" onchange="javascript:document.forma.submit()";>
 	     <OPTION value="">-- seleccione --
               <c:forEach var="listaForm" items="${lFormularios}" >
	         <OPTION value="<c:out value="${listaForm.id_form}"/>"<c:if test="${listaForm.id_form == id_form}">selected</c:if>>
	         <c:out value="${listaForm.form}"/>
               </c:forEach>
	   </SELECT>  
      </tr>
      <tr>
        <td class="etiqueta">Campo <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
           <SELECT name="id_campo">
  	     <OPTION value="">-- seleccione --
               <c:forEach var="listaCampos" items="${lCampos}" >
	         <OPTION value="<c:out value="${listaCampos.id_campo}"/>"<c:if test="${listaCampos.id_campo == id_campo}">selected</c:if>>
	         <c:out value="${listaCampos.campo}"/>
               </c:forEach>
  	   </SELECT>  
      </tr>
    </c:if>
    <c:if test="${id_tipo_dominio == 3}">
      <tr>
        <td class="etiqueta">Tabla <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
          <SELECT name="tabla" onchange="javascript:document.forma.submit()";>
 	    <OPTION value="">-- seleccione --
              <c:forEach var="listaTablas" items="${lTablas}" >
	        <OPTION value="<c:out value="${listaTablas.tabla}"/>"<c:if test="${listaTablas.tabla == tabla}">selected</c:if>>
	        <c:out value="${listaTablas.tabla}"/>
              </c:forEach>
	  </SELECT>  
      </tr>
      <tr>
        <td class="etiqueta">Primario <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>	      
        <td>
        <SELECT name="primario">
	  <option value="">--Seleccione--</option>
          <c:forEach var="lista" items="${lCamposTabla}" >
            <OPTION value="<c:out value="${lista.campo}"/>" <c:if test="${lista.campo == primario}">selected</c:if>>
            <c:out value="${lista.etiqueta}"/>
	  </c:forEach>
	</SELECT>
	</td>
       </tr>
       <tr>
         <td class="etiqueta">Campos <font color='red'>(*)</font> </td>
         <td class="etiqueta">::</td>
         <td><input type="text" name="campo" size="50" value='<c:out value="${campo}"/>'></td>
      </tr>
    </c:if>
    <tr>
      <td class="etiqueta">Dominio <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="dominio" size="50" value='<c:out value="${dominio}"/>'></td>
    </tr>
    <tr>
      <td class="etiqueta">Privado <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>Si<input type="radio" name="privado" value='si'<c:if test="${privado == 'true'}"> checked </c:if> > &nbsp; 
          No<input type=radio name=privado value='no' <c:if test="${privado == 'false' || empty buscarDominio.privado}"> checked </c:if>></td>
    </tr>
  </table>
  <center>
    <input type="submit" class="siguiente" value='Siguiente' onclick="document.forma.accion1.value='Guardar';
								      document.forma.action='<c:url value="/confirmarDominio.fautapo"/>'">
  </center>
    <input type="hidden" name='accion1'    value=''>
    <input type="hidden" name='accion'     value='<c:out value="${accion}"/>'>
    <input type="hidden" name='id_dominio' value='<c:out value="${id_dominio}"/>'>
    <input type="hidden" name='recargado'  value='Si'>
    <input type="hidden" name='sw'         value='1'>
</form>
<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../Inferior.jsp"%>
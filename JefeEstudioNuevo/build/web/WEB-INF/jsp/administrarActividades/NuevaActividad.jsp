<%@ include file="../Superior.jsp"%>
<script language='JavaScript' SRC="./validar.js"></script>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Actividades</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Actividades</div>
</c:if>

<div><a class="volver" href='listarActividades.fautapo?id_proceso=<c:out value="${id_proceso}"/>'>Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <td class="colh">Proceso</td>
    <td><c:out value="${proceso}"/></td>
  </tr>
</table>
<br>

<form name="adicionaractividad" method="POST" >
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Actividad <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="actividad" value="<c:out value="${actividad}"/>" maxlength="100" size="70" ></td>            
    </tr>
    <tr>
      <td class="etiqueta">Area <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
         <SELECT name="id_ubicacion_organica">
	    <OPTION value="">-- seleccione --
             <c:forEach var="listaAr" items="${lUbicacionesOrganicas}" >
	       <OPTION value="<c:out value="${listaAr.id_ubicacion_organica}"/>" <c:if test="${listaAr.id_ubicacion_organica == id_ubicacion_organica}">selected</c:if> >
	       <c:out value="${listaAr.ubicacion_organica}"/>
             </c:forEach>
	 </SELECT>  
    </tr>
    <tr>
      <td class="etiqueta">Rol <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
       <SELECT name="id_rol">
         <option value="">-- seleccione --
         <c:forEach var="lista" items="${lRoles}" >
	   <OPTION value="<c:out value="${lista.id_rol}"/>" <c:if test="${id_rol == lista.id_rol}">selected</c:if>>
	   <c:out value="${lista.rol}"/>
         </c:forEach>
       </SELECT>
     </td>
    </tr>
    <tr>
      <td class="etiqueta">Duraci&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="duracion" value="<c:out value="${duracion}"/>" maxlength="5" size="7" onblur='validar(orden,"9")'>
          <SELECT name="id_tipo_duracion">
            <c:forEach var="lista" items="${lTiposDuraciones}" >
   	      <OPTION value="<c:out value="${lista.id_tipo_duracion}"/>" <c:if test="${id_tipo_duracion == lista.id_tipo_duracion}">selected</c:if>>
	      <c:out value="${lista.tipo_duracion}"/>
            </c:forEach>
          </SELECT>  
      (s)</td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo Actuaci&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
       <SELECT name="id_tipo_actuacion" OnChange='javascript: document.adicionaractividad.submit()'>
         <option value="">-- seleccione --
         <c:forEach var="lista" items="${lTiposActuaciones}" >
	   <OPTION value="<c:out value="${lista.id_tipo_actuacion}"/>" <c:if test="${id_tipo_actuacion == lista.id_tipo_actuacion}">selected</c:if>>
	   <c:out value="${lista.tipo_actuacion}"/>
         </c:forEach>
       </SELECT>  
     </td>
    </tr>

    <!--COMBO CUANDO ID TIPO ACTUACION ES GOTO-->
    <c:if test="${id_tipo_actuacion == '2'}">
      <tr>
        <td class="etiqueta">Actuaci&oacute;n <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>	      
        <td>
          <SELECT name="id_actividad">
           <option value="">-- seleccione --
           <c:forEach var="listita" items="${lActividades}" >
	     <OPTION value="<c:out value="${listita.id_actividad}"/>" <c:if test="${id_actividad == listita.id_actividad}">selected</c:if>>
	      <c:out value="${listita.orden}"/>-<c:out value="${listita.actividad}"/>
	     </OPTION> 
           </c:forEach>
          </SELECT>  
        </td>
      </tr>            
       <input type="hidden" name="orden_actividad" value="<c:out value="${buscarActividad.orden}"/>"></td>
    </c:if>
    
    <!--CHECKED CUANDO ID TIPO ACTUACION ES FORK-->
    <c:if test="${id_tipo_actuacion == '3'}">
      <tr>
        <td class="etiqueta">Actuaci&oacute;n <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>	      
        <td class="etiqueta">
	  <table class="table">
	    <tr>
	      <td></td>
	    </tr>
	    <c:forEach var="listita" items="${lActividades}" varStatus="contador">    
              <tr>
    	        <td align="left">
		  <input type="checkbox" name="id_actividad" value="<c:out value="${listita.id_actividad}"/>"
		    <c:forEach var="prueba" items="${lActuacionesOrden}">
		      <c:if test="${listita.orden ==prueba.orden}">checked</c:if>
		    </c:forEach>  
		    >
                  <c:out value="${listita.orden}"/> - <c:out value="${listita.actividad}"/>
	        </td>
	        <td>
	          <c:out value="${listita.orden}"/>
	          <input type='hidden' name="orden_actividad" value="<c:out value="${listita.orden}"/>"/>
	        </td>
		
	        <td>
	          <input type='text' name="actuacion_<c:out value="${listita.id_actividad}"/>"
		    <c:forEach var="prueba" items="${lActuacionesOrden}">
  		      <c:if test="${listita.orden == prueba.orden}"> value="<c:out value="${prueba.actuacion}"/>" </c:if>
		    </c:forEach> >
		</td>
		
    	      </tr>
    	    </c:forEach> 
	  </table>
        </td>
      </tr>
    </c:if>        
    <tr>
      <td class="etiqueta">Orden <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="orden" value="<c:out value="${orden}"/>" maxlength="5" size="7" onblur='validar(this,"9")'></td>
    </tr>
    <tr>
      <td class="etiqueta">Alerta <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>Si<input type="radio" name="alerta" value="true" <c:if test="${alerta == 'true'}"> checked </c:if> OnChange='javascript: document.adicionaractividad.submit()'> &nbsp;
          No <input type="radio" name="alerta" value="false" <c:if test="${alerta == 'false' || empty(alerta)}">checked</c:if> OnChange='javascript: document.adicionaractividad.submit()' > </td>
    </tr>
    <c:if test="${alerta == 'true'}">
      <tr>
        <td class="etiqueta">Alerta <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td class="etiqueta">
          <table class="table" align="left">
            <c:forEach var="listita" items="${listaTiposAlertas}" >
  	    <tr>
	      <td class="etiqueta">
	        <input type="checkbox" name="alertas" value='<c:out value="${listita.id_tipo_alerta}"/>' 
		 <c:forEach var="pruebita" items="${lTiposAlertas}">
	           <c:if test="${listita.id_actividad != 0 || pruebita.id_tipo_alerta == listita.id_tipo_alerta}">checked </c:if>
		 </c:forEach> >
	      </td>
	      <td class="etiqueta"><c:out value="${listita.tipo_alerta}"/></td>
	    </tr>
            </c:forEach>
         </table>
        </td>
      </tr>
    </c:if>
    <tr>
      <td class="etiqueta">Puente <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>Si<input type="radio" name="puente" value="true" <c:if test="${puente == 'true'}"> checked </c:if> > &nbsp;
          No <input type="radio" name="puente" value="false" <c:if test="${puente == 'false' || empty(puente)}">checked</c:if> > </td>
    </tr>
    <tr>
      <td class="etiqueta">Ruta </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="ruta" value='<c:out value="${ruta}"/>'>
    </tr>
    <tr>
      <td class="etiqueta">Fin flujo <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>Si<input type="radio" name="fin_flujo" value="true" <c:if test="${fin_flujo == 'true'}"> checked </c:if> > &nbsp;
          No <input type="radio" name="fin_flujo" value="false" <c:if test="${fin_flujo == 'false' || empty(fin_flujo)}">checked</c:if> > </td>
    </tr>
  </table>
  <center>
    <input type="submit" class="siguiente" value='Siguiente' onclick='document.adicionaractividad.accion1.value="Guardar";
								      document.adicionaractividad.action="<c:url value="/confirmarActividad.fautapo"/>"'>
  </center>
    <input type="hidden" name='accion' value='<c:out value="${accion}"/>'>
    <input type="hidden" name='id_actividad_modificar' value='<c:out value="${id_actividad_modificar}"/>'>
    <input type="hidden" name='id_proceso' value='<c:out value="${id_proceso}"/>'>
    <input type="hidden" name='orden' value='<c:out value="${orden}"/>'>
    <input type="hidden" name='actuacion' value='<c:out value="${actuacion}"/>'>
    <input type="hidden" name='recargado' value='Si'>
    <input type="hidden" name='accion1' value=''>
</form>
<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../Inferior.jsp"%>
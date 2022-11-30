<%@ include file="../Superior.jsp"%>

<script language="javascript" type="text/javascript" src="./tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
  tinyMCE.init({
    mode : "textareas",
    theme : "advanced",

    plugins : "style,layer,table,save,advhr,advimage,advlink,insertdatetime,preview,searchreplace,contextmenu,paste,directionality,fullscreen,noneditable",
    theme_advanced_buttons1_add_before : "newdocument,separator",
    theme_advanced_buttons1_add : "fontselect,fontsizeselect",
    theme_advanced_buttons2_add : "separator,insertdate,inserttime,preview,separator,forecolor,backcolor",
    theme_advanced_buttons2_add_before: "cut,copy,paste,pastetext,pasteword,separator,search,replace,separator",
    theme_advanced_buttons3_add_before : "tablecontrols,separator",
    theme_advanced_buttons3_add : "iespell,advhr,separator,ltr,rtl,separator,fullscreen",
    theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops",
    theme_advanced_toolbar_location : "top",
    theme_advanced_toolbar_align : "left",
    theme_advanced_path_location : "bottom",
    content_css : "example_full.css",
    plugin_insertdate_dateFormat : "%d-%m-%Y",
    plugin_insertdate_timeFormat : "%H:%M:%S",
    extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
    external_link_list_url : "example_link_list.js",
    external_image_list_url : "example_image_list.js",
    flash_external_list_url : "example_flash_list.js",
    file_browser_callback : "fileBrowserCallBack",
    theme_advanced_resize_horizontal : false,
    theme_advanced_resizing : true
  });

  function fileBrowserCallBack(field_name, url, type, win) {
    // This is where you insert your custom filebrowser logic
    alert("Example of filebrowser callback: field_name: " + field_name + ", url: " + url + ", type: " + type);

    // Insert new URL, this would normaly be done in a popup
    win.document.forms[0].elements[field_name].value = "someurl.htm";
  }
</script>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Informes</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Informes</div>
</c:if>
<c:if test="${accion == 'Eliminar'}">
  <div class="titulo"> Eliminando Informes</div>
</c:if>

<table>
  <tr>
    <td>
      <div><a class="volver" href="<c:url value="/listarInformes.fautapo?id_proceso=${id_proceso}"></c:url>">Volver</a></div>
    </td>
  </tr>    
</table>

<br>
<form name="forma" method="POST">
  <c:if test="${accion == 'Adicionar' || accion == 'Modificar'}">
    <table class="formulario">
      <tr>
        <th colspan="3">INTRODUZCA LOS DATOS</th>
      </tr>
      <tr>
        <td class="etiqueta">Proceso</td>
	<td class="etiqueta">::</td>
        <td><c:out value="${datosProceso.proceso}"/></td>
      </tr>
      <tr>
        <td class="etiqueta">Actividad <font color='red'>(*)</font> </td>
	<td class="etiqueta">::</td>
        <td>
	  <select name="id_actividad">
    	    <c:forEach var="lista" items="${lActividades}">
	      <option value="<c:out value="${lista.id_actividad}"/>" <c:if test="${lista.id_actividad == datosInforme.id_actividad}">selected</c:if>> 
	       <c:out value="${lista.actividad}"/>
	    </c:forEach>
	  </select>
	</td>
      </tr>
      <tr>
        <td class="etiqueta">Informe <font color='red'>(*)</font> </td>
	<td class="etiqueta">::</td>
        <td><input type="text" name="informe" value='<c:out value="${datosInforme.informe}"/>'></td>
      </tr>
      <tr>
        <td class="etiqueta">Descripci&oacute;n <font color='red'>(*)</font> </td>
	<td class="etiqueta">::</td>
        <td><input type="text" name="descripcion" value='<c:out value="${datosInforme.descripcion}"/>' size="100"></td>
      </tr>
      <tr>
        <td colspan="3">
          <textarea name="contenido" id="contenido" rows="15" cols="80" style="width: 100%"><c:out value="${datosInforme.contenido}" escapeXml="False" /></textarea>
        </td>
      </tr>
    </table>
    <center>
      <input type="submit" class="siguiente" value='Aceptar' onclick="document.forma.boton.value='Guardar';">
    </center>
    <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>
    </c:if>

    <c:if test="${accion == 'Eliminar'}">
      <table class="formulario">
        <tr>
          <th>ELIMINAR</th>
        </tr>
        <tr>      
          <td class="etiqueta" align="center">&iquest; Esta seguro de querer eliminar el informe: <b><c:out value="${datosInforme.informe}"/></b>?</td>
        </tr>
      </table>
      <center>
        <input type="submit" class="aceptar" name="boton" value="Si">
 	<input type="submit" class="cancelar" name="boton" value="No">
      </center>
    </c:if>
    <input type="hidden" name='boton'      value='No'>
    <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>" >
    <input type="hidden" name="id_informe" value="<c:out value='${datosInforme.id_informe}'/>" >
  </form>

<%@ include file="../Inferior.jsp" %>
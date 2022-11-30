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

<div class="titulo"> Nuevo Segmento </div>
<div><a class="volver" href="<c:url value="/listarSegmentos.fautapo"><c:param name="id_hilo" value="${id_hilo}"/></c:url>">Volver </a></div>
<br>

<form name="forma" method="POST" action="<c:url value="/adjuntar.fautapo"/>">
  <table class="formulario" align="left" width="70%">
    <tr>
      <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Asunto</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${hilo.hilo}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">A</td>
      <td class="etiqueta">::</td>
      <td>
        <SELECT name="id_destinatario">
          <c:forEach var="usuarios" items="${lDestinatarios}">
            <OPTION value='<c:out value="${usuarios.id_destinatario}"/>' <c:if test="${usuarios.id_destinatario == id_destinatario}">seleted</c:if> >
              <c:out value="${usuarios.destinatario}"/>
            </OPTION>
          </c:forEach>
        </SELECT>	
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de segmento</td>
      <td class="etiqueta">::</td>
      <td>
        <SELECT name="id_tipo_segmento">
          <c:forEach var="hilos" items="${lTiposSegmentos}">
            <OPTION value='<c:out value="${hilos.id_tipo_segmento}"/>' <c:if test="${hilos.id_tipo_segmento == id_tipo_segmento}">selected</c:if> >
              <c:out value="${hilos.tipo_segmento}"/>
            </OPTION>
          </c:forEach>
        </SELECT>	
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <textarea name="detalle" id="detalle" rows="15" cols="80" style="width: 100%"><c:out value="${detalle}" escapeXml="False" /></textarea>
      </td>
    </tr>
    <tr>
      <td align="center"><input type="submit" name="boton" value="Enviar" onClick="document.forma.action='<c:url value="/nuevoSegmento.fautapo"/>'"></td>
      <td align="center" colspan="2"><input type="submit" name="boton" value=" Limpiar" onClick="document.forma.action='<c:url value="/nuevoSegmento.fautapo"/>'"></td>
    </tr>
    <tr>
  </table>
  <input type="hidden" name="id_hilo"    value='<c:out value="${id_hilo}"/>'>
  <input type="hidden" name="aplicacion" value='<c:out value="${aplicacion}"/>'>
</form>

<%@ include file="../Inferior.jsp"%>

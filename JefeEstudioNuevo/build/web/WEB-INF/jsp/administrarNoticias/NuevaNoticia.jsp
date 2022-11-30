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
  <div class="titulo"> Modificando Noticias</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Noticias</div>
</c:if>

<div><a class="volver" href="verNoticias.fautapo">Volver</a></div>
<br>

<form name="forma" method="POST" action='<c:url value="/registrarNoticia.fautapo"/>'>
  <input type=hidden name="id_tablero" value="<c:out value="${datosTablero.id_tablero}"/>" >
  <table class="formulario" width="100%">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Nombre <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${nombres}"/></td>
    </tr>
    <tr>    
      <td class="etiqueta"> T&iacute;tulo <font color='red'>(*)</font> </td>    
      <td class="etiqueta">::</td>	
      <td><input type="text" name="noticia" value="<c:out value="${datosTablero.noticia}"/>"> </td>
    </tr>   
    <tr>
      <td class="etiqueta"> Rol <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_rol">
          <c:forEach var="roles" items="${lRoles}">
            <option value="<c:out value="${roles.id_rol}"/>" <c:if test="${roles.id_rol == datosTablero.id_rol}">selected</c:if>> 
              <c:out value="${roles.rol}"/> 
            </option>
          </c:forEach>
        </select>	  	 
      </td>
    </tr>
    <tr>
      <td class="etiqueta"> Tipo de aviso <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_tipo_aviso">
          <c:forEach var="aviso" items="${lTiposAvisos}">
            <option value="<c:out value="${aviso.id_tipo_aviso}"/>" <c:if test="${aviso.id_tipo_aviso == datosTablero.id_tipo_aviso}">selected</c:if>> 
              <c:out value="${aviso.tipo_aviso}"/> 
            </option>
          </c:forEach>
        </select>	  	 
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de tablero <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_tipo_tablero">
          <c:forEach var="tablero" items="${lTiposTableros}">
            <option value="<c:out value="${tablero.id_tipo_tablero}"/>" <c:if test="${id_tipo_tablero == datosTablero.id_tipo_tablero}"> selected </c:if>>
             <c:out value="${tablero.tipo_tablero}"/>
          </c:forEach>
        </select>	
      </td>
    </tr>
    <tr>
      <td width="100%" heigth="100%" colspan="3">
        <textarea name="mensaje" id="mensaje" rows="15" cols="80" style="width: 100%"><c:out value="${datosTablero.mensaje}" escapeXml="False" /></textarea>
      </td>
    </tr>
  </table>
  <center>
    <input type="submit" class="aceptar" value="Aceptar" onclick="document.modificarTableros.boton.value='Guardar'">
  </center>
  <input type="hidden" name="boton" value="">
  <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>   
</form>

<%@ include file="../Inferior.jsp" %>
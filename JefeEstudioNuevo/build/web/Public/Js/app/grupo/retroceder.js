import Grupos from "./Grupo.js";
var btnsalir = document.getElementById('btnsalir');

function OnInit(url) {
    _url = url;
    oArrayGrupos = "";
    oGrupo = new Grupos(url);
    cbxgrupo = document.getElementById('id_grupo');
    oModelGrupo = {
        id_materia: document.getElementById('id_materia').value,
        id_tipo_evaluacion: document.getElementById('id_tipo_evaluacion').value,
        gestion: document.getElementById('gestion').value,
        periodo: document.getElementById('periodo').value,
        id_grupo: document.getElementById('id_grupo').value,
        csrfToken: document.getElementById('_csrf').value
    }
}
function OnInitSend(url) {
    _url = url;
    oGrupo = new Grupos(url);
    cbxgrupo = document.getElementById('id_grupo');
    valoranterior = cbxgrupo.getAttribute('data-anterior');
    oModelComprobar = {
        id_materia: document.getElementById('id_materia').value,
        gestion: document.getElementById('gestion').value,
        periodo: document.getElementById('periodo').value,
        id_grupo: document.getElementById('id_grupo').value,
        csrfToken: document.getElementById('_csrf').value
    }
}

btnsalir.addEventListener('click', (event) => {
    btnsalir.className = 'btn btn-secondary disabled';
    btnsalir.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Procesando...'; 
    document.getElementById('frmsalir').submit();
});
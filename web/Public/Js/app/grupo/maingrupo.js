import Grupos from "./Grupo.js";
var direcion = '';
var oArrayGrupos, oModelGrupo, _url, oGrupo, cbxmateria, cbxgrupo, btnenviar, oModelComprobar, valoranterior, form;
cbxmateria = document.getElementById('id_materia');
btnenviar = document.getElementById('btnenviar');
var btnsalir = document.getElementById('btnsalir');
form = document.getElementById('model');
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
cbxmateria.addEventListener('change', (event) => {
    OnInit(event.target.dataset.url);
    oGrupo.cargargrupos(oModelGrupo).then((response) => {
        oArrayGrupos += `<option value="1" selected>NINGUNO</option>`;
        response.forEach(elem => {
            if (elem.value === oModelGrupo.id_grupo) {
                oArrayGrupos += `<option value="${elem.value}" selected>${elem.display}</option>`;
            } else {
                oArrayGrupos += `<option value="${elem.value}">${elem.display}</option>`;
            }
        });
        cbxgrupo.innerHTML = oArrayGrupos;
    }).catch(error => {

    });
});
btnsalir.addEventListener('click', (event) => {
    btnsalir.className = 'btn btn-secondary disabled';
    btnsalir.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Procesando...'; 
    document.getElementById('frmsalir').submit();
});
btnenviar.addEventListener('click', (event) => {
    OnInitSend(event.target.dataset.url);
    if (valoranterior === oModelComprobar.id_grupo) {
        form.submit();
    } else {
        oGrupo.comprobargrupos(oModelComprobar).then((response) => {
            if (response) {
                form.submit();
            } else {
                swal("Ups", "No se puede modificar el grupo de la materia", "error");
            }
        }).catch(error => {
        });
    }
});

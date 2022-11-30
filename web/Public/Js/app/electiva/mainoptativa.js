import Optativa from "./Electiva.js";
var oArray = "", oArrayOptativa = "", oOptativa, btn, _url, oModelBusqueda;
var tabla = document.getElementById('listaTabla');
var cbxplan = document.getElementById('id_plan');
btn = document.getElementById('btnbuscar');
function OnInit(url) {
    _url = url;
    oArray = "";
    oArrayOptativa = "";
    oOptativa = new Optativa(url);
    oModelBusqueda = {
        id_programa: document.getElementById('id_programa').value,
        buscar: document.getElementById('buscarElementos').value,
        id_plan: document.getElementById('id_plan').value,
        id_materia: document.getElementById('id_materia').value
    }
}
btn.addEventListener('click', (event) => {
    OnInit(event.target.dataset.url);
    btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Buscar';
    btn.disabled = true;
    oOptativa.obtenerlistaestudiante(oModelBusqueda).then((response) => {
        oArray = "";
        response.forEach(data => {
            oArray += `<tr ondblclick="seleccionarfila('${data.id_estudiante}')"><td data-id="${data.id_estudiante}" id = "tdru${data.id_estudiante}">${data.id_estudiante}</td><td data-nombre="${data.nombre_completo}" id="tdnombre${data.id_estudiante}">${data.nombre_completo}</td > </tr>`;
        });
        tabla.innerHTML = oArray;
        btn.innerHTML = '<i class="fa fa-fw fa-lg fa-search"></i> Buscar';
        btn.disabled = false;
    }).catch(error => {
        tabla.innerHTML = "";
        btn.innerHTML = '<i class="fa fa-fw fa-lg fa-search"></i> Buscar';
        btn.disabled = false;
    });
});
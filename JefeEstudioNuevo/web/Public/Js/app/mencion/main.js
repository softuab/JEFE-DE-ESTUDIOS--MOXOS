import Mencion from "./Mencion.js";
var oArray = "", oArrayMencion = "", oMencion, btn, _url, oModelBusqueda;
var tabla = document.getElementById('listaTabla');
var cbxplan = document.getElementById('id_plan');
btn = document.getElementById('btnbuscar');
function OnInit(url) {
    _url = url;
    oArray = "";
    oArrayMencion = "";
    oMencion = new Mencion(url);
    oModelBusqueda = {
        buscar: document.getElementById('buscarElementos').value,
        id_plan: document.getElementById('id_plan').value,
        id_mencion: document.getElementById('id_mencion').value,
        id_programa: document.getElementById('id_programa').value
    }
}
btn.addEventListener('click', (event) => {
    OnInit(event.target.dataset.url);
    btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Buscar';
    btn.disabled = true;
    oMencion.obtenerlistaestudiante(oModelBusqueda).then((response) => {
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
cbxplan.addEventListener('change', (event) => {
    OnInit(event.target.dataset.url);
    oMencion.obtenerlistamenciones(oModelBusqueda).then((response) => {
        oArrayMencion = "";
        response.forEach(elem => {
            if (elem.value === oModelBusqueda.id_mencion) {
                oArrayMencion += `<option value="${elem.id_mencion}" selected>${elem.mencion}</option>`;
            } else {
                oArrayMencion += `<option value="${elem.id_mencion}">${elem.mencion}</option>`;
            }
        });
        document.getElementById('id_mencion').innerHTML = oArrayMencion;
    }).catch(error => {
        document.getElementById('id_mencion').innerHTML = "";
    });
});


  
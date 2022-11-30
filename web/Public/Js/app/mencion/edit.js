import Mencion from "./Mencion.js";
var oArray = "", oArrayMencion = "", oMencion, btn, _url, oModelBusqueda;
var cbxplan = document.getElementById('id_plan');
function OnInit(url) {
    _url = url;
    oArray = "";
    oArrayMencion = "";
    oMencion = new Mencion(url);
    oModelBusqueda = {
        id_programa: document.getElementById('id_programa').value,
        id_plan: document.getElementById('id_plan').value,
        id_mencion: document.getElementById('id_mencion').value
    }
}
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


  
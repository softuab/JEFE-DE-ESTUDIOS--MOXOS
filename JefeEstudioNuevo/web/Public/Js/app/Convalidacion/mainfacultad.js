import Convalidacion from "./Convalidacion.js";

var cbxfacultad, contenido, ofacultad, oArrayCarreras, oPreinscripcion;
cbxfacultad = document.getElementById('id_facultad');
function OnInit(url) {
    oArrayCarreras = "";
    cbxfacultad = document.getElementById('id_facultad');
    contenido = document.getElementById('busquedaoferta');
    contenido.innerHTML = ''
    oPreinscripcion = new Convalidacion(url);
    ofacultad = {
        id_facultad: document.getElementById('id_facultad').value,
        csrfToken: document.getElementById('_csrf').value
    }
}
cbxfacultad.addEventListener('change', (event) => {
    OnInit(event.target.dataset.url);
    oPreinscripcion.obtenerCarrerasOfertadas(ofacultad).then((response) => {
        if (response.length !== 0) {
            response.forEach(elem => {
                oArrayCarreras += `<option value="${elem.value}">${elem.display}</option>`;
            });
            contenido.innerHTML = `<select id="id_programa" name="id_programa" class="form-control">${oArrayCarreras}</select>`;
        } else {
            contenido.innerHTML = '<div class="card-panel"><span class="red-text text-darken-2 center">No existe oferta academica</span></div>';
        }
    }).catch(error => {
        contenido.innerHTML = `<select id="id_programa" name="id_programa" class="form-control"><span class="red-text text-darken-2 center">${oArrayCarreras}No existe!!</span></select>`;
    });
});


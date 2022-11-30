import Moodle from "./Moodle.js";
var oArray = "", oArrayMoodle = "", oMoodle, btn, _url, oModelBusqueda;
var contenido = document.getElementById('contenido');
var busqueda = document.getElementById('busqueda');

function OnInit(url) {
    _url = url;
    oArray = "";
    oArrayMoodle = "";
    oMoodle = new Moodle(url);
    oModelBusqueda = {
        id_moodle_cursos: '',
        csrf: ''
    }
}
document.querySelectorAll(".detalle").forEach(btn =>
    btn.addEventListener('click', (event) => {
        OnInit(event.target.dataset.url);
        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Buscar';
        btn.disabled = true;
        oModelBusqueda.id_moodle_cursos = event.target.dataset.id;
        oModelBusqueda.csrf = event.target.dataset.csrf;
        console.log(event.target.dataset.id);
        oMoodle.obtenerdetalle(oModelBusqueda).then((response) => {
            oArray = "";
            response.forEach(data => {
                oArray += `<tr><td>${data.Tipo}</td><td>${data.Detalle}</td ></tr>`;
            });
            contenido.innerHTML = ' <table class="table table-bordered"><thead><tr><th>Tipo Recurso</th><th scope="col">Recurso</th></tr></thead><tbody>' + oArray + '</tbody></table>';
            btn.innerHTML = 'Detalle';
            btn.disabled = false;
            $('#modalCursoMoodle').modal('show');
        }).catch(error => {
            contenido.innerHTML = "";
            btn.innerHTML = 'Detalle';
            btn.disabled = false;
        });
    })
);

busqueda.addEventListener('keyup', (event) => {
    filtrar();
});
function filtrar() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("busqueda");
    filter = input.value.toUpperCase();
    table = document.getElementById("tablagrupo");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[4];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

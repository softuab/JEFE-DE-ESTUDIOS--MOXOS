import Mencion from "./Mencion.js";
var oArray = "", oArrayMencion = "", oMencion, btn, _url, oModelBusqueda;
var deleteLink = document.querySelectorAll('.delete');

function OnInit(url) {
    _url = url;
    oMencion = new Mencion(url);
}
for (var i = 0; i < deleteLink.length; i++) {
    deleteLink[i].addEventListener('click', function (event) {
        console.log(event.target.dataset.id_estudiante);
        oModelBusqueda = {
            id_programa: event.target.dataset.id_programa,
            id_estudiante: event.target.dataset.id_estudiante,
            id_plan: event.target.dataset.id_plan,
            id_mencion: event.target.dataset.id_mencion,
            csrfToken: event.target.dataset.csrf
        }
        OnInit(event.target.dataset.url);
        swal({
            title: "¿Desea continuar con la eliminacion del registro?",
            text: "Presiona aceptar para continuar..",
            icon: "warning",
            buttons: {
                cancel: "Cancelar",
                catch : {
                    text: "Aceptar",
                    value: "Eliminar",
                }
            },
        })
                .then((value) => {
                    switch (value) {
                        case "Eliminar":
                            oMencion.eliminarmencion(oModelBusqueda).then((response) => {
                                if (response.status) {
                                    document.formularioTodo.submit();
                                } else {
                                    swal("Cancelado!", response.Msg, "success");
                                }
                            }).catch(error => {
                                swal("Cancelado!", error, "error");
                            });
                            break;
                        default:
                            swal("Cancelado!", "Se cancelo la eliminacion del registro.", "success");
                    }
                });
    });
}
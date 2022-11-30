import Optativa from "./Electiva.js";
var oArray = "", oArrayOptativa = "", oOptativa, btn, _url, oModelBusqueda;
var deleteLink = document.querySelectorAll('.delete');

function OnInit(url) {
    _url = url;
    oOptativa = new Optativa(url);
}
for (var i = 0; i < deleteLink.length; i++) {
    deleteLink[i].addEventListener('click', function (event) {
        oModelBusqueda = {
            id_est_materiaoptativa: event.target.dataset.id_est_materiaoptativa,
            csrfToken: event.target.dataset.csrf
        }
        OnInit(event.target.dataset.url);
        swal({
            title: 'Desea continuar con la eliminacion del registro?',
            text: 'Presiona aceptar para continuar..',
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
                            oOptativa.eliminarmateria(oModelBusqueda).then((response) => {
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
import Recovery from "./Recovery.js";

var controladorTiempo = "", txtcorreo, oRecovery, btn, _url, form, oModelPassword;
btn = document.getElementById('btnrecovery');
function OnInit(url) {
    _url = url;
    oRecovery = new Recovery(url);
    form = document.getElementById('formarecovery');
    oModelPassword = {
        correo: document.getElementById('correo_recovery').value,
        capchat: document.getElementById('captcha').value
    }
}
function existecorreo(input) {
    OnInit(input.dataset.url);
    oRecovery.existecorreo(oModelPassword).then((response) => {
        if (response.status === "none") {
            form.submit();
        } else {
            var div = document.createElement("div");
            div.classList.add("alert");
            div.classList.add("alert-warning");
            div.innerHTML = response.status;
            swal({text: "Error", icon: "warning", content: div,
                buttons: {
                    Registrar: {
                        text: "Si modificar",
                        value: "Registrar",
                        className: 'btn btn-primary',
                    }
                },
            })
        }
    }).catch(error => {
        swal({text: error, icon: "warning",
            buttons: {
                Registrar: {
                    text: "Si modificar",
                    value: "Registrar",
                    className: 'btn btn-primary',
                }
            },
        })
    });
}
btn.addEventListener('click', (event) => {
    existecorreo(event.target);
}); 
$(document).ready(function () {

        $('.treeview-menu a.treeview-item').on('click', function (e) {
            var ruta = $(this).attr("data-url");
            $('#marco').attr('src', ruta);
            return true;
        });
        $('#CambiarPin').on('click', function (e) {
            var ruta = "./cambioPinDocente/entrada.fautapo";
            $('#marco').attr('src', ruta);
            return true;
        });
});


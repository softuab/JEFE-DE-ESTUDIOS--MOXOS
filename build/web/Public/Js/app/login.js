document.oncontextmenu = function () {
    return false;
}
$('.login-content [data-toggle="flip"]').click(function () {
    $('.login-box').toggleClass('flipped');
    return false;
});
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition,
                function (error) {
                    $("#ubicacion").val("nulo");
                    var div = document.createElement("div");
                    div.innerHTML = "<table border=0 cellspacing=0 cellpadding=0><tr><td width=100% valign=top ><p align=center><span ><img style='text-align: center;' width=48 height=48 src='<c:url value='../imagenes/Locationicon.png'/>'></span></p><p align=center><span style='font-size:28.0pt;color:red'>AVISO</span></b></p></td></tr><tr><td><p  ALIGN='justify'>Por seguridad al acceder al sistema académico - Moxos en su modulo Jefe de Estudio debe activar el acceso a su geolocalización; para detectar accesos indebidos. <a href=''>para mas informacion haga click</a></p> </td></tr></table>";
                    swal({
                        content: div,
                        type: "warning"
                    });
                },
                {timeout: 30000, enableHighAccuracy: true, maximumAge: 75000});
    } else {
        $("#ubicacion").val("nulo");
        var div = document.createElement("div");
        div.innerHTML = "<table border=0 cellspacing=0 cellpadding=0><tr><td width=100% valign=top ><p align=center><span ><img style='text-align: center;' width=48 height=48 src='<c:url value='/imagenes/Locationicon.png'/>'></span></p><p align=center><span style='font-size:28.0pt;color:red'>AVISO</span></b></p></td></tr><tr><td><p  ALIGN='justify'>La geolocalizacion no esta soportado por el navegador. debe actualizar su navegador en su dispositivo. <a href=''>para mas informacion haga click</a></p> </td></tr></table>";
        swal({
            content: div,
            type: "warning"
        });
    }
}
function showPosition(position) {
    var x = "Latitude: " + position.coords.latitude + " - Longitude: " + position.coords.longitude;
    $("#ubicacion").val(x);
    $('#anuncio').modal('show');
}

$("#forma").submit(function (event) {
    var str = new String;
    str = $("#ubicacion").val();
    console.log(str);
    if (str === "nulo") {
        var div = document.createElement("div");
        div.innerHTML = "<table border=0 cellspacing=0 cellpadding=0><tr><td width=100% valign=top ><p align=center><span ><img style='text-align: center;' width=48 height=48 src='<c:url value='/imagenes/Locationicon.png'/>'></span></p><p align=center><span style='font-size:28.0pt;color:red'>AVISO</span></b></p></td></tr><tr><td><p  ALIGN='justify'>Por seguridad al acceder al sistema académico - Moxos en su modulo Docente debe permitir el acceso a su geolocalización; en caso de detectarse accesos indebidos, esta medida de seguridad brindara información que ayudara a tomar los recaudos necesarios. <a href=''>para mas informacion haga click</a></p> </td></tr></table>";
        swal({
            content: div,
            type: "warning"
        });
        event.preventDefault();
    }
});
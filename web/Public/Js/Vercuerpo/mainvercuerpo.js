$(document).ready(function () {
    $("#subirimagen").click(function () {
        event.preventDefault();
         $('input[name=filedocente]').click();
    });

});
function PreviewImage() {
    saveMedia();
};

function saveMedia() {
    var formData = new FormData();
    formData.append('filedocente', $('input[type=file]')[0].files[0]);
    var file = $("#filedocente");
    var numb = file[0].files[0].size / 1024 / 1024; //count file size
    var resultid = file.val().split(".");
    
    var gettypeup = resultid [resultid.length - 1]; // take file type uploaded file
    var filetype = file.attr('data-file_types'); // take allowed files from input
    var allowedfiles = filetype.replace(/\|/g, ', '); // string allowed file
    var filesize = 2; //2MB
    var onlist = file.attr('data-file_types').indexOf(gettypeup) > -1;
    var checkinputfile = file.attr('type');
    numb = numb.toFixed(2);


    if (onlist && numb <= filesize) {
        $.ajax({
            type: $('#submitimagen').attr('method'),
            url: $('#submitimagen').attr('action'),
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("filedocente").files[0]);
                oFReader.onload = function (oFREvent) {
                    $("#fotoperfil").attr("src", oFREvent.target.result);
                    $('#alert').html('Se actualizo correctamente la imagen').removeAttr('class').addClass('alert alert-success') //file OK
                };
            },
            error: function (err) {
                alert(err);
            }
        });
    } else {
        if (numb >= filesize && onlist) {
            file.val(''); //remove uploaded file
            $('#alert').html('El archivo agregado es demasiado grande \(' + numb + ' MB\) - Tamaño máximo de archivo ' + filesize + ' MB').removeAttr('class').addClass('alert alert-warning') //alert that file is too big, but type file is ok
        } else if (numb < filesize && !onlist) {
            file.val(''); //remove uploaded file
            $('#alert').html('Se ha agregado un formato de archivo no permitido. \(' + gettypeup + ') - Formatos permitidos: ' + allowedfiles).removeAttr('class').addClass('alert alert-danger') //wrong type file
        } else if (!onlist) {
            file.val(''); //remove uploaded file
            $('#alert').html('Se ha agregado un formato de archivo no permitido. \(' + gettypeup + ') - Formatos permitidos: ' + allowedfiles).removeAttr('class').addClass('alert alert-danger') //wrong type file
        }
    }


}
;
document.addEventListener("DOMContentLoaded", function () {
    $('.preloader-background').delay(1700).fadeOut('slow');
    $('.loader').delay(1700).fadeOut();
});
'use strict';
import Servicio from "../Servicio.js";
var _url = '';
export default class Moodle extends Servicio {
    constructor(url) {
        _url = url;
        super();
    }
    obtenerdetalle(_detalle) {
        var init = {method: 'GET', body: null, headers: {'Content-Type': 'application/json'}};
        var myRequest = new Request(_url + '?id_moodle_cursos=' + _detalle.id_moodle_cursos , init);
        return new Promise(function (resolve, reject) {
            this.http(myRequest).then((response) => {
                resolve(response);
            }).catch(error => {
                reject(error);
            });
        }.bind(this));
    }
}
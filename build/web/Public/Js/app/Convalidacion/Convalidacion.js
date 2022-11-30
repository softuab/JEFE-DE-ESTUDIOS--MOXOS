'use strict';
import Servicio from "../Servicio.js";
var _url = '';
export default class Convalidacion extends Servicio {
    constructor(url) {
        _url = url;
        super();
    }
    obtenerCarrerasOfertadas(_facultad) {
        var init = {method: 'POST', body: JSON.stringify(_facultad), headers: {'Content-Type': 'application/json', 'X-CSRF-TOKEN': _facultad.csrfToken}};
        var myRequest = new Request(_url, init);
        console.log("estoy aki!!!");
        return new Promise(function (resolve, reject) {
            this.http(myRequest).then((response) => {
                resolve(response);
            }).catch(error => {
                reject(error);
            });
        }.bind(this));
    }
}
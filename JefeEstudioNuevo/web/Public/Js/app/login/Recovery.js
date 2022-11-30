'use strict';
import Servicio from "../Servicio.js";
var _url = '';
export default class Recovery extends Servicio {
    constructor(url) {
        _url = url;
        super();
    }
    existecorreo(_correo) {
        var init = {method: 'GET', body: null, headers: {'Content-Type': 'application/json'}};
        var myRequest = new Request(_url + '?correo=' + _correo.correo + '&capchat=' + _correo.capchat, init);
        return new Promise(function (resolve, reject) {
            this.http(myRequest).then((response) => {
                resolve(response);
            }).catch(error => {
                reject(error);
            });
        }.bind(this));
    }
}
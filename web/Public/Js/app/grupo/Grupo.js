'use strict';
import Servicio from "../Servicio.js";
var _url = '';
export default class Grupo extends Servicio {
    constructor(url) {
        _url = url;
        super();
    }
    cargargrupos(_datos) {
        var init = {method: 'POST', body: JSON.stringify(_datos), headers: {'Content-Type': 'application/json', 'X-CSRF-TOKEN': _datos.csrfToken}};
        var myRequest = new Request(_url, init);
        return new Promise(function (resolve, reject) {
            this.http(myRequest).then((response) => {
                resolve(response);
            }).catch(error => {
                reject(error);
            });
        }.bind(this));
    }

    comprobargrupos(_datos) {
        var init = {method: 'POST', body: JSON.stringify(_datos), headers: {'Content-Type': 'application/json', 'X-CSRF-TOKEN': _datos.csrfToken}};
        var myRequest = new Request(_url, init);
        return new Promise(function (resolve, reject) {
            this.http(myRequest).then((response) => {
                resolve(response);
            }).catch(error => {
                reject(error);
            });
        }.bind(this));
    }
}
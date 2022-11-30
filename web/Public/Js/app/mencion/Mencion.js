'use strict';
import Servicio from "../Servicio.js";
var _url = '';
export default class Mencion extends Servicio {
    constructor(url) {
        _url = url;
        super();
    }
    obtenerlistaestudiante(_correo) {
        var init = {method: 'GET', body: null, headers: {'Content-Type': 'application/json'}};
        var myRequest = new Request(_url + '?id_programa=' + _correo.id_programa + '&buscar=' + _correo.buscar, init);
        return new Promise(function (resolve, reject) {
            this.http(myRequest).then((response) => {
                resolve(response);
            }).catch(error => {
                reject(error);
            });
        }.bind(this));
    }
    obtenerlistamenciones(_correo) {
        var init = {method: 'GET', body: null, headers: {'Content-Type': 'application/json'}};
        var myRequest = new Request(_url + '?id_programa=' + _correo.id_programa + '&id_plan=' + _correo.id_plan, init);
        return new Promise(function (resolve, reject) {
            this.http(myRequest).then((response) => {
                resolve(response);
                console.log(reponse);
            }).catch(error => {
                reject(error);
            });
        }.bind(this));
    }
    eliminarmencion(_datos) {
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
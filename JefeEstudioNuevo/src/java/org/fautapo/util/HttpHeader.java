/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.util;

/**
 *
 * @author hp
 */
public enum HttpHeader {
    AUTHORIZATION("Authorization"),
    AUTHENTICATION_TYPE_BASIC("Basic"),
    X_AUTH_TOKEN("X-AUTH-TOKEN"),
    WWW_Authenticate("WWW-Authenticate"),
    X_FORWARDED_FOR("X-FORWARDED-FOR"),
    PROXY_CLIENT_IP("Proxy-Client-IP"),
    WL_PROXY_CLIENT_IP("WL-Proxy-Client-IP"),
    HTTP_CLIENT_IP("HTTP_CLIENT_IP"),
    HTTP_X_FORWARDED_FOR("HTTP_X_FORWARDED_FOR");
    private String key;
    private HttpHeader(String key) {
        this.key = key;
    }
    public String key() {
        return this.key;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

/**
 *
 * @author hp
 */
public class EstudianteProgramado {
    private int id_persona;
    private int ru;
    private String nombres_completos;
    private String usuario;
    private String password;
    private int id_curso;
    private int rol_estudiante;
    private String nombres;
    private boolean registrado;
    private boolean registradomoodle;

    public boolean isRegistradomoodle() {
        return registradomoodle;
    }

    public void setRegistradomoodle(boolean registradomoodle) {
        this.registradomoodle = registradomoodle;
    }

    public boolean isRegistrado() {
        return registrado;
    }

    public void setRegistrado(boolean registrado) {
        this.registrado = registrado;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public int getRu() {
        return ru;
    }

    public void setRu(int ru) {
        this.ru = ru;
    }

    public String getNombres_completos() {
        return nombres_completos;
    }

    public void setNombres_completos(String nombres_completos) {
        this.nombres_completos = nombres_completos;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId_curso() {
        return id_curso;
    }

    public void setId_curso(int id_curso) {
        this.id_curso = id_curso;
    }

    public int getRol_estudiante() {
        return rol_estudiante;
    }

    public void setRol_estudiante(int rol_estudiante) {
        this.rol_estudiante = rol_estudiante;
    }
    
    
}

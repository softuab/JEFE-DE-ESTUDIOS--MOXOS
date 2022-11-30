/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;
import java.util.List;

/**
 *
 * @author hp
 */
public class PersonaKardex {

    private int id_persona_kardex;
    private String numerodocumento;
    private String tipodocumento;
    private String nombre;
    private String segundonombre;
    private String apellidopaterno;
    private String apellidomaterno;
    private String imagen;
    private Date fechanacimiento;
    private String direccion;
    private String telefonocelular;
    private String estadocivil;
    private String correoinsitucional;
    private int id_localidad;
    private String nua;
    private String tiponua;
    private Boolean sexo;
    private String detalle_sexo;
    private Date fechacontratoinicial;
    private Boolean sindicato;
    private Boolean jubilado;
    private String ren;
    private Boolean discapacidad;
    private String numerolibreta;
    private String numerodeseguro;
    private Date fechaingresodocente;
    private Date fechaexpiracioncarnet;
    private String matriculalibreta;
    private String escalon;
    private String aserviciomilitar;
    private String nrodiscpacitado;
    private int ult_usuario;
    private int id_banco;
    private String cuentacorriente;
    private int id_nivelestudio;
    private int id_profesiones;
    private int id_colegio_profesionales;
    private String numeroregistroprofesionales;
    private Date fechatituloprofesion;
    private Boolean ley1178;
    private String nrotitulo;
    private String promedio;
    private String idiomanativo;
    private String imagelibretamilitar;
    private String imagecarnetidentidad;
    private Date declaracionjurada;
    private String declaracionjurabienesrentas;
    private Date fechacurso1178;
    private String id_estado;
    private String universidad;
    private Date fechaemision;
    private String numerotituloprovision;
    private Boolean sippase;
    private Date fechaemisionsippase;
    private int id_persona;
    private String prefijo_profesional;
    private String emision_documento;
    private String detalle_estadocivil;
    private String detalle_localidad;
    private String detalle_banco;
    private String detalle_sindicato;
    private String detalle_jubilado;
    private String detalle_discapacitado;
    private String detalle_nivelestudio;
    private String detalle_profesion;
    private String detalle_colegio_profesionales;
    private String detalle_sippase;
    private String detalle_ley1178;
    private String numero;
    private String alfanumerico;
    private List<PersonaIdioma> personaidioma;
    private int number;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
    
    

    public List<PersonaIdioma> getPersonaidioma() {
        return personaidioma;
    }

    public void setPersonaidioma(List<PersonaIdioma> personaidioma) {
        this.personaidioma = personaidioma;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setAlfanumerico(String alfanumerico) {
        this.alfanumerico = alfanumerico;
    }

    public String getNumero() {
        String[] split = numerodocumento.split("-");
        if (split.length == 0) {
            numero = "";
        } else {
            if (split.length == 1) {
                numero = numerodocumento;
            } else {
                numero = split[0];
            }
        }
        return numero;
    }

    public String getAlfanumerico() {
        String[] split = numerodocumento.split("-");
        if (split.length == 0) {
            alfanumerico = "";
        } else {
            if (split.length == 1) {
                alfanumerico = "";
            } else {
                alfanumerico = split[1];
            }
        }
        return alfanumerico;
    }

    public String getDetalle_sippase() {
        if (sippase) {
            detalle_sippase = "SI";
        } else {
            detalle_sippase = "NO";
        }
        return detalle_sippase;
    }

    public String getDetalle_ley1178() {
        if (ley1178) {
            detalle_ley1178 = "SI";
        } else {
            detalle_ley1178 = "NO";
        }
        return detalle_ley1178;
    }

    public String getDetalle_nivelestudio() {
        return detalle_nivelestudio;
    }

    public void setDetalle_nivelestudio(String detalle_nivelestudio) {
        this.detalle_nivelestudio = detalle_nivelestudio;
    }

    public String getDetalle_profesion() {
        return detalle_profesion;
    }

    public void setDetalle_profesion(String detalle_profesion) {
        this.detalle_profesion = detalle_profesion;
    }

    public String getDetalle_colegio_profesionales() {
        return detalle_colegio_profesionales;
    }

    public void setDetalle_colegio_profesionales(String detalle_colegio_profesionales) {
        this.detalle_colegio_profesionales = detalle_colegio_profesionales;
    }

    public String getDetalle_banco() {
        return detalle_banco;
    }

    public void setDetalle_banco(String detalle_banco) {
        this.detalle_banco = detalle_banco;
    }

    public String getDetalle_sindicato() {
        if (sindicato) {
            detalle_sindicato = "SI";
        } else {
            detalle_sindicato = "NO";
        }
        return detalle_sindicato;
    }

    public String getDetalle_jubilado() {
        if (jubilado) {
            detalle_jubilado = "SI";
        } else {
            detalle_jubilado = "NO";
        }
        return detalle_jubilado;
    }

    public String getDetalle_discapacitado() {
        if (discapacidad) {
            detalle_discapacitado = "SI";
        } else {
            detalle_discapacitado = "NO";
        }
        return detalle_discapacitado;
    }

    public String getDetalle_localidad() {
        return detalle_localidad;
    }

    public void setDetalle_localidad(String detalle_localidad) {
        this.detalle_localidad = detalle_localidad;
    }

    public String getDetalle_estadocivil() {
        return detalle_estadocivil;
    }

    public void setDetalle_estadocivil(String detalle_estadocivil) {
        this.detalle_estadocivil = detalle_estadocivil;
    }

    public String getDetalle_sexo() {

        if (sexo) {
            detalle_sexo = "MASCULINO";
        } else {
            detalle_sexo = "FEMENINO";
        }
        return detalle_sexo;
    }

    public int getId_persona_kardex() {
        return id_persona_kardex;
    }

    public void setId_persona_kardex(int id_persona_kardex) {
        this.id_persona_kardex = id_persona_kardex;
    }

    public String getNumerodocumento() {
        return numerodocumento;
    }

    public void setNumerodocumento(String numerodocumento) {
        this.numerodocumento = numerodocumento;
    }

    public String getTipodocumento() {
        return tipodocumento;
    }

    public void setTipodocumento(String tipodocumento) {
        this.tipodocumento = tipodocumento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSegundonombre() {
        return segundonombre;
    }

    public void setSegundonombre(String segundonombre) {
        this.segundonombre = segundonombre;
    }

    public String getApellidopaterno() {
        return apellidopaterno;
    }

    public void setApellidopaterno(String apellidopaterno) {
        this.apellidopaterno = apellidopaterno;
    }

    public String getApellidomaterno() {
        return apellidomaterno;
    }

    public void setApellidomaterno(String apellidomaterno) {
        this.apellidomaterno = apellidomaterno;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Date getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(Date fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefonocelular() {
        return telefonocelular;
    }

    public void setTelefonocelular(String telefonocelular) {
        this.telefonocelular = telefonocelular;
    }

    public String getEstadocivil() {
        return estadocivil;
    }

    public void setEstadocivil(String estadocivil) {
        this.estadocivil = estadocivil;
    }

    public String getCorreoinsitucional() {
        return correoinsitucional;
    }

    public void setCorreoinsitucional(String correoinsitucional) {
        this.correoinsitucional = correoinsitucional;
    }

    public int getId_localidad() {
        return id_localidad;
    }

    public void setId_localidad(int id_localidad) {
        this.id_localidad = id_localidad;
    }

    public String getNua() {
        return nua;
    }

    public void setNua(String nua) {
        this.nua = nua;
    }

    public String getTiponua() {
        return tiponua;
    }

    public void setTiponua(String tiponua) {
        this.tiponua = tiponua;
    }

    public Boolean getSexo() {
        return sexo;
    }

    public void setSexo(Boolean sexo) {
        this.sexo = sexo;
    }

    public Date getFechacontratoinicial() {
        return fechacontratoinicial;
    }

    public void setFechacontratoinicial(Date fechacontratoinicial) {
        this.fechacontratoinicial = fechacontratoinicial;
    }

    public Boolean getSindicato() {
        return sindicato;
    }

    public void setSindicato(Boolean sindicato) {
        this.sindicato = sindicato;
    }

    public Boolean getJubilado() {
        return jubilado;
    }

    public void setJubilado(Boolean jubilado) {
        this.jubilado = jubilado;
    }

    public String getRen() {
        return ren;
    }

    public void setRen(String ren) {
        this.ren = ren;
    }

    public Boolean getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(Boolean discapacidad) {
        this.discapacidad = discapacidad;
    }

    public String getNumerolibreta() {
        return numerolibreta;
    }

    public void setNumerolibreta(String numerolibreta) {
        this.numerolibreta = numerolibreta;
    }

    public String getNumerodeseguro() {
        return numerodeseguro;
    }

    public void setNumerodeseguro(String numerodeseguro) {
        this.numerodeseguro = numerodeseguro;
    }

    public Date getFechaingresodocente() {
        return fechaingresodocente;
    }

    public void setFechaingresodocente(Date fechaingresodocente) {
        this.fechaingresodocente = fechaingresodocente;
    }

    public Date getFechaexpiracioncarnet() {
        return fechaexpiracioncarnet;
    }

    public void setFechaexpiracioncarnet(Date fechaexpiracioncarnet) {
        this.fechaexpiracioncarnet = fechaexpiracioncarnet;
    }

    public String getMatriculalibreta() {
        return matriculalibreta;
    }

    public void setMatriculalibreta(String matriculalibreta) {
        this.matriculalibreta = matriculalibreta;
    }

    public String getEscalon() {
        return escalon;
    }

    public void setEscalon(String escalon) {
        this.escalon = escalon;
    }

    public String getAserviciomilitar() {
        return aserviciomilitar;
    }

    public void setAserviciomilitar(String aserviciomilitar) {
        this.aserviciomilitar = aserviciomilitar;
    }

    public String getNrodiscpacitado() {
        return nrodiscpacitado;
    }

    public void setNrodiscpacitado(String nrodiscpacitado) {
        this.nrodiscpacitado = nrodiscpacitado;
    }

    public int getUlt_usuario() {
        return ult_usuario;
    }

    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }

    public int getId_banco() {
        return id_banco;
    }

    public void setId_banco(int id_banco) {
        this.id_banco = id_banco;
    }

    public String getCuentacorriente() {
        return cuentacorriente;
    }

    public void setCuentacorriente(String cuentacorriente) {
        this.cuentacorriente = cuentacorriente;
    }

    public int getId_nivelestudio() {
        return id_nivelestudio;
    }

    public void setId_nivelestudio(int id_nivelestudio) {
        this.id_nivelestudio = id_nivelestudio;
    }

    public int getId_profesiones() {
        return id_profesiones;
    }

    public void setId_profesiones(int id_profesiones) {
        this.id_profesiones = id_profesiones;
    }

    public int getId_colegio_profesionales() {
        return id_colegio_profesionales;
    }

    public void setId_colegio_profesionales(int id_colegio_profesionales) {
        this.id_colegio_profesionales = id_colegio_profesionales;
    }

    public String getNumeroregistroprofesionales() {
        return numeroregistroprofesionales;
    }

    public void setNumeroregistroprofesionales(String numeroregistroprofesionales) {
        this.numeroregistroprofesionales = numeroregistroprofesionales;
    }

    public Date getFechatituloprofesion() {
        return fechatituloprofesion;
    }

    public void setFechatituloprofesion(Date fechatituloprofesion) {
        this.fechatituloprofesion = fechatituloprofesion;
    }

    public Boolean getLey1178() {
        return ley1178;
    }

    public void setLey1178(Boolean ley1178) {
        this.ley1178 = ley1178;
    }

    public String getNrotitulo() {
        return nrotitulo;
    }

    public void setNrotitulo(String nrotitulo) {
        this.nrotitulo = nrotitulo;
    }

    public String getPromedio() {
        return promedio;
    }

    public void setPromedio(String promedio) {
        this.promedio = promedio;
    }

    public String getIdiomanativo() {
        return idiomanativo;
    }

    public void setIdiomanativo(String idiomanativo) {
        this.idiomanativo = idiomanativo;
    }

    public String getImagelibretamilitar() {
        return imagelibretamilitar;
    }

    public void setImagelibretamilitar(String imagelibretamilitar) {
        this.imagelibretamilitar = imagelibretamilitar;
    }

    public String getImagecarnetidentidad() {
        return imagecarnetidentidad;
    }

    public void setImagecarnetidentidad(String imagecarnetidentidad) {
        this.imagecarnetidentidad = imagecarnetidentidad;
    }

    public Date getDeclaracionjurada() {
        return declaracionjurada;
    }

    public void setDeclaracionjurada(Date declaracionjurada) {
        this.declaracionjurada = declaracionjurada;
    }

    public String getDeclaracionjurabienesrentas() {
        return declaracionjurabienesrentas;
    }

    public void setDeclaracionjurabienesrentas(String declaracionjurabienesrentas) {
        this.declaracionjurabienesrentas = declaracionjurabienesrentas;
    }

    public Date getFechacurso1178() {
        return fechacurso1178;
    }

    public void setFechacurso1178(Date fechacurso1178) {
        this.fechacurso1178 = fechacurso1178;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }

    public Date getFechaemision() {
        return fechaemision;
    }

    public void setFechaemision(Date fechaemision) {
        this.fechaemision = fechaemision;
    }

    public String getNumerotituloprovision() {
        return numerotituloprovision;
    }

    public void setNumerotituloprovision(String numerotituloprovision) {
        this.numerotituloprovision = numerotituloprovision;
    }

    public Boolean getSippase() {
        return sippase;
    }

    public void setSippase(Boolean sippase) {
        this.sippase = sippase;
    }

    public Date getFechaemisionsippase() {
        return fechaemisionsippase;
    }

    public void setFechaemisionsippase(Date fechaemisionsippase) {
        this.fechaemisionsippase = fechaemisionsippase;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getPrefijo_profesional() {
        return prefijo_profesional;
    }

    public void setPrefijo_profesional(String prefijo_profesional) {
        this.prefijo_profesional = prefijo_profesional;
    }

    public String getEmision_documento() {
        return emision_documento;
    }

    public void setEmision_documento(String emision_documento) {
        this.emision_documento = emision_documento;
    }
}

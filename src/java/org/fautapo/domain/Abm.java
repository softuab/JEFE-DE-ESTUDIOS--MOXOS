package org.fautapo.domain;

import java.util.List;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public class Abm extends Principal {

    /* Private Fields */
    private int id_campo;
    private int id_tabla;
    private String tabla;
    private String etiqueta;
    private String campo;
    private String permiso;
    private String campo_padre;
    private String tipo_dato;
    private int orden;
    private String sql;
    private String valores;
    private String codigo;
    private String detalle;

    //  INICIO JOJO  \\
    private int id_componente;
    private String tabla_foranea;
    private String id_campo_foraneo;
    private String campo_foraneo;
    private String condicion;
    private List combo;
    private int columnas;
    private int filas;
    private int caracteres;
    private int x;
    private int y;
    private String tag;
    private int pagina;
    //  FIN JOJO  \\
    private int id_campo_condicion;
    private int id_consulta;
    private String consulta;
    private String titulo;
    private String etiquetas;
    private List tablas_dibrep;
    private List campos_dibrep;
    private int id_foranea;
    private String id_campos;
    private String cabezas;
    private String sumas;
    private String alias;
    private boolean padre;
    private boolean glosa;
    private String descripcion;
    private String[] tuplaDatos;

    /* JavaBeans Properties */

    public int getId_campo() {
        return id_campo;
    }

    public void setId_campo(int id_campo) {
        this.id_campo = id_campo;
    }

    public int getId_tabla() {
        return id_tabla;
    }

    public void setId_tabla(int id_tabla) {
        this.id_tabla = id_tabla;
    }

    public String getTabla() {
        return tabla;
    }

    public void setTabla(String tabla) {
        this.tabla = tabla;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getCampo() {
        return campo;
    }

    public void setCampo(String campo) {
        this.campo = campo;
    }

    public String getPermiso() {
        return permiso;
    }

    public void setPermiso(String permiso) {
        this.permiso = permiso;
    }

    public String getCampo_padre() {
        return campo_padre;
    }

    public void setCampo_padre(String campo_padre) {
        this.campo_padre = campo_padre;
    }

    public String getTipo_dato() {
        return tipo_dato;
    }

    public void setTipo_dato(String tipo_dato) {
        this.tipo_dato = tipo_dato;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public String getValores() {
        return valores;
    }

    public void setValores(String valores) {
        this.valores = valores;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    //  INICIO JOJO  \\
    public int getId_componente() {
        return id_componente;
    }

    public void setId_componente(int id_componente) {
        this.id_componente = id_componente;
    }

    public String getTabla_foranea() {
        return tabla_foranea;
    }

    public void setTabla_foranea(String tabla_foranea) {
        this.tabla_foranea = tabla_foranea;
    }

    public String getId_campo_foraneo() {
        return id_campo_foraneo;
    }

    public void setId_campo_foraneo(String id_campo_foraneo) {
        this.id_campo_foraneo = id_campo_foraneo;
    }

    public String getCampo_foraneo() {
        return campo_foraneo;
    }

    public void setCampo_foraneo(String campo_foraneo) {
        this.campo_foraneo = campo_foraneo;
    }

    public String getCondicion() {
        return condicion;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }

    public List getCombo() {
        return combo;
    }

    public void setCombo(List combo) {
        this.combo = combo;
    }

    public int getColumnas() {
        return columnas;
    }

    public void setColumnas(int columnas) {
        this.columnas = columnas;
    }

    public int getFilas() {
        return filas;
    }

    public void setFilas(int filas) {
        this.filas = filas;
    }

    public int getCaracteres() {
        return caracteres;
    }

    public void setCaracteres(int caracteres) {
        this.caracteres = caracteres;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getPagina() {
        return pagina;
    }

    public void setPagina(int pagina) {
        this.pagina = pagina;
    }
    //  FIN JOJO  \\

    public int getId_campo_condicion() {
        return id_campo_condicion;
    }

    public void setId_campo_condicion(int id_campo_condicion) {
        this.id_campo_condicion = id_campo_condicion;
    }

    public int getId_consulta() {
        return id_consulta;
    }

    public void setId_consulta(int id_consulta) {
        this.id_consulta = id_consulta;
    }

    public String getConsulta() {
        return consulta;
    }

    public void setConsulta(String consulta) {
        this.consulta = consulta;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getEtiquetas() {
        return etiquetas;
    }

    public void setEtiquetas(String etiquetas) {
        this.etiquetas = etiquetas;
    }

    public List getTablas_dibrep() {
        return tablas_dibrep;
    }

    public void setTablas_dibrep(List tablas_dibrep) {
        this.tablas_dibrep = tablas_dibrep;
    }

    public List getCampos_dibrep() {
        return campos_dibrep;
    }

    public void setCampos_dibrep(List campos_dibrep) {
        this.campos_dibrep = campos_dibrep;
    }

    public int getId_foranea() {
        return id_foranea;
    }

    public void setId_foranea(int id_foranea) {
        this.id_foranea = id_foranea;
    }

    public String getId_campos() {
        return id_campos;
    }

    public void setId_campos(String id_campos) {
        this.id_campos = id_campos;
    }

    public String getCabezas() {
        return cabezas;
    }

    public void setCabezas(String cabezas) {
        this.cabezas = cabezas;
    }

    public String getSumas() {
        return sumas;
    }

    public void setSumas(String sumas) {
        this.sumas = sumas;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public boolean getPadre() {
        return padre;
    }

    public void setPadre(boolean padre) {
        this.padre = padre;
    }

    public boolean getGlosa() {
        return glosa;
    }

    public void setGlosa(boolean glosa) {
        this.glosa = glosa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String[] getTuplaDatos() {
        return tuplaDatos;
    }

    public void setTuplaDatos(String[] tuplaDatos) {
        this.tuplaDatos = (String[]) tuplaDatos;
    }

}

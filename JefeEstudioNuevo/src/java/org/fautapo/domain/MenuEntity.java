/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

/**
 *
 * @author FNZABALETAA
 */
import java.util.List;

public class MenuEntity {
 private List<MenuEntity> menus;
 private String controller;
 private String module;
  private int nivel;

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
  
 public MenuEntity(String controller, String module, int nivel ,List<MenuEntity> menus) {
  super();
  this.menus = menus;
  this.controller = controller;
  this.module = module;
  this.nivel = nivel;
 }
 
 public List<MenuEntity> getMenus() {
  return menus;
 }
 public void setMenus(List<MenuEntity> menus) {
  this.menus = menus;
 }
 public String getController() {
  return controller;
 }
 public void setController(String controller) {
  this.controller = controller;
 }
 public String getModule() {
  return module;
 }
 public void setModule(String module) {
  this.module = module;
 }

 @Override
 public String toString() {
  return "MenuEntity [menus=" + menus + ", controller=" + controller + ", module=" + module + "]";
 }
}
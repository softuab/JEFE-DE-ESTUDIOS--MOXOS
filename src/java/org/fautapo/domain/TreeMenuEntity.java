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
import java.util.ArrayList;
import java.util.List;

public class TreeMenuEntity {

    public int idObject;
    public int idParent;
    public String controller;
    public String action;
    public String nameModule;
    
    private int idNivel;

    public int getIdObject() {
        return idObject;
    }

    public void setIdObject(int idObject) {
        this.idObject = idObject;
    }

    public int getIdParent() {
        return idParent;
    }

    public void setIdParent(int idParent) {
        this.idParent = idParent;
    }

    public String getController() {
        return controller;
    }

    public void setController(String controller) {
        this.controller = controller;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getNameModule() {
        return nameModule;
    }

    public void setNameModule(String nameModule) {
        this.nameModule = nameModule;
    }

    public static List<MenuEntity> GenerarMenu(List<TreeMenuEntity> TreeMenuEntitys) {
        List<MenuEntity> menuList = new ArrayList<MenuEntity>();
        for(int i=0;i < TreeMenuEntitys.size();i++) {
            if (TreeMenuEntitys.get(i).idParent == 1) {
                String urlaction = TreeMenuEntitys.get(i).getController(); 
                menuList.add(new MenuEntity(urlaction, TreeMenuEntitys.get(i).getNameModule(),TreeMenuEntitys.get(i).getIdNivel() ,GenerarSubMenu(TreeMenuEntitys, TreeMenuEntitys.get(i))));
            }
        }
        return menuList;
    }

    public static List<MenuEntity> GenerarSubMenu(List<TreeMenuEntity> TreeMenuEntitys, TreeMenuEntity treeMenuEntitys) {
        List<MenuEntity> menuList = new ArrayList<MenuEntity>();
        for(int i=0;i < TreeMenuEntitys.size();i++) {
            if (TreeMenuEntitys.get(i).idParent == treeMenuEntitys.idObject) {
                String urlaction = TreeMenuEntitys.get(i).getController();
                menuList.add(new MenuEntity(urlaction, TreeMenuEntitys.get(i).getNameModule(),TreeMenuEntitys.get(i).getIdNivel() ,GenerarSubMenu(TreeMenuEntitys, TreeMenuEntitys.get(i))));
            }
        }
        return menuList;
    }

    /**
     * @return the idNivel
     */
    public int getIdNivel() {
        return idNivel;
    }

    /**
     * @param idNivel the idNivel to set
     */
    public void setIdNivel(int idNivel) {
        this.idNivel = idNivel;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Gateways.TDGCategorie;
import java.util.ArrayList;

/**
 *
 * @author Charles-Antoine
 */
public class Categorie {
    private String idCat;
    private String nom;

    public Categorie(String idCat, String nom) {
        this.idCat = idCat;
        this.nom = nom;
    }

    public String getIdCat() {
        return idCat;
    }

    public String getNom() {
        return nom;
    }
    public static String getIdFromNom(String nomCat) throws ClassNotFoundException
    {
        TDGCategorie TDG = new TDGCategorie();
        
               
        return TDG.getCategorieWhere("nom", nomCat).get(0).idCat;
    }
    public static ArrayList<Categorie> All() throws ClassNotFoundException
    {
        TDGCategorie TDG = new TDGCategorie();
        
        
        return TDG.getCategories();
    }
    public static Categorie getCatFromId(String idCat) throws ClassNotFoundException
    {
        TDGCategorie TDG = new TDGCategorie();
        
        return TDG.getCategorieWhere("idcategorie", idCat).get(0);
    }
    
}

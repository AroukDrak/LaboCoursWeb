/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Gateways.TDGFigurine;
import java.util.ArrayList;

/**
 *
 * @author Charles-Antoine
 */
public class Figurine {
    String id;
    String nom;
    double prix;
    String photo;
    String description;
    int quantite;
    String idCat;

    public Figurine(String id, String nom, double prix, String photo, String description, int quantite, String idCat) {
        this.id = id;
        this.nom = nom;
        this.prix = prix;
        this.photo = photo;
        this.description = description;
        this.quantite = quantite;
        this.idCat = idCat;
    }

    public String getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public double getPrix() {
        return prix;
    }

    public String getPhoto() {
        return photo;
    }

    public String getDescription() {
        return description;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getIdCat() {
        return idCat;
    }

    public static ArrayList<Figurine> getFigurineFromCat(String nomCat) throws ClassNotFoundException
    {
        ArrayList<Figurine> figurines = new ArrayList<>();
       //TODO getIdCat from catergories where nom = nom cat;
       String idCat = Categorie.getIdFromNom(nomCat);
        for (Figurine figurine : All()) {
            if(figurine.idCat.matches(idCat))figurines.add(figurine);
        }
        
        
        return figurines;
    }
    public Categorie getCategorie() throws ClassNotFoundException
    {
        return Categorie.getCatFromId(this.idCat); 
    }
    
    public void save() throws ClassNotFoundException{
        TDGFigurine TDG=new TDGFigurine();

        //update
        TDG.updateQuantiteFigurine(this.id,this.quantite);
    }

    public static ArrayList<Figurine> getFigurinesWhere(String column,String value) throws ClassNotFoundException
    {
        TDGFigurine TDG=new TDGFigurine();
        
        return TDG.getFigurinesWhere(column,value);
    }
    
    public static ArrayList<Figurine> All() throws ClassNotFoundException
    {
        TDGFigurine TDG=new TDGFigurine();
        
        return TDG.getFigurines();
    }


}

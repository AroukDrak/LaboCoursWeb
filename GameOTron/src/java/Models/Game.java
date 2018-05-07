/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Gateways.TDGGames;
import java.util.ArrayList;

/**
 *
 * @author Charles-Antoine
 */
public class Game {
    private String id;
    private String nom;
    private String description;
    private double prix;
    private int rating;
    private String photo;

    public Game(String id, String nom, String description, double prix, int rating, String photo) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.prix = prix;
        this.rating = rating;
        this.photo = photo;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(String rate) {
        if(rate.matches("like")&& this.rating<100)this.rating++;
        else if(rate.matches("dislike")&& this.rating>0) this.rating--;
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

    
    public void save() throws ClassNotFoundException{
        TDGGames TDG=new TDGGames();

        //update
        TDG.updateRating(this.id,this.rating);
    }

    public static ArrayList<Game> getGamesWhere(String column,String value) throws ClassNotFoundException
    {
        TDGGames TDG=new TDGGames();
        
        return TDG.getGamesWhere(column,value);
    }
    //Returns ordered by ratings desc
    public static ArrayList<Game> All() throws ClassNotFoundException
    {
        TDGGames TDG=new TDGGames();
        
        return TDG.getGames();
    }
    public static Game getGameFromRatingSpot(int Ranking) throws ClassNotFoundException
    {
        ArrayList<Game> games = Game.All();
        Game game = games.get(Ranking-1);
        return game;
    }


}

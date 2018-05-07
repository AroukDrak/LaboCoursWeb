package Gateways;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Models.Game;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Charles-Antoine
 */
public class TDGGames {
private Connection c;
private ResultSet r;
private PreparedStatement updateRating,getGames,getGamesWhere;
private String url = "jdbc:mysql://localhost:3306/gameotron",
        user ="root",
        pw = "";

ArrayList<Game> games = new ArrayList<>();

public TDGGames() throws ClassNotFoundException
{
    
    Class.forName("com.mysql.jdbc.Driver");
    try {
        c=DriverManager.getConnection(this.url, this.user, this.pw);
        getGames=c.prepareStatement("Select * from games order by rating desc;");
        getGamesWhere=c.prepareStatement("Select * from games where ?=?;");
        updateRating=c.prepareStatement("Update games set rating=? where idgames=?;");
        
        
    } catch (SQLException ex) {
        Logger.getLogger(TDGGames.class.getName()).log(Level.SEVERE, null, ex);
    }
}


public ArrayList<Game> getGames()
{
        try {
        r=this.getGames.executeQuery();
        while(r.next())
    {
        games.add(new Game(
                r.getString("idgames"),
                r.getString("nom"),
                r.getString("description"),
                r.getDouble("prix"),
                r.getInt("rating"),
                r.getString("photo")));
    }
    } catch (SQLException ex) {
        games=null;
    }
    return games;
}
public ArrayList<Game> getGamesWhere(String column,String value)
{
        try {
        this.getGamesWhere=c.prepareStatement("Select * from games where "+column+"=?;");
        this.getGamesWhere.setString(1,value);
        r=this.getGamesWhere.executeQuery();
        while(r.next())
    {
        games.add(new Game(
                r.getString("idgames"),
                r.getString("nom"),
                r.getString("description"),
                r.getDouble("prix"),
                r.getInt("rating"),
                r.getString("photo")));
    }
    } catch (SQLException ex) {
        games=null;
    }
    return games;
}
public void updateRating(String idgames,int rating)
{
    try {
        this.updateRating.setInt(1,rating);
        this.updateRating.setString(2,idgames);
        int i=this.updateRating.executeUpdate();
        } 
    catch (SQLException ex) {
        Logger.getLogger(TDGGames.class.getName()).log(Level.SEVERE, null, ex);
    }
}
}
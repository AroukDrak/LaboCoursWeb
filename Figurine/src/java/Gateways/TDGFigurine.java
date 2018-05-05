package Gateways;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Models.Figurine;
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
public class TDGFigurine {
private Connection c;
private ResultSet r;
private PreparedStatement updateQuantiteFigurine,getFigurines,getFigurinesWhere;
private String url = "jdbc:mysql://localhost:3306/figurines",
        user ="root",
        pw = "";

ArrayList<Figurine> figurines = new ArrayList<>();

public TDGFigurine() throws ClassNotFoundException
{
    
    Class.forName("com.mysql.jdbc.Driver");
    try {
        c=DriverManager.getConnection(this.url, this.user, this.pw);
        getFigurines=c.prepareStatement("Select * from figurines;");
        getFigurinesWhere=c.prepareStatement("Select * from figurines where ?=?;");
        updateQuantiteFigurine=c.prepareStatement("Update figurines set quantite=? where idfigurine=?;");
        
        
    } catch (SQLException ex) {
        Logger.getLogger(TDGFigurine.class.getName()).log(Level.SEVERE, null, ex);
    }
}


public ArrayList<Figurine> getFigurines()
{
        try {
        r=this.getFigurines.executeQuery();
        while(r.next())
    {
        figurines.add(new Figurine(
                r.getString("idfigurine"),
                r.getString("nom"),
                r.getDouble("prix"),
                r.getString("photo"),
                r.getString("description"),
                r.getInt("quantite"),
                r.getString("idCat")));
    }
    } catch (SQLException ex) {
        figurines=null;
    }
    return figurines;
}
public ArrayList<Figurine> getFigurinesWhere(String column,String value)
{
        try {
        this.getFigurinesWhere=c.prepareStatement("Select * from figurines where "+column+"=?;");
        this.getFigurinesWhere.setString(1,value);
        r=this.getFigurinesWhere.executeQuery();
        while(r.next())
    {
        figurines.add(new Figurine(
                r.getString("idfigurine"),
                r.getString("nom"),
                r.getDouble("prix"),
                r.getString("photo"),
                r.getString("description"),
                r.getInt("quantite"),
                r.getString("idcat")));
    }
    } catch (SQLException ex) {
        figurines=null;
    }
    return figurines;
}
public void updateQuantiteFigurine(String idfigurine,int quantite)
{
    try {
        this.updateQuantiteFigurine.setString(1,idfigurine);
        this.updateQuantiteFigurine.setInt(2,quantite);
        int i=this.updateQuantiteFigurine.executeUpdate();
        } 
    catch (SQLException ex) {
        Logger.getLogger(TDGFigurine.class.getName()).log(Level.SEVERE, null, ex);
    }
}
}
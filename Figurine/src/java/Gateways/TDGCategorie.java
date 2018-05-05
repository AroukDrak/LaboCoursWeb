package Gateways;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Models.Categorie;
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
public class TDGCategorie {
private Connection c;
private ResultSet r;
private PreparedStatement updateQuantiteFigurine,getCategories,getCategorieWhere;
private String url = "jdbc:mysql://localhost:3306/figurines",
        user ="root",
        pw = "";

ArrayList<Categorie> categories = new ArrayList<>();


public TDGCategorie() throws ClassNotFoundException
{
    
    Class.forName("com.mysql.jdbc.Driver");
    try {
        c=DriverManager.getConnection(this.url, this.user, this.pw);
        getCategories=c.prepareStatement("Select * from categories;");
        getCategorieWhere=c.prepareStatement("Select * from categories where ?=?;");
        
        
    } catch (SQLException ex) {
        Logger.getLogger(TDGCategorie.class.getName()).log(Level.SEVERE, null, ex);
    }
}


public ArrayList<Categorie> getCategories()
{
        try {
        r=this.getCategories.executeQuery();
        while(r.next())
    {
        categories.add(new Categorie(
                r.getString("idcategorie"),
                r.getString("nom")));
    }
    } catch (SQLException ex) {
        categories=null;
    }
    return categories;
}
public ArrayList<Categorie> getCategorieWhere(String column,String value)
{
        try {
        this.getCategorieWhere=c.prepareStatement("Select * from categories where "+column+"=?;");
        this.getCategorieWhere.setString(1,value);
        r=this.getCategorieWhere.executeQuery();
        while(r.next())
    {
        categories.add(new Categorie(
                r.getString("idcategorie"),
                r.getString("nom")));
    }
    } catch (SQLException ex) {
        categories=null;
    }
    return categories;
}

}
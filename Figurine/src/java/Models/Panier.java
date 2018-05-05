/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;

/**
 *
 * @author Charles-Antoine
 */
public class Panier {
    private ArrayList<Figurine> figurines;
    private double total;
    private double GrandTotal;
    
      public Panier()
    {
        this.figurines=new ArrayList<>();
        this.total=0;
    }

    public ArrayList<Figurine> getFigurines() {
        return figurines;
    }

    public double getTotal() {
        return total;
    }

    public double getGrandTotal() {
        return GrandTotal;
    }
    
    public void AddFigAuPanier(Figurine figurine)
    {
        figurines.add(figurine);
    }
    public void RemoveFigAuPanier(String idFig)
    {
        Figurine figurine=null;
        for (Figurine f : figurines) {
            if(f.getId().matches(idFig))figurine = f;
        }
        figurines.remove(figurine);
    }
    public void RemoveAllFigAuPanier()
    {
        figurines = new ArrayList<>();
    }
    
    public void CalculTotal()
    {
        total=0;
        for(Figurine figurine:figurines)
        {
            total+=figurine.prix;
        }
    }
    public void CalculTotalWithTaxes()
    {

        double taxes=0.1475;
        CalculTotal();
        GrandTotal= total*taxes;
    }
}

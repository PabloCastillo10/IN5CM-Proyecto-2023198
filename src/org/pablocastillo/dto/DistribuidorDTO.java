/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.pablocastillo.dto;

import org.pablocastillo.model.Distribuidores;

/**
 *
 * @author pablo
 */
public class DistribuidorDTO {
    private static DistribuidorDTO instance;
    private Distribuidores Distribuidores;
    
    private DistribuidorDTO() {
        
    }
    
    public static DistribuidorDTO getDistribuidorDTO(){
        if(instance == null) {
            instance = new DistribuidorDTO();
        }
        return instance;
    }

    public Distribuidores getDistribuidores() {
        return Distribuidores;
    }

    public void setDistribuidores(Distribuidores Distribuidores) {
        this.Distribuidores = Distribuidores;
    }
    
    
}

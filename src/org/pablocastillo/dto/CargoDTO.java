/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.pablocastillo.dto;

import org.pablocastillo.model.Cargos;

/**
 *
 * @author pablo
 */
public class CargoDTO {
    private static CargoDTO instance;
    private Cargos cargos;
    
    private CargoDTO() {
        
    }
    
    public static CargoDTO getCargosDTO() {
        if(instance == null) {
            instance = new CargoDTO();
        }
        return instance;
    }

    public Cargos getCargos() {
        return cargos;
    }

    public void setCargos(Cargos cargos) {
        this.cargos = cargos;
    }
    
}

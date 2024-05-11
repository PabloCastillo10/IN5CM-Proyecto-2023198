/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.pablocastillo.model;

/**
 *
 * @author informatica
 */
public class TicketSoporte {
    private int ticketSoporteId;
    private String descripcion;
    private String estatuss;
    private int clienteId;
    private String cliente;
    private int facturaId;
    
    public TicketSoporte() {
    }

    public TicketSoporte(int ticketSoporteId, String descripcion, String estatuss, String cliente, int facturaId) {
        this.ticketSoporteId = ticketSoporteId;
        this.descripcion = descripcion;
        this.estatuss = estatuss;
        this.cliente = cliente;
        this.facturaId = facturaId;
    }

    public int getTicketSoporteId() {
        return ticketSoporteId;
    }

    public void setTicketSoporteId(int ticketSoporteId) {
        this.ticketSoporteId = ticketSoporteId;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstatuss() {
        return estatuss;
    }

    public void setEstatus(String estatuss) {
        this.estatuss = estatuss;
    }

    public int getClienteId() {
        return clienteId;
    }

    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public int getFacturaId() {
        return facturaId;
    }

    public void setFacturaId(int facturaId) {
        this.facturaId = facturaId;
    }

    @Override
    public String toString() {
        return "TicketSoporte{" + "ticketSoporteId=" + ticketSoporteId + ", descripcion=" + descripcion + ", estatuss=" + estatuss + ", clienteId=" + clienteId + ", cliente=" + cliente + ", facturaId=" + facturaId + '}';
    }
}

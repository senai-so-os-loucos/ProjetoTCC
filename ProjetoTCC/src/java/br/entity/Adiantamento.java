/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.entity;

import java.util.Date;

/**
 *
 * @author ricardo_jose_santana
 */
public class Adiantamento {
  private Integer idAdiantamento;
  private Double Valor;
  private Date Data;
  private String Descricao;

    public Integer getIdAdiantamento() {
        return idAdiantamento;
    }

    public void setIdAdiantamento(Integer idAdiantamento) {
        this.idAdiantamento = idAdiantamento;
    }

    public Double getValor() {
        return Valor;
    }

    public void setValor(Double Valor) {
        this.Valor = Valor;
    }

    public Date getData() {
        return Data;
    }

    public void setData(Date Data) {
        this.Data = Data;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }



}

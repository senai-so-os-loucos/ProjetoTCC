/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ricardo_jose_santana
 */
public class MySQL {
 
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String nomeServidor = "localhost";
            String database = "Mysql";
            String url = "jdbc:mysql://" + nomeServidor + "/" + database;
            String username = "root";
            String password = "";

            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.out.println("O driver expecificado nao foi encontrado.");
            return null;
        } catch (SQLException e) {
            System.out.println("Nao foi possivel conectar ao Banco de Dados.");
            return null;
        }
    }
}

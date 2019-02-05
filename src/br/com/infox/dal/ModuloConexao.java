/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.infox.dal;

import java.sql.*;

/**
 *
 * @author igors
 */
public class ModuloConexao {

    //Método responsável por estabelecer a conexão com o banco
    public static Connection conector() {
        java.sql.Connection conexao = null;
        //A linha abaixo chama o driver
        //JDBC - Java Data Base Connector
        String driver = "com.mysql.jdbc.Driver";

        //Armazenado informações referentes ao banco
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        String password = "";
        
        //Estabelecendo a conexão com o banco
        
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (ClassNotFoundException | SQLException e){
            // A linha abaixo serve de apoio para descrever o erro
            //System.out.println(e);
            return null;
        }
    }
}

//$Id$
package com.advenent.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;


public class DbStoreValue {
	
	
	public String list(HttpServletRequest request) throws Exception {
		long startTime = System.currentTimeMillis();
        //Database connection establishment
        Connection connection = null;
        Statement statement = null;
        PreparedStatement pstatement = null;
        int updateQuery = 0;

        String username=request.getParameter("Email");
        System.out.println(username);
        
      
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost/","root", "");
        statement = connection.createStatement();
        try 
        {
            String sql = "create database Login_details";
            statement.executeUpdate(sql);
            System.out.println("Database created!");
        } 
        catch (SQLException sqlException) 
        {
            if (sqlException.getErrorCode() == 1007) {
                System.out.println("already database exist so we are dropping it and creating again");
                String sql = "drop database Login_details";
                statement.executeUpdate(sql);
                sql = "create database Login_details";
                statement.executeUpdate(sql);
                System.out.println("Database created!");
                }
            else 
                sqlException.printStackTrace();
        }
        connection = DriverManager.getConnection("jdbc:mysql://localhost/Login_details","root", "");
        statement = connection.createStatement();
        
      //  String sql2 = "create table credentials(userName varchar(255),password varchar(255),newpassword varchar(255),confirmpassword varchar(255))";
         String sql2 = "create table credentials(userName varchar(255))";
        System.out.println("Table credentials created!");
		 statement.executeUpdate(sql2);
		 System.out.println("Inserting records into the table...");
		 String queryString = "INSERT INTO credentials(userName) VALUES (?)";
         pstatement = connection.prepareStatement(queryString);
         pstatement.setString(1, username);
         updateQuery = pstatement.executeUpdate();
         if (updateQuery != 0) {
             System.out.println("Data was inserted successfuly.");
         }
         pstatement.close();
         connection.close();

		  return null;
    }
}



